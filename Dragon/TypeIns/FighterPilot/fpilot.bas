5  PCLEAR8:DIM F,D,O,P,V,U,M,CA(8,8),CB(8,8),CC(8,8),CD(8,8),CE(8,8),CF(8,8),CG(8,8),CH(8,8), CI(8,8) 
10 REM ****************
20 REM FIGHTER PILOT- B.J. CANDY' 
60 B$="P" 
70 GOSUB 810 
90 PMODE 4:SCREEN1, 0: PCLS 
100 FOR A=1TO9 
110 X=1536 
120 FOR B=1TO8 
130 READ P 
140 POKE X, P 
150 X=X+32 
160 NEXT B 
170 IF A=1 THEN GET(0,0)-(8,8),CA,G 
180 IF A=2 THEN GET(0,0)-(8,8),CB,G 
190 IF A=3 THEN GET(0,0)-(8,8),CC,G 
200 IF A=4 THEN GET(0,0)-(8,8),CD,G 
210 IF A=5 THEN GET(0,0)-(8,8),CE,G 
220 IF A=6 THEN GET(0,0)-(8,8),CF,G 
230 IF A=7 THEN GET(0,0)-(8,8),CG,G 
240 IF A=8 THEN GET(0,0)-(8,8),CH,G 
250 IF A=9 THEN GET(0,0)-(8,8),CI,G 
260 NEXTA 
270 DATA 16,40,40,198,40,16,16,40 
280 DATA 71,41,17,26,28,226,33,32 
290 DATA 8,8,150,97,150,8,8,0 
300 DATA 32,33,226,28,26,17,41,71 
310 DATA 40,16,16,40,198,40,40,16 
320 DATA 4,132,71,56,72,136,148,226 
330 DATA 16,16,105,134,105,16,16,0 
340 DATA 226,148,136,88,56,71,132,4 
350 DATA 73,42,28,129,90,36,36,24 
360 D=1:X=128:Y=96:F=1:O=128:P=150:M=20:U=0:S=0:Z=3 
370 REM *** MOVE 1 *** 
380 U=U+.75 
390 IF Y<U THEN Y=U 
400 M=M-1:IF M=0 THEN GOSUB 760 
410 IF L>0 THEN GOSUB 1040 
420 IF PPOINT(O,P)=1 THEN GOSUB 1230
430 IF F=9 THEN GOSUB 1270:GOTO 560
440 IF F=1 THEN PUT(O-4,P-4)-(O+4,P+4),CA,PSET:P=P-3:GOTO520 
450 IF F=2 THEN PUT(O-4,P-4)-(O+4,P+4),CB,PSET:P=P-3:O=O+3:GOTO520
460 IF F=3 THEN PUT(O-4,P-4)-(O+4,P+4),CC,PSET:O=O+3:GOTO520 
470 IF F=4 THEN PUT(O-4,P-4)-(O+4,P+4),CD,PSET:O=O+3:P=P+3:GOTO520 
480 IF F=5 THEN PUT(O-4,P-4)-(O+4,P+4),CE,PSET:P=P+3:GOTO520 
490 IF F=6 THEN PUT(O-4,P-4)-(O+4,P+4),CF,PSET:P=P+3:O=O-3:GOTO520 
500 IF F=7 THEN PUT(O-4,P-4)-(O+4,P+4),CG,PSET:O=O-3:GOTO520 
510 IF F=8 THEN PUT(O-4,P-4)-(O+4,P+4),CH,PSET:O=O-3:P=P-3:GOTO520 
520 IF O>240 THEN F=7 
530 IF O<15 THEN F=3 
540 IF P>170 THEN F=1 
550 IF P<15 THEN F=5 
560 FOR W=5TO8:PCOPY W TO W-4: NEXT W
570 IF L>0 THEN GOSUB 1040 
580 IF D=9 THEN GOSUB 1430:GOTO 370 
590 REM *** B.J. CANDY *** 
600 A$=INKEY$: IF A$=""THEN A$=B$
610 V=ASC(A$) 
620 IF V=8 THEN D=D+1: IF D=9 THEN D=1 
630 IF V=9 THEN D=D-1: IF D=0 THEN D=8 
640 IF V=32 THEN GOSUB 1010 
650 IF D=9 THEN GOSUB 1430 
660 IF PPOINT(X,Y)=1 THEN GOSUB 1190 
670 IF D=1 THEN PUT(X-4, Y-4)-(X+4,Y+4),CA,OR:Y=Y-4:GOTO 380
680 IF D=2 THEN PUT(X-4, Y-4)-(X+4,Y+4),CB,OR:Y=Y-4:X=X+4:GOTO 380 
690 IF D=3 THEN PUT(X-4, Y-4)-(X+4,Y+4),CC,OR:X=X+4:GOTO 380 
700 IF D=4 THEN PUT(X-4, Y-4)-(X+4,Y+4),CD,OR:X=X+4:Y=Y+4:GOTO 380
710 IF D=5 THEN PUT(X-4, Y-4)-(X+4,Y+4),CE,OR:Y=Y+4:GOTO 380
720 IF D=6 THEN PUT(X-4, Y-4)-(X+4,Y+4),CF,OR:Y=Y+4:X=X-4:GOTO 380
730 IF D=7 THEN PUT(X-4, Y-4)-(X+4,Y+4),CG,OR:X=X-4:GOTO 380
740 IF D=8 THEN PUT(X-4, Y-4)-(X+4,Y+4),CH,OR:X=X-4:Y=Y-4:GOTO 380
750 GOTO 380 
760 IF F=9 THEN L=0: RETURN 
770 F=F+(RND(3)-2): IF F>8 THEN F=1 
780 IF F<1 THEN F=8 
790 M=RND(10): RETURN 
800 GOTO 800 
810 PMODE 4,5:SCREEN1,0:PCLS 
820 DRAW"BM5, 185"
830 FOR A=5 TO 250 STEP 5 
840 B=RND(10)+175 
850 LINE-(A, B), PSET 
860 NEXT A
870 LINE(5,5)-(250,187), PSET, B 
880 LINE(5,187)-(250,187), PRESET 
890 PAINT(0,0),1,1 
900 LINE(1,1)-(255, 191), PRESET, B 
910 LINE(10,190)-(40,150), PSET, BF
920 FOR A=190TO150 STEP -4 
930 FOR B=10TO40 STEP 4 
940 LINE (B,A) - (B+1,A+1), PRESET, BF 
950 NEXT B, A 
960 LINE (10,190)-(40, 150), PSET, B 
970 LINE (10,150)-(25,145), PSET
980 LINE-(40,150), PSET 
990 RETURN 
1000 GOTO 1000 
1010 REM *** FIRE *** 
1020 L=40:X1=X:Y1=Y:H=D 
1030 RETURN 
1040 REM *** SHOT ***
1050 IF F=9 THEN RETURN
1060 L=L-1
1070 IF L>35 THEN RETURN
1080 IF H=1 THEN Y1=Y1-5 
1090 IF H=2 THEN Y1=Y1-5:X1=X1+5 
1100 IF H=3 THEN X1=X1+5 
1110 IF H=4 THEN X1=X1+5:Y1=Y1+5 
1120 IF H=5 THEN Y1=Y1+5 
1130 IF H=6 THEN Y1=Y1+5:X1=X1-5 
1140 IF H=7 THEN X1=X1-5 
1150 IF H=8 THEN X1=X1-5:Y1=Y1-5 
1160 IF X1>245 OR X1<10 OR Y1>175 OR Y1<10 THEN L=0 
1165 IF X1<1 THEN X1=0 
1166 IF Y1<1 THEN Y1=0 
1170 LINE(X1-1,Y1-1)-(X1+2,Y1+2) ,PSET, BF 
1180 RETURN 
1190 REM *** HIT 2 *** 
1200 SOUND 1,1 
1210 D=9 
1220 RETURN 
1230 IF F=9 THEN RETURN 
1240 F=9 
1250 CIRCLE(X1,Y1),10: PAINT(X1,Y1),1,1 
1260 RETURN 
1270 PUT(O-4,P-4)-(O+4,P+4),CI,OR 
1280 PLAY" O3; T55;GB"
1290 IF O<50 THEN O=O+2 
1300 IF O>200 THEN O=O-2 
1310 P=P+5 
1320 IF P>180 THEN GOTO 1340 
1330 RETURN 
1340 REM ** CRASH ** 
1350 PMODE4,5 
1360 PUT(O-4,P-4)-(O+4,P+4), CI,OR 
1370 PMODE4, 1 
1380 PLAY"05; T50; ABDABC" 
1390 O=128:P=96 
1400 F=RND(8) 
1410 U=U-25:S=S+1 
1420 GOTO 370
1430 REM ** CRASH 2 **
1440 PUT(X-4,Y-4)-(X+4, Y+4), CI,OR 
1450 Y=Y+5 
1460 IF X<50 THEN X=X+1 
1470 IF X>150 THEN X=X-1 
1480 IF Y>180 THEN 1510
1490 PLAY" O2; T55; GB" 
1500 RETURN 
1510 PMODE 4,5 
1520 PUT (X-4, Y-4)-(X+4,+4), CI,OR 
1530 PMODE 4,1 
1540 D=RND(8) 
1550 X=128:Y=96 
1560 U=0 
1570 Z=Z-1 
1580 IF Z=Ø THEN 1600 
1590 GOTO 370 
1600 CLS: PRINT"********* FIGHTER PILOT ********"
1610 PRINT:PRINT"YOU SHOT DOWN"; S; "PLANES"
1620 PRINT:PRINT" ANOTHER GAME Y/ N" 
1630 SOUND 200,2:FORDE=1TO100:NEXT
1640 A$=INKEY$:IF A$="" THEN 1640
1650 IF A$="N" THEN STOP
1660 RUN





