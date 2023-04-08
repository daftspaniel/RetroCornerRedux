10DIMU$(4),L$(4),P(4):U$(1)="€’•˜":L$(1)="€ž":U$(2)="€ÒÕØ":L$(2)="€ÞÝ":U$(3)="€òõø":L$(3)="€þý":U$(4)="€âåè":L$(4)="€îí"
20C=4:W$="llama€winner€€":P$="³³³³³³³³³³³³³³³³³³³³³³³³³³³³³³³³€€€€€€€€pick€a€llama€ABCD":W=0:L=0
30CLS0:N$="":P(1)=1:P(2)=1:P(3)=1:P(4)=1:?@490,"won"+STR$(W)+"€€lost"+STR$(L);:FORF=0TO10:?@30+(F*32),"ÉÉ";:NEXT
40FORJ=0TO(C-1):?@J*96,CHR$(65+J);:NEXT:?@352,P$;
42V$=INKEY$:IFV$=""THEN42
45?@384,"€€€€€€€you€picked€llama€"+V$+"€€€€€€€€";
50R=1:FORJ=0TO(C-1):O=J*96:?@O+P(R),U$(R);:?@O+32+P(R),L$(R);:R=R+1:NEXT:IFLEN(N$)>0THENGOTO80
60FORA=1TOC:P(A)=P(A)+RND(2)-1:IFP(A)>27THENN$=N$+CHR$(64+A)+"€"
70SOUND100+P(A),1:NEXT:GOTO50
80IFLEFT$(N$,1)=V$THENW=W+1:GOTO100
90L=L+1
100?@490,W$+N$;:SOUND205,2:SOUND215,3:SOUND225,4:FORD=1TO2000:NEXTD:GOTO30
110 REM A 10 LINER 2018 BY DAVY MITCHELL
120 REM UPDATED APRIL 2023
