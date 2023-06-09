10 REM ****************************
20 REM **********DRASTAR*********** 
30 REM *****BRIAN MORLEY FEB84***** 
40 REM ****************************
45 POKE 65495,0: GOSUB2000
50 DIM LT$ (26),NU$ (9),SS (25,18),TS (40,20) 
60 CLS: PRINT: PRINTTAB(11) "DRASTAR 4": PRINT 
70 PRINT"MISSION: ": PRINT TAB(7)"YOU ARE REQUIRED TO RID   THE GALAXY OF THE 9 REMAINING   STARONS. YOU ARE THE PILOT OF   A CRIPPLED DRASTAR FIGHTER."
80 PRINT: PRINT TAB(5)"YOUR FIGHTERS ENGINES ARE   DAMAGED,SO YOU MUST ANTICIPATE  THE STARONS FLIGHT PATH TO PUT  THEM IN YOUR SIGHTS.";
90 REM SET UP SCREEN
100 PMODE4,1: COLOR 1,0:PCLS:GOSUB 1480 
110 DRAW"BM0,0S6BD7BR4RE2R2UDR2F2RLG2L4H2": PAINT(10,10)
120 GET (0,0)-(25,18),SS,G
130 PCLS: DRAW"BM0,0S8"
140 DRAW"BD2BR3R2L2D3LRD3R2" 
150 DRAW"BM25,0BD2BR2R2D3RLD3L2"
160 GET (0,0)-(40,20), TS,G 
170 PCLS: LINE (0,170)-(256,192), PSET, BF: DRAW"C0" 
180 LINE (1,172)-(254,180),PSET, B:DRAW"BM4,174"
190 A$="ENERGY":GOSUB 1260 
200 LINE (41,174)-(251,178),PRESET, BF
210 LINE (1,182)-(126,190), PRESET, B: DRAW"BM4,184"
220 A$="STAR@DATE":GOSUB 1260
230 DRAW"BM90,184": A$="00000":GOSUB 1310
240 LINE(128,182)-(254,190),PRESET,B: DRAW"BM130,184"
250 A$="STARONS@REMAINING":GOSUB 1260
260 DRAW"BM240,184":A$="09": GOSUB 1310
270 REM SET CONSTANTS
280 C=5: D=4: FR=225: FL=5:FU=5:FD=145
290 E=4:F=4: TR=210: TL=4: TU=4:TD=145
300 T3=40: T4=20: T5=9: T6=54
310 S1=25:S2=18 
320 B1=254: B2=126: NT=9: BP=65280 
330 PRINT:PRINT:PRINTTAB(2) "HIT SPACE BAR TO CONTINUE" 
340 K$=INKEY$: IF K$=" " THEN 350 ELSE GOTO 340 
350 REM SET DIFFICULTY 
360 CLS:PRINT TAB(6) "HOW MANY LASER SHOTS?": PRINT
370 PRINT TAB(11) "A.10 SHOTS": PRINT 
380 PRINT TAB(11) "B.14 SHOTS" 
390 PRINT: PRINT TAB(11) "C.15 SHOTS": PRINT 
400 PRINT TAB(11) "D.21 SHOTS": PRINT
410 PRINT TAB(11) "E.30 SHOTS": PRINT
420 PRINT TAB(8) "SELECT BY LETTER"
430 K$=INKEY$: IF K$="" THEN 430
440 K=ASC(K$)-64: IF K<1 OR K>5 THEN SOUND 100,2: GOTO 430 
450 ON K GOTO 460,470,480,490,500
460 NS=10: ES=21: GOTO510 
470 NS=14: ES=15: GOTO510
480 NS=15: ES=14: GOTO510 
490 NS=21: ES=10: GOTO510
500 NS=30: ES=7
510 PRINT: PRINTTAB(3) "PRESS SPACE BAR TO BEGIN"
520 K$=INKEY$: IF K$=" " THEN TIMER=0: PRINT@448," STAND BY  ":GOTO 540
530 GOTO 520 
540 REM SET UP DISPLAY
550 LINE (0,0)-(256,169), PRESET, BF:T1=108: T2=86 
560 PUT (T1, T2)-(T1+T3, T2+T4), TS, PSET
570 FOR X=1 TO 10:GOSUB 1360: NEXT 
580 A=RND (225): B=RND (145): SCREEN 1,1
590 A=A+C: B=B+D
600 IF A<FL OR A>FR THEN C=-C
610 IF B<FU OR B>FD THEN D=-D
620 PUT(A,B)-(A+S1,B+S2),SS,PSET
630 P=PEEK(BP): IF P=B1 OR P=B2 THEN GOSUB 760 
640 J0=JOYSTK (0): J1=JOYSTK (1) 
650 IF J0<T5 THEN T1=T1-TL
660 IF J0>T6 THEN T1=T1+TL 
670 IF J1<T5 THEN T2=T2-TL
680 IF J1>T6 THEN T2=T2+TL
690 IF T1<TL THEN T1=TL
700 IF T1>TR THEN T1=TR
710 IF T2<TL THEN T2=TL
720 IF T2>TD THEN T2=TD
730 PUT(T1, T2)-(T1+T3, T2+T4), TS, PSET 
740 U=RND(T4): IF U>S2 THEN GOSUB 1360
750 GOTO 590
760 REM FIRE LASER
770 PLAY"T255L4O2CBACBACBACBACBACBA": T1=T1+20: T2=T2+10
780 FOR X=5 TO 7
790 LINE (X,169)-(T1, T2), PSET 
800 LINE (256-X,169)-(T1, T2), PSET:NEXT
810 FOR X=5 TO 7
820 LINE (X,169)-(T1, T2), PRESET 
830 LINE (256-X,169)-(T1, T2), PRESET: NEXT
840 NS=NS-1: LINE (NS*ES+41,173)-(253,179), PSET, BF
850 GOSUB 1400
860 PUT (A,B) - (A+S1, B+S2), SS, PSET 
870 IF PPOINT (T1, T2) >0 THEN GOTO 910
880 IF NS=0 THEN GOTO1070
890 T1=T1-20: T2=T2-10
900 RETURN
910 REM HIT STARON
920 PUT(A,B)-(A+S1,B+S2),SS,PSET
930 PLAY"L100O5GFED"
940 PUT(A,B)-(A+S1,B+S2),SS,PSET
950 PLAY"CBAO4GFED"
960 PUT(A-1, B-1)-(A+S1+1,B+S2+1),SS,PSET 
970 PLAY"CBAO3GFED"
980 PUT(A-3, B-3)-(A+S1+3,B+S2+3),SS,PSET
990 PLAY"CBAO2GFED"
1000 PUT(A-6, B-6)-(A+S1+6, B+S2+6),SS,PSET
1010 PLAY"CBA01GFEDCBA"
1020 NT=NT-1:LINE (239,183)-(253,189),PSET, BF
1030 A$=STR$(NT): DRAW"BM240,184":GOSUB 1310
1040 IF NT=0 THEN GOTO 1160
1050 IF NS=0 THEN GOTO 1070
1060 GOTO 540
1070 REM OUT OF ENERGY
1080 LINE (0,0)-(256,169), PRESET, BF
1090 LINE (0,170)-(256,192), PSET, BF 
1100 DRAW"BM2,171": A$="STAR@DATE": GOSUB1260
1110 DRAW"BM70,171": GOSUB 1450 
1120 DRAW"BM120,171": A$="YOU@RAN@OUT@OF@ENERGY": GOSUB 1260
1130 DRAW"BM55, 178": A$="THE@GALAXY@IS@DESTROYED": GOSUB 1260
1140 PLAY"P2; O2; T2; L3; C; L4; C; O1; L8; B; O2; L4; L4; C; L6;4; L8; D; L6; D; L8;C;L6; C; L8; O1; B; O2; L3; C;"
1150 DRAW"BM26, 185": GOTO1230
1160 REM NO STARONS LEFT 
1170 LINE (0,170)-(256,192),PSET, BF
1180 DRAW"BM2, 172": A$="STAR@DATE": GOSUB 1260 
1190 DRAW"BM70, 171": GOSUB 1450
1200 DRAW"BM13, 179": A$="CONGRATULATIONS@YOU@SAVED@THE@GALAXY": GOSUB1260
1210 FOR X=1 TO 2: PLAY"T15; L4;V15; 03; A#; ADEGFBCADEFGBADE": NEXT 
1220 DRAW"BM26, 192": GOTO1230
1230 A$="PRESS@THE@FIRE@BUTTON@TO@RESTART":GOSUB 1260
1240 P=PEEK (BP): IF P=B1 OR P=B2 THEN RUN
1250 GOTO 1240
1260 REM DRAW LETTERS 
1270 DRAW"S4C0"
1280 FOR X=1 TO LEN(A$)
1290 DRAW LT$(ASC(MID$(A$, X, 1))-64 )+"BR3"
1300 NEXT: DRAW"C1": RETURN 
1310 REM DRAW NUMBERS
1320 DRAW"S4C0"
1330 FOR X=1 TO LEN (A$) 
1340 DRAW NU$(VAL(MID$(A$,X,1)))+"BR3"
1350 NEXT X: DRAW"C1": RETURN 
1360 REM DRAW STARS
1370 U$=STR$ (RND (250)):V$=STR$ (RND(166))
1380 DRAW"BM"+U$+","+V$+"S8C1NDNLNUR"
1390 RETURN
1400 'DRAW TIME 
1410 LINE(88,183)-(124, 189),PSET, BF: DRAW"BM90,184"
1420 A$=STR$(INT(TIMER/10)):LA=LEN (A$)
1430 A$=LEFT$("000",5-LA)+A$: GOSUB 1310
1440 RETURN
1450 A$=STR$(INT(TIMER/10)):LA=LEN(A$) 
1460 A$=LEFT$("000",5-LA)+A$: GOSUB 1310
1470 RETURN
1480 REM SET UP ARRAYS 
1490 FOR X=0 TO 26:READ LT$ (X): NEXT
1500 FOR X=0 TO 9: READ NU$ (X): NEXT
1510 RETURN
1520 'DATA @ TO Z
1530 DATA BR4
1540 DATA D4RU2R3ND2U2NL3
1550 DATA D4RNU2R2U2L2R1U2NL2BR
1560 DATA D4RNUR2UBU2UL3R3
1570 DATA D4RNU2REU2HNL2BR
1580 DATA D4RNUR2BU2BLL2U2R3
1590 DATA D4RU2RBU2L2R3
1600 DATA D4R2NURU2LBU2L2R3
1610 DATA D4RU2R2D2U4 
1620 DATA BDD3RU4
1630 DATA BD3DR2NURU4
1640 DATA D4U2R3D2U2L2E2
1650 DATA ND4RDBD3R2BU4
1660 DATA D4RU2BU2RND2R2D4BU4
1670 DATA D4RU1BU3LF3DU4
1680 DATA NR3D4RBU2U2BD4R2U4
1690 DATA D4RU2R2U2L3R3
1700 DATA NR3D4R2NURU4
1710 DATA NR3D4RU2R3ND2LU2NL3BR
1720 DATA NR3DNRDR3D2L3BR3BU4
1730 DATA BD4BR2NU4RUBU3L3R4
1740 DATA D4RNU2R2U4
1750 DATA ND4RD2BD2E4
1760 DATA D4RNU2RNU4R2U4 
1770 DATA NDF4LBL3E4
1780 DATA D2R3D2U2LU2RND2
1790 DATA NDR464RNUR3BU4
1800 REM DATA O TO 9
1810 DATA D4R4U4L3ND2R3
1820 DATA BR2D4RU2BU2BR 
1830 DATA R3D2RU2D2L4D2R4BU4
1840 DATA R4D2L2RD2L3R4U4
1850 DATA D3RNU3R2NDRNDRBU3
1860 DATA NR4D2RNU2R3D2L4BR4BU4
1870 DATA ND4RD2R3D2L4BR4BU4
1880 DATA DRUR3D4LU2RU2
1890 DATA D4R4U2NL4U2L4RD2R2D2RBU4
1900 DATA R4D4LU2L3U2R4

2000 CLS0:TT$="DRASTAR4":TBY$="BRIAN MORLEY":TD$="MAGAZINE TYPE-IN"
2010 TV$="DRAGON USER AUGUST 1984":TC$=CHR$(159):GOSUB 9010
2020 GOSUB9930:GOTO9810
2500 RETURN

9010 TM=LEN(TT$):IF LEN(TBY$)>TM THEN TM=LEN(TBY$)
9015 IF LEN(TV$)>TM THEN TM=LEN(TV$)
9017 IF LEN(TD$)>TM THEN TM=LEN(TD$)
9020 BH=7:BW=TM+2:BY=3:BX=(30-BW)/2+1:BC$=CHR$(143):GOSUB9510
9030 BH=9:BW=TM+4:BY=1:BX=(32-BW)/2:BC$=TC$:GOSUB9410
9040 ?@(BY+1)*32 + ((32-LEN(TT$))/2),TT$;
9050 ?@(BY+3)*32 + ((32-LEN(TBY$))/2),TBY$;
9060 ?@(BY+5)*32 + ((32-LEN(TD$))/2),TD$;
9070 ?@(BY+7)*32 + ((32-LEN(TV$))/2),TV$;
9100 RETURN

9410 BR$=""
9420 BR$=STRING$(BW,BC$)
9430 ?@BX+((BY+1)*32),BR$;
9435 ?@BX+((BY+BH)*32),BR$;
9437 BH=BH-1:BY=BY+1:BW=BW-1
9440 FOR BQ=1TOBH:?@BX+((BY+BQ)*32),BC$;:?@BX+BW+((BY+BQ)*32),BC$;:NEXT
9499 RETURN

9510 BR$=""
9520 FOR BR=1TOBW:BR$=BR$+BC$:NEXT
9530 FOR BQ=1TOBH:?@BX+((BY-1+BQ)*32),BR$;:NEXT
9599 RETURN

9810 WA$=INKEY$:IF WA$="" THEN 9810
9820 RETURN

9930 BC$=CHR$(128):?@483,"press"+BC$+"any"+BC$+"key"+BC$+"to"+BC$+"continue";:GOSUB9810:RETURN
