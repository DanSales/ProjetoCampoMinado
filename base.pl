%Definindo onde estao as minas do campo
mina(0,1).
mina(1,2).
mina(2,0).
mina(1,1).
mina(5,7).
mina(7,4).
mina(6,8).
mina(3,1).
mina(9,6).
mina(5,5).

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

jogada(Linha, Coluna,R):-
  (mina(Linha,Coluna) ->
    R is -1
    ; contarValor(Linha,Coluna,V), write(V), R = V).


soma([],0).
soma([H|T],S):-soma(T,G),S is H+G.

replace([_|T], 0, X, [X|T]).
replace([H|T], I, X, [H|R]):- I > -1, NI is I-1, replace(T, NI, X, R), !.

inicio(Linha, Coluna, L1, L2, L3, Cond):-
  soma(L1,S),
  (Cond > -1, S > 8 ->
    write('Jogada:'),nl,
    write(Linha),
    write('-'),
    write(Coluna),nl,
    jogada(Linha, Coluna, V),
    Pos is Linha*10 + Coluna,
    replace(L2, Pos, V, NL2),
    %L2 is NL2, %Atulizar valor das casas
    write(NL2),nl,%SEGURA NA MAO DE DEUS E VAI
    replace(L1, Pos, 0, NL1),
    %L1 is NL1, %Marcar como visitado
    write('Resultado:'),
    write(V),nl,
    %ATUALIZAR AS probabilidades
    random(0,9,X),
    random(0,9,Y),
    inicio(X,Y, NL1, NL2, NL3, V)
    ;write('Fim do Jogo'),nl
    /*(Cond < 0 ->
      write('Voce ganhou')
      ;write('Voce perdeu')
    ),*/
  ).

main :-
  Lvisitados = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
  Lcasas = [-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2],
  Lprobabilidades = [0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1],

  Linha = 4,
  Coluna = 5,
  inicio(Linha, Coluna, Lvisitados, Lcasas, Lprobabilidades, 0),
  write('Feito por Daniel Henrique e Luis Filipe').
