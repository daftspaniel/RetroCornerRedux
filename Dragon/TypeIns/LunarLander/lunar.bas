10 REM ****************
20 REM * LUNAR LANDER *
30 REM ****************
40 DIM L(9,9)
50 DIM A$(9)
60 DIM C(9,9)
70 A$(1)="01011010"
80 A$(2)="00100100"
90 A$(3)="01111110"
100 A$(4)="01000010"
110 A$(5)="00100100"
120 A$(6)="10011001"
130 A$(7)="10000001"
140 A$(8)="10000001"
150 PMODE4,1:PCLS
160 FORX=1 TO 8:FORY=1 TO 8
170 K=0:IF MID$(A$(X),Y,1)="1" THEN K=1
180 PSET(9+Y,9+X,K)
190 NEXT:NEXT
200 GET(10,10)-(18,18),C
210 PCLS
220 SCREEN1,1
230 A=1500
240 TH=0
250 F=20
260 V=0
270 REM DESCENT
280 J=1509-A:K=J+8
290 PUT(110,J)-(118,K),C
300 PUT(110,J)-(118,K),L
310 LINE(0,170)-(255,170),PSET
320 A$=INKEY$
330 IF A$="A" THEN TH=TH+1
340 IF A$="Q" THEN TH=TH-1
350 V=V+TH/10
360 IFV<0THEN 380
370 A=A-V
380 F=F-TH/5
390 IF F<0 OR A<1350 THEN GOTO 410
400 GOTO 270
410 CLS: IF V<5 AND F>0 THEN GOTO 450
420 PRINT"YOU CRASHED WITH FUEL  ";F
430 PRINT"AND AT A VELOCITY OF ";V
440 STOP
450 PRINT"YOU LANDED SAFELY!!"
460 PRINT"WITH FUEL TO SPARE AT ";F
470 PRINT" AND A GOOD VELOCITY OF ";V
480 STOP
