"""Runs the game in DOSBox, headless under Xvfb, and drives it with keys.

    play.py [--exe NAME] [STEP...]

Steps run in order:

    wait:SECONDS     wait
    key:KEY          tap a key (xdotool names: Return, Escape, Up, Down, ...)
    hold:KEY:SECONDS hold a key down
    shot:NAME        save a screenshot to build/shots/NAME.png

The game runs from build/game/TOMBRAID, mounted as C:, with the CD image
mounted as D:. --exe runs NAME there instead of TOMB.EXE. With no steps
a screenshot is taken after 20 seconds. DOSBOX is the dosbox-staging
binary; it defaults to ~/opt/dosbox-staging*/dosbox or
~/data.local/work/dosbox-staging*/dosbox. Needs Xvfb, xdotool and
ImageMagick.
"""
import glob, os, subprocess, sys, time

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
GAME = os.path.join(ROOT, "build/game")
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
cd \\TOMBRAID
{exe}
exit
"""


def dosbox():
    if os.environ.get("DOSBOX"):
        return os.environ["DOSBOX"]
    found = sorted(glob.glob(os.path.expanduser("~/opt/dosbox-staging*/dosbox"))
                   + glob.glob(os.path.expanduser("~/data.local/work/dosbox-staging*/dosbox")))
    if not found:
        sys.exit("error: set DOSBOX to a dosbox-staging binary")
    return found[-1]


def free_display():
    n = 99
    while os.path.exists(f"/tmp/.X{n}-lock"):
        n += 1
    return f":{n}"


def xdo(env, *args):
    return subprocess.run(["xdotool", *args], env=env, capture_output=True, text=True).stdout.strip()


def main():
    args = sys.argv[1:]
    exe = "TOMB.EXE"
    if args[:1] == ["--exe"]:
        exe, args = args[1], args[2:]
    steps = args or ["wait:20", "shot:start"]
    conf = os.path.join(GAME, "dosbox.conf")
    with open(conf, "w") as f:
        f.write(CONF.format(game=GAME, cue=os.path.join(GAME, "GAME.DAT"), exe=exe))
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
