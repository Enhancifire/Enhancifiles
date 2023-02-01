def getRandomWallpaper():
    import os
    import random
    HOME = os.environ['HOME']
    wallpaper_directory = os.path.join(HOME, 'Wallpapers')
    wallpapers = os.listdir(wallpaper_directory)
    path = random.choice(wallpapers)
    wall_path = os.path.join(wallpaper_directory, path)
    return wall_path


def lock():
    import subprocess
    wallpaper = getRandomWallpaper()
    subprocess.run(["i3lock", "-i", wallpaper, "-F", "-k", "--time-size=300",
                   "--date-size=1", "--pass-media", "--pass-screen", "--time-color=ffffff",])


lock()
