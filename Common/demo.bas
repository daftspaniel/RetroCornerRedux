100 CLS0:TT$="BASIC LIBRARY DEMO":TBY$="DAVY MITCHELL":TD$="MAY 2023":TV$="VERSION 0.1":TC$=CHR$(175):GOSUB 6000
110 GOSUB 9930

200 CLS:TL=0:T$="WELCOME TO THE DEMO":GOSUB9600
210 BH=12:BW=30:BX=1:BY=1:BC$=CHR$(207):GOSUB9400
220 TL=6:T$="A LIBRARY OF EASY TO USE":GOSUB9600
230 TL=TL+1:T$="BASIC ROUTINES FOR":GOSUB9600
240 TL=TL+1:T$="DRAGON, TANDY & MC-10":GOSUB9600
250 TL=TL+2:T$="FEEDBACK VERY WELCOME!":GOSUB9600
290 GOSUB 9900

1000 CLS:TL=0:T$="FILLED BOX ROUTINE DEMO":GOSUB9600
1010 BH=5:BW=16:BX=4:BY=2:BC$="*":GOSUB9500
1020 BH=5:BW=16:BX=6:BY=4:BC$=CHR$(255):GOSUB9500
1030 BH=5:BW=16:BX=8:BY=6:BC$=CHR$(150):GOSUB9500
1040 BH=5:BW=16:BX=10:BY=8:BC$=CHR$(223):GOSUB9500
1090 GOSUB 9900

1100 CLS:TL=0:T$="OUTLINE BOX ROUTINE DEMO":GOSUB9600
1110 BH=5:BW=6:BX=4:BY=2:BC$="*":GOSUB9410
1120 BH=5:BW=6:BX=12:BY=2:BC$="$":GOSUB9410
1130 BH=5:BW=6:BX=20:BY=2:BC$="@":GOSUB9410
1140 BH=5:BW=6:BX=4:BY=8:BC$=CHR$(150):GOSUB9410
1150 BH=5:BW=6:BX=12:BY=8:BC$=CHR$(223):GOSUB9410
1160 BH=5:BW=6:BX=20:BY=8:BC$=CHR$(255):GOSUB9410
1190 GOSUB 9900

1200 CLS:TL=0:T$="HORIZONTAL LINE DEMO":GOSUB9600
1210 FORD=1TO6
1220 LC$=CHR$(255-D*16):LL=28-D*2:LX=2:LY=4+D:GOSUB 9310
1230 NEXT
1299 GOSUB 9900

1300 CLS:TL=0:T$="VERTICAL LINE DEMO":GOSUB9600
1310 FORD=1TO6
1320 LC$=CHR$(255-D*16):LL=13-D:LX=2+D*2:LY=2:GOSUB 9210
1330 LC$=CHR$(255-D*16):LL=13-D:LX=32-(2+D*2):LY=2:GOSUB 9210
1340 NEXT
1399 GOSUB 9900

1400 CLS0:TL=0:T$="LOWER CASE/INVERT DEMO":GOSUB9600
1410 T$="LOREM IPSUM DOLOR SIT AMET":GOSUB9950:TL=8:GOSUB9600
1420 T$="ABCDEFGHIJKLMNOPQRSTUVWXYZ":GOSUB9950:TL=6:GOSUB9600
1430 T$="NUMBERS DO NOT WORK 1234":GOSUB9950:TL=4:GOSUB9600
1499 GOSUB 9900

1500 CLS0:TL=0:T$="TITLE SCREEN DEMO":GOSUB9600
1510 TT$="PROGRAM NAME HERE":TBY$="A COCO CAT":TD$="DATE":TV$="VERSION 1.1":TC$=CHR$(175):GOSUB 6000
1540 GOSUB 9900

5500 CLS:TL=0:T$="DEVELOPMENT TODO":GOSUB9600
5560 BH=12:BW=30:BX=1:BY=1:BC$=CHR$(175):GOSUB9400
5570 I=6:TL=6:?@(32*TL)+I,"TODO FOR VERSION 0.2";
5580 TL=TL+1:?@(32*TL)+I,"+ MORE ROUTINES";
5590 TL=TL+1:?@(32*TL)+I,"+ MORE DOCUMENTATION";
5600 TL=TL+1:?@(32*TL)+I,"+ FEWER VARIABLES";
5610 GOSUB 9900

5998 RUN

5999 REM ------LIBRARY GOES BELOW------

6000 REM TITLE SCREEN
6001 REM TT$ = PROGRAM NAME
6002 REM TBY$ = AUTHOR
6003 REM TD$ = DATE
6004 REM TV$ = VERSION
6010 BH=7:BW=LEN(TT$)+2:BY=3:BX=(30-BW)/2+1:BC$=CHR$(143):GOSUB9510
6020 BH=9:BW=LEN(TT$)+4:BY=1:BX=(32-BW)/2:BC$=TC$:GOSUB9410
6030 ?@BX+(BY+1)*32 + 2,TT$;
6040 ?@BX+(BY+3)*32 + ((BW-LEN(TBY$))/2),TBY$;
6050 ?@BX+(BY+5)*32 + ((BW-LEN(TD$))/2),TD$;
6060 ?@BX+(BY+7)*32 + ((BW-LEN(TV$))/2),TV$;
6100 RETURN

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
9320 LO$=STRING$(LL,LC$)
9330 ?@LX+(LY*32),LO$;
9340 RETURN

9400 REM BOX OUTLINE
9403 REM BX,BY = BOX POSITION
9404 REM BH,BW = BOX HEIGHT & WIDTH
9405 REM BC$ = CHARACTER FOR BOX EDGE
9410 BR$=""
9420 FOR BR=1TOBW:BR$=BR$+BC$:NEXT
9430 ?@BX+((BY+1)*32),BR$;
9435 ?@BX+((BY+BH)*32),BR$;
9437 BH=BH-1:BY=BY+1:BW=BW-1
9440 FOR BQ=1TOBH:?@BX+((BY+BQ)*32),BC$;:?@BX+BW+((BY+BQ)*32),BC$;:NEXT
9499 RETURN

9500 REM FILLED BOX
9503 REM BX,BY = BOX POSITION
9504 REM BH,BW = BOX HEIGHT & WIDTH
9505 REM BC$ = CHARACTER FOR BOX
9510 BR$=""
9520 FOR BR=1TOBW:BR$=BR$+BC$:NEXT
9530 FOR BQ=1TOBH:?@BX+((BY-1+BQ)*32),BR$;:NEXT
9599 RETURN

9600 REM CENTER TEXT. TL = vertical line number.
9610 PRINT@(32-LEN(T$))/2+32*TL,T$;
9620 RETURN

9700 REM DELAY
9710 FORDZ=1TO1000:NEXT:RETURN

9800 REM WAIT FOR ANY KEY
9810 WA$=INKEY$:IF WA$="" THEN 9810
9820 RETURN

9900 REM ANY KEY PROMPT AT BOTTOM OF SCREEN.
9910 TL=15:T$="PRESS ANY KEY TO CONTINUE":GOSUB9600:GOSUB9800:RETURN

9920 REM INVERTED ANY KEY PROMPT AT BOTTOM OF SCREEN.
9930 TL=15:BC$=CHR$(128):T$="press"+BC$+"any"+BC$+"key"+BC$+"to"+BC$+"continue":GOSUB9600:GOSUB9800:RETURN

9950 REM LOWER CASE TEXT
9960 TL=LEN(T$):O$=""
9970 FORBR=1TOTL:C$=MID$(T$,BR,1):BH=ASC(C$):IF BH<91 AND BH>64 THEN C$=CHR$(BH+32)
9971 IFBH=32THENC$=CHR$(128)
9975 O$=O$+C$
9979 NEXT
9980 T$=O$
9999 RETURN