100 REM XMAS
110 GOSUB1100:H=0
120 PRINT "      XMAS"
130 T=2:GOSUB1400
140 H=0:FORS=1TO10:GOSUB2800
150 X=2:Y=14:GOSUB1700:PRINT"****************";
160 N=10:GOSUB1300:R=R+4
170 X=R:FORY=12TO14:GOSUB1700:PRINT"*  *";:NEXTY
180 A=0:B=1:P=0
190 T=.2:GOSUB1400:A=A+1:X=A:Y=B:GOSUB1700:PRINT" <*>"
200 IFX=17THEN310
210 IFP=1THEN250
220 GOSUB1600:IFK$<>"."THEN240
230 P=1:C=A:D=B:N=1
240 GOTO 190
250 C=C+1:D=D+N:N=N+1:X=C:Y=D-1:GOSUB1700:PRINT "+";
260 IF (X=R OR X=R+3) AND Y>11 THEN 310
270 IF Y<14THEN190
280 IF X=R+1 OR X=R+2 THEN 300
290 GOTO 310
300 X=8:Y=5:GOSUB1700:PRINT"BULLSEYE!":H=H+1:GOTO320
310 X=6:Y=5:GOSUB1700:PRINT"MISSED!"
320 T=2:GOSUB1400:NEXT S
330 T=2:GOSUB1400:GOSUB2800
340 PRINT:PRINT:PRINT"YOU GOT ";STR$(H);" PRESENTS"
350 PRINT:PRINT:PRINT"OUT OF A POSSIBLE 10":PRINT:PRINT
360 IF H>4 THEN 380
370 PRINT"NOT MUCH FOR XMAS":PRINT:PRINT"   THIS YEAR!":GOTO390
380 PRINT"APPLY FOR A JOB AT":PRINT:PRINT"THE NORTH POLE!"
390 PRINT:PRINT:PRINT:STOP

1000 REM DRAGON SUBROUTINES 
1100 W=32: D=16: F=8:GOSUB 1200: RETURN 
1200 CLS: PRINT @ 256,"";: RETURN 
1300 R=RND(N): RETURN 
1400 FOR Z=1 TO 650*T: NEXT Z:RETURN 
1500 G$=INKEY$: IF G$="" THEN 1500 
1510 RETURN 
1600 K$=INKEY$: RETURN 
1700 PRINT @32*Y+X, "";: RETURN 
1800 PRINT TAB(X); : RETURN 
1900 PRINT CHR$(94);: RETURN 
2000 PRINT CHR$(9); : RETURN 
2100 INPUT K: RETURN 
2200 INPUT K$: RETURN 
2300 CLS: RETURN 
2400 SOUND Z, 1: RETURN 
2500 R$=CHR$(R+64): RETURN 
2600 P$=MID$(K$, P, 1): RETURN 
2700 GOSUB 2600: A=ASC(P$) : RETURN 
2800 CLS: RETURN 
2900 DIM V$(26): RETURN 
3000 DIM W$(60): RETURN 
3100 GG=ASC(G$): RETURN
