1 GOSUB 2000:CLS
10 PRINT "DEATH VALLEY"
20 S=0
30 M=200
40 PRINT "WIDTH?"
50 INPUT W
60 W=INT(W/2)
70 L=10
80 Y=W
90 R=W
100 D=RND(3)-2
110 IF L+D<0 OR L+D>20 THEN GOTO 100
120 L=L+D
130 Y=Y-D
140 R=R+D
150 N=L
160 GOSUB 1000
170 PRINT "I";
180 N=Y
190 GOSUB 1000
200 PRINT "*";
210 N=R
220 GOSUB 1000
230 PRINT "I"
240 I$=INKEY$
250 IF I$<>"Q" THEN GOTO 280
260 Y=Y-1
270 R=R+1
280 IF I$<>"P" THEN GOTO 310
290 Y=Y+1
300 R=R-1
310 IF Y<1 OR R<1 THEN GOTO 370
320 S=S+1
330 IF S<M THEN GOTO 100
340 PRINT "WELL DONE-YOU MADE IT"
350 PRINT "THROUGH DEATH VALLEY"
360 STOP
370 PRINT "YOU CRASHED INTO THE WALL"
380 PRINT "AND DISINTEGRATED"
390 STOP
1000 IF N=0 THEN RETURN
1010 FOR I=1 TO N
1020 PRINT " ";
1030 NEXT I
1040 RETURN

2000 CLS0:TT$="DEATH VALLEY":TBY$="BY DANIEL ISAAMAN":TD$="& JENNY TYLER"
2010 TV$="USBORNE:COMPUTER SPACE GAMES":TC$=CHR$(159):GOSUB 9010
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
