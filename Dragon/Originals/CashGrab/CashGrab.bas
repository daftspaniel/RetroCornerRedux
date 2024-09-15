10 DIMH(16),A(1),B(1),C(1),P(1),R(1),M(16,11),N(11),X,Y,V,W,D,J,O,R,L,S,M,Q,HP,VP,CL,A$,T,PR
20 DIMC$(27),N$(10):GOSUB1180:REM SET UP TEXT
30 FORI=0TO15:H(I)=I*16:NEXT
40 GOSUB750:REM SET UP GRAPHICS
50 GOSUB870:REM TITLE SCREEN
60 GOSUB610:REM INIT GAME
70 GOSUB640:REM INIT LEVEL
80 PCLS:GOSUB390
90 REM GAME LOOP
100 A$=INKEY$:IFA$="P"THENX=X+1ELSEIFA$="O"THENX=X-1
110 IFA$="Q"THENY=Y-1ELSEIFA$="A"THENY=Y+1
120 J=JOYSTK(0):IFJ=0THENX=X-1ELSEIFJ=63THENX=X+1
130 J=JOYSTK(1):IFJ=0THENY=Y-1ELSEIFJ=63THENY=Y+1
140 IFX<0THENX=0ELSEIFX>15THENX=15
150 IFY<1THENY=1ELSEIFY>11THENY=11
160 GOSUB210
170 IFX=V THEN IF Y=W THEN190
180 PUT(H(X),H(Y))-(H(X)+15,H(Y)+15),A,PSET:PUT(H(V),H(W))-(H(V)+15,H(W)+15),B,PSET:V=X:W=Y
190 ON M(X,Y) GOSUB280,320,350:IF M THEN100
200 GOSUB960:GOTO50
210 REM DRAW SCREEN UPDATES
220 R=RND(11):IF N(R) THENN(R)=N(R)-1:O=N(R):M(O,R)=1:PUT(H(O),H(R))-(H(O)+15,H(R)+15),R,PSET
230 IF PR THEN PUT(0,H(PR))-(15,H(PR)+15),P,NOT
240 IFRND(10)>1THENRETURN
250 O=2+RND(14):R=1+RND(9):IFT<3THEN O=2+RND(7)
255 IF H(O) AND M(O,R)=0 THEN M(O,R)=2:PUT(H(O),H(R))-(H(O)+15,H(R)+15),C,PSET
260 RETURN
270 REM BURN
280 SCREEN1,0:PLAY"T255AEAEAAAAEEA":SCREEN1,1:M=M-1:IF M THENGOSUB650ELSEGOTO300
290 GOSUB540:GOSUB390
300 RETURN
310 REM SCORE
320 M(X,Y)=0:S=S+10+X:GOSUB490:PLAY"T255BCDGG":GOSUB250:T=T+1:IFT=3THENGOSUB580
330 RETURN
340 REM PORTAL AND NEXT LEVEL
350 L=L+1:T=0:PLAY"O3;V15;T194;GFEDCBAAAAAAAO2AAAAV9AAGFEDCBAAAAAAAO2AAAAV8AAGFEDCBAAAAAAAO2AAAAV7AA;V15":GOSUB540
360 GOSUB510:GOSUB650
370 RETURN
380 REM DRAW INITIAL SCREEN
390 LINE(0,15)-(255,15),PSET
400 HP=6:VP=2:O$="LIVES": GOSUB1120
410 HP=84:VP=2:O$="SCORE": GOSUB1120
420 HP=180:VP=2:O$="LEVEL": GOSUB1120
430 GOSUB460:GOSUB490:GOSUB510
440 RETURN
450 REM UPDATE LIVES DISPLAY
460 LINE(55,2)-(64,10),PRESET,BF:HP=55:VP=2:N$=MID$(STR$(M),2):GOSUB1150
470 RETURN
480 REM UPDATE SCORE DISPLAY
490 LINE(135,2)-(160,10),PRESET,BF:HP=135:VP=2:N$=MID$(STR$(S),2):FORQ=1TOLEN(N$):DRAW"BM"+STR$(HP)+",2"+N$(ASC(MID$(N$,Q,1))-48):HP=HP+8:NEXT:RETURN
500 REM UPDATE LEVEL DISPLAY
510 LINE(231,2)-(240,10),PRESET,BF:HP=231:VP=2:N$=MID$(STR$(L),2):GOSUB1150
520 RETURN
530 REM CLEAR PLAYFIELD HORIZONTAL
540 FORCL=16TO192STEP32:LINE(0,CL)-(255,CL+16),PRESET,BF:PLAY"T255BAAA":NEXT
550 FORCL=32TO192STEP32:LINE(0,CL)-(255,CL+16),PRESET,BF:PLAY"T255ABBB":NEXT
560 RETURN
570 REM POSITION AND DISPLAY PORTAL
580 PR=RND(11):M(0,PR)=3
590 PUT(0,H(PR))-(15,H(PR)+15),P,PSET
600 RETURN
610 REM INIT GAME
620 L=1:S=0:M=3
630 RETURN
640 REM LEVEL SET UP
650 X=5:Y=2:V=1:W=1:T=0:PR=0
660 GOSUB710
670 IFL>2THENI=L+2:FORJ=1TOI:O=RND(16):R=RND(11):M(O,R)=1:PUT(H(O),H(R))-(H(O)+15,H(R)+15),R,PSET:NEXT
680 M(X,Y)=0: REM ENSURE STARTING POSITION CLEAR
690 RETURN
700 REM RESET LEVEL DATA - SCREEN LAYOUT AND LAVA
710 FORJ=0TO16:FORI=0TO11:M(J,I)=0:NEXT:NEXT
720 FORI=0TO11:N(I)=16:NEXT
730 RETURN
740 REM DRAW GFX
750 PMODE0,1:PCLS:SCREEN1,1
760 GET(0,0)-(15,15),B
770 FORL=0TO7:READD:POKE1536+(L*16),D:NEXT
780 GET(0,0)-(15,15),A
790 FORL=0TO7:READD:POKE1536+(L*16),D:NEXT
800 GET(0,0)-(15,15),R
810 FORL=0TO7:READD:POKE1536+(L*16),D:NEXT
820 GET(0,0)-(15,15),C
830 FORL=0TO7:READD:POKE1536+(L*16),D:NEXT
840 GET(0,0)-(15,15),P
850 RETURN
860 REM TITLE SCREEN
870 PCLS:LINE(0,176)-(255,176),PSET:LINE(0,15)-(255,15),PSET
880 HP=87:VP=40:O$="CASH@GRAB":GOSUB1120:PLAY"T255AO3AO2GG"
890 HP=85:VP=180:O$="VERSION":GOSUB1120
900 HP=145:VP=180:N$="0":GOSUB1150
910 HP=157:VP=180:N$="1":GOSUB1150:PSET(153,188,1):PLAY"T255AO3AO2GG"
920 HP=110:VP=60:O$="BY":GOSUB1120
930 HP=70:VP=80:O$="DAVY@MITCHELL":GOSUB1120:PLAY"T255AO3AO2GG"
940 FORD=1TO4000:NEXT
950 RETURN
960 REM GAME OVER SCREEN
970 PCLS:LINE(0,176)-(255,176),PSET:LINE(0,15)-(255,15),PSET
980 HP=91:VP=40:O$="GAME@OVER": GOSUB1120
990 HP=87:VP=80:O$="YOU@SCORED": GOSUB1120
1000 HP=INT((255-LEN(STR$(S)))/2):VP=100:O$=MID$(STR$(S),2): GOSUB1150
1010 FORD=1TO4000:NEXT
1020 RETURN
1030 REM STICK MAN
1040 DATA24,60,24,126,24,24,36,66
1050 REM LAVA
1060 DATA97,95,204,32,244,31,120,30
1070 REM CASH
1080 DATA0,0,60,24,60,126,126,60
1090 REM PORTAL
1100 DATA126,129,189,165,165,189,129,126
1110 REM DISPLAY TEXT
1120 FORQ=1TOLEN(O$):DRAW"BM"+STR$(HP)+","+STR$(VP)+";"+C$(ASC(MID$(O$,Q,1))-64):HP=HP+8:NEXT
1130 RETURN
1140 REM DISPLAY NUMBERS
1150 FORQ=1TOLEN(N$):DRAW"BM"+STR$(HP)+","+STR$(VP)+";"+N$(ASC(MID$(N$,Q,1))-48):HP=HP+8:NEXT
1160 RETURN
1170 REM LETTER DATA
1180 C$(1)="D8U8R4D4L4R4D4"
1190 C$(2)="R4D8L4U8D4R4"
1200 C$(3)="R4L4D8R4"
1210 C$(4)="D8R3E1U6M-4,-1"
1220 C$(5)="R4L4D4R4L4D4R4"
1230 C$(6)="R4L4D4R4L4D4"
1240 C$(7)="R4L4D8R4U4"
1250 C$(8)="D8U4R4U4D8"
1260 C$(9)="R4L2D8R2L4"
1270 C$(10)="R4L2D8L2"
1280 C$(11)="D8U4M+4,-4M-4,+4M+4,+4"
1290 C$(12)="D8R4"
1300 C$(13)="D8U8M+2,+2M+2,-2D8"
1310 C$(14)="D8U8M+5,+8U8"
1320 C$(15)="D8R4U8L4"
1330 C$(16)="D8U8R4D4L4"
1340 C$(17)="D6R4D2U8L4"
1350 C$(18)="D8U8R4D4L4F4"
1360 C$(19)="R4L4D4R4D4L4"
1370 C$(20)="R4L2D8"
1380 C$(21)="D8R4U8"
1390 C$(22)="D6F2E2U6"
1400 C$(23)="D6F2E2U6D6F2E2U6"
1410 C$(24)="M+4,+8BM+0,-8M-4,+8"
1420 C$(25)="D4R4U4D4L2D4"
1430 C$(26)="R4D2G2G2D2R4"
1440 REM NUMBERS
1450 N$(0)="D8R4U8L4"
1460 N$(1)="BM+2,+0D8"
1470 N$(2)="D2U2R4D4G4R4"
1480 N$(3)="R4D4L4R4D4L4"
1490 N$(4)="D4R4U4D8"
1500 N$(5)="R4L4D4R4D4L4"
1510 N$(6)="R4L4D4R4D4L4U4"
1520 N$(7)="R4D8"
1530 N$(8)="R4D8L4U8D4R4"
1540 N$(9)="R4D8U4L4U4"
1550 RETURN
1560 REM