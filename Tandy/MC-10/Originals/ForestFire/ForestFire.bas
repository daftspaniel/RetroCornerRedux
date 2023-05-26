10 DIM X,Y,V,F(30,14),N(30,14):G$=CHR$(143):F$=CHR$(191):W$="T":O$=""
20 GOSUB 2000
30 GOSUB 600
40 FOR X=1TO30
50 FOR Y=1TO14
60 V=F(X,Y)
70 IF V=0 AND RND(10)=1 THEN N(X,Y)=1:GOTO150
80 IF V=2 THEN N(X,Y)=0:GOTO150
90 IF V=1 AND RND(20)=1 THEN N(X,Y)=2:GOTO150
95 IF V<>1 THEN 150
100 IF X>29 THEN 120
110 IF F(X+1,Y)=2 THEN N(X,Y)=2
120 IF Y>13 THEN 150
130 IF F(X,Y+1)=2 THEN N(X,Y)=2
135 IF X<2 THEN 150
138 IF F(X-1,Y)=2 THEN N(X,Y)=2
140 IF Y<2 THEN 150
141 IF F(X,Y-1)=2 THEN N(X,Y)=2
150 NEXT:NEXT

240 FOR X=1TO30
250 FOR Y=1TO14
260 F(X,Y)=N(X,Y)
270 NEXT
280 NEXT

490 GOSUB 1010: REM PLOT IT
492 GOTO 40
500 GOTO 500

600 CLS6:T$="FOREST FIRE":TL=0:GOSUB9600
610 T$="PLEASE WAIT":TL=7:GOSUB9600
620 RETURN

1000 REM DISPLAY MAIN SCREEN
1010 O$=""
1020 FOR Y=1TO14
1030 FOR X=1TO30
1040 IF F(X,Y)=0 THEN O$=O$ + G$:GOTO1070
1050 IF F(X,Y)=1 THEN O$=O$ + W$:GOTO1070
1060 IF F(X,Y)=2 THEN O$=O$ + F$
1070 NEXT
1080 PRINT@1+Y*32,O$;:O$=""
1090 NEXT
1200 RETURN

2000 CLS0:TT$="FOREST FIRE SIMULATION":TBY$="DAVY MITCHELL":TD$="DON'T PLAY WITH FIRE!"
2010 TV$="VERSION 0.1":TC$=CHR$(255):GOSUB 9010
2020 GOSUB9930:GOTO9810
2500 RETURN

9010 TM=LEN(TT$):IF LEN(TBY$)>TM THEN TM=LEN(TBY$)
9020 BH=7:BW=TM+2:BY=3:BX=(30-BW)/2+1:BC$=CHR$(143):GOSUB9510
9030 BH=9:BW=TM+4:BY=1:BX=(32-BW)/2:BC$=TC$:GOSUB9410
9040 ?@(BY+1)*32 + ((32-LEN(TT$))/2),TT$;
9050 ?@(BY+3)*32 + ((32-LEN(TBY$))/2),TBY$;
9060 ?@(BY+5)*32 + ((32-LEN(TD$))/2),TD$;
9070 ?@(BY+7)*32 + ((32-LEN(TV$))/2),TV$;
9100 RETURN

9410 BR$="":FOR BR=1TOBW:BR$=BR$+BC$:NEXT
9430 ?@BX+((BY+1)*32),BR$;
9435 ?@BX+((BY+BH)*32),BR$;
9437 BH=BH-1:BY=BY+1:BW=BW-1
9440 FOR BQ=1TOBH:?@BX+((BY+BQ)*32),BC$;:?@BX+BW+((BY+BQ)*32),BC$;:NEXT
9499 RETURN

9510 BR$=""
9520 FOR BR=1TOBW:BR$=BR$+BC$:NEXT
9530 FOR BQ=1TOBH:?@BX+((BY-1+BQ)*32),BR$;:NEXT
9599 RETURN

9610 PRINT@(32-LEN(T$))/2+32*TL,T$;
9620 RETURN

9810 WA$=INKEY$:IF WA$="" THEN 9810
9820 RETURN

9930 BC$=CHR$(128):?@483,"press"+BC$+"any"+BC$+"key"+BC$+"to"+BC$+"continue";:GOSUB9810:RETURN

