INCLUDE "hardware.inc"

SECTION "Header", ROM0[$100]
	jp EntryPoint
    ds $150 - @, 0 		; Make room for the Header

EntryPoint:
WaitVBlank: 			; Do not turn off LCD outside of VBlank
	ld a, [rLY]
    cp 144
    jp c, WaitVBlank
    
    ;Turn off LCD
    ld a, 0
    ld [rLCDC], a
    
; Copy Tile Data
	ld de, Tiles
    ld hl, $9000
    ld bc, TilesEnd - Tiles
    
CopyTiles:
	ld a, [de]
    ld [hli], a
    inc de
    dec bc
    ld a, b
    or a, c
    jp nz, CopyTiles
    
; Copy Tilemap
	ld de, Tilemap
    ld hl, $9800
    ld bc, TilemapEnd - Tilemap
    
CopyTilemap:
	ld a, [de]
    ld [hli], a
    inc de
    dec bc
    ld a, b
    or a, c
    jp nz, CopyTileMap
    
; Turn on LCD
	ld a, LCDCF_ON | LCDCF_BGON
    ld [rLCDC] , a
    
    ; During first blank frame, init display registers
    ld a, %11100100
    ld [rBGP], a
    
Done:
	jp Done
    
Tiles:
    dw `33333333
    dw `33333333
    dw `33333333
    dw `33322222
    dw `33322222
    dw `33322222
    dw `33322211
    dw `33322211
    dw `33333333
    dw `33333333
    dw `33333333
    dw `22222222
    dw `22222222
    dw `22222222
    dw `11111111
    dw `11111111
    dw `33333333
    dw `33333333
    dw `33333333
    dw `22222333
    dw `22222333
    dw `22222333
    dw `11222333
    dw `11222333
    dw `33333333
    dw `33333333
    dw `33333333
    dw `33333333
    dw `33333333
    dw `33333333
    dw `33333333
    dw `33333333
    dw `33322211
    dw `33322211
    dw `33322211
    dw `33322211
    dw `33322211
    dw `33322211
    dw `33322211
    dw `33322211
    dw `22222222
    dw `20000000
    dw `20111111
    dw `20111111
    dw `20111111
    dw `20111111
    dw `22222222
    dw `33333333
    dw `22222223
    dw `00000023
    dw `11111123
    dw `11111123
    dw `11111123
    dw `11111123
    dw `22222223
    dw `33333333
    dw `11222333
    dw `11222333
    dw `11222333
    dw `11222333
    dw `11222333
    dw `11222333
    dw `11222333
    dw `11222333
    dw `00000000
    dw `00000000
    dw `00000000
    dw `00000000
    dw `00000000
    dw `00000000
    dw `00000000
    dw `00000000
    dw `11001100
    dw `11111111
    dw `11111111
    dw `21212121
    dw `22222222
    dw `22322232
    dw `23232323
    dw `33333333
    ; Paste your logo here:
    
TilesEnd:
