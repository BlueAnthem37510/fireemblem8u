from tsa2 import read_file
from PIL import Image
import sys
def main(args):
    try:
        img = args[1]
        tsa = args[2]
    except:
        sys.exit(f"Usage: {args[0]} <*.png> <*.bin>")

    tsa =  read_file(tsa)
    used_ids = list(set([x.tile_id for x in tsa.tiles]))
    used_ids.remove(1023)
    max_id = max(used_ids)
    unused_ids = []
    for i in range(max_id):
        if i not in used_ids:
            unused_ids.append(i)
    print(",".join(map(str, unused_ids)))
    if len(unused_ids) == 0: exit()
    full_tiles = Image.open(img)
    unused_tiles = []
    out_image = full_tiles.crop((0,0, 8,len(unused_ids)*8 ))
    for i in range(len(unused_ids)):
        tile = unused_ids[i]
        out_image.paste(full_tiles.crop((0,tile*8, 8, (tile+1)*8)), (0,i*8))
    test = 1
if __name__ == '__main__':
    main(sys.argv)
