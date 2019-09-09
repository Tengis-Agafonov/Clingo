{\rtf1\ansi\ansicpg1251\cocoartf1265\cocoasubrtf210
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural

\f0\fs24 \cf0 #const n=2.\
r(1..n**2).\
c(1..n**2).\
val(1..n**2).\
\
inblock(N,X,Y):-(1+(N'-1)*n)<=X,X<=n*N' ,(1+(M'-1)*n)<=Y,Y<=n*M', N=((N'-1)*n+M')  ,N'=1..n, M'=1..n,r(X),c(Y) .\
\
empty(X,Y):-not cell(X,Y,_),r(X),c(Y).\
cells(X,Y,Z):-cell(X,Y,Z).\
\
1 \{cells(X,Y,Z) : val(Z)\} 1:-empty(X,Y).\
:-r(X) ,  cells(X,Y,Z), cells(X,Y',Z), Y!=Y'.\
:-c(Y) ,  cells(X,Y,Z), cells(X',Y,Z), X!=X'.\
:-r(X),c(Y),r(X'),r(Y'),inblock(N,X,Y),inblock(N,X',Y'), cells(X',Y',Z) ,cells(X,Y,Z),X!=X',Y!=Y'.}