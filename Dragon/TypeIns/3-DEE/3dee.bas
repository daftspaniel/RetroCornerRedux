10 REM *********
20 REM * 3-DEE *
30 REM *********
40 PMODE 4,1:PCLS:SCREEN1,1
50 FOR X=-100 TO 100
60 R=10:J=0:K=1
70 V=R*INT(SQR(10000-X*X)/R)
80 FOR Y=V TO -V STEP -R
90 Z=INT(80+30*SIN((SQR(X*X+Y*Y))/12)-0.7*Y)
100 IF Z<J THEN 140
110 J=Z
120 PSET(X+110,Z-15,1)
130 K=0
140 NEXT Y: NEXT X
150 GOTO 150