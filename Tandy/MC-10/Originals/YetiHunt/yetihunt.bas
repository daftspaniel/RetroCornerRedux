10 CLEAR500:V=16384+8:D=128:SOUND205,1:W=0:YX=RND(-TIMER):DIMF(5,5):YX=RND(5):YY=RND(5)
15 CLS:PRINT@33,"yeti";:PRINT@65,"hunt";:FORX=1TO5: FORY=1TO5:F(X,Y)=94:NEXT:NEXT
16 PRINT@450,"PRESS ANY KEY TO START":A$=INKEY$:IF A$=""THEN 16
17 YX=RND(-TIMER):YX=RND(5):YY=RND(5):PRINT@450,""
18 FORX=1TO16: FORY=1TO12:POKEV+Y*32+X,D:NEXT:NEXT:O$=CHR$(255)
20 FORX=1TO5:POKE16384+40+X*3,X+48:NEXT:FORX=1TO5:POKE16384+41+X*64,X+48:NEXT
30 FORX=1TO5:FORY=1TO5:POKE 16384+40+Y*64+X*3,F(X,Y):NEXT:NEXT:IF W=0 THEN PRINT@422,"SEARCH (ENTER X,Y)  ";
40 IF W=1THEN PRINT@450,"   HIT ENTER TO PLAY AGAIN";:INPUTQ$:RUN
50 I$=INKEY$:A=VAL(I$):IFA<1 OR A>5THEN 50 
55 PRINT@442,STR$(A)+",":SOUND128,1
60 I$=INKEY$:B=VAL(I$):IFB<1 OR B>5THEN 60 
65 PRINT@445,B:SOUND128,1
70 IF A=YX AND B=YY THEN PRINT@422," YOU FOUND THE YETI!    ":GOSUB100:F(A,B)=207:W=1:GOTO80
75 F(A,B)=30
80 IF W=0 THEN G = SQR(ABS(YX-A) + ABS(YY-B)):IFG<1.5THENF(A,B)=255:PRINT@450,"BAD SMELL: GETTING CLOSE!";:GOTO90
85 PRINT@450,"NO SIGN OF LIFE!"
90 IFW=0ANDG=1THENF(A,B)=191
91 GOTO 30
100 PRINT@129,CHR$(255) + CHR$(255) + CHR$(255) + CHR$(255) + CHR$(255);
110 PRINT@160,O$+O$+CHR$(206)+O$+CHR$(205)+O$+O$;
120 PRINT@192,CHR$(255) + CHR$(255) + CHR$(255) + CHR$(255) + CHR$(255) + CHR$(255) + CHR$(255);
130 PRINT@224,O$ + O$ + O$ + CHR$(207) + O$ + O$ + O$;
140 PRINT@257,CHR$(255) + CHR$(255) + CHR$(255) + CHR$(255) + CHR$(255);
150 RETURN