				; GBZ80 Hello World (ASM)
org &0000			;RST 0-7

org &0040			;int. Vblank
	reti
org &0048			;int. LCD-Stat
	reti
org &0050			;int. timer
	reti
org &0058			;int. serial
	reti
org &0060			;int. joyp
	reti
    
; Init routine
sstart:
	org &0100
    nop				;0100	0103	Entry Point (start of program)
    jp begin
    
				; HEADER
;0104-0133 NNTD Logo (Match ROM logo)
db 