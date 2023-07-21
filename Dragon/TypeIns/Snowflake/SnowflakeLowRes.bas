1 DIM P,X,Y,T,N,V,Z,Q,R,K
10 REM ***********
20 REM *SNOWFLAKE*
30 REM ***********
35 GOSUB 2000
40 CLS0
60 X=0:Y=6.284
70 J=90:K=20:C=5
80 T=(Y-X)/J
90 FOR P=X TO Y STEP T
100 N=K*COS(P*8)
110 V=N*SIN(P)
120 Z=N*COS(P)
125 Q=(128+V)/4
127 R=(96+Z)/6
128 IF Q<0 OR Q>63 OR R<0 OR R>31 THEN J=40+RND(70):K=20:C=RND(8):CLS0:GOTO80
130 SET(Q,R,C)
140 NEXT
150 K=K+10
160 GOTO 80

2000 CLS0:TT$="SNOWFLAKE":TBY$="DR TIM LANGDELL":TD$="LOW-RES PORT - D.MITCHELL"
2010 TV$="35 PROGRAMS FOR DRAGON 32":TC$=CHR$(159):GOSUB 9010
2030 GOSUB9930:GOTO9810
2500 RETURN

9010 TM=LEN(TT$):IF LEN(TBY$)>TM THEN TM=LEN(TBY$)
9015 IF LEN(TV$)>TM THEN TM=LEN(TV$)
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

9510 BR$="":FOR BR=1TOBW:BR$=BR$+BC$:NEXT
9530 FOR BQ=1TOBH:?@BX+((BY-1+BQ)*32),BR$;:NEXT
9599 RETURN



9810 WA$=INKEY$:IF WA$="" THEN 9810
9820 RETURN

9930 BC$=CHR$(128):?@483,"press"+BC$+"any"+BC$+"key"+BC$+"to"+BC$+"continue";:GOSUB9810:RETURN