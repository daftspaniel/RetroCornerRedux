30 DIM K,X,X1,X2,Y1,Y2,XI,YI,A$,S
40 X=257
50 CLS0:X1=9:Y1=7+RND(3):XI=1:YI=1
60 FORI=2TO31:?@32+I,CHR$(182);
70 ?@448+I,CHR$(182);
80 NEXT: GOSUB 340
90  FOR T=95 TO 447 STEP32:?@T,CHR$(182);:NEXT
100 FOR T=89 TO 444 STEP32:?@T,CHR$(255)+CHR$(255)+CHR$(255)+CHR$(255);:NEXT
135 ?@X,CHR$(207);:?@X+32, CHR$(207);:?@X+64, CHR$(128);:?@X-32,CHR$(128);
140 X2=X1+XI: IF X2>61 THEN XI=-XI:SOUND 178,1:GOTO 140
150 IF X2<2 THEN GOSUB 250:GOTO140
160 IFPOINT(X2,Y2)=8THENGOSUB310
170 Y2=Y1+YI:IF Y2>27 OR Y2<4 THEN YI=-YI:SOUND178,1:GOTO 170
180 SET(X2,Y2,8):RESET(X1,Y1):X1=X2:Y1=Y2
190 K=PEEK(2)ANDPEEK(17023)
200 IF K=90 AND X<384 THEN X=X+32:GOSUB360:GOTO230
210 IF K=81 AND X>65 THEN X=X-32:GOSUB360
230 IF X1<5 THEN GOSUB360
235 IFPOINT(X1,Y1)=5 THEN XI=-XI
240 GOTO 140
250 POKE49151,64:FORD=1TO100:NEXTD:L=L+1:GOSUB340:IF L>4 THEN 290
270 SOUND100,3:RESET(X1,Y1):XI=1:X1=16:Y1=8
280 RETURN
290 ?@202,"GAME OVER";:FORD=1TO2500:NEXT
300 ?@259,"HIT ANY KEY FOR ANOTHER GO";:IF INKEY$="" THEN 300
305 RUN
310 RESET(X2,Y2)
330 S=S+15
340 ?@20,"score" + STR$(S);:?@4,"lives" + STR$(4-L);
350 RETURN
360 ?@X,CHR$(207);:?@X+32,CHR$(207);:?@X+64,CHR$(128);:?@X-32,CHR$(128);:RETURN
500 REM DRAGON USER MAGAZINE MARCH 1984 - GARRY SAUNDERS.
510 REM PORTED & ENHANCED FOR THE TANDY MC-10 
520 REM BY DAVY MITCHELL APRIL 2023
