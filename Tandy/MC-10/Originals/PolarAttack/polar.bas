10 DIMA$(3):A$(1)=CHR$(170):A$(2)=CHR$(169):A$(3)=CHR$(172):DIMP$(3):P$(1)="READY":P$(2)="AIM":P$(3)="FIRE":K$="press€":W=0:L=0
20 X=90-RND(15):A=0:S=0:R=0:CLS0:?@489,"kills"+STR$(W)+"€"+"loses"+STR$(L);:?@64,CHR$(239);:?@96,CHR$(223);
30 ?@128,CHR$(251);:?@10,"polar€attack";:R$="””””””””””””””””””””””””””””””””":?@192,R$;:?@352,R$;
40 ?@263,"wait€for€it€sheriff";:FORD=1TO999+RND(255)*8:NEXT:?@263,"€€bear€attacking€€€€€€€";
50 IFS>3THENSOUND50,12:SOUND99,4:?@X+65,"ÏÏÏÏÏ€€€€€€€€€€€€€€€€€";:X=X+2:?@296,"€€€€€€€€€€€€€€€€€";:GOTO100
60 K=PEEK(2) AND PEEK(17023):IF S=0 OR K=R THEN GOSUB 110
64 ?@X,"ÏÏÏÏÏ€";:?@X+33,"ÏÏÏÏ€";:?@X+65,"Ï€€Ï€";:
65 IFS>3THEN?@98,"¸¸¸¸";:GOTO50
80 A=RND(R):X=X-1:IFX>64THENSOUND50+(50-X),1:GOTO50
90 L=L+1:SOUND255,4:FORD=42TO1STEP-1:CLS5:CLS4:SOUNDD,1:NEXT:GOTO20
100 W=W+1:?@263,"you€got€it€sheriff€€";:?@X+65,"ÏÏÏÏÏ€";:?@X+33,"ÏÏÏÏ€";:?@X,"Ï€€Ï€";:?@65,"€€€€€€€€€€";:FORD=1TO3000:NEXT:GOTO20
110 SOUND99,1:S=S+1:R=65+RND(25):IFS<4THEN?@296,K$+CHR$(R)+"€to€"+P$(S)+"€€€€";:?@97,A$(S);
130 RETURN
140 REM HELLO