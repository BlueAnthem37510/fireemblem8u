from collections import UserDict, OrderedDict
import enum, sys
from PIL import Image
import numpy as np

class Orientation(enum.Enum):
    N = 0 #not flipped
    X = 1
    Y = 2
    XY = 3

class TileIndex():
    def __init__(self, index):
        self.value = index

    def __eq__(self, other):
        if isinstance(other, int):
            return self.value == other
        if isinstance(other, TileIndex):
            return self.value == other.value
        return False
    def __hash__(self):
        return id(self)
    def __str__(self):
        return repr(self)
    def __repr__(self):
        return self.value.__str__()
    def __int__(self):
        return self.value
    def __gt__(self, other):
        return self.value > int(other)
    def __lt__(self, other):
        return self.value < int(other)
class CheckTile():
    def __init__(self, tile):
        self.pal_id = tile[0]//16
        self.original = (tile-self.pal_id*16).reshape((8, 8))
        self.x = np.flip(self.original, axis=0)
        self.y = np.flip(self.original, axis=1)
        self.xy = np.flip(self.original)

    def get_orientation(self, tile):
        if (self.original == tile).all() : return Orientation.N
        if (self.x == tile).all() : return Orientation.X
        if (self.y == tile).all() : return Orientation.Y
        if (self.xy == tile).all() : return Orientation.XY
class TSA():
    def __init__(self, width=1, height=1, tiles = []):
        self.width = width
        self.height = height
        self.tiles = tiles
    def from_bytes(bin, with_dimensions=True):
        out = TSA()
        if with_dimensions:
            out.width = bin[0] + 1
            out.height = bin[1] + 1
        out.tiles = []
        for i in range(2 if with_dimensions else 0, len(bin), 2):
            out.tiles.append(Tile.from_bytes(bin[i:i+2]))
        return out
    def to_bytes(self, with_dimensions = True):
        if with_dimensions:
            out = bytearray([self.width-1, self.height-1])
        else:
            out = bytearray()
        for t in self.tiles:
            out.extend(t.to_bytes())
        return out
    def order_chunks(self):
        out = []
        tiles = list(reversed(self.tiles))
        for i in range(0, len(tiles), self.width):
            chunk = tiles[i:i+self.width]
            chunk.reverse()
            out += chunk
        return out
    def __eq__(self, value):
        if not isinstance(value, TSA): return False
        return self.width == value.width and self.height == value.height and self.tiles == value.tiles
class Tile():
    def __init__(self, tile_id :TileIndex, x_flip = False, y_flip = False, pal_id = 0):
        self.tile_id = tile_id
        self.x_flip = x_flip
        self.y_flip = y_flip
        self.pal_id = pal_id
    def from_bytes(bytes):
        bytes  = pretty_binary(int.from_bytes(bytes, "big"), 16)
        #tttttttt pppp x y tt
        tile_id = int(bytes[14:16]+bytes[:8], 2)
        x_flip = bool(int(bytes[12], 2))
        y_flip = bool(int(bytes[13], 2))
        pal_id = int(bytes[8:12], 2)
        return Tile(tile_id, x_flip, y_flip ,pal_id)
    def to_bytes(self) -> bytearray:

        byte_1 = pretty_binary(int(self.tile_id), 10)
        byte_2 = pretty_binary(self.pal_id, 4)
        byte_2 += str(int(self.x_flip))
        byte_2 += str(int(self.y_flip))
        byte_2 += byte_1[:2]

        byte_1 = byte_1[2:]

        return bytearray([int(byte_1, 2), int(byte_2, 2)])
    def set_orientation(self, o:Orientation):
        match(o):
            case Orientation.N: self.x_flip = False; self.y_flip = False; return
            case Orientation.X: self.x_flip = True; self.y_flip =  False; return
            case Orientation.Y: self.x_flip = False; self.y_flip =  True; return
            case Orientation.XY: self.x_flip = True; self.y_flip =  True; return

    def __repr__(self):
        return "Id: {0} x: {1} y: {2} pal: {3}".format(self.tile_id, self.x_flip, self.y_flip, self.pal_id)
    def __str__(self):
        return self.__repr__()
    def __eq__(self, value):
        if not isinstance(value, Tile): return False
        return self.tile_id == value.tile_id and self.x_flip == value.x_flip and self.y_flip == value.y_flip# and self.pal_id == value.pal_id

class TileCollection(UserDict):

    def __setitem__(self, key: int | TileIndex, value: CheckTile) -> None:

        if(isinstance(key, int)):
            key = TileIndex(key)
        if(key.value > 1023):
            raise("Tile index value {} is too large!".format(str(key)))
        return super().__setitem__(key, value)
    def get_key(self, key):
        key_list = list(self.data.keys())
        index = key_list.index(key)
        return key_list[index]
    def get_key_from_value(self, value):
        return next(x for x in self.data.keys() if self[x] == value)
    def append(self, value :CheckTile) -> None:
        if(len(self) == 0):
            largestKey = -1
        else:largestKey = max(self.data.keys()).value
        if(largestKey == 1023):
            raise("Next key is too large, please set item instead")
        largestKey += 1
        newKey = TileIndex(largestKey)
        self.__setitem__(newKey, value)
        return newKey
    def move_tile(self, old, new):

        key = self.get_key(old)
        #temp set_value
        key.value = -1
        if old < new:
            self.shift_backwards_between(old, new)
            key.value = new
        else:
            self.shift_forwards_between(new, old)
            key.value = new

    def keys(self) -> list[TileIndex]:
        out = list(self.data.keys())
        out.sort()
        return out
    def first_key(self):
        return self.keys()[0]
    def last_key(self):
        return self.keys()[-1]
    def insert(self, index, tile):
        self.shift_forwards_from(index)
        self[index] = tile
    def shift_forwards_from(self, from_int):
        keys = self.keys()
        keys.reverse()
        for k in keys:
            if k.value < from_int: continue
            k.value = k.value + 1
    def shift_forwards_between(self,from_int, to_int):
        keys = self.data.keys()
        for k in keys:
            if k.value > to_int or k.value < from_int: continue
            k.value = k.value + 1
    def shift_backwards_from(self, from_int):
        keys = self.data.keys()
        for k in keys:
            if k.value < from_int: continue
            k.value = k.value - 1
    def shift_backwards_between(self,from_int, to_int):
        keys = self.data.keys()
        for k in keys:
            if k.value > to_int or k.value < from_int:
                continue
            k.value = k.value - 1
    def values(self):
        return [x[1] for x in sorted(self.items())]
    def __delitem__(self, key):
        del self.data[key]
        self.shift_backwards_from(key.value)
def pretty_binary(num, places = 0):
    return bin(num)[2:].rjust(places, "0")
def read_file(path, in_tile_order=False, with_dimensions=True) -> TSA:
    with open(path, "rb") as f:
        tsa = TSA.from_bytes(f.read(), with_dimensions)
    if in_tile_order:
        tsa.tiles = tsa.order_chunks()
    return tsa
def create_TSA(tiles, ntile_x, ntile_y) -> TSA:

    unique_tiles = []
    keys = []
    unique_tiles.append(CheckTile(tiles[0]))
    keys.append(TileIndex(0))
    tsa = [None]*ntile_x*ntile_y
    tsa[0] = Tile(keys[0], pal_id=unique_tiles[0].pal_id)
    index = 1
    for t in tiles[1:]:
        t = CheckTile(t)
        found = False
        for i in range(len(unique_tiles)):

            u = unique_tiles[i]
            orientation = u.get_orientation(t.original)
            if orientation != None:
                tsa_tile = Tile(keys[i], pal_id=t.pal_id)
                tsa_tile.set_orientation(orientation)
                tsa[index] = tsa_tile
                index+= 1
                found = True
                break
        if not found:
            unique_tiles.append(t)
            new_key = TileIndex(len(keys))
            keys.append(new_key)
            tsa_tile = Tile(new_key, pal_id=t.pal_id)
            tsa[index] = tsa_tile
            index += 1
    outTsa = TSA(ntile_x,ntile_y,tsa )
    unique_tiles = TileCollection(dict(zip(keys, unique_tiles)))
    return outTsa, unique_tiles


def get_tiles(image: Image):
    img_width, img_height = image.size
    ntile_x = img_width //8
    ntile_y = img_height //8
    return extract_tiles(image, ntile_x, ntile_y).flatten()

def max_empty_tile(unique_tiles : TileCollection,  tsa : TSA):

    #in the battle background the blank tiles are set as tile_id 1023 (max id)
    shift = True
    first_tile = tsa.tiles[0]
    shift = first_tile.tile_id == 0 and first_tile.pal_id == 0

    for i in range(int(not shift), len(tsa.tiles)):
        tile = tsa.tiles[i]
        if tile.tile_id == 0:
            if tile.pal_id != 0:
                #use empty end tile if the empty tile is not the first tile
                tsa.tiles[i].tile_id  = unique_tiles.last_key()
                continue
            tsa.tiles[i].tile_id = 1023
            continue
    if shift:
        del unique_tiles[unique_tiles.get_key(0)]

def handle_padding(padding: int, unique_tiles : TileCollection):
    if padding == 0: return
    #padding at start
    if padding < 0:
        padding = abs(padding)
        for _ in range(padding):
            unique_tiles.insert(0, CheckTile(np.zeros((8,8), dtype=int)))
        return
    #padding at end
    for _ in range(padding):
        unique_tiles.append(CheckTile(np.zeros((8,8), dtype=int)))
def handle_number_of_tiles(num_tiles: int, unique_tiles : TileCollection):
    while len(unique_tiles) < num_tiles:
        unique_tiles.append(CheckTile(np.zeros((8,8), dtype=int)))
def handle_blank_tile_index(index : int, unique_tiles : TileCollection):
    unique_tiles.insert(0, CheckTile(np.zeros((8,8), dtype=int)))
    unique_tiles.move_tile(1, index)
def handle_flip_tiles(indexes : list[int],unique_tiles : TileCollection, tsa: TSA, y_flip:bool):
    for i in indexes:
        u_key = unique_tiles.get_key(i)
        unique_tiles[u_key] = CheckTile(unique_tiles[u_key].y if y_flip else unique_tiles[u_key].x)
        for i in range(len(tsa.tiles)):
            t = tsa.tiles[i]
            if t.tile_id == u_key:
                if y_flip:
                    tsa.tiles[i].y_flip = not t.y_flip
                else: #x_flip
                    tsa.tiles[i].x_flip = not t.x_flip
                test= 1
def handle_flip_indexes(indexes : list[int], tsa: TSA):
    for i in indexes:
        tsa.tiles[i].y_flip = True
def handle_copy_tiles(indexes : list[int],unique_tiles : TileCollection, tsa: TSA):
    for old, new in indexes:
        unique_tiles.shift_forwards_from(new)
        unique_tiles[new] = CheckTile(unique_tiles[unique_tiles.get_key(old)].original)
        key = unique_tiles.get_key(new)
        skip_first = False
        for t in tsa.tiles:
            if t.tile_id == old:
                if not skip_first:
                    skip_first = True
                    continue
                t.tile_id = key
def handle_insert_unused_tiles(args : dict, unique_tiles :TileCollection):
    from tsa_generator import extract_tiles
    unused = args["png_file"].replace(".png", ".unused.png")
    im = Image.open(unused)
    tiles = extract_tiles(im, 1, im.height//8).flatten()
    unused_tile_indexes = args["insert_unused_tiles"]
    unused_tile_indexes.sort()
    for i in range(len(tiles)):
        unique_tiles.insert(unused_tile_indexes[i], CheckTile(tiles[i]))
def handle_args(args : dict, unique_tiles :TileCollection, tsa):
    if args["max_empty_index"]:
        max_empty_tile(unique_tiles, tsa)
    if args["padding"] != 0:
        handle_padding(args["padding"], unique_tiles)
    if len(args["copy_tiles"]) > 0:
        handle_copy_tiles(args["copy_tiles"], unique_tiles, tsa)
    if len(args["insert_blank_tiles"]) > 0:
        for index in args["insert_blank_tiles"]:
            unique_tiles.insert(index, CheckTile(np.zeros((8,8), dtype=int)))
    if len(args["insert_unused_tiles"]) > 0:
        handle_insert_unused_tiles(args, unique_tiles)
    if args["num_tiles"] != 0:
        handle_number_of_tiles(args["num_tiles"], unique_tiles)
    if args["blank_tile_index"] != 0:
        handle_blank_tile_index(args["blank_tile_index"], unique_tiles)
    if len(args["flip_tile_y_indexes"]) > 0:
        handle_flip_tiles(args["flip_tile_y_indexes"], unique_tiles, tsa, y_flip=True)
    if len(args["flip_tile_x_indexes"]) > 0:
        handle_flip_tiles(args["flip_tile_x_indexes"], unique_tiles, tsa, y_flip=False)
    if len(args["flip_y_indexes"]) > 0:
        handle_flip_indexes(args["flip_y_indexes"], tsa)
    if len(args["insert_indexes"]) > 0:
        for old, new in args["insert_indexes"]:
            unique_tiles.move_tile(old, new)
    if(len(args["set_indexes"]) > 0):
        for tsa_index, new_tile_id in args["set_indexes"]:
            tsa.tiles[tsa_index].tile_id = new_tile_id
    if args["pop_last_tile"]:
        del unique_tiles[unique_tiles.last_key()]
    if args["no_chunked"] != True:
        tsa.tiles = tsa.order_chunks()

def main(args, tiles , ntile_x, ntile_y ):
    tsa, out_tiles = create_TSA(tiles, ntile_x, ntile_y)
    handle_args(args,out_tiles, tsa )
    return tsa, out_tiles.values()

if __name__ == '__main__':
    from tsa_generator import convert_to_4bpp, extract_tiles, get_args
    parser = get_args()
    try:
        args = parser.parse_args()
    except IndexError:
        sys.exit(parser.usage)

    png_file = args.png_file
    im = Image.open(png_file)
    if im.mode != 'P':
        raise ValueError("IMAGE ERROR (P mode)")
    tiles = get_tiles(im)
    img_width, img_height = im.size
    ntile_x = img_width //8
    ntile_y = img_height //8
    tsa, out_tiles = main(args.__dict__, tiles, ntile_x,  ntile_y )
    tsa_bytes = tsa.to_bytes()
    with open(args.out_tsa, "wb") as f:
        f.write(tsa_bytes)
    img_bytes = bytearray()
    for t in out_tiles:
        img_bytes.extend(convert_to_4bpp(t.original.flatten()))
    with open(args.out_img, "wb") as f:
        f.write(img_bytes)