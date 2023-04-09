10 DIMX,Y,T$(2),H,T,V,S,N,W,D:H=0:T$(1)="Ÿ":T$(2)="¯":DIMP(2):P(1)=255:P(2)=128:DIMQ(2):Q(1)=10:Q(2)=-5:M=375:CLS4
15 GOSUB 200
20 CLS4:?"score 0¿¿¿lives 3¿highscore"+STR$(H);:?@226,"ÏÏ";:?@257,"ÏÑÑÏ";:?@289,"ÏÏÏÏ";:?@322,"ÏÏ";:?@353,"ÏÏÏÏ";:?@385,"ùÏÏ";
30 Y=33:S=0:T=1:L=3:N=3:?@449,"Ï¿¿Ï";:?@417,"ÏÏÏÏ";:?@480,"ßßßßßßß";:IFF>0ANDF>HTHENH=F:?@27,STR$(H);
40 K=PEEK(2)ANDPEEK(17023):IFK<>65THENN=N-1:?@386+N,"¿";:GOTO60
50 N=N+1:IFN>31THENN=31
60 IFN<4THENN=4
70 Q(1)=N:?@384+N,"ù";:?@42+Y,T$(T);:?@(42+Y)-32,"¿";:Y=Y+32:IFY>470THENY=33+RND(16):T=RND(2)
80 V=Y-M:IFV>-1ANDV<=NTHEN GOSUB 150:IFW=2THENL=L-1:POKE49151,64:FORD=1TO100:NEXT:SOUND50,2
90 IFL>-1THEN GOTO 40
100 ?@96,"":?@128,"gameovergameovergameovergameover":F=S:SOUND255,1:SOUND155,5:SOUND55,6:SOUND15,9:CLS4:GOTO15
150 W=T:SOUNDP(T),1:Y=33+RND(16):S=S+Q(T):?@5,STR$(S);:?@15,STR$(L);:?@27,STR$(H);:T=RND(2):RETURN
200 ?@226,"ÏÏ";:?@257,"ÏÑÑÏ";:?@289,"ÏÏÏÏ";:?@322,"ÏÏ";:?@353,"ÏÏÏÏ";:?@385,"ùÏÏù";
210 ?@449,"Ï¿¿Ï";:?@417,"ÏÏÏÏ";:?@481,"ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß";
220 ?@40,"ROBOT¿ARM¿GRAB";:?@103,"BY¿DAVY¿MITCHELL";
290 A$=INKEY$:IFA$=""THEN GOTO 290
300 RETURN
