
5 CLEAR1000
10 DIM S,X,Y,C$,P,P(7,7),G(7,7),S(7,7),M,L,LY$(10),LE:GOSUB5000
11 P(4,4)=1:P(5,4)=1:P(6,4)=1:
100 CLS0

110 T$="flipping"+CHR$(128)+"bits":TL=0:GOSUB9600
111 L=69:PRINT@L,"board";:PRINT@L+15,"target";
113 BC$=CHR$(246):BX=3:BY=2:BH=10:BW=10:GOSUB9400
114 BC$=CHR$(150):BX=18:BY=2:BH=10:BW=10:GOSUB9400

115 P=3+2+((2+2)*32)
120 PRINT@P-1,"/1234567";
130 PRINT@P+14,"/1234567";
140 PRINT@P+31,"A";:PRINT@P+14+32,"A";
141 PRINT@P+63,"B";:PRINT@P+14+64,"B";
142 PRINT@P+95,"C";:PRINT@P+14+96,"C";
143 PRINT@P+127,"D";:PRINT@P+14+128,"D";
144 PRINT@P+159,"E";:PRINT@P+14+160,"E";
145 PRINT@P+191,"F";:PRINT@P+14+192,"F";
146 PRINT@P+223,"G";:PRINT@P+14+224,"G";
149 REM DRAW BOARDS

170 GOSUB 800:REM CREATE TARGET
176 GOSUB 900:REM CREATE STARTING POINT
180 S=132:GOSUB 300
190 S=147:GOSUB 350

200 A$=INKEY$:IFA$=""THEN 200
210 C=VAL(A$):IF C>0 AND C<8 THEN M=M+1:GOSUB450:GOTO230
215 R=ASC(A$):IF R>64 AND R<72 THEN R=R-64:M=M+1:GOSUB400:GOTO230
220 IF R=82 THEN GOSUB700:GOTO230
225 GOTO 200
230 S=132:GOSUB300:?@480,"CHECKING...";:GOSUB650
240 IF W=1 THEN ?"WINNER!":STOP ELSE W=0:?@480,"           ";

296 REM GOSUB400:S=132:GOSUB 300:GOSUB650
297 REM GOSUB450:S=132:GOSUB 300:GOSUB650
298 REM IF W=1 THEN ?"WINNER!":STOP
298 GOTO 200
299 GOSUB 9900

300 REM DISPLAY GAME BOARD
305 FOR Y=1TO7
310 FOR X=1TO7
315 IF P(X,Y)=0 THEN PRINT@S+Y*32+X,CHR$(128); ELSE PRINT@S+Y*32+X,CHR$(207);
320 NEXT:NEXT
340 RETURN

350 REM DISPLAY TARGET BOARD
355 FOR Y=1TO7
360 FOR X=1TO7
370 IF G(X,Y)=0 THEN PRINT@S+Y*32+X,CHR$(128); ELSE PRINT@S+Y*32+X,CHR$(207);
380 NEXT:NEXT
390 RETURN

400 REM INVERT A ROW
410 FOR X=1TO7
415 IF P(X,R)=0 THEN P(X,R)=1 ELSE P(X,R)=0
420 NEXT
440 RETURN

450 REM INVERT A COLUMN
455 FOR Y=1TO7
465 IF P(C,Y)=0 THEN P(C,Y)=1 ELSE P(C,Y)=0
470 NEXT
480 RETURN

650 REM CHECK FOR A WIN
655 W=0:FOR Y=1TO7
660 FOR X=1TO7
670 IF G(X,Y)<>P(X,Y) THEN 690
680 NEXT:NEXT:W=1
690 RETURN

700 REM RESTORE STARTING POINT
710 FOR Y=1TO7
720 FOR X=1TO7
730 P(X,Y)=S(X,Y)
740 NEXT:NEXT
750 RETURN

800 REM CREATE TARGET
810 PRINT@480,"PLEASE WAIT";:GOSUB9700
820 BR=1
830 FOR Y=1TO7
840 FOR X=1TO7
850 G(X,Y)=VAL(MID$(LY$(9),BR,1))
860 BR=BR+1
870 NEXT:NEXT
885 PRINT@480,STRING$(11,128);
890 RETURN

900 REM CREATE STARTING POINT
910 FOR Y=1TO7
920 FOR X=1TO7
930 P(X,Y)=G(X,Y):S(X,Y)=G(X,Y)
940 NEXT:NEXT
950 C=2:GOSUB 450
960 R=4:GOSUB 400
990 RETURN

5000 REM Setup layouts.
5010 LY$(1)="0000000010001000000000000000000000001000100000000"
5020 LY$(2)="0000000011111000000000000000000000001111100000000"
5030 LY$(3)="0000000011111001000100100010010001001111100000000"
5040 LY$(4)="1000001010001000101000001000001010001000101000001"
5050 LY$(5)="0000000110001100000001100011000000011000110000000"
5060 LY$(6)="1010101010101010101010101010101010101010101010101"
5070 LY$(7)="1111111111111100000000101010111111111111110000000"
5080 LY$(9)="0001000001110000111001111111001110000111000001000"
5900 RETURN
5998 END
5999 REM ------LIBRARY LIVES HERE------

9000 REM TITLE SCREEN
9001 REM TT$ = PROGRAM NAME
9002 REM TBY$ = AUTHOR
9003 REM TD$ = DATE
9004 REM TV$ = VERSION
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

9200 REM VERTICAL LINE
9201 REM LC$ = CHARACTER FOR LINE
9202 REM LX,LY = POSITION 
9203 REM LL = LENGTH
9210 LZ=LY+LL-1
9220 FOR BR=LY TO LZ:?@LX+(BR*32),LC$;:NEXT
9240 RETURN

9300 REM HORIZONTAL LINE
9301 REM LC$ = CHARACTER FOR LINE
9302 REM LX,LY = POSITION 
9304 REM LL = LENGTH
9310 LO$=""
9320 REM MC10: FOR BR=1TOLL:LO$=LO$+LC$:NEXT
9320 REM COCO/DRAGON: LO$=STRING$(LL,LC$)
9320 LO$=STRING$(LL,LC$)
9330 ?@LX+(LY*32),LO$;
9340 RETURN

9400 REM BOX OUTLINE
9403 REM BX,BY = BOX POSITION
9404 REM BH,BW = BOX HEIGHT & WIDTH
9405 REM BC$ = CHARACTER FOR BOX EDGE
9410 REM MC10: BR$="":FOR BR=1TOBW:BR$=BR$+BC$:NEXT
9410 REM COCO/DRAGON: BR$=STRING$(BW,BC$)
9410 BR$=STRING$(BW,BC$)
9420 ?@BX+((BY+1)*32),BR$;
9430 ?@BX+((BY+BH)*32),BR$;
9440 BH=BH-1:BY=BY+1:BW=BW-1
9450 FOR BQ=1TOBH:?@BX+((BY+BQ)*32),BC$;:?@BX+BW+((BY+BQ)*32),BC$;:NEXT
9460 RETURN

9500 REM FILLED BOX
9503 REM BX,BY = BOX POSITION
9504 REM BH,BW = BOX HEIGHT & WIDTH
9505 REM BC$ = CHARACTER FOR BOX
9510 REM MC10: BR$="":FOR BR=1TOBW:BR$=BR$+BC$:NEXT
9510 REM COCO/DRAGON: BR$=STRING$(BW,BC$)
9510 BR$=STRING$(BW,BC$)
9530 FOR BQ=1TOBH:?@BX+((BY-1+BQ)*32),BR$;:NEXT
9540 RETURN

9600 REM CENTER TEXT. TL = vertical line number.
9610 PRINT@(32-LEN(T$))/2+32*TL,T$;
9620 RETURN

9700 REM DELAY
9710 FORDZ=1TO1000:NEXT:RETURN

9800 REM WAIT FOR ANY KEY
9810 WA$=INKEY$:IF WA$="" THEN 9810
9820 RETURN

9900 REM ANY KEY PROMPT AT BOTTOM OF SCREEN.
9910 ?@483,"PRESS ANY KEY TO CONTINUE";:GOSUB9810:RETURN

9920 REM INVERTED ANY KEY PROMPT AT BOTTOM OF SCREEN.
9930 BC$=CHR$(128):?@483,"press"+BC$+"any"+BC$+"key"+BC$+"to"+BC$+"continue";:GOSUB9810:RETURN

9950 REM LOWER CASE TEXT
9960 TL=LEN(T$):O$=""
9970 FORBR=1TOTL:C$=MID$(T$,BR,1):BH=ASC(C$):IF BH<91 AND BH>64 THEN C$=CHR$(BH+32)
9971 IFBH=32THENC$=CHR$(128)
9975 O$=O$+C$
9979 NEXT
9980 T$=O$
9999 RETURN
