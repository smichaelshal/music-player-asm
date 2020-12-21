
; --------------------------
;Music Player
; --------------------------



; --------------------------

;Michael Shalitin 2019.
;TASM 16 BIT.
;Var CD - Songs Folder (c:\music).
;Contains up to 1000 songs.

; --------------------------

IDEAL
MODEL small
STACK 100h
DATASEG

; --------------------------
; Your variables here
; --------------------------
numbers_chars db 5 dup (0) ; Print number of song
numbers_charsoff dw 0 ; offset numbers_chars

lengh_num1 dw 0; lengh  number of song
while_numbers1 dw 0
num_of_music1 dw 0
num_music1 dw 0
nums_var1 dw 0d
nums_var2 dw 0d

num_div dw 0
num_mod dw 0

xs1 dw 0
ys1 dw 50
ls1 dw 400d
cs1 dw 0d
ws1 dw 100d

color_white dw 15d

point1 dw 0
len_var1 db 0

row_var1 db 5
column_var1 db 15d
color2 dw 12d

poin1 dw 0
poin2 dw 0

x1 dw 1
y1 dw 1
color1 dw 12
length1 dw 10
with1 dw 10

xs dw 0
ys dw 0


backsp1 dw 0
backsp2 dw 0

seeks1 db 0

varseek1 dw 0
varseek2 dw 0

seekvarup1 db 0
micro1 dw 0
micro2 dw 0
micro3 dw 0
micro4 dw 0

number_of_music1 dw 1

datanamesoff2 dw 0
mainvar1 db 0
varrr dw 256d

datanames db 3E80h dup (0); buffer names songs

CD db 'c:\music', 0 ;  Songs Folder
CD2 db 'c:\assembly\tasm\bin', 0 ;  Songs Folder


on1 db 0

varup1 db 0
varup2 db 0
varup3 db 0
varup4 db 0

vardown1 db 0
vardown2 db 0
vardown3 db 0
vardown4 db 0

pointers dw 0
number_of_music2 dw 0

datanamesoff dw 0
datanamesoff3 dw 0

DTA db 64d dup (0)
FileNamess db '*.wav' ; filter file of wav
DTAoff dw 0

message db 8 dup (0)
messageoff dw 0
messageoff2 dw 0
messageoff3 dw 0

true_egg1 db 0

eas1 db 0
eas2 db 0
eas3 db 0

esc1 db 0
esc2 db 0

easarr1 db 8 dup (0)

;scan_code1 db 32h , 17h, 2Eh, 24h, 1Eh, 12h, 26h, 0; michael
;scan_code2 db 0B2h , 97h, 0AEh, 0A4h, 9Eh, 92h, 0A6h, 0; michael

scan_code1 db 13h, 1Eh, 31h, 0; ran
scan_code2 db  93h , 9Eh, 0B1h, 0; ran

;scan_code1 db 38h , 13h, 37h, 0; ori
;scan_code2 db  0B8h , 93h, 0B7h, 0; ori

easarr1off1 dw 0
scan_code1off1 dw 0
scan_code2off1 dw 0

ot1 db 0

egg_m db 0

michael_var1 db 'Michael', 0
color_red db 12d

michael_var1off dw 0

var_m db 0
var_m2 db 0


forwardvar1 db 0
forwardvar2 db 0
forwardvar3 db 0

filenamearray db 230d dup (0)

dileyvar dw 1d ;170d
dileyvar2 dw 0

secends3 dw 0

sample_rate dw 0

bits1 dw 0
bits2 dw 0

chan_bit dw 0

bitpersimple2 dw 0

channels2 dw 0

sps1 dw 4000d

bitpersimple dw 0

chan dw 22d
bitper dw 34d

channels dw 2d
sample_rate_off dw 24d

num1 dw 1
num2 dw 2
num3 dw 3
num4 dw 4
num6 dw 6

sizefile3 dw 0; size file 2
sizefile4 dw 0; size file 1

sizefile5 dw 0; size file 2
sizefile6 dw 0; size file 1

backsp3 dw 0
backsp4 dw 0

mon2 db 0

mon1 db 0

le1 dw 0
le2 dw 0

dilvar1 dw 1

varstop1 db 0

secends1 dw 0

secends2 dw 0

mikom2 dw 22
kamot2 dw 2

filehandle1 dw 0 ; 2
sizefile1 dw 0; size file 1
sizefile2 dw 0; size file 2

sums1 dw 1d

len1 dw 1d ; 2
len2 dw 2d ; 2

kamot1 dw 2d; kamot byte
mikom1 dw 4d; vars read

bd1 dd 1d

pointer1 dw 0 ; 2
pointer2 dw 0 ; 2
loops1 dw 0 ; 2

header1 db 44d dup (1); 44
buff1 db 42h ;72

keyboardoff1 dw 0

keyboard1 db 0

filenamearray_off dw 0
filenames_off dw 0

slesh db '/', 0


buffer_keyboard1 db 100d dup (0)
key1 db 0
key2 db 0
key0 db 0

point_key_var dw 0
point_key_off dw 0

hPress_var1 db 0
hPress_var2 db 0
hPress_var3 db 0

help_color db 15d

help_play1 db 'P - Play music', 0
help_stop1 db 'S - Stop music', 0
help_music_back1 db '< - Music back (Left)', 0
help_music_next1 db '> - Music next (Right)', 0
help_next1 db '>> - Song next (Down)', 0
help_back1 db '<< - Song back (Up)', 0
print_help db 'H - Help', 0

CODESEG
;Procedure (Function)
;equ

proc open_file

	filename equ [bp + 4d]

	push bp
	mov bp, sp

	; Open file
	mov ah, 3Dh
	mov al, 2h
	mov dx, filename
	int 21h
	mov [filehandle1], ax
	pop bp
	ret 2d
endp open_file


proc read_file
	push bp
	mov bp, sp

	lens equ [bp + 6d]
	buff2 equ [bp + 4d]


	; Read file
	mov ah,3Fh
	mov bx, lens
	mov cx, [bx]
	mov bx, [filehandle1]
	mov dx, buff2
	int 21h

	pop bp
	ret 4d
endp read_file

proc close_file
	; close file
	mov ah,3Eh
	mov bx, [filehandle1]
	int 21h
	ret
endp close_file

proc open_speaker
	; open speaker
	in al, 61h
	or al, 00000011b
	out 61h, al
	ret
	; send control word to change frequency
	mov al, 0B6h
	out 43h, al
endp open_speaker

proc close_speaker
	; close the speaker
	in al, 61h
	and al, 11111100b
	out 61h, al
	ret
endp close_speaker

proc diley1


	;diley loops
	push cx
	mov cx, [dileyvar]
d1:
	nop
	loop d1
	pop cx
	ret
endp diley1

proc diley2
	;diley loops
	mov cx, 1d
	mov dx, 0d

	mov ah, 86h
	int 15h

	ret
endp diley2

proc read_header
	; read piece from header file
	push bp
	mov bp, sp

	offs1 equ [bp + 8d]
	kamot equ [bp + 6d]
	mikom equ [bp + 4d]


	mov bx, kamot
	mov ax, [bx]

	cmp ax, 2d
	je rh1
	jne rh2

rh1:
	mov bx, mikom
	mov bx, [bx]
	add bx, offset header1
	mov ax, [bx]

	mov bx, offs1
	mov [bx], ax

	jmp rh3
rh2:
	mov bx, mikom
	mov bx, [bx]
	add bx, offset header1
	mov al, [bx]

	mov bx, offs1
	mov [bx], al
rh3:

	pop bp
	ret 6d
endp read_header

proc head1

	;read head file
headloop1:
	push offset len2

	mov bx, offset header1
	add bx, [pointer1]
	push bx
	add [pointer1], 2d

	call read_file

	cmp [pointer1], 44d
	jb headloop1


	ret
endp head1

proc lenn1
	;size file to sizefile1 and sizefile2 (little endian)
	push offset len1
	push offset kamot2
	push offset mikom2
	call read_header
	ret
endp lenn1

proc size1
	;size file to sizefile1 and sizefile2 (little endian)
	push offset sizefile1
	push offset kamot1
	push offset mikom1
	call read_header

	add [mikom1], 2d

	push offset sizefile2
	push offset kamot1
	push offset mikom1
	call read_header
	ret
endp size1

proc sample_rate_func

	; sample rate

	push offset sample_rate
	push offset channels
	push offset sample_rate_off
	call read_header

	ret
endp sample_rate_func

proc channels2_func

	; channel

	push offset channels2; offset
	push offset num1 ; kamot
	push offset chan ; mikiom
	call read_header

	ret
endp channels2_func

proc bitpersimple_func

	; bit per simple

	push offset bitpersimple; offset
	push offset num1 ; kamot
	push offset bitper ; mikiom
	call read_header

	ret
endp bitpersimple_func

proc head_file


	;read header
	call head1

	;read size file
	call size1

	;read lengh file
	call lenn1

	;read size file
	call sample_rate_func
	call channels2_func
	call bitpersimple_func
	call mathdil1

	; bit per simple
	mov ax, [bitpersimple]
	mov bl, 8d
	div bl
	mov ah, al
	mov al, 0
	mov [bitpersimple2], 1

	;Calculates amount bits of 10 secends from file
	call muls

	ret
endp head_file

proc reads

	push offset len1

	;read bytes for buff1 from play
	push offset buff1
	call read_file

	ret
endp reads

proc stop_music1
	;stop music

	mov [varstop1], 1
	jmp lop5

	ret
endp stop_music1

proc play_music1
	;play music

	mov [varstop1], 0

	ret
endp play_music1

proc loop_file
	;The song playing loop

	mov ax, [sizefile1]
	mov [sizefile3], ax; min

	mov ax, [sizefile2]
	mov [sizefile4], ax; max

;if file 1
	;------------------------------------
lop1:


	cmp [dilvar1], 0
	jne bbb1

	mov ax, [sizefile5]
	cmp [sizefile3], ax
	jne bbb1

	mov ax,  [sizefile6]
	cmp [sizefile4], ax
	jne bbb1

	mov [dilvar1], 1

bbb1:

	cmp [dilvar1], 0
	jne bbb3

	mov ax, [sizefile5]
	cmp [sizefile3], ax
	jne bbb3

	mov ax,  [sizefile6]
	cmp [sizefile4], ax
	jne bbb3

	mov [dilvar1], 1

bbb3:


WaitForh:
	; button help (h)

	in al, 64h ; Read keyboard status port
	cmp al, 10b ; Data in buffer ?
	je WaitForh ; Wait until data available

	;donw button h
	in al, 60h ; Get keyboard data
	cmp al, 23h ; 39h
	jne hPressed

	mov [hPress_var1], 1

hPressed:

	cmp [hPress_var1], 1
	jne hPresseda

WaitForh2:
	in al, 64h ; Read keyboard status port
	cmp al, 10b ; Data in buffer ?
	je WaitForh2 ; Wait until data available

	;up button h
	in al, 60h ; Get keyboard data
	cmp al, 0A3h ; 39h
	jne hPressed2

	mov [hPress_var2], 1

hPressed2:

hPresseda:

	cmp [hPress_var1], 1
	jne hPressed3

	cmp [hPress_var2], 1
	jne hPressed3

	mov [hPress_var1], 0
	mov [hPress_var2], 0


;--------------------------- jump

	jmp hP1
hPressed3:
	jmp hPressed3a
hP1:

;--------------------------- jump

	call help1

	mov [row_var1], 5
	mov [column_var1], 15d

	mov ax, [pointers]
	cmp ax, 2d
	jne he1

	call print_names

	jmp he3
he1:
	mov ax, [pointers]
	cmp ax, 0
	jne he2

	mov ax, [number_of_music1]
	dec ax
	mov [pointers], ax
	call print_names

	inc [pointers]

	jmp he3
he2:

	mov ax, [pointers]
	cmp ax, 99d
	jne he4s

	;dec [pointers]

	;call print_names

; ------------------------------

	add [row_var1], 3d
	mov bx, offset datanames
	add bx, [poin2]
	add bx, 32d

	push offset row_var1
	push offset column_var1
	push offset color_white
	push bx
	call strints1

	mov cx, 4d
namsasaff:
	pop ax
	loop namsasaff

	add [row_var1], 3d
	mov bx, offset datanames
	add bx, [poin2]
	add bx, 16d

	push offset row_var1
	push offset column_var1
	push offset color_white
	push bx
	call strints1

	mov cx, 4d
namsasaf:
	pop ax
	loop namsasaf

;--------------------------- jump

	jmp he4f
he4s:
	jmp he4
he4f:

;--------------------------- jump



	add [row_var1], 3d
	mov bx, offset datanames
	add bx, [poin2]

	push offset row_var1
	push offset column_var1
	push offset color_red
	push bx
	call strints1

	mov cx, 4d
namsasaf2f:
	pop ax
	loop namsasaf2f


	add [row_var1], 3d
	mov bx, offset datanames
	add bx, [poin2]
	sub bx, 16d

; ------------------------------

	inc [pointers]

	jmp he3
he4:
	dec [pointers]
	call print_names
	inc [pointers]

he3:

hPressed3a:

WaitForData:
	; button srop (s)

	in al, 64h ; Read keyboard status port
	cmp al, 10b ; Data in buffer ?
	je WaitForData ; Wait until data available

	;donw button s
	in al, 60h ; Get keyboard data
	cmp al, 1Fh ; 39h

	jne ESCPressed

	cmp [dilvar1], 1
	jne ds1s2

	; stop music
	call stop_music1

ds1s2:

ESCPressed:


WaitForData3:
	; button srop (< - (left)), (<)

	in al, 64h ; Read keyboard status port
	cmp al, 10b ; Data in buffer ?
	je WaitForData3 ; Wait until data available

	;donw button <
	in al, 60h ; Get keyboard data
	cmp al, 4Bh ; 39h
	jne ESCPressed3

	mov [le1], 1

ESCPressed3:

	;up button <
	in al, 60h ; Get keyboard data
	cmp al, 0CBh ; 39h
	jne ESCPressed4

	mov [le2], 1

ESCPressed4:

	cmp [le1], 1
	jne ESCPressed5

	cmp [le2], 1
	jne ESCPressed5

	mov ax, [sizefile2]
	mov bx, [backsp1]

	sub ax, bx


	cmp [sizefile4], ax
	ja down_seek1

	call movseekdown


	mov bx, [backsp1]
	add [sizefile4], bx

	mov [seeks1], 1

down_seek1:

	mov [seeks1], 0

	mov [le1], 0
	mov [le2], 0

ESCPressed5:
	mov [le2], 0

WaitForData3s:
	; button srop (> - (left)), (>)
	in al, 64h ; Read keyboard status port
	cmp al, 10b ; Data in buffer ?
	je WaitForData3s ; Wait until data available

	;donw button >
	in al, 60h ; Get keyboard data
	cmp al, 4Dh ; 39h
	jne ESCPressed3s

	mov [le1], 1

ESCPressed3s:

	;up button >
	in al, 60h ; Get keyboard data
	cmp al, 0CDh ; 39h
	jne ESCPressed4s

	mov [le2], 1

ESCPressed4s:

	cmp [le1], 1
	jne ESCPressed5s

	cmp [le2], 1
	jne ESCPressed5s

	call seek_proc_up

	sub [sizefile3], 700h

	mov [le1], 0
	mov [le2], 0

ESCPressed5s:
	mov [le2], 0

;----------------------------- m
;ran

WaitForDatam:
	in al, 64h ; Read keyboard status port
	cmp al, 10b ; Data in buffer ?
	je WaitForDatam ; Wait until data available

	mov ax, 0
	mov al, [eas1]
	mov bx, [scan_code1off1]
	add bx, ax

	in al, 60h ; Get keyboard data
	cmp al, [bx] ; 39h
	jne m_pressed

	mov [var_m], 1

m_pressed:

	cmp [var_m], 1
	jne tag_m

WaitForDatam2:
	in al, 64h ; Read keyboard status port
	cmp al, 10b ; Data in buffer ?
	je WaitForDatam2 ; Wait until data available

	mov ax, 0
	mov al, [eas1]
	mov bx, [scan_code2off1]
	add bx, ax

	in al, 60h ; Get keyboard data
	cmp al, [bx] ; 39h

	mov [ot1], ah
	jne m_pressed2

	mov [var_m2], 1

m_pressed2:

tag_m:

	cmp [var_m], 1
	jne m1

	cmp [var_m2], 1
	jne m1

	mov ax, 0
	mov al, [eas1]
	mov bx, [michael_var1off]
	add bx, ax

	inc [eas1]

	mov [var_m], 0
	mov [var_m2], 0
m1:
	cmp [eas1], 3
	jne m2

	;michael

	mov [color_white], 3d
	mov [color_red], 10d

	mov [eas1], 0
m2:



;----------------------------- m

; --- s
WaitForDataesc:
	;button exit (esc)

	in al, 64h ; Read keyboard status port
	cmp al, 10b ; Data in buffer ?
	je WaitForDataesc ; Wait until data available


	;donw button esc
	in al, 60h ; Get keyboard data
	cmp al, 1; 39h
	jne esc_pressed

	mov [esc1], 1

esc_pressed:

	cmp [esc1], 1
	jne escv1

WaitForDatamesc2:
	in al, 64h ; Read keyboard status port
	cmp al, 10b ; Data in buffer ?
	je WaitForDatamesc2 ; Wait until data available

	;up button esc
	in al, 60h ; Get keyboard data
	cmp al, 81h ; 39h

	jne escv1

	mov [esc2], 1

escv1:
	cmp [esc1], 1
	jne escv2

	cmp [esc2], 1
	jne escv2

	mov [mainvar1], 0

	; return text mode
	call text_mode

	; exit code
	call change_folder2
	mov ax, 4c00h
	int 21h

	mov [esc1], 0
	mov [esc2], 0
escv2:

nextmusic_lable1:
	; button next song (>> - (up)), (>>)

	in al, 64h ; Read keyboard status port
	cmp al, 10b ; Data in buffer ?
	je nextmusic_lable1 ; Wait until data available

	;donw button >> (up)
	in al, 60h ; Get keyboard data
	cmp al, 48h ; 39h
	jne nextmusic_lable2

	mov [varup1], 1

nextmusic_lable2:

nextmusic_lable1a:

	in al, 64h ; Read keyboard status port
	cmp al, 10b ; Data in buffer ?
	je nextmusic_lable1a ; Wait until data available

	;up button >> (up)
	in al, 60h ; Get keyboard data
	cmp al, 0C8h ; 39h
	jne nextmusic_lable2a

	mov [varup2], 1

nextmusic_lable2a:

	cmp [varup1], 1
	jne nextmusic_lable3

	cmp [varup2], 1
	jne nextmusic_lable3

	;reset vars
	call zero_vars

	;close file wav
	call close_file

	;inc [pointers]
	mov [varup3], 0
	mov [varup4], 1


	mov [varup1], 0
	mov [varup2], 0


nextmusic_lable3:

	mov [varup2], 0

backmusic_lable1:
	; button back song (<< - (down)), (<<)

	in al, 64h ; Read keyboard status port
	cmp al, 10b ; Data in buffer ?
	je backmusic_lable1 ; Wait until data available

	;donw button << (down)
	in al, 60h ; Get keyboard data
	cmp al, 50h ; 39h
	jne backmusic_lable2

	mov [vardown1], 1

backmusic_lable2:

backmusic_lable1a:
	in al, 64h ; Read keyboard status port
	cmp al, 10b ; Data in buffer ?
	je backmusic_lable1a ; Wait until data available

	;up button << (down)
	in al, 60h ; Get keyboard data
	cmp al, 0D0h ; 39h
	jne backmusic_lable2a

	mov [vardown2], 1

backmusic_lable2a:

	cmp [vardown1], 1
	jne backmusic_lable3

	cmp [vardown2], 1
	jne backmusic_lable3

	call zero_vars

	;close file wav
	call close_file

	mov [vardown3], 1
	mov [vardown4], 1


	cmp [pointers], 0
	jne bbb1s

	add [pointers], 2d

bbb1s:

	sub [pointers], 2d

	mov [vardown1], 0
	mov [vardown2], 0

backmusic_lable3:

	mov [vardown2], 0
; --- s

	;if sizefile3 != 0 && sizefile4 != 0

	call reads

	cmp [dilvar1], 1
	jne ds1s

	; send DSP Command 10h
	mov dx, 22ch
	mov al, 10h; d5h / 30h
	out dx, al

	; send byte audio sample
	;send bytes from play
	mov al, [buff1]
	out dx, al

ds1s:

	cmp [dilvar1], 1
	jne ds1

	call diley1
ds1:

	cmp [sizefile3], 0
	je lop2

	cmp [sizefile4], 0
	je lop2

	dec [sizefile3]
	jmp lop1


lop2:

	;if sizefile3 != 0 && sizefile4 == 0

	cmp [sizefile3], 0
	je lop3

	cmp [sizefile4], 0
	jne lop3

	dec [sizefile3]
	jmp lop1
lop3:
	;if sizefile3 == 0 && sizefile4 != 0

	cmp [sizefile3], 0
	jne lop4

	cmp [sizefile4], 0
	je lop4

	mov [sizefile3], 0FFFFh
	dec [sizefile4]
	jmp lop1
lop4:
	;if sizefile3 == 0 && sizefile4 == 0 && sums1 != 0

	cmp [sizefile3], 0
	jne lop6

	cmp [sizefile4], 0
	jne lop6

	cmp [sums1], 0
	je lop6

	mov ax, [sizefile2]
	mov [sizefile3], ax
	dec [sums1]
	jmp lop1

lop5:

WaitForData2:
	in al, 64h ; Read keyboard status port
	cmp al, 10b ; Data in buffer ?
	je WaitForData2 ; Wait until data available

	in al, 60h ; Get keyboard data
	cmp al, 19h ; 39h
	jne ESCPressed2

	cmp [dilvar1], 1
	jne ds2s2

	call play_music1
ds2s2:

ESCPressed2:

	cmp [varstop1], 0
	jne lop5

	jmp lop1

lop6:
	;exit if

	mov ax, [secends1]

	;------------------------------------

	ret
endp loop_file

proc help1
	;print help explanation

	mov [hPress_var3], 1

; -----------------------

	;clean screen

	mov [x1], 0d
	mov [y1], 20d
	mov [color1], 0d
	mov [length1], 320d
	mov [with1], 150d

	push offset with1
	push offset length1
	push offset x1
	push offset y1
	push offset color1
	call print_with

	mov [row_var1], 5d
	mov [column_var1], 3d

	;print text play
	push offset row_var1
	push offset column_var1
	push offset help_color
	push offset help_play1
	call strints1

	pop ax
	pop ax
	pop ax
	pop ax

	add [row_var1], 3
	mov [column_var1], 3d

	;print text stop
	push offset row_var1
	push offset column_var1
	push offset help_color
	push offset help_stop1
	call strints1

	pop ax
	pop ax
	pop ax
	pop ax

	add [row_var1], 3
	mov [column_var1], 3d

	;print text back (left)
	push offset row_var1
	push offset column_var1
	push offset help_color
	push offset help_music_back1
	call strints1

	pop ax
	pop ax
	pop ax
	pop ax

	add [row_var1], 3
	mov [column_var1], 3d

	;print text next (right)
	push offset row_var1
	push offset column_var1
	push offset help_color
	push offset help_music_next1
	call strints1

	pop ax
	pop ax
	pop ax
	pop ax

	add [row_var1], 3
	mov [column_var1], 3d

	;print text song back (down)
	push offset row_var1
	push offset column_var1
	push offset help_color
	push offset help_back1
	call strints1

	pop ax
	pop ax
	pop ax
	pop ax

	add [row_var1], 3
	mov [column_var1], 3d

	;print text song next (up)
	push offset row_var1
	push offset column_var1
	push offset help_color
	push offset help_next1
	call strints1

	pop ax
	pop ax
	pop ax
	pop ax

; -----------------------

hel1:

WaitForhb:
	; button help (h)
	in al, 64h ; Read keyboard status port
	cmp al, 10b ; Data in buffer ?
	je WaitForhb ; Wait until data available

	;donw button h
	in al, 60h ; Get keyboard data
	cmp al, 23h ; 39h
	jne hPressedb

;--------------------------- jump

	jmp helps1b
helps2:
	jmp hel1
helps1b:

;--------------------------- jump


	mov [hPress_var1], 1

hPressedb:

	cmp [hPress_var1], 1
	jne hPressedab

WaitForh2b:
	in al, 64h ; Read keyboard status port
	cmp al, 10b ; Data in buffer ?
	je WaitForh2b ; Wait until data available

	;up button h
	in al, 60h ; Get keyboard data
	cmp al, 0A3h ; 39h
	jne hPressed2b

	mov [hPress_var2], 1

hPressed2b:

hPressedab:

	cmp [hPress_var1], 1
	jne hPressed3b

	cmp [hPress_var2], 1
	jne hPressed3b

;--------------------------- jump

	jmp helps1
helps:
	jmp helps2
helps1:

;--------------------------- jump

	mov [hPress_var1], 0
	mov [hPress_var2], 0

	mov [hPress_var3], 0

	;clean screen

	mov [x1], 0d
	mov [y1], 20d
	mov [color1], 0d
	mov [length1], 320d
	mov [with1], 150d

	push offset with1
	push offset length1
	push offset x1
	push offset y1
	push offset color1
	call print_with

hPressed3b:

	cmp [hPress_var3], 1
	je helps

	ret
endp help1

proc easter_egg1
	; easter egg michael

	offm1 equ [bp + 6d]
	offm2 equ [bp + 4d]
	push bp
	mov bp, sp

	mov bx, offm1
	mov al, [bx]

	mov bx, offm2
	mov ah, [bx]

	cmp al, ah
	jne egg1

	mov [true_egg1], 1
egg1:

	pop bp
	ret 4d
endp easter_egg1

proc movseekup
	;music next 10 secend

	mov al, 1
	mov bx, [filehandle1]
	mov cx, [backsp1] ; hight
	mov dx,  [backsp2]; low
	mov ah, 42h
	int 21h

	mov ax, [backsp1]
	sub [sizefile4],ax

	mov ax, [backsp2]
	sub [sizefile3],ax

	jc SeekError
SeekError:

	ret
endp movseekup

proc movseekdown

	;music back 10 secend

	mov bx, [filehandle1]
	mov cx, 2d ; [backsp1] ; hight
	mov dx, [backsp2]; low

	mov ax, 2d
	neg dx
	neg cx

	mov al, 1
	mov ah, 42h
	int 21h

	mov ax, [backsp1]
	add [sizefile4],ax

	mov ax, [backsp2]
	add [sizefile3],ax


	jc Seek_Error
Seek_Error:

	ret
endp movseekdown

proc seek_proc
	;checker seek not exit border file (down)

	cmp [varseek2], 1
	jne SeekError3


	mov [sizefile3], 0
	mov [sizefile4], 0

SeekError3:

	mov [varseek1], 0
	mov [varseek2], 0


	ret
endp seek_proc

proc seek_proc_up
	;checker seek not exit border file (up)

	cmp [seekvarup1], 0
	jne seekv

seekv:


	mov ax, [sizefile3]
	mov bx, [sizefile4]

	cmp ax, [backsp2]
	ja seek1

	mov [varseek1], 1
seek1:

	cmp bx, [backsp1]
	ja seek2

	mov [varseek2], 1
seek2:

	cmp [varseek1], 1
	jne SeekError2

	cmp [varseek2], 1
	je SeekErrora

SeekError2:

	call movseekup

SeekErrora:

	call seek_proc

	ret
endp seek_proc_up

proc mathdil1
	; calculation 10 secend of music
	; 280 / (8000 / 4000) = 140		=> dileyvar = 280 / (sample_rate / 4000)

	mov bx, [sps1]
	mov ax, [sample_rate]
	mov dx, 0

	div bx

	mov [dileyvar2], ax

	mov bx, [dileyvar2]
	mov ax, 280
	mov dx, 0

	div bx

	mov [dileyvar], ax
	sub [dileyvar], 40d
	;speed

	ret
endp mathdil1

proc zero_vars
	;reset vars

	mov [secends1], 0d
	mov [secends2], 0d
	mov [secends3], 0d
	mov [sample_rate], 0d
	mov [channels], 2d
	mov [sample_rate_off], 24d
	mov [filehandle1], 0d
	mov [sizefile1], 0d
	mov [sizefile2], 0d
	mov [sizefile3], 0d
	mov [sizefile4], 0d
	mov [sums1], 1d
	mov [len1], 1d
	mov [len2], 2d
	mov [kamot1], 2d
	mov [mikom1], 4d
	mov [dileyvar], 1d ;140d
	mov [pointer1], 0d
	mov [pointer2], 0d
	mov [loops1], 0d
	mov [header1], 0d
	mov [buff1], 0d
	mov [varstop1], 0d

	ret
endp zero_vars

proc sta1
	;start program

	;offset to vars
	call proc_offset

	;change folder read
	call change_folder

	;print names files
	call namsproc

	ret
endp sta1

proc proc_offset
	;move offset for vars

	mov bx, offset filenamearray
	mov [filenamearray_off], bx

	mov bx, offset easarr1
	mov [easarr1off1], bx

	mov bx, offset scan_code1
	mov [scan_code1off1], bx

	mov bx, offset scan_code2
	mov [scan_code2off1], bx

	mov bx, offset michael_var1
	mov [michael_var1off], bx

	mov bx, offset datanames
	mov [datanamesoff], bx

	mov bx, offset datanames
	mov [datanamesoff2], bx


	ret
endp proc_offset

proc play_m1
	;play song

	filenames equ [bp + 4d]

	push bp
	mov bp, sp

	;play music
	push filenames

	;open file wav
	call open_file

	;read header

	call head_file

	;play loop file
	call loop_file

	;close file wav
	call close_file

	;reset vars
	call zero_vars

	pop bp
	ret 2d
endp play_m1

proc muls
	;Calculate bits per (10) seconds

	mov ax, [channels2]
	mov bx, [bitpersimple2]
	mul bx

	mov [chan_bit], ax


	mov ax, [chan_bit]
	mov bx, 10d ; number secend
	mul bx

	mov [bits2], ax ; max
	mov [bits1], dx ; min

	mov ax, [bits2]
	mov bx, [sample_rate]
	mul bx

	mov [backsp2], ax ; max
	mov [backsp1], dx ; min

	ret
endp muls

proc back
	; back music 10 secend

bspa1:
	cmp [backsp1], 0
	je bspa2


	dec [backsp1]

	cmp [sizefile3], 0
	je bspa3

	inc [sizefile3]

	jmp bspa1
bspa2:
	cmp [backsp2], 0
	je bspa5

	dec [backsp2]

	jmp bspa1

bspa3:


	inc [sizefile4]
	jmp bspa1
bspa4:
bspa5:
	mov ax, [sizefile3]
	mov [sizefile5], ax

	mov ax, [sizefile4]
	inc ax

	mov [sizefile6], ax

	ret
endp back


proc forward
; next music 10 secend

bspa1s:

	cmp [backsp1], 0
	je bspa2s

	dec [backsp1]


	cmp [sizefile3], 0
	je bspa3s

	dec [sizefile3]

	jmp bspa1s
bspa2s:
	cmp [backsp2], 0
	je bspa5s

	dec [backsp2]

	jmp bspa1s

bspa3s:

	dec [sizefile4]
	cmp [sizefile4], 0
	jne bspa4sa

	jmp bspa6s
bspa4sa:
	jmp bspa1s
bspa4s:
bspa5s:
	mov ax, [sizefile3]
	mov [sizefile5], ax

	mov ax, [sizefile4]
	dec ax

	mov [sizefile6], ax
	jmp bspa7s

bspa6s:
	mov [sizefile3], 1
	mov [sizefile4], 0

	jmp bspa5s
bspa7s:

	ret
endp forward


proc data_name_proc
	;move data name of DTA to datanames

	mov bx, offset DTA
	mov [DTAoff], bx
	add [DTAoff], 30d

	push cx
	mov cx, 16d
names1:

	mov bx, [DTAoff]
	mov al, [bx]

	mov bx, [datanamesoff]
	mov [bx], al

	inc [DTAoff]
	inc [datanamesoff]

	loop names1
	pop cx

	ret
endp data_name_proc

proc change_folder
	;change main folder read

	mov dx, offset CD
	mov ah,3Bh
	int 21h

	ret
endp change_folder

proc change_folder2
	;change main folder read

	mov dx, offset CD2
	mov ah,3Bh
	int 21h

	ret
endp change_folder2


proc namsproc
	;read names file of folder

	mov ah, 1Ah ;Set DTA
	lea dx, [DTA]
	int 21h
	xor cx, cx ;No attributes.
	lea dx, [FileNamess]
	mov ah, 4Eh ;Find First File
	int 21h

	call data_name_proc

NextEntry:
	mov ah, 1Ah ;Set DTA
	lea dx, [DTA]
	int 21h

	xor cx, cx ;No attributes.
	lea dx, [FileNamess]
	mov ah, 4Fh ;Find First File
	int 21h
	jc NoMoreFiles; dont file

	call data_name_proc
	inc [number_of_music1]

	jmp NextEntry
NoMoreFiles:

	mov ah, 2Fh
	int 21h
	ret
endp namsproc

proc next_music1
	; next song list
	mov bx, offset datanames
	mov [datanamesoff2], bx

	mov ax, [pointers]
	mov bx, 16d

	mul bx

	add [datanamesoff2], ax
	inc [pointers]

	ret
endp next_music1

proc back_music1
	; back song list

	dec [pointers]
	mov ax, [pointers]
	mov bx, 16d

	mul bx

	add [datanamesoff2], 16d
	ret
endp back_music1

proc main_proc

main1:
	;player songs

	mov [row_var1], 5
	mov [column_var1], 1

	push offset row_var1
	push offset column_var1
	push offset color_white
	push offset buffer_keyboard1
	call strints1

; ---------------------------------- number song

	mov cx, 5
mms:
	mov bx, offset numbers_chars
	mov [bx], 0
	inc bx
	loop mms


	mov [x1], 0d
	mov [y1], 0d
	mov [color1], 0d
	mov [length1], 60d
	mov [with1], 20d

	;clean screen
	push offset with1
	push offset length1
	push offset x1
	push offset y1
	push offset color1
	call print_with

	mov ax, [pointers]
	inc ax
	mov [nums_var1], ax
	push offset nums_var1
	call number_to_ascii

	mov bx, offset numbers_chars
	mov cx, 0


	mov [row_var1], 1
	mov [column_var1], 1

	push offset row_var1
	push offset column_var1
	push offset color_white
	push offset numbers_chars
	call strints1

	mov [row_var1], 1
	mov [column_var1], 2

	mov ax, [nums_var2]
	add [column_var1], al

	push offset row_var1
	push offset column_var1
	push offset color_white
	push offset slesh
	call strints1
	; ------
	mov bx, offset numbers_chars
	mov cx, 0

	mov ax, [number_of_music1]
	mov [nums_var1], ax
	push offset nums_var1
	call number_to_ascii


	mov [row_var1], 1
	mov [column_var1], 3

	mov ax, [nums_var2]
	add [column_var1], al
	; ------

	push offset row_var1
	push offset column_var1
	push offset color_white
	push offset numbers_chars
	call strints1

; ---------------------------------- number song
	mov [row_var1], 23d
	mov [column_var1], 1

	push offset row_var1
	push offset column_var1
	push offset color_white
	push offset print_help
	call strints1

	mov [column_var1], 15d
	mov [row_var1], 5

	call next_music1

	mov ax, [pointers]
	cmp [number_of_music1], ax
	jne pp1

	cmp [vardown3], 0
	jne pp1

	mov [pointers], 0

pp1:

	mov [vardown3], 0


	mov bx, [datanamesoff2]
	push bx
	call play_m1


	mov ax, [pointers]
	cmp ax, -1
	jne pp2

	mov bx, [number_of_music1]
	dec bx
	mov [pointers], bx

pp2:
	mov ax, [number_of_music1]
	cmp [pointers], ax
	jne bbb2s

	cmp [varup4], 1
	jne bbb2s

	cmp [vardown4], 1
	jne bbb2s

	mov ax, [number_of_music1]
	sub [pointers], ax

	mov [varup4], 0
	mov [vardown4], 0
bbb2s:

;--------------------------- jump

	jmp main3
main2:
	jmp main1
main3:

;--------------------------- jump

	mov [x1], 120d
	mov [y1], 60d
	mov [color1], 0d
	mov [length1], 100d
	mov [with1], 110d

	;clean screen
	push offset with1
	push offset length1
	push offset x1
	push offset y1
	push offset color1
	call print_with

	call print_names

	mov ax, [number_of_music1]
	cmp [pointers], ax
	jne bla1
	mov [pointers], 0d
bla1:

	cmp [mainvar1], 1
	je main2

	ret
endp main_proc

proc prints_lins1

	mov [x1], 0d
	mov [y1], 103d
	mov [color1], 12d
	mov [length1], 319d
	mov [with1], 2d

	push offset with1
	push offset length1
	push offset x1
	push offset y1
	push offset color1
	call print_with


	mov [x1], 0d
	mov [y1], 126d
	mov [color1], 12d
	mov [length1], 319d
	mov [with1], 2d

	push offset with1
	push offset length1
	push offset x1
	push offset y1
	push offset color1
	call print_with

	ret
endp prints_lins1

proc prints_lins

	mov [x1], 0d
	mov [y1], 55d
	mov [color1], 15d
	mov [length1], 319d
	mov [with1], 2d

	push offset with1
	push offset length1
	push offset x1
	push offset y1
	push offset color1
	call print_with


	mov [x1], 0d
	mov [y1], 78d
	mov [color1], 15d
	mov [length1], 319d
	mov [with1], 2d

	push offset with1
	push offset length1
	push offset x1
	push offset y1
	push offset color1
	call print_with

	mov [x1], 0d
	mov [y1], 103d
	mov [color1], 15d
	mov [length1], 319d
	mov [with1], 2d

	push offset with1
	push offset length1
	push offset x1
	push offset y1
	push offset color1
	call print_with

	mov [x1], 0d
	mov [y1], 128d
	mov [color1], 15d
	mov [length1], 319d
	mov [with1], 2d

	push offset with1
	push offset length1
	push offset x1
	push offset y1
	push offset color1
	call print_with

	mov [x1], 0d
	mov [y1], 153d
	mov [color1], 15d
	mov [length1], 319d
	mov [with1], 2d

	push offset with1
	push offset length1
	push offset x1
	push offset y1
	push offset color1
	call print_with

	mov [x1], 0d
	mov [y1], 178d
	mov [color1], 15d
	mov [length1], 319d
	mov [with1], 2d

	push offset with1
	push offset length1
	push offset x1
	push offset y1
	push offset color1
	call print_with
	ret
endp prints_lins

proc Graphic_mode
	;move to graphic mode

	mov ax, 13h
	int 10h

	ret
endp Graphic_mode

proc text_mode
	;move to graphic mode

	mov ah, 0
	mov al, 2
	int 10h

	ret
endp text_mode

proc print_dot
	;print dot

	x_Private equ [bp + 8d]
	y_Private equ [bp + 6d]
	color_Private equ [bp + 4d]

	push bp
	mov bp, sp

	mov bx, x_Private
	mov cx, [bx]; x

	mov bx, y_Private
	mov dx, [bx] ; y

	mov bx, color_Private
	mov al, [bx] ; color

	mov bh,0h
	mov ah,0ch
	int 10h

	pop bp
	ret 6d

endp print_dot

proc print_line
	;print line

	Length_Private1 equ [bp + 10d]
	x_Private_line equ [bp + 8d]
	y_Private_line equ [bp + 6d]
	color_Privat1 equ [bp + 4d]

	push bp
	mov bp, sp


	mov bx, Length_Private1
	mov cx, [bx]

	mov bx, x_Private_line
	mov ax, [bx]

	mov [xs], ax

line1:
	push cx

	push x_Private_line

	push y_Private_line

	push color_Privat1

	call print_dot

	mov bx, x_Private_line
	inc [bx]

	pop cx

	loop line1

	pop bp
	ret 8d
endp print_line

proc print_with
	;print rectangle

	whith_v2 equ [bp + 12d]
	Length_Private2 equ [bp + 10d]
	x_Private_line2 equ [bp + 8d]
	y_Private_line2 equ [bp + 6d]
	color_Privat2 equ [bp + 4d]
	push bp
	mov bp, sp

	mov bx, y_Private_line2
	mov ax, [bx]

	mov [ys], ax

	mov bx, whith_v2
	mov cx, [bx]
withs:
	push cx

	push Length_Private2
	push x_Private_line2
	push y_Private_line2
	push color_Privat2
	call print_line

	mov ax, xs
	mov x1, ax
	inc y1

	pop cx
	loop withs

	pop bp
	ret 10d
endp print_with

proc line_m
	;print line


	mov cx, 80d
mm:
	mov al, 'M'
	mov bh, 1d
	mov bl, 0d
	mov ah, 0Eh
	int 10h

loop mm


	ret
endp line_m

proc print_string
	;print string

	colors equ [bp + 6d]
	strings equ [bp + 4d]

	push bp
	mov bp, sp

str1:

	mov bx, strings
	add bx, [point1]
	mov al, [bx]

	cmp al, 0
	je stops1

	mov bx, colors
	mov bl, [bx]

	mov bh, 1d
	mov ah, 0Eh
	int 10h

	inc [point1]

	jmp str1

stops1:

	pop bp
	ret 4d
endp print_string

proc print_string2
	colors equ [bp + 6d]
	strings equ [bp + 4d]

	push bp
	mov bp, sp

str2:

	mov bx, strings
	add bx, [point1]
	mov al, [bx]

	cmp al, 0
	je stops2

	mov bx, colors
	mov bl, [bx]

	mov bh, 1
	mov cx, 1
	mov ah, 0Ah
	int 10h

	inc [point1]

	jmp str2

stops2:

	pop bp
	ret 4d
endp print_string2

proc print_buff
	;print buffer names

	mov ax, [pointers]
	mov bx, 16d
	mul bx

	mov bx, offset datanames

	add bx, ax


	push offset color_red
	push bx
	call print_string
	ret
endp print_buff

proc print_color
	;print rectangle permanent

	mov [x1], 0d
	mov [y1], 10d
	mov [color1], 12d
	mov [length1], 30d
	mov [with1], 2d

	push offset with1
	push offset length1
	push offset x1
	push offset y1
	push offset color1
	call print_with

	ret
endp print_color

proc strints1
	;print string

	row2 equ [bp + 6d]
	column2 equ [bp + 6d]
	colors2 equ [bp + 6d]
	strings2 equ [bp + 4d]

	push bp
	mov bp, sp

	push strings2
	push offset len_var1
	call proc_len

	mov cl, [len_var1]
	mov ch, 0

	mov dl, [column_var1]

	mov dh, [row_var1]


	mov bx, colors2
	mov bl, [bx]

	mov bh, 1
	mov al, 0

	mov bp, strings2

	mov ah, 13h
	int 10h

	pop bp

	ret
endp strints1

proc proc_len
	;calculation lengh string

	off_len1 equ [bp + 6d]
	len_vars equ [bp + 4d]

	push bp
	mov bp, sp


	mov bx, off_len1
	mov dl, 0

off_lens1:

	mov al, [bx]

	cmp al, 0
	je off_lens2

	inc bx
	inc dl

	jmp off_lens1

off_lens2:

	mov bx, len_vars
	mov [bx], dl

	pop bp
	ret 4d
endp proc_len

proc print_names
	;print names
	;cmp

	mov [row_var1], 5d
	mov ax, [pointers]
	mov bx, 16d
	mul bx
	mov [poin2], ax

	mov ax, [number_of_music1]
	mov bx, 16d
	mul bx

	mov [poin1], ax


	mov ax, [number_of_music1]
	dec ax
	cmp [pointers], ax
	je js0

	cmp [pointers], 0
	je js0

	cmp [pointers], 1
	je js0

	mov ax, [number_of_music1]
	sub ax, 2d
	cmp [pointers], ax
	je js0

	jmp js1

js0:

	cmp [pointers], 1
	ja namsas2

	cmp [pointers], 0
	jne namsas3

	add [row_var1], 3d
	mov bx, offset datanames
	add bx, [poin2]
	add bx, 32d

	push offset row_var1
	push offset column_var1
	push offset color_white
	push bx
	call strints1

	mov cx, 4d
namsasr:
	pop ax
	loop namsasr

;--------------------------- jump

	jmp namsas1
namsas2:
	jmp nams1
namsas1:

	jmp namsas4
namsas3:
	jmp nams1a
namsas4:

;--------------------------- jump

	add [row_var1], 3d
	mov bx, offset datanames
	add bx, [poin2]
	add bx, 16d

	push offset row_var1
	push offset column_var1
	push offset color_white
	push bx
	call strints1

	mov cx, 4d
namsasr2:
	pop ax
	loop namsasr2

	add [row_var1], 3d
	mov bx, offset datanames
	add bx, [poin2]
	;add bx, 16d


	push offset row_var1
	push offset column_var1
	push offset color_red
	push bx
	call strints1

	mov cx, 4d
namsasr3:
	pop ax
	loop namsasr3


	add [row_var1], 3d
	mov bx, offset datanames
	add bx, [poin2]
	add bx, [poin1]
	sub bx, 16d

	push offset row_var1
	push offset column_var1
	push offset color_white
	push bx
	call strints1

	mov cx, 4d
namsasr4:
	pop ax
	loop namsasr4

	add [row_var1], 3d
	mov bx, offset datanames
	add bx, [poin2]
	add bx, [poin1]
	sub bx, 32d

	push offset row_var1
	push offset column_var1
	push offset color_white
	push bx
	call strints1

	mov cx, 4d
namsasr5:
	pop ax
	loop namsasr5


nams1a:

	cmp [pointers], 1
	jne nams2ab

	add [row_var1], 3d
	mov bx, offset datanames
	add bx, [poin2]
	add bx, 32d

	push offset row_var1
	push offset column_var1
	push offset color_white
	push bx
	call strints1

	pop ax
	pop ax
	pop ax
	pop ax

	add [row_var1], 3d
	mov bx, offset datanames
	add bx, [poin2]
	add bx, 16d

	push offset row_var1
	push offset column_var1
	push offset color_white
	push bx
	call strints1

	mov cx, 4d
namsasa:
	pop ax
	loop namsasa
;--------------------------- jump

	jmp nams2ab1
nams2ab:
	jmp nams2a
nams2ab1:

;--------------------------- jump

	add [row_var1], 3d
	mov bx, offset datanames
	add bx, [poin2]

	push offset row_var1
	push offset column_var1
	push offset color_red
	push bx
	call strints1

	mov cx, 4d
namsasa2:
	pop ax
	loop namsasa2

	add [row_var1], 3d
	mov bx, offset datanames
	add bx, [poin2]
	sub bx, 16d

	push offset row_var1
	push offset column_var1
	push offset color_white
	push bx
	call strints1

	mov cx, 4d
namsasa3:
	pop ax
	loop namsasa3

	add [row_var1], 3d
	mov bx, offset datanames
	add bx, [poin1]
	sub bx, 16d

	push offset row_var1
	push offset column_var1
	push offset color_white
	push bx
	call strints1

	mov cx, 4d
namsasa4:
	pop ax
	loop namsasa4




nams1:

nams2a:

	mov ax, [number_of_music1]
	dec ax
	cmp [pointers], ax
	jne j0

	add [row_var1], 3d
	mov bx, offset datanames
	add bx, 16d

	push offset row_var1
	push offset column_var1
	push offset color_white
	push bx
	call strints1

	mov cx, 4d
namsasb:
	pop ax
	loop namsasb

	add [row_var1], 3d
	mov bx, offset datanames

	push offset row_var1
	push offset column_var1
	push offset color_white
	push bx
	call strints1

	mov cx, 4d
namsasb2:
	pop ax
	loop namsasb2

;--------------------------- jump

	jmp j1
j0:
	jmp nams3a
j1:

;--------------------------- jump

	add [row_var1], 3d
	mov bx, offset datanames
	add bx, [poin2]

	push offset row_var1
	push offset column_var1
	push offset color_red
	push bx
	call strints1

	mov cx, 4d
namsasb3:
	pop ax
	loop namsasb3

	add [row_var1], 3d
	mov bx, offset datanames
	add bx, [poin2]
	sub bx, 16d

	push offset row_var1
	push offset column_var1
	push offset color_white
	push bx
	call strints1

	mov cx, 4d
namsasb4:
	pop ax
	loop namsasb4

	add [row_var1], 3d
	mov bx, offset datanames
	add bx, 32d

	push offset row_var1
	push offset column_var1
	push offset color_white
	push bx
	call strints1

	mov cx, 4d
namsasb5:
	pop ax
	loop namsasb5

nams3a:

	mov ax, [number_of_music1]
	sub ax, 2d
	cmp [pointers], ax
	jne j2

	add [row_var1], 3d
	mov bx, offset datanames

	push offset row_var1
	push offset column_var1
	push offset color_white
	push bx
	call strints1

	mov cx, 4d
namsasc:
	pop ax
	loop namsasc

	add [row_var1], 3d
	mov bx, offset datanames
	add bx, [poin1]
	sub bx, 16d

	push offset row_var1
	push offset column_var1
	push offset color_white
	push bx
	call strints1

;--------------------------- jump

	jmp j3
j2:
	jmp nams4a
j3:

;--------------------------- jump

	mov cx, 4d
namsasc1:
	pop ax
	loop namsasc1

	add [row_var1], 3d
	mov bx, offset datanames
	add bx, [poin2]

	push offset row_var1
	push offset column_var1
	push offset color_red
	push bx
	call strints1

	mov cx, 4d
namsasc2:
	pop ax
	loop namsasc2

	add [row_var1], 3d
	mov bx, offset datanames
	add bx, [poin2]
	sub bx, 16d

	push offset row_var1
	push offset column_var1
	push offset color_white
	push bx
	call strints1

	mov cx, 4d
namsasc3:
	pop ax
	loop namsasc3

	add [row_var1], 3d
	mov bx, offset datanames
	add bx, [poin2]
	sub bx, 32d

	push offset row_var1
	push offset column_var1
	push offset color_white
	push bx
	call strints1

	mov cx, 4d
namsasc4:
	pop ax
	loop namsasc4

nams4a:

	jmp nams2
js1:

	add [row_var1], 3d
	mov bx, offset datanames
	add bx, [poin2]
	add bx, 32d

	push offset row_var1
	push offset column_var1
	push offset color_white
	push bx
	call strints1

	mov cx, 4d
namsasd:
	pop ax
	loop namsasd

	add [row_var1], 3d
	mov bx, offset datanames
	add bx, [poin2]
	add bx, 16d

	push offset row_var1
	push offset column_var1
	push offset color_white
	push bx
	call strints1

	mov cx, 4d
namsasd2:
	pop ax
	loop namsasd2

	add [row_var1], 3d
	mov bx, offset datanames
	add bx, [poin2]

	push offset row_var1
	push offset column_var1
	push offset color_red
	push bx
	call strints1

	mov cx, 4d
namsasd3:
	pop ax
	loop namsasd3

	add [row_var1], 3d
	mov bx, offset datanames
	add bx, [poin2]
	sub bx, 16d

	push offset row_var1
	push offset column_var1
	push offset color_white
	push bx
	call strints1

	mov cx, 4d
namsasd4:
	pop ax
	loop namsasd4

	add [row_var1], 3d
	mov bx, offset datanames
	add bx, [poin2]
	sub bx, 32d

	push offset row_var1
	push offset column_var1
	push offset color_white
	push bx
	call strints1

	mov cx, 4d
namsasd5:
	pop ax
	loop namsasd5

nams2:

	ret 4d
endp print_names

proc number_to_ascii
	; converter number to ascii (1d - 1000d)
	number1 equ [bp + 4d]

	num_pr1 equ [bp - 2d]
	mod_pr1 equ [bp - 4d]
	div_pr1 equ [bp - 6d]

	push bp
	mov bp, sp
	mov [lengh_num1], 0
	call len_number
;zxcvb
	mov bx, offset numbers_chars
	add bx, [nums_var2]
	mov [numbers_charsoff], bx

	mov dx, 0
	mov bx, number1
	mov ax, [bx]
nums1:

	mov bx, 10d
	div bx

	mov [num_div], ax
	mov [num_mod], dx


	mov dx, [num_mod]

	mov bx, [numbers_charsoff]
	add dl, 30h
	mov [bx], dl

	dec [numbers_charsoff]

	mov ax, [num_div]
	mov dx, 0

	inc [lengh_num1]

	cmp [num_div], 0
	jne nums1

	pop bp
	ret 8d
endp number_to_ascii


proc print_number
	;print number song

	mov bx, offset numbers_chars
	mov cx, [lengh_num1]

pr_nums:

	mov dl, [bx]
	add dl, 30h
	mov ah, 2
	int 21h

	inc bx

	loop pr_nums

	ret
endp print_number

proc len_number
	;checker lengh number

	cmp [nums_var1], 9d
	ja len_s1

	mov [nums_var2], 0d
	jmp len_s5

len_s1:
	cmp [nums_var1], 99d
	ja len_s2

	mov [nums_var2], 1d
	jmp len_s5
len_s2:
	cmp [nums_var1], 999d
	ja len_s3

	mov [nums_var2], 2d
	jmp len_s5
len_s3:
	mov [nums_var2], 3d

len_s5:


	ret
endp len_number

proc poin_print_proc
	;print now number song

	mov ax, [number_of_music1]
	mov [nums_var1], ax
	push offset nums_var1
	call number_to_ascii

	mov [row_var1], 1
	mov [column_var1], 4
	mov ax, [lengh_num1]
	add [column_var1], al

	push offset row_var1
	push offset column_var1
	push offset color_white
	push offset numbers_chars
	call strints1

	mov ax, [number_of_music1]
	mov [nums_var1], ax
	push offset nums_var1
	call number_to_ascii

	mov [row_var1], 1
	mov [column_var1], 2

	push offset row_var1
	push offset column_var1
	push offset color_white
	push offset slesh
	call strints1

	mov [column_var1], 15d
	mov [row_var1], 5

	pop ss
	pop sp
	pop bp
	pop dx
	pop cx
	pop bx
	pop ax
	pop di
	pop ax
	pop ax

	ret
endp poin_print_proc

start:
	mov ax, @data
	mov ds, ax
; --------------------------
; Your code here
; --------------------------

	;start program
	call sta1

	;on player
	mov [mainvar1], 1

	;move to graphic mode
	call Graphic_mode

; --------------------------
; Graphics
; --------------------------

	;print names songs
	call print_names

; --------------------------

	; player songs
	call main_proc

	;return to text mode
	call text_mode

; --------------------------
; Exit Code
; --------------------------

exit:
	mov ax, 4c00h
	int 21h
END start
