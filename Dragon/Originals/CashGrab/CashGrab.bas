10 DIMH(16),I(16),A(1),B(1),C(1),P(1),R(1),M(16,11),N(11),X,Y,V,W,D,J,R,L,S,M,Q
20 DIMC$(27),N$(10):GOSUB1080:REM SET UP TEXT
30 FORI=0TO15:H(I)=I*16:NEXT
40 GOSUB670:REM SET UP GRAPHICS
50 GOSUB780:REM TITLE SCREEN
60 GOSUB530:REM INIT GAME
70 GOSUB560:REM INIT LEVEL
80 PCLS:GOSUB400
90 REM GAME LOOP
100 A$=INKEY$:IFA$="P"THENX=X+1ELSEIFA$="O"THENX=X-1
110 IFA$="Q"THENY=Y-1ELSEIFA$="A"THENY=Y+1
120 J=JOYSTK(0):IFJ=0THENX=X-1ELSEIFJ=63THENX=X+1
130 J=JOYSTK(1):IFJ=0THENY=Y-1ELSEIFJ=63THENY=Y+1
140 IFX<0THENX=0ELSEIFX>15THENX=15
150 IFY<1THENY=1ELSEIFY>11THENY=11
160 GOSUB 270
170 IF X=V THEN IF Y=W THEN 190
180 PUT(H(X),H(Y))-(H(X)+15,H(Y)+15),A,PSET:PUT(H(V),H(W))-(H(V)+15,H(W)+15),B,PSET:V=X:W=Y
190 GOSUB 240
200 IFM>0THEN100
210 GOSUB880
220 GOTO50
230 REM CHECK LOCATION
240 Z=M(X,Y):IFZ=0THENRETURN
250 ON Z GOSUB310,330,360
260 RETURN
270 REM DRAW SCREEN UPDATES
280 R=RND(11):IF N(R)>0 THEN N(R)=N(R)-1:O=N(R):M(O,R)=1:PUT(H(O),H(R))-(H(O)+15,H(R)+15),R,PSET
290 RETURN
300 REM BURN
310 SCREEN1,0:PLAY"T255AEAEAAAAEEA":SCREEN1,1:M=M-1:IFM>0THENGOSUB560:LINE(0,16)-(255,192),PRESET,BF:GOSUB390
320 RETURN
330 REM SCORE
340 M(X,Y)=0
350 RETURN
360 REM PORTAL
370 GOTO70
380 RETURN
390 REM DRAW INTIAL SCREEN
400 LINE(0,15)-(255,15),PSET
410 HP=6:VP=2:O$="LIVES": GOSUB1020
420 HP=84:VP=2:O$="SCORE": GOSUB1020
421 HP=180:VP=2:O$="LEVEL": GOSUB1020
430 REM PUT(H(3),H(5))-(H(3)+15,H(5)+15),C,PSET
440 PUT(H(0),H(R))-(H(0)+15,H(R)+15),P,PSET
450 GOSUB470:GOSUB510:GOSUB522
460 RETURN
470 REM UPDATE LIVES DISPLAY
480 LINE(55,2)-(64,10),PRESET,BF:HP=55:VP=2:N$=MID$(STR$(M),2):GOSUB1050
490 RETURN
500 REM UPDATE SCORE DISPLAY
510 LINE(135,2)-(160,10),PRESET,BF:HP=135:VP=2:N$=MID$(STR$(S),2):GOSUB1050
520 RETURN
521 REM UPDATE LEVEL DISPLAY
522 LINE(231,2)-(240,10),PRESET,BF:HP=231:VP=2:N$=MID$(STR$(L),2):GOSUB1050
523 RETURN
530 REM INIT GAME
540 L=1:S=0:M=3
550 RETURN
560 REM LEVEL SET UP
570 X=0:Y=2:V=1:W=1
580 GOSUB620
590 M(3,5)=2:REM CASH BAG
600 R=RND(11):M(0,R)=3:REM PORTAL
610 RETURN
620 REM RESET LEVEL DATA
630 FORJ=0TO16:FORI=0TO11:M(J,I)=0:NEXT:NEXT: REM SCREEN LAYOUT
640 FORI=0TO11:N(I)=16:NEXT: REM LAVA POSITIONS
650 RETURN
660 REM DRAW GFX
670 PMODE0,1:PCLS:SCREEN1,1
680 GET(0,0)-(15,15),B
690 FORL=0TO7:READD:POKE1536+(L*16),D:NEXT
700 GET(0,0)-(15,15),A
710 FORL=0TO7:READD:POKE1536+(L*16),D:NEXT
720 GET(0,0)-(15,15),R
730 FORL=0TO7:READD:POKE1536+(L*16),D:NEXT
740 GET(0,0)-(15,15),C
750 FORL=0TO7:READD:POKE1536+(L*16),D:NEXT
760 GET(0,0)-(15,15),P
770 RETURN
780 REM TITLE SCREEN
790 PCLS
800 HP=80:VP=40:O$="CASH@GRAB":GOSUB1020
810 HP=110:VP=60:O$="BY":GOSUB1020
820 HP=70:VP=80:O$="DAVY@MITCHELL":GOSUB1020
821 LINE(0,176)-(255,176),PSET
822 LINE(0,15)-(255,15),PSET
830 HP=70:VP=180:O$="VERSION":GOSUB1020
840 HP=130:VP=180:N$="0":GOSUB1050
850 HP=142:VP=180:N$="1":GOSUB1050:PSET(138,188,1)
860 FORD=1TO4000:NEXT
870 RETURN
880 REM GAME OVER SCREEN
890 PCLS
900 HP=91:VP=40:O$="GAME@OVER": GOSUB1020
910 FORD=1TO4000:NEXT
920 RETURN
930 REM STICK MAN
940 DATA24,60,24,126,24,24,36,66
950 REM LAVA
960 DATA97,95,204,32,244,31,120,30
970 REM CASH
980 DATA0,0,60,24,60,126,126,60
990 REM PORTAL
1000 DATA126,129,189,165,165,189,129,126
1010 REM DISPLAY TEXT
1020 FORQ=1TOLEN(O$):DRAW"BM"+STR$(HP)+","+STR$(VP)+";"+C$(ASC(MID$(O$,Q,1))-64):HP=HP+8:NEXT
1030 RETURN
1040 REM DISPLAY NUMBERS
1050 FORQ=1TOLEN(N$):DRAW"BM"+STR$(HP)+","+STR$(VP)+";"+N$(ASC(MID$(N$,Q,1))-48):HP=HP+8:NEXT
1060 RETURN
1070 REM LETTER DATA
1080 C$(1)="D8U8R4D4L4R4D4"
1090 C$(2)="R5D8L5U8D4R4"
1100 C$(3)="R4L4D8R4"
1110 C$(4)="D8R3E1U6M-4,-1"
1120 C$(5)="R4L4D4R4L4D4R4"
1130 C$(6)="R4L4D4R4L4D4"
1140 C$(7)="R4L4D8R4U4"
1150 C$(8)="D8U4R4U4D8"
1160 C$(9)="R4L2D8R2L4"
1170 C$(10)="R4L2D8L2"
1180 C$(11)="D8U4M+4,-4M-4,+4M+4,+4"
1190 C$(12)="D8R4"
1200 C$(13)="D8U8M+2,+2M+2,-2D8"
1210 C$(14)="D8U8M+5,+8U8"
1220 C$(15)="D8R4U8L4"
1230 C$(16)="D8U8R4D4L4"
1240 C$(17)="D6R4D2U8L4"
1250 C$(18)="D8U8R4D4L4F4"
1260 C$(19)="R5L5D4R4D4L4"
1270 C$(20)="R4L2D8"
1280 C$(21)="D8R4U8"
1290 C$(22)="D6F2E2U6"
1300 C$(23)="D6F2E2U6D6F2E2U6"
1310 C$(24)="M+4,+8BM+0,-8M-4,+8"
1320 C$(25)="D4R4U4D4L2D4"
1330 C$(26)="R4D2G2G2D2R4"
1340 REM NUMBERS
1350 N$(0)="D8R4U8L4"
1360 N$(1)="BM+2,+0D8"
1370 N$(2)="D2U2R4D4G4R4"
1380 N$(3)="R4D4L4R4D4L4"
1390 N$(4)="D4R4U4D8"
1400 N$(5)="R5L5D4R4D4L4"
1410 N$(6)="R5L5D4R4D4L4U4"
1420 N$(7)="R5D8"
1430 N$(8)="R5D8L5U8D4R4"
1440 N$(9)="R5D8U4L4U4"
1450 RETURN
1460 REM