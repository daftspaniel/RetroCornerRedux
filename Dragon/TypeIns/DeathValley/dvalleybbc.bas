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
240 I$=INKEY$(1)
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
