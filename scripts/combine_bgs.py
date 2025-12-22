import tool, os
import gfxtools.tsa2 as tsa
graphics_dir = "../graphics/bg"
def convertBGS():
    paths = list(os.walk("../graphics/bg"))
    for p in paths[0][2]:

        if ".lz" in p: continue
        if  not ".4bpp" in p: continue

        basePath = os.path.join(paths[0][0], p).replace(".4bpp", "")
        tool.save_image(basePath+".4bpp", basePath + ".png", 1, basePath + ".gbapal",  basePath + ".bin")
convertBGS()

def clear_no_maps():
    map_paths =list(os.walk(graphics_dir))[0][2]
    for m in map_paths:
        if m.endswith(".nomap.png"):
            os.remove(os.path.join(graphics_dir, m))
clear_no_maps()