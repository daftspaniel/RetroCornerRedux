10 REM SET UP GRAPHICS
20 CLEAR2000
30 PMODE0,1
40 PCLS:SCREEN1,1:DIMC$(27),N$(10)
50 LINE(0,15)-(255,15),PSET
60 REM LETTER DATA
70 C$(1)="R8D4L8D4R8"
80 C$(5)="R4L4D4R4L4D4R4"
90 C$(9)="R4L2D8R2L4"
100 C$(12)="D8R4"
110 C$(19)="R5L5D4R4D4L4"
120 C$(22)="D6F2E2U6"
130 REM NUMBERS
140 N$(0)="D8R4U8L4"
150 N$(1)="BM+2,+0D8"
160 N$(2)="D2U2R4D4G4R4"
170 N$(3)="R4D4L4R4D4L4"
180 N$(4)="D4R4U4D8"
190 N$(5)="R5L5D4R4D4L4"
200 N$(6)="R5L5D4R4D4L4U4"
210 N$(7)="R5D8"
220 N$(8)="R5D8L5U8D4R4"
230 N$(9)="R5D8U4L4U4"
240 REM DEMO
241 CP=2
249 REM GOTO400
250 DRAW "BM2,2;"+C$(12)
260 DRAW "BM10,2;"+C$(9)
270 DRAW "BM18,2;"+C$(22)
280 DRAW "BM26,2;"+C$(5)
290 DRAW "BM34,2;"+C$(19)
300 DRAW "BM142,2;"+N$(0)
310 DRAW "BM150,2;"+N$(1)
320 DRAW "BM158,2;"+N$(2)
330 DRAW "BM166,2;"+N$(3)
340 DRAW "BM174,2;"+N$(4)
350 DRAW "BM182,2;"+N$(5)
360 DRAW "BM190,2;"+N$(6)
370 DRAW "BM198,2;"+N$(7)
380 DRAW "BM206,2;"+N$(8)
390 DRAW "BM214,2;"+N$(9)
400 GOTO 400
410 REM
