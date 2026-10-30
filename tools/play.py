"""Runs the game in DOSBox, headless under Xvfb, and drives it with keys.

    play.py [--exe NAME | --orig] [STEP...]

Steps run in order:

    wait:SECONDS     wait
    key:KEY          tap a key (xdotool names: Return, Escape, Up, Down, ...)
    hold:KEY:SECONDS hold a key down
    shot:NAME        save a screenshot to build/shots/NAME.png

build/game is mounted as C: and the CD image, game.cd in project.toml,
as D:. The hooked executable, game.hooked, runs from its directory;
--exe runs NAME there instead, and --orig copies the unmodified original
there as ORIG.EXE and runs that. With no steps a screenshot is taken
after 20 seconds. DOSBOX is the dosbox-staging binary; it defaults to
the first in dosbox.search. Needs Xvfb, xdotool and ImageMagick.
"""
import os, shutil, subprocess, sys, time

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import project
from project import ROOT, dosbox

GAME = os.path.join(ROOT, project.GAME)
SHOTS = os.path.join(ROOT, "build/shots")

CONF = """\
[sdl]
fullscreen = false
output = texture
texture_renderer = software

[dosbox]
machine = svga_s3
memsize = 16

[cpu]
core = dynamic
cpu_cycles = max

[render]
aspect = false

[mixer]
nosound = true

[autoexec]
mount c "{game}"
imgmount d "{cue}" -t cdrom
c:
cd \\{dir}
{exe}
exit
"""


def free_display():
    n = 99
    while os.path.exists(f"/tmp/.X{n}-lock"):
        n += 1
    return f":{n}"


def xdo(env, *args):
    return subprocess.run(["xdotool", *args], env=env, capture_output=True, text=True).stdout.strip()


def main():
    args = sys.argv[1:]
    folder, exe = os.path.split(project.config["game"]["hooked"])
    if args[:1] == ["--exe"]:
        exe, args = args[1], args[2:]
    elif args[:1] == ["--orig"]:
        exe, args = "ORIG.EXE", args[1:]
        shutil.copyfile(os.path.join(ROOT, project.ORIGINAL), os.path.join(GAME, folder, exe))
    steps = args or ["wait:20", "shot:start"]
    conf = os.path.join(GAME, "dosbox.conf")
    with open(conf, "w") as f:
        f.write(CONF.format(game=GAME, cue=os.path.join(GAME, project.config["game"]["cd"]),
                           dir=folder.replace("/", "\\"), exe=exe))
    display = free_display()
    env = dict(os.environ, DISPLAY=display, SDL_AUDIODRIVER="dummy")
    os.makedirs(SHOTS, exist_ok=True)
    xvfb = subprocess.Popen(["Xvfb", display, "-screen", "0", "640x480x24", "-nolisten", "tcp"],
                            stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    log = os.path.join(ROOT, "build/game.log")
    game = None
    try:
        time.sleep(1)
        with open(log, "w") as out:
            game = subprocess.Popen([dosbox(), "--noprimaryconf", "--nolocalconf", "-conf", conf],
                                    cwd=GAME, env=env, stdout=out, stderr=out)
        for step in steps:
            kind, _, arg = step.partition(":")
            if game.poll() is not None:
                print(f"the game exited before {step}")
                break
            if kind == "wait":
                time.sleep(float(arg))
            elif kind == "key":
                xdo(env, "keydown", arg)
                time.sleep(0.15)
                xdo(env, "keyup", arg)
                time.sleep(0.15)
            elif kind == "hold":
                key, _, secs = arg.partition(":")
                xdo(env, "keydown", key)
                time.sleep(float(secs))
                xdo(env, "keyup", key)
            elif kind == "shot":
                path = os.path.join(SHOTS, arg + ".png")
                subprocess.run(["import", "-window", "root", path], env=env, check=True)
                print("screenshot", os.path.relpath(path, ROOT))
            else:
                sys.exit(f"unknown step: {step}")
    finally:
        if game and game.poll() is None:
            game.terminate()
            try:
                game.wait(5)
            except subprocess.TimeoutExpired:
                game.kill()
        xvfb.terminate()
        xvfb.wait()


if __name__ == "__main__":
    main()
