MOVEUNITGFXDIR := graphics/unit_icon/move

### Move Unit Icon Animation Sheets ###

$(MOVEUNITGFXDIR)/unit_icon_move_Ephraim_Master_Lord_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241

$(MOVEUNITGFXDIR)/unit_icon_move_Eirika_Master_Lord_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241

$(MOVEUNITGFXDIR)/unit_icon_move_General_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 242

$(MOVEUNITGFXDIR)/unit_icon_move_Hero_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241

$(MOVEUNITGFXDIR)/unit_icon_move_Hero_F_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241

$(MOVEUNITGFXDIR)/unit_icon_move_Swordmaster_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241

$(MOVEUNITGFXDIR)/unit_icon_move_Swordmaster_F_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241

$(MOVEUNITGFXDIR)/unit_icon_move_Wyvern_Rider_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241

$(MOVEUNITGFXDIR)/unit_icon_move_Wyvern_Lord_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241

$(MOVEUNITGFXDIR)/unit_icon_move_Wyvern_Lord_F_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 242

$(MOVEUNITGFXDIR)/unit_icon_move_Wyvern_Knight_F_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 242

$(MOVEUNITGFXDIR)/unit_icon_move_Bishop_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241

$(MOVEUNITGFXDIR)/unit_icon_move_Bishop_F_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241

$(MOVEUNITGFXDIR)/unit_icon_move_Journeyman_T2_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241

$(MOVEUNITGFXDIR)/unit_icon_move_Dancer_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 256

$(MOVEUNITGFXDIR)/unit_icon_move_Fleet_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 252

$(MOVEUNITGFXDIR)/unit_icon_move_Cyclops_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 242

$(MOVEUNITGFXDIR)/unit_icon_move_Draco_Zombie_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 242

$(MOVEUNITGFXDIR)/unit_icon_move_Blst_Long_Empty_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 252

$(MOVEUNITGFXDIR)/unit_icon_move_Blst_Killer_Empty_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 252

## Map Tileset OBJ

MAPDIR := graphics/map

$(MAPDIR)/ObjectType1.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 1024

$(MAPDIR)/ObjectType2.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 1024

$(MAPDIR)/ObjectType3.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 1024

$(MAPDIR)/ObjectType4.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 918

$(MAPDIR)/ObjectType5.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 632

$(MAPDIR)/ObjectType6.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 1024

$(MAPDIR)/ObjectType7.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 929

$(MAPDIR)/ObjectType8.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 1019

$(MAPDIR)/ObjectType9.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 1024

$(MAPDIR)/ObjectType10.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 768

$(MAPDIR)/TowerOfValniObjectType.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 976

## Backgrounds

graphics/bg/bg_Black_Temple_Inside.feimg2.bin graphics/bg/bg_Black_Temple_Inside.fetsa2.bin: graphics/bg/bg_Black_Temple_Inside.png
	$(FETSATOOL) $< graphics/bg/bg_Black_Temple_Inside.feimg2.bin graphics/bg/bg_Black_Temple_Inside.fetsa2.bin --insert_indexes=0:29

graphics/bg/bg_Black_Temple_Outside.feimg2.bin graphics/bg/bg_Black_Temple_Outside.fetsa2.bin: graphics/bg/bg_Black_Temple_Outside.png
	$(FETSATOOL) $< graphics/bg/bg_Black_Temple_Outside.feimg2.bin graphics/bg/bg_Black_Temple_Outside.fetsa2.bin --insert_indexes=0:29

graphics/bg/bg_Burning_Castle.feimg2.bin graphics/bg/bg_Burning_Castle.fetsa2.bin: graphics/bg/bg_Burning_Castle.png
	$(FETSATOOL) $< graphics/bg/bg_Burning_Castle.feimg2.bin graphics/bg/bg_Burning_Castle.fetsa2.bin --insert_indexes=0:29

graphics/bg/bg_Caer_Pelyn.feimg2.bin graphics/bg/bg_Caer_Pelyn.fetsa2.bin: graphics/bg/bg_Caer_Pelyn.png
	$(FETSATOOL) $< graphics/bg/bg_Caer_Pelyn.feimg2.bin graphics/bg/bg_Caer_Pelyn.fetsa2.bin --insert_indexes=0:597

graphics/bg/bg_Darkling_Woods.feimg2.bin graphics/bg/bg_Darkling_Woods.fetsa2.bin: graphics/bg/bg_Darkling_Woods.png
	$(FETSATOOL) $< graphics/bg/bg_Darkling_Woods.feimg2.bin graphics/bg/bg_Darkling_Woods.fetsa2.bin --insert_indexes=0:29

graphics/bg/bg_Grado_Chamber.feimg2.bin graphics/bg/bg_Grado_Chamber.fetsa2.bin: graphics/bg/bg_Grado_Chamber.png
	$(FETSATOOL) $< graphics/bg/bg_Grado_Chamber.feimg2.bin graphics/bg/bg_Grado_Chamber.fetsa2.bin --insert_indexes=0:594

graphics/bg/bg_Renais_Chamber.feimg2.bin graphics/bg/bg_Renais_Chamber.fetsa2.bin: graphics/bg/bg_Renais_Chamber.png
	$(FETSATOOL) $< graphics/bg/bg_Renais_Chamber.feimg2.bin graphics/bg/bg_Renais_Chamber.fetsa2.bin --insert_indexes=0:20 --padding 1

graphics/bg/bg_Stream.feimg2.bin graphics/bg/bg_Stream.fetsa2.bin: graphics/bg/bg_Stream.png
	$(FETSATOOL) $< graphics/bg/bg_Stream.feimg2.bin graphics/bg/bg_Stream.fetsa2.bin --insert_indexes=1:481 --padding -1

graphics/bg/bg_Castle_Back.feimg2.bin graphics/bg/bg_Castle_Back.fetsa2.bin: graphics/bg/bg_Castle_Back.png
	$(FETSATOOL) $< graphics/bg/bg_Castle_Back.feimg2.bin graphics/bg/bg_Castle_Back.fetsa2.bin --insert_indexes=30:28,31:29,62:58,63:59,94:87,95:88,126:117,127:118,158:147,159:148,190:175,191:176,222:202,223:203,254:226,255:227,286:253,287:254,318:277,319:278,350:298,351:299,382:321,383:322,414:345,415:346

graphics/bg/bg_Garden.feimg2.bin graphics/bg/bg_Garden.fetsa2.bin: graphics/bg/bg_Garden.png
	$(FETSATOOL) $< graphics/bg/bg_Garden.feimg2.bin graphics/bg/bg_Garden.fetsa2.bin --insert_unused_tiles=7,8,30,31,84 --insert_indexes=28:7,29:8,97:30,41:20,0:24,20:19

graphics/bg/bg_Cell.feimg2.bin graphics/bg/bg_Cell.fetsa2.bin: graphics/bg/bg_Cell.png
	$(FETSATOOL) $< graphics/bg/bg_Cell.feimg2.bin graphics/bg/bg_Cell.fetsa2.bin --insert_unused_tiles=16,34,48,83,104,120,141,163,185,203,221,239,255,269,282

graphics/bg/bg_Grass_Plains_2.feimg2.bin graphics/bg/bg_Grass_Plains_2.fetsa2.bin: graphics/bg/bg_Grass_Plains_2.png
	$(FETSATOOL) $< graphics/bg/bg_Grass_Plains_2.feimg2.bin graphics/bg/bg_Grass_Plains_2.fetsa2.bin --insert_unused_tiles=179 --insert_indexes=180:208

graphics/bg/bg_Serafew_Village.feimg2.bin graphics/bg/bg_Serafew_Village.fetsa2.bin: graphics/bg/bg_Serafew_Village.png
	$(FETSATOOL) $< graphics/bg/bg_Serafew_Village.feimg2.bin graphics/bg/bg_Serafew_Village.fetsa2.bin --insert_unused_tiles=0

graphics/bg/bg_Volcano.feimg2.bin graphics/bg/bg_Volcano.fetsa2.bin: graphics/bg/bg_Volcano.png
	$(FETSATOOL) $< graphics/bg/bg_Volcano.feimg2.bin graphics/bg/bg_Volcano.fetsa2.bin --insert_unused_tiles=52,561,562,563,564,565,566,567,568,569,570,571,572,573,574,575,576,577,578,579,580,581,582,583,584,585,586,587,588,589,590 --flip_tile_y_indexes=6,7 --flip_tile_x_indexes=6,7 --insert_indexes=18:26,17:25,16:23,15:22,14:21,11:18,10:17,9:16,8:15,8:14,8:10,6:8,6:7,5:6

#Opening subtitles

graphics/op_subtitle/OpSubtitle_05.feimg2.bin graphics/op_subtitle/OpSubtitle_05.fetsa2.bin:  graphics/op_subtitle/OpSubtitle_05.png
	$(FETSATOOL) $< graphics/op_subtitle/OpSubtitle_05.feimg2.bin graphics/op_subtitle/OpSubtitle_05.fetsa2.bin --padding 6

#Battle Backgrounds
graphics/btl_bg/btl_bg_1.feimg3.bin graphics/btl_bg/btl_bg_1.fetsa3.bin: graphics/btl_bg/btl_bg_1.png
	$(FETSATOOL) $< graphics/btl_bg/btl_bg_1.feimg3.bin graphics/btl_bg/btl_bg_1.fetsa3.bin --flip_y_indexes=375,376,377,378,385,386,387,388,389

graphics/btl_bg/btl_bg_10.feimg3.bin graphics/btl_bg/btl_bg_10.fetsa3.bin: graphics/btl_bg/btl_bg_10.png
	$(FETSATOOL) $< graphics/btl_bg/btl_bg_10.feimg3.bin graphics/btl_bg/btl_bg_10.fetsa3.bin --flip_y_indexes=375,376,377,378,385,386,388,389

graphics/btl_bg/btl_bg_13.feimg3.bin graphics/btl_bg/btl_bg_13.fetsa3.bin: graphics/btl_bg/btl_bg_13.png
	$(FETSATOOL) $< graphics/btl_bg/btl_bg_13.feimg3.bin graphics/btl_bg/btl_bg_13.fetsa3.bin --flip_y_indexes=50,375,376,377,378,379,380,381,382,383,384,386,387,388,389,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419

graphics/btl_bg/btl_bg_14.feimg3.bin graphics/btl_bg/btl_bg_14.fetsa3.bin: graphics/btl_bg/btl_bg_14.png
	$(FETSATOOL) $< graphics/btl_bg/btl_bg_14.feimg3.bin graphics/btl_bg/btl_bg_14.fetsa3.bin --flip_tile_y_indexes=1,2 --flip_y_indexes=375,376,377 --insert_indexes=6:4,9:7,12:10

graphics/btl_bg/btl_bg_27.feimg3.bin graphics/btl_bg/btl_bg_27.fetsa3.bin: graphics/btl_bg/btl_bg_27.png
	$(FETSATOOL) $< graphics/btl_bg/btl_bg_27.feimg3.bin graphics/btl_bg/btl_bg_27.fetsa3.bin --copy_tiles=10:19 --insert_blank_tiles=30,31,62,63,94,95,126,127,158,159,190,191,222,223,254,255,286,287,318,319,350,351

graphics/btl_bg/btl_bg_32.feimg3.bin graphics/btl_bg/btl_bg_32.fetsa3.bin: graphics/btl_bg/btl_bg_32.png
	$(FETSATOOL) $< graphics/btl_bg/btl_bg_32.feimg3.bin graphics/btl_bg/btl_bg_32.fetsa3.bin --flip_y_indexes=195,225,255

graphics/btl_bg/btl_bg_33.feimg3.bin graphics/btl_bg/btl_bg_33.fetsa3.bin: graphics/btl_bg/btl_bg_33.png
	$(FETSATOOL) $< graphics/btl_bg/btl_bg_33.feimg3.bin graphics/btl_bg/btl_bg_33.fetsa3.bin --insert_blank_tiles=323,324,325 --set_indexes=380:323,381:323,382:323,383:324,384:325,385:323,386:323,387:323,388:323,389:323

graphics/btl_bg/btl_bg_47.feimg3.bin graphics/btl_bg/btl_bg_47.fetsa3.bin: graphics/btl_bg/btl_bg_47.png
	$(FETSATOOL) $< graphics/btl_bg/btl_bg_47.feimg3.bin graphics/btl_bg/btl_bg_47.fetsa3.bin --flip_y_indexes=15,16,17,18,19,20,21,22,23,24,25,26,27,28,29

graphics/btl_bg/btl_bg_55.feimg3.bin graphics/btl_bg/btl_bg_55.fetsa3.bin: graphics/btl_bg/btl_bg_55.png
	$(FETSATOOL) $< graphics/btl_bg/btl_bg_55.feimg3.bin graphics/btl_bg/btl_bg_55.fetsa3.bin --insert_indexes=1:31,1:146,1:115,1:54,1:359,357:84,358:177,358:208 --padding=-1

graphics/btl_bg/btl_bg_56.feimg3.bin graphics/btl_bg/btl_bg_56.fetsa3.bin: graphics/btl_bg/btl_bg_56.png
	$(FETSATOOL) $< graphics/btl_bg/btl_bg_56.feimg3.bin graphics/btl_bg/btl_bg_56.fetsa3.bin --blank_tile_index=298 --pop_last_tile

graphics/btl_bg/btl_bg_57.feimg3.bin graphics/btl_bg/btl_bg_57.fetsa3.bin: graphics/btl_bg/btl_bg_57.png
	$(FETSATOOL) $< graphics/btl_bg/btl_bg_57.feimg3.bin graphics/btl_bg/btl_bg_57.fetsa3.bin --blank_tile_index=305 --pop_last_tile

graphics/btl_bg/btl_bg_58.feimg3.bin graphics/btl_bg/btl_bg_58.fetsa3.bin: graphics/btl_bg/btl_bg_58.png
	$(FETSATOOL) $< graphics/btl_bg/btl_bg_58.feimg3.bin graphics/btl_bg/btl_bg_58.fetsa3.bin --insert_indexes=7:1,314:12,313:13 --padding=-1

graphics/btl_bg/btl_bg_60.feimg3.bin graphics/btl_bg/btl_bg_60.fetsa3.bin: graphics/btl_bg/btl_bg_60.png
	$(FETSATOOL) $< graphics/btl_bg/btl_bg_60.feimg3.bin graphics/btl_bg/btl_bg_60.fetsa3.bin --insert_indexes=1:317,313:1,315:7,316:11,316:8,11:12 --padding=-1
#op anim
graphics/op_anim/OpAnimWorldMap.feimg4.bin graphics/op_anim/OpAnimWorldMap.fetsa4.bin: graphics/op_anim/OpAnimWorldMap.png
	$(FETSATOOL) $< graphics/op_anim/OpAnimWorldMap.feimg4.bin  graphics/op_anim/OpAnimWorldMap.fetsa4.bin --insert_indexes=0:511,22:0

graphics/op_anim/OpAnimWorldMapFog.feimg4.bin graphics/op_anim/OpAnimWorldMapFog.fetsa4.bin: graphics/op_anim/OpAnimWorldMapFog.png
	$(FETSATOOL) $< graphics/op_anim/OpAnimWorldMapFog.feimg4.bin  graphics/op_anim/OpAnimWorldMapFog.fetsa4.bin --blank_tile_index=255

graphics/op_anim/OpAnimGenericCharacterBG.feimg4.bin graphics/op_anim/OpAnimGenericCharacterBG.fetsa4.bin: graphics/op_anim/OpAnimGenericCharacterBG.png
	$(FETSATOOL) $< graphics/op_anim/OpAnimGenericCharacterBG.feimg4.bin  graphics/op_anim/OpAnimGenericCharacterBG.fetsa4.bin --num_tiles=256 --insert_indexes=1:213 --padding=-1 --flip_y_indexes=16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,88,89,90,123,126,127,144,158,176,179,180,208,209,210,211,212,213,214,215,216,217,218,272,274,275,287,306,307,308,309,315,316,317,319,338,340,345,383,401,405,406,432,434,435,436,438,442,444,445,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,504,506,560,561,562,563,564,565,566,567,568,569,572,573,574,575,606,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639

graphics/op_anim/OpAnimEphraim.feimg4.bin graphics/op_anim/OpAnimEphraim.fetsa4.bin: graphics/op_anim/OpAnimEphraim.png
	$(FETSATOOL) $< graphics/op_anim/OpAnimEphraim.feimg4.bin  graphics/op_anim/OpAnimEphraim.fetsa4.bin --num_tiles=256 --insert_indexes=1:133

graphics/op_anim/OpAnimEphraimBlur1.feimg4.bin graphics/op_anim/OpAnimEphraimBlur1.fetsa4.bin: graphics/op_anim/OpAnimEphraimBlur1.png
	$(FETSATOOL) $< graphics/op_anim/OpAnimEphraimBlur1.feimg4.bin  graphics/op_anim/OpAnimEphraimBlur1.fetsa4.bin --num_tiles=256 --insert_indexes=1:149

#graphics/op_anim/OpAnimEphraimBlur2.feimg4.bin graphics/op_anim/OpAnimEphraimBlur2.fetsa4.bin: graphics/op_anim/OpAnimEphraimBlur1.png
#	$(FETSATOOL) $< graphics/op_anim/OpAnimEphraimBlur2.feimg4.bin  graphics/op_anim/OpAnimEphraimBlur2.fetsa4.bin --num_tiles=255 --insert_indexes=153:0

#graphics/op_anim/OpAnimEphraimBlur3.feimg4.bin graphics/op_anim/OpAnimEphraimBlur3.fetsa4.bin: graphics/op_anim/OpAnimEphraimBlur3.png
#	$(FETSATOOL) $< graphics/op_anim/OpAnimEphraimBlur3.feimg4.bin  graphics/op_anim/OpAnimEphraimBlur3.fetsa4.bin --num_tiles=256 --insert_indexes=167:1

graphics/op_anim/OpAnimEirika.feimg4.bin graphics/op_anim/OpAnimEirika.fetsa4.bin: graphics/op_anim/OpAnimEirika.png
	$(FETSATOOL) $< graphics/op_anim/OpAnimEirika.feimg4.bin  graphics/op_anim/OpAnimEirika.fetsa4.bin --num_tiles=256 --insert_indexes=1:114

graphics/op_anim/OpAnimEirikaBlur1.feimg4.bin graphics/op_anim/OpAnimEirikaBlur1.fetsa4.bin: graphics/op_anim/OpAnimEirikaBlur1.png
	$(FETSATOOL) $< graphics/op_anim/OpAnimEirikaBlur1.feimg4.bin  graphics/op_anim/OpAnimEirikaBlur1.fetsa4.bin --num_tiles=256 --insert_indexes=1:119

graphics/op_anim/OpAnimEirikaBlur2.feimg4.bin graphics/op_anim/OpAnimEirikaBlur2.fetsa4.bin: graphics/op_anim/OpAnimEirikaBlur2.png
	$(FETSATOOL) $< graphics/op_anim/OpAnimEirikaBlur2.feimg4.bin  graphics/op_anim/OpAnimEirikaBlur2.fetsa4.bin --num_tiles=256 --insert_indexes=1:136

graphics/op_anim/OpAnimEirikaBlur3.feimg4.bin graphics/op_anim/OpAnimEirikaBlur3.fetsa4.bin: graphics/op_anim/OpAnimEirikaBlur3.png
	$(FETSATOOL) $< graphics/op_anim/OpAnimEirikaBlur3.feimg4.bin  graphics/op_anim/OpAnimEirikaBlur3.fetsa4.bin --num_tiles=256 --insert_indexes=1:161

## Statscreen

graphics/statscreen/StatscreenObjs.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 134

graphics/statscreen/StatscreenBG.bin: %.bin: %.tmap
	$(TMAP2TSA) $< $@ --width 29 --height 19

graphics/statscreen/StatscreenHalo.bin: %.bin: %.tmap
	$(TMAP2TSA) $< $@ --width 17 --height 6

graphics/statscreen/StatscreenEquipmentBG.bin: %.bin: %.tmap
	$(TMAP2TSA) $< $@ --width 15 --height 5

graphics/statscreen/StatscreenEquipedWeaponHighlight.bin: %.bin: %.tmap
	$(TMAP2TSA) $< $@ --width 15 --height 0
