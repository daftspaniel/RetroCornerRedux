20 CLEAR300:D=0:R=8:DIMM(3,3),B(3):DIMT$(3),O$(3)
30 M(1,1)=2:M(1,2)=1:M(1,3)=3:M(2,1)=2:M(2,2)=3:M(2,3)=1:M(3,1)=1:M(3,2)=2:M(3,3)=3
35 B(1)=7:B(2)=-2:B(3)=-7:DIMA$(3):A$(1)="you€try€diplomacy"
37 A$(2)="you€fire€all€phasers":A$(3)="you€send€a€science€team"
40 O$(1)="mission€successful":O$(2)="those€orders€were€illogical"
50 O$(3)="mission€failed": T$(1)="was€unpopulated":T$(2)="has€peaceful€people":T$(3)="attacked€your€ship"
55 B$="":FORD=1TO32:B$=B$+"¼":NEXT:C$="":FORD=1TO95:C$=C$+"€":NEXT:CLS0
60 D=1000+RND(256)
100 REM MAIN DISPLAY
102 D=D+1:P=255-RND(7)*16:?@0,"stardate"+STR$(D);: GOSUB210
104 GOSUB250
106 ?@128,"ÏÏÏÏÏÏ";:?@163,"Å";:?@195,"ÏÏÏÏÏÏÏÎ";:?@170,"Ï";:?@136,"ÃÃÃÏÏÃÃ";:?@138,"ÏÏ";
110 ?@304,"planet€"+V$+STR$(RND(12345)+19999);
118 ?@352,B$;
120 ?@384,"€€1diplomacy€2phasers€3explore€";:
122 A$=INKEY$:IFA$=""THEN 122
124 C=VAL(A$): IF C<1 OR C>3 THEN 122
126 GOSUB200
130 P=RND(3):O=M(C,P):R=R+B(O):?@384,A$(C);:?@416,"the€planet€"+T$(P)+"€";:GOSUB210
135 IF B(O)<0 THEN SOUND 100,1:SOUND 80,1:SOUND 60,1
137 IF B(O)>1 THEN SOUND 120,1:SOUND 140,1:SOUND 160,1
140 ?@452,O$(O);:FORD=1TO4000:NEXT:GOSUB200
150 ?@384,"";:IFR<1THEN ?@390,"starfleet€demote€you";:?@459,"game€over";:FORD=1TO4000:NEXT:RUN
160 IF R<20 THEN 60
170 GOSUB 200:?@384,"starfleet€promote€you€to€admiral";
180 ?@459,"well€done";:FORD=1TO4000:NEXT:RUN
200 ?@384,C$;:RETURN
210 ?@21,"rating"+STR$(R)+"€";:RETURN
250 P$=CHR$(143+(RND(7)*16))
260 ?@246, P$+P$+P$+P$+P$+P$;
270 ?@212, P$+P$+P$+P$+P$+P$+P$+P$+P$+P$;
280 ?@180, P$+P$+P$+P$+P$+P$+P$+P$+P$+P$;
290 ?@150, P$+P$+P$+P$+P$+P$;
400 RETURN
