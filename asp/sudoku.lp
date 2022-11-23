% Please insert the names and email addresses of the group members:
% campbell1@uni-potsdam.de
% Colin Campbell MNR: 814718
% Hints:
% - For subgrid_size(s), subgrids can be identified by labels 0..s*s-1
% - A cell (x,y) can be mapped to the subgrid labeled (((x-1)/s)*s + (y-1)/s)

x(1..9).
y(1..9).
n(1..9).

sudoku(X,Y,N) :- initial(X,Y,N).

{sudoku(X,Y,N): n(N)}=1 :- x(X) ,y(Y).

subgrid(X,Y,A,B) :- x(X), x(A), y(Y), y(B),(X-1)/3 == (A-1)/3, (Y-1)/3 == (B-1)/3.  %die 9 Unter-Kästchenen, durch ganzzahlige Division (vorher -1 weil es mit 1 Initialisiert wurde und man sonst bei 3/6/9 ins nächste rutscht) werden die ersten, zweiten und dritten Zahlen der X,Y Koordinaten zusammengefasst in ein Subgrid  

:- sudoku(X,Y,N), sudoku(A,Y,N), X!=A.  %In der 
:- sudoku(X,Y,N), sudoku(X,B,N), Y!=B.
:- sudoku(X,Y,V), sudoku(A,B,V), subgrid(X,Y,A,B), X != A, Y != B.

#show sudoku/3.
