%Definindo onde estao as minas do campo
mina(0,1).
mina(1,2).
mina(2,0).

%Checador se a casa e mina ou nao, retornando 1 se for e 0 caso contrario
eMina(Linha,Coluna,R):-
  (mina(Linha,Coluna) ->
    R is 1
    ; R is 0).

%Conta o valor da casa X=Linha, Y= Coluna
contarValor(X,Y,Valor):-

  NX is X+1,
  NY is Y+1,
  eMina(NX, NY, R1),

  NX1 is X,
  NY1 is Y-1,
  eMina(NX1, NY1, R2),

  NX2 is X,
  NY2 is Y+1,
  eMina(NX2, NY2, R3),

  NX3 is X-1,
  NY3 is Y-1,
  eMina(NX3, NY3, R4),

  NX4 is X-1,
  NY4 is Y,
  eMina(NX4, NY4, R5),

  NX5 is X-1,
  NY5 is Y+1,
  eMina(NX5, NY5, R6),

  NX6 is X+1,
  NY6 is Y-1,
  eMina(NX6, NY6, R7),

  NX7 is X+1,
  NY7 is Y,
  eMina(NX7, NY7, R8),

  Valor is R1+R2+R3+R4+R5+R6+R7+R8.

jogada(Linha, Coluna):-
  (mina(Linha,Coluna) ->
    write('Voce Perdeu')
    ; contarValor(Linha,Coluna,V), write(V)).
