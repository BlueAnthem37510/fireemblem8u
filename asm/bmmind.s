	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Unit Action stuff (why "mind"?)

	THUMB_FUNC_START StoreRNStateToActionStruct
StoreRNStateToActionStruct: @ 0x08031FEC
	push {lr}
	ldr r0, _08031FF8  @ gUnknown_0203A958
	bl StoreRNState
	pop {r0}
	bx r0
	.align 2, 0
_08031FF8: .4byte gUnknown_0203A958

	THUMB_FUNC_START LoadRNStateFromActionStruct
LoadRNStateFromActionStruct: @ 0x08031FFC
	push {lr}
	ldr r0, _08032008  @ gUnknown_0203A958
	bl LoadRNState
	pop {r0}
	bx r0
	.align 2, 0
_08032008: .4byte gUnknown_0203A958

	THUMB_FUNC_START ApplyUnitAction
ApplyUnitAction: @ 0x0803200C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08032054  @ gUnknown_0203A958
	ldrb r0, [r5, #0xc]
	bl GetUnitStruct
	ldr r1, _08032058  @ gUnknown_03004E50
	str r0, [r1]
	ldrb r0, [r5, #0x11]
	cmp r0, #2
	bne _0803203C
	ldrb r0, [r5, #0xc]
	bl GetUnitStruct
	ldrb r1, [r5, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0xa6
	bne _0803203C
	b _08032148
_0803203C:
	ldr r0, _08032054  @ gUnknown_0203A958
	ldrb r0, [r0, #0x11]
	subs r0, #1
	cmp r0, #0x1d
	bls _08032048
	b _0803215C
_08032048:
	lsls r0, r0, #2
	ldr r1, _0803205C  @ _08032060
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08032054: .4byte gUnknown_0203A958
_08032058: .4byte gUnknown_03004E50
_0803205C: .4byte _08032060
_08032060: @ jump table
	.4byte _080320D8 @ case 0
	.4byte _08032104 @ case 1
	.4byte _08032148 @ case 2
	.4byte _0803210C @ case 3
	.4byte _0803215C @ case 4
	.4byte _08032124 @ case 5
	.4byte _0803212C @ case 6
	.4byte _08032134 @ case 7
	.4byte _080320EC @ case 8
	.4byte _080320F4 @ case 9
	.4byte _0803215C @ case 10
	.4byte _0803215C @ case 11
	.4byte _0803215C @ case 12
	.4byte _08032114 @ case 13
	.4byte _0803211C @ case 14
	.4byte _080320FC @ case 15
	.4byte _080320FC @ case 16
	.4byte _08032148 @ case 17
	.4byte _0803215C @ case 18
	.4byte _08032148 @ case 19
	.4byte _08032152 @ case 20
	.4byte _0803215C @ case 21
	.4byte _0803215C @ case 22
	.4byte _0803215C @ case 23
	.4byte _0803213C @ case 24
	.4byte _08032148 @ case 25
	.4byte _0803215C @ case 26
	.4byte _0803215C @ case 27
	.4byte _0803215C @ case 28
	.4byte _080320D8 @ case 29
_080320D8:
	ldr r0, _080320E8  @ gUnknown_03004E50
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	orrs r0, r1
	str r0, [r2, #0xc]
	b _0803215C
	.align 2, 0
_080320E8: .4byte gUnknown_03004E50
_080320EC:
	adds r0, r4, #0
	bl ActionRescue
	b _08032142
_080320F4:
	adds r0, r4, #0
	bl ActionDrop
	b _08032142
_080320FC:
	adds r0, r4, #0
	bl ActionVisitAndSieze
	b _08032142
_08032104:
	adds r0, r4, #0
	bl ActionCombat
	b _08032142
_0803210C:
	adds r0, r4, #0
	bl ActionDance
	b _08032142
_08032114:
	adds r0, r4, #0
	bl ActionTalk
	b _08032142
_0803211C:
	adds r0, r4, #0
	bl ActionSupport
	b _08032142
_08032124:
	adds r0, r4, #0
	bl ActionSteal
	b _08032142
_0803212C:
	adds r0, r4, #0
	bl ActionSummon
	b _08032142
_08032134:
	adds r0, r4, #0
	bl ActionSummonDK
	b _08032142
_0803213C:
	adds r0, r4, #0
	bl ActionArena
_08032142:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0803215E
_08032148:
	adds r0, r4, #0
	bl ActionStaffDoorChestUseItem
	movs r0, #0
	b _0803215E
_08032152:
	adds r0, r4, #0
	bl ActionPick
	movs r0, #0
	b _0803215E
_0803215C:
	movs r0, #1
_0803215E:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_START ActionRescue
ActionRescue: @ 0x08032164
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _080321B4  @ gUnknown_0203A958
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnitStruct
	adds r4, r0, #0
	bl TryRemoveUnitFromBallista
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	movs r3, #0x11
	ldrsb r3, [r4, r3]
	bl GetSomeFacingDirection
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	adds r3, r6, #0
	bl Make6CKOIDO
	adds r0, r5, #0
	adds r1, r4, #0
	bl UnitRescue
	adds r0, r4, #0
	bl HideUnitSMS
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080321B4: .4byte gUnknown_0203A958

	THUMB_FUNC_START sub_80321B8
sub_80321B8: @ 0x080321B8
	push {lr}
	ldr r1, [r0, #0x54]
	bl sub_80377F0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_80321C8
sub_80321C8: @ 0x080321C8
	push {lr}
	bl RefreshFogAndUnitMaps
	bl UpdateGameTilesGraphics
	bl SMS_UpdateFromGameData
	bl SMS_FlushIndirect
	pop {r1}
	bx r1

	THUMB_FUNC_START ActionDrop
ActionDrop: @ 0x080321E0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _08032248  @ gUnknown_0203A958
	ldrb r0, [r4, #0xd]
	bl GetUnitStruct
	adds r5, r0, #0
	ldrb r0, [r4, #0x14]
	ldr r1, _0803224C  @ gUnknown_0202E4EC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r4, #0x13]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08032254
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	bl ApplyUnitMovement
	ldrb r0, [r4, #0x13]
	ldrb r1, [r4, #0x14]
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	bl GetSomeFacingDirection
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #2
	adds r3, r6, #0
	bl Make6CKOIDO
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	ldrb r1, [r4, #0x13]
	ldrb r2, [r4, #0x14]
	bl UpdateRescuingData
	ldr r0, _08032250  @ gUnknown_0859DA6C
	adds r1, r6, #0
	bl Proc_CreateBlockingChild
	str r5, [r0, #0x54]
	b _08032262
	.align 2, 0
_08032248: .4byte gUnknown_0203A958
_0803224C: .4byte gUnknown_0202E4EC
_08032250: .4byte gUnknown_0859DA6C
_08032254:
	ldr r0, _0803226C  @ gUnknown_02033EFC
	movs r1, #0xa
	strb r1, [r0]
	movs r1, #4
	strb r1, [r0, #1]
	bl MU_StartMoveScript_Auto
_08032262:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803226C: .4byte gUnknown_02033EFC

	THUMB_FUNC_START ActionVisitAndSieze
ActionVisitAndSieze: @ 0x08032270
	push {r4, r5, lr}
	ldr r5, _08032298  @ gUnknown_0203A958
	ldrb r0, [r5, #0xc]
	bl GetUnitStruct
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	ldrb r0, [r5, #0xc]
	bl GetUnitStruct
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	bl sub_80840C4
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08032298: .4byte gUnknown_0203A958

	THUMB_FUNC_START ActionCombat
ActionCombat: @ 0x0803229C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, _0803231C  @ gUnknown_0203A958
	ldrb r0, [r4, #0xd]
	bl GetUnitStruct
	adds r6, r0, #0
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	ldrb r1, [r4, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIndex
	ldr r1, _08032320  @ gUnknown_0203A4EC
	adds r1, #0x7e
	movs r2, #0
	strb r2, [r1]
	cmp r0, #0xa6
	bne _080322FC
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	bl MakeTargetListForFuckingNightmare
	bl sub_804FD28
	adds r5, r0, #0
	movs r4, #0
	cmp r4, r5
	bge _080322FC
_080322E0:
	adds r0, r4, #0
	bl GetTarget
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnitStruct
	movs r1, #2
	bl SetUnitNewStatus
	adds r4, #1
	cmp r4, r5
	blt _080322E0
_080322FC:
	cmp r6, #0
	bne _08032304
	bl MakeSnagBattleTarget
_08032304:
	ldr r1, _0803231C  @ gUnknown_0203A958
	ldrb r0, [r1, #0x12]
	cmp r0, #8
	bne _08032324
	ldrb r0, [r1, #0xc]
	bl GetUnitStruct
	adds r1, r6, #0
	bl sub_802A384
	b _08032330
	.align 2, 0
_0803231C: .4byte gUnknown_0203A958
_08032320: .4byte gUnknown_0203A4EC
_08032324:
	ldrb r0, [r1, #0xc]
	bl GetUnitStruct
	adds r1, r6, #0
	bl sub_802A350
_08032330:
	ldr r0, _08032340  @ gUnknown_0859DABC
	adds r1, r7, #0
	bl Proc_CreateBlockingChild
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08032340: .4byte gUnknown_0859DABC

	THUMB_FUNC_START ActionArena
ActionArena: @ 0x08032344
	push {lr}
	adds r1, r0, #0
	ldr r0, _08032354  @ gUnknown_0859DB24
	bl Proc_CreateBlockingChild
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_08032354: .4byte gUnknown_0859DB24

	THUMB_FUNC_START ActionDance
ActionDance: @ 0x08032358
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0803239C  @ gUnknown_0203A958
	ldrb r0, [r4, #0xd]
	bl GetUnitStruct
	ldr r1, [r0, #0xc]
	ldr r2, _080323A0  @ 0xFFFFFBBD
	ands r1, r2
	str r1, [r0, #0xc]
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	movs r1, #1
	negs r1, r1
	bl sub_802CB24
	ldrb r0, [r4, #0xd]
	bl GetUnitStruct
	bl sub_802CBC8
	ldr r1, _080323A4  @ gUnknown_0203A4D4
	movs r0, #0x40
	strh r0, [r1]
	adds r0, r5, #0
	bl SaveInstigatorWith10ExtraExp
	bl BeginBattleAnimations
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0803239C: .4byte gUnknown_0203A958
_080323A0: .4byte 0xFFFFFBBD
_080323A4: .4byte gUnknown_0203A4D4

	THUMB_FUNC_START ActionTalk
ActionTalk: @ 0x080323A8
	push {r4, r5, lr}
	ldr r4, _080323D0  @ gUnknown_0203A958
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	ldr r0, [r0]
	ldrb r5, [r0, #4]
	ldrb r0, [r4, #0xd]
	bl GetUnitStruct
	ldr r0, [r0]
	ldrb r1, [r0, #4]
	adds r0, r5, #0
	bl sub_8083FB0
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080323D0: .4byte gUnknown_0203A958

	THUMB_FUNC_START ActionSupport
ActionSupport: @ 0x080323D4
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	ldr r0, _08032474  @ gUnknown_0203A958
	ldrb r0, [r0, #0xd]
	bl GetUnitStruct
	adds r4, r0, #0
	ldr r0, _08032478  @ gUnknown_03004E50
	mov r9, r0
	ldr r0, [r0]
	ldr r1, [r4]
	ldrb r1, [r1, #4]
	bl GetSupportDataIdForOtherUnit
	adds r7, r0, #0
	mov r1, r9
	ldr r0, [r1]
	ldr r0, [r0]
	ldrb r1, [r0, #4]
	adds r0, r4, #0
	bl GetSupportDataIdForOtherUnit
	mov r8, r0
	adds r0, r4, #0
	mov r1, r8
	bl CanUnitSupportCommandWith
	mov r2, r9
	ldr r0, [r2]
	adds r1, r7, #0
	bl sub_80282DC
	adds r0, r4, #0
	mov r1, r8
	bl sub_80282DC
	mov r1, r9
	ldr r0, [r1]
	ldr r1, [r0]
	ldrb r6, [r1, #4]
	ldr r1, [r4]
	ldrb r5, [r1, #4]
	adds r1, r7, #0
	bl GetSupportLevelBySupportIndex
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_808371C
	mov r2, r9
	ldr r0, [r2]
	adds r0, #0x32
	adds r0, r0, r7
	ldrb r0, [r0]
	adds r4, #0x32
	add r4, r8
	ldrb r1, [r4]
	cmp r0, r1
	beq _08032464
	cmp r0, r1
	ble _08032456
	strb r0, [r4]
_08032456:
	cmp r0, r1
	bge _08032464
	mov r2, r9
	ldr r0, [r2]
	adds r0, #0x32
	adds r0, r0, r7
	strb r1, [r0]
_08032464:
	movs r0, #0
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08032474: .4byte gUnknown_0203A958
_08032478: .4byte gUnknown_03004E50

	THUMB_FUNC_START ActionSteal
ActionSteal: @ 0x0803247C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, _080324F4  @ gUnknown_0203A958
	ldrb r0, [r4, #0xd]
	bl GetUnitStruct
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	ands r0, r1
	cmp r0, #0
	beq _080324AC
	ldrb r4, [r4, #0x12]
	adds r0, r5, #0
	bl GetUnitItemCount
	subs r0, #1
	cmp r4, r0
	bne _080324AC
	ldr r0, [r5, #0xc]
	ldr r1, _080324F8  @ 0xFFFFEFFF
	ands r0, r1
	str r0, [r5, #0xc]
_080324AC:
	ldr r4, _080324F4  @ gUnknown_0203A958
	ldrb r0, [r4, #0xd]
	bl GetUnitStruct
	ldrb r1, [r4, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r6, [r0]
	ldrb r0, [r4, #0xd]
	bl GetUnitStruct
	ldrb r1, [r4, #0x12]
	bl UnitRemoveItem
	movs r0, #0xff
	ands r0, r6
	cmp r0, #0x9a
	blt _080324FC
	cmp r0, #0xa0
	ble _080324DE
	cmp r0, #0xb9
	bgt _080324FC
	cmp r0, #0xb8
	blt _080324FC
_080324DE:
	bl GetPartyGoldAmount
	adds r4, r0, #0
	adds r0, r6, #0
	bl GetItemCost
	adds r4, r4, r0
	adds r0, r4, #0
	bl SetPartyGoldAmount
	b _0803250A
	.align 2, 0
_080324F4: .4byte gUnknown_0203A958
_080324F8: .4byte 0xFFFFEFFF
_080324FC:
	ldr r0, _0803254C  @ gUnknown_0203A958
	ldrb r0, [r0, #0xc]
	bl GetUnitStruct
	adds r1, r6, #0
	bl UnitAddItem
_0803250A:
	ldr r5, _0803254C  @ gUnknown_0203A958
	ldrb r0, [r5, #0xc]
	bl GetUnitStruct
	movs r1, #1
	negs r1, r1
	bl sub_802CB24
	ldr r4, _08032550  @ gUnknown_0203A56C
	adds r1, r4, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	ldrb r0, [r5, #0xd]
	bl GetUnitStruct
	adds r1, r0, #0
	adds r0, r4, #0
	bl CopyUnitToBattleStruct
	adds r4, #0x48
	strh r6, [r4]
	adds r0, r7, #0
	bl SaveInstigatorWith10ExtraExp
	bl MU_EndAll
	bl BeginMapAnimForSteal
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803254C: .4byte gUnknown_0203A958
_08032550: .4byte gUnknown_0203A56C

	THUMB_FUNC_START ActionSummon
ActionSummon: @ 0x08032554
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08032578  @ gUnknown_0203A4EC
	ldr r1, _0803257C  @ gUnknown_03004E50
	ldr r1, [r1]
	bl CopyUnitToBattleStruct
	adds r0, r4, #0
	bl SaveInstigatorWith10ExtraExp
	bl MU_EndAll
	bl BeginMapAnimForSummon
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08032578: .4byte gUnknown_0203A4EC
_0803257C: .4byte gUnknown_03004E50

	THUMB_FUNC_START ActionSummonDK
ActionSummonDK: @ 0x08032580
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080325A4  @ gUnknown_0203A4EC
	ldr r1, _080325A8  @ gUnknown_03004E50
	ldr r1, [r1]
	bl CopyUnitToBattleStruct
	adds r0, r4, #0
	bl SaveInstigatorWith10ExtraExp
	bl MU_EndAll
	bl BeginMapAnimForSummonDK
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080325A4: .4byte gUnknown_0203A4EC
_080325A8: .4byte gUnknown_03004E50

	THUMB_FUNC_START sub_80325AC
sub_80325AC: @ 0x080325AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x38
	ldrsh r1, [r6, r0]
	movs r3, #0x3c
	ldrsh r2, [r6, r3]
	adds r7, r6, #0
	adds r7, #0x46
	movs r4, #0
	ldrsh r3, [r7, r4]
	adds r5, r6, #0
	adds r5, #0x48
	movs r4, #0
	ldrsh r0, [r5, r4]
	str r0, [sp]
	movs r0, #0
	bl sub_8012DCC
	mov r8, r0
	movs r0, #0x3a
	ldrsh r1, [r6, r0]
	movs r3, #0x3e
	ldrsh r2, [r6, r3]
	movs r4, #0
	ldrsh r3, [r7, r4]
	movs r4, #0
	ldrsh r0, [r5, r4]
	str r0, [sp]
	movs r0, #0
	bl sub_8012DCC
	adds r2, r0, #0
	adds r1, r6, #0
	adds r1, #0x40
	movs r3, #0
	ldrsh r0, [r1, r3]
	adds r2, r2, r0
	adds r3, r6, #0
	adds r3, #0x42
	ldrh r0, [r3]
	ldrh r4, [r1]
	adds r0, r0, r4
	strh r0, [r1]
	adds r0, r6, #0
	adds r0, #0x44
	ldrh r0, [r0]
	ldrh r1, [r3]
	adds r0, r0, r1
	strh r0, [r3]
	ldr r1, _08032654  @ gUnknown_0202BCB0
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	mov r3, r8
	subs r4, r3, r0
	movs r3, #0xe
	ldrsh r0, [r1, r3]
	subs r2, r2, r0
	ldr r3, [r6, #0x2c]
	movs r0, #7
	adds r1, r4, #0
	bl sub_8027B60
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r4, #0
	ldrsh r1, [r5, r4]
	cmp r0, r1
	bne _08032646
	adds r0, r6, #0
	bl Proc_ClearNativeCallback
_08032646:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08032654: .4byte gUnknown_0202BCB0

	THUMB_FUNC_START sub_8032658
sub_8032658: @ 0x08032658
	push {lr}
	ldr r1, [r0, #0x2c]
	bl sub_8037830
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8032664
sub_8032664: @ 0x08032664
	push {lr}
	bl RefreshFogAndUnitMaps
	bl SMS_UpdateFromGameData
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8032674
sub_8032674: @ 0x08032674
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	bl GetUnitCurrentHP
	adds r6, r0, #0
	cmp r6, #0
	bne _08032716
	ldr r0, [r5, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08032716
	ldr r0, _0803271C  @ gUnknown_0859DA94
	adds r1, r4, #0
	bl Proc_CreateBlockingChild
	adds r4, r0, #0
	ldrb r0, [r5, #0x1b]
	bl GetUnitStruct
	str r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x30
	adds r2, r4, #0
	adds r2, #0x34
	adds r0, r5, #0
	bl sub_80184E0
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x34]
	adds r0, r5, #0
	bl UpdateRescuingData
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	lsls r0, r0, #4
	strh r0, [r4, #0x38]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	lsls r0, r0, #4
	strh r0, [r4, #0x3a]
	ldr r0, [r4, #0x30]
	lsls r0, r0, #4
	strh r0, [r4, #0x3c]
	ldr r0, [r4, #0x34]
	lsls r0, r0, #4
	strh r0, [r4, #0x3e]
	adds r0, r4, #0
	adds r0, #0x40
	strh r6, [r0]
	adds r1, r4, #0
	adds r1, #0x42
	ldr r0, _08032720  @ 0x0000FFFB
	strh r0, [r1]
	adds r1, #2
	movs r0, #1
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x46
	strh r6, [r0]
	adds r1, #4
	movs r0, #0xb
	strh r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSMSIndex
	bl SMS_RegisterUsage
	bl SMS_FlushIndirect
	ldr r0, _08032724  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08032716
	movs r0, #0xac
	bl m4aSongNumStart
_08032716:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803271C: .4byte gUnknown_0859DA94
_08032720: .4byte 0x0000FFFB
_08032724: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START sub_8032728
sub_8032728: @ 0x08032728
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetUnitCurrentHP
	cmp r0, #0
	bne _0803274A
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	ldr r1, [r5]
	ldrb r1, [r1, #4]
	movs r2, #2
	bl BWL_AddWinOrLossIdk
	adds r0, r4, #0
	bl sub_80183FC
_0803274A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8032750
sub_8032750: @ 0x08032750
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitCurrentHP
	cmp r0, #0
	bne _0803276E
	adds r0, r4, #0
	bl sub_80183FC
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	movs r1, #0
	movs r2, #6
	bl BWL_AddWinOrLossIdk
_0803276E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START BATTLE_GOTO1_IfNobodyIsDead
BATTLE_GOTO1_IfNobodyIsDead: @ 0x08032774
	push {lr}
	adds r2, r0, #0
	ldr r0, _080327A8  @ gUnknown_0203A4D4
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0803279C
	ldr r0, _080327AC  @ gUnknown_0203A4EC
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080327A4
	ldr r0, _080327B0  @ gUnknown_0203A56C
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080327A4
_0803279C:
	adds r0, r2, #0
	movs r1, #1
	bl Proc_GotoLabel
_080327A4:
	pop {r0}
	bx r0
	.align 2, 0
_080327A8: .4byte gUnknown_0203A4D4
_080327AC: .4byte gUnknown_0203A4EC
_080327B0: .4byte gUnknown_0203A56C

	THUMB_FUNC_START DidUnitDie
DidUnitDie: @ 0x080327B4
	push {lr}
	bl GetUnitCurrentHP
	cmp r0, #0
	bne _080327C2
	movs r0, #1
	b _080327C4
_080327C2:
	movs r0, #0
_080327C4:
	pop {r1}
	bx r1

	THUMB_FUNC_START BATTLE_ProbablyMakesTheDeadUnitDissapear
BATTLE_ProbablyMakesTheDeadUnitDissapear: @ 0x080327C8
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r0, #0
	str r0, [r6, #0x54]
	ldr r7, _08032850  @ gUnknown_0203A4EC
	adds r0, r7, #0
	bl DidUnitDie
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080327F2
	ldr r0, _08032854  @ gProcScr_MoveUnit
	bl Proc_Find
	adds r4, r0, #0
	bl MU_StartDeathFade
	str r4, [r6, #0x54]
	adds r0, r7, #0
	bl TryRemoveUnitFromBallista
_080327F2:
	ldr r5, _08032858  @ gUnknown_0203A56C
	adds r0, r5, #0
	bl DidUnitDie
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803284A
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	bl GetUnitStruct
	ldr r1, [r0, #0xc]
	movs r2, #1
	orrs r1, r2
	str r1, [r0, #0xc]
	bl TryRemoveUnitFromBallista
	bl SMS_UpdateFromGameData
	adds r0, r5, #0
	bl MU_Create
	adds r4, r0, #0
	movs r0, #0x10
	ldrsb r0, [r7, r0]
	movs r1, #0x11
	ldrsb r1, [r7, r1]
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	bl GetFacingDirection
	ldr r1, _0803285C  @ gUnknown_02033EFC
	strb r0, [r1]
	movs r0, #4
	strb r0, [r1, #1]
	adds r0, r4, #0
	bl MU_StartMoveScript
	adds r0, r4, #0
	bl MU_StartDeathFade
	str r4, [r6, #0x54]
_0803284A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08032850: .4byte gUnknown_0203A4EC
_08032854: .4byte gProcScr_MoveUnit
_08032858: .4byte gUnknown_0203A56C
_0803285C: .4byte gUnknown_02033EFC

	THUMB_FUNC_START BATTLE_DeleteLinkedMOVEUNIT
BATTLE_DeleteLinkedMOVEUNIT: @ 0x08032860
	push {lr}
	ldr r0, [r0, #0x54]
	bl MU_End
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_803286C
sub_803286C: @ 0x0803286C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetUnitStruct
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0x66
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetUnitStruct
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8032674
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8032674
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_8032728
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8032728
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80328B0
sub_80328B0: @ 0x080328B0
	push {r4, lr}
	bl GetCurrentMapMusicIndex
	adds r4, r0, #0
	bl Sound_GetCurrentSong
	cmp r0, r4
	beq _080328CA
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0
	bl Sound_PlaySong80024E4
_080328CA:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START BATTLE_HandleItemDrop
BATTLE_HandleItemDrop: @ 0x080328D0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r7, #0
	ldr r6, _08032960  @ gUnknown_0203A4EC
	movs r1, #0xb
	ldrsb r1, [r6, r1]
	adds r0, #0x64
	strh r1, [r0]
	ldr r4, _08032964  @ gUnknown_0203A56C
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	mov r1, r8
	adds r1, #0x66
	strh r0, [r1]
	movs r0, #0x13
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bne _0803290C
	movs r0, #0xb
	ldrsb r0, [r6, r0]
	bl GetUnitStruct
	adds r7, r0, #0
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	bl GetUnitStruct
	adds r5, r0, #0
_0803290C:
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08032928
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	bl GetUnitStruct
	adds r7, r0, #0
	movs r0, #0xb
	ldrsb r0, [r6, r0]
	bl GetUnitStruct
	adds r5, r0, #0
_08032928:
	cmp r7, #0
	beq _08032968
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	ands r0, r1
	cmp r0, #0
	beq _08032968
	ldrh r0, [r7, #0x1e]
	cmp r0, #0
	beq _08032968
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _08032968
	adds r0, r7, #0
	bl GetUnitLastItem
	adds r1, r0, #0
	adds r0, r5, #0
	mov r2, r8
	bl NewGeneralItemGot
	movs r0, #0
	b _0803296A
	.align 2, 0
_08032960: .4byte gUnknown_0203A4EC
_08032964: .4byte gUnknown_0203A56C
_08032968:
	movs r0, #1
_0803296A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_8032974
sub_8032974: @ 0x08032974
	push {lr}
	adds r2, r0, #0
	ldr r1, _08032998  @ gUnknown_0203A56C
	movs r0, #1
	strb r0, [r1, #0x12]
	strb r0, [r1, #0x13]
	ldr r0, _0803299C  @ gUnknown_0203A4EC
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08032994
	adds r0, r2, #0
	movs r1, #1
	bl Proc_GotoLabel
_08032994:
	pop {r0}
	bx r0
	.align 2, 0
_08032998: .4byte gUnknown_0203A56C
_0803299C: .4byte gUnknown_0203A4EC

	THUMB_FUNC_START sub_80329A0
sub_80329A0: @ 0x080329A0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080329BC  @ gUnknown_03004E50
	ldr r0, [r4]
	bl sub_8032750
	ldr r1, [r4]
	adds r0, r5, #0
	bl sub_8032674
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080329BC: .4byte gUnknown_03004E50

	THUMB_FUNC_START sub_80329C0
sub_80329C0: @ 0x080329C0
	push {r4, lr}
	ldr r4, _080329D4  @ gUnknown_0203A974
	adds r1, r4, #0
	movs r2, #7
	bl CpuFastSet
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080329D4: .4byte gUnknown_0203A974

.align 2, 0
