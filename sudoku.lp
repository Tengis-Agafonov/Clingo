% n is the size of sudoku with grid(n^2 x n^2)
#const n=3.

%rows
r(1..n**2). 
%columns
c(1..n**2).

%sets integer 1 in cell with row=2 and column=4
cell(2,4,1).

%predicate which says in which block is a cell
inblock(N,X,Y):-(1+(N'-1)*n)<=X,X<=n*N' ,(1+(M'-1)*n)<=Y,Y<=n*M', N=((N'-1)*n+M')  ,N'=1..n, M'=1..n,r(X),c(Y).


empty(X,Y):-not cell(X,Y,_),r(X),c(Y).

cells(X,Y,Z):-cell(X,Y,Z).

% 3 constraints. 1-st check if a row has unique number in [1,n^2]
% 2-nd like first for culumns
% 3-d checkes whether a block has exactly one occurrence of each integer in [1, n^2]
1 {cells(X,Y,Z) : val(Z)} 1:-empty(X,Y).
:-r(X) ,  cells(X,Y,Z), cells(X,Y',Z), Y!=Y'.
:-c(Y) ,  cells(X,Y,Z), cells(X',Y,Z), X!=X'.
:-r(X),c(Y),r(X'),r(Y'),inblock(N,X,Y),inblock(N,X',Y'), cells(X',Y',Z) ,cells(X,Y,Z),X!=X',Y!=Y'.}
