% Configurações
% camisetas
camisa(amarelo).
camisa(azul).
camisa(branco).
camisa(verde).
camisa(vermelho).

% nacionalidades
nacionalidade(alemao).
nacionalidade(croata).
nacionalidade(espanhol).
nacionalidade(frances).
nacionalidade(italiano).

% bebida
bebida(agua).
bebida(cafe).
bebida(cha).
bebida(cerveja).
bebida(leite).

% dias
dias(10).
dias(15).
dias(20).
dias(25).
dias(30).

% idade
idade(28).
idade(31).
idade(36).
idade(45).
idade(57).

% companhia
companhia(amigo).
companhia(filho).
companhia(irma).
companhia(esposa).
companhia(namorada).

% X está ao lado de Y.
aoLado(X, Y, Lista) :-
    nextto(X,Y,Lista);
    nextto(Y,X,Lista).

% X está lado a lado de Y.
ladoAlado(X, Y, Lista) :-
    aEsquerdaExatamente(X,Y,Lista);
    aDireitaExatamente(X,Y,Lista).

% X está à esquerda de Y (em qualquer posição à esquerda).
aEsquerda(X, Y, Lista) :-
    nth0(IndexX,Lista,X),
    nth0(IndexY,Lista,Y),
    IndexX < IndexY.

% X está exatamente à esquerda de Y.
aEsquerdaExatamente(X, Y, Lista) :-
    nth0(IndexX,Lista,X),
    nth0(IndexY,Lista,Y),
    IndexX =:= IndexY - 1.

% X está exatamente à direita de Y.
aDireitaExatamente(X, Y, Lista) :-
    nth0(IndexX,Lista,X),
    nth0(IndexY,Lista,Y),
    IndexX =:= IndexY + 1.

% X está à direita de Y (em qualquer posição à direita).
aDireita(X, Y, Lista) :- aEsquerda(Y,X,Lista).

% X está entre Y e Z, nessa ordem.
entre(X, Y, Z, Lista) :-
    aEsquerda(X, Z, Lista),
    aDireita(X, Y, Lista).

% Verifica se todos elementos da lista são diferentes.
todosDiferentes([]).
todosDiferentes([H|T]) :- not(member(H,T)), todosDiferentes(T).

solucao(ListaSolucao) :- 

    % Lista da solução do problema da turistas na copa.
    ListaSolucao = [
        turista(Camisa1, Nacionalidade1, Bebida1, Dias1, Idade1, Companhia1),
        turista(Camisa2, Nacionalidade2, Bebida2, Dias2, Idade2, Companhia2),
        turista(Camisa3, Nacionalidade3, Bebida3, Dias3, Idade3, Companhia3),
        turista(Camisa4, Nacionalidade4, Bebida4, Dias4, Idade4, Companhia4),
        turista(Camisa5, Nacionalidade5, Bebida5, Dias5, Idade5, Companhia5)
    ],


    % Na primeira posição está quem ficará 15 dias no Brasil.
    Dias1 = 15,

    % O turista da camisa Verde está em algum lugar entre quem gosta de Água e o Croata, nessa ordem.
    entre(turista(verde, _, _, _, _, _), turista(_, _, agua, _, _, _), turista(_, croata, _, _, _, _), ListaSolucao),

    % O Alemão está acompanhado do Filho.
    member(turista(_, alemao, _, _, _, filho), ListaSolucao),

    % O Espanhol é o turista mais velho.
    member(turista(_, espanhol, _, _, 57, _), ListaSolucao),

    % O turista de 45 anos está exatamente à direita do turista de 31 anos.
    % errado aqui?
    aDireitaExatamente(turista(_, _, _, _, 45, _), turista(_, _, _, _, 31, _), ListaSolucao),
    
    % O Alemão está exatamente à esquerda do turista de Vermelho.
    aEsquerdaExatamente(turista(_, alemao, _, _, _, _), turista(vermelho, _, _, _, _, _), ListaSolucao),

    % O turista de 36 anos está exatamente à esquerda do turista que gosta de Leite.
    aEsquerdaExatamente(turista(_, _, _, _, 36, _), turista(_, _, leite, _, _, _), ListaSolucao),

    % O turista do meio está acompanhado do Amigo.
    Companhia3 = amigo,

    % O turista de Azul está ao lado do turista que ficará 10 dias no Brasil.
    aoLado(turista(azul, _, _, _, _, _), turista(_, _, _, 10, _, _), ListaSolucao),

    % O Italiano está na terceira posição.
    Nacionalidade3 = italiano,

    % O Alemão está ao lado do turista que passará 20 dias no Brasil.
    aoLado(turista(_, alemao, _, _, _, _), turista(_, _, _, 20, _, _), ListaSolucao),

    % O turista de 28 anos está exatamente à direita do turista que ficará 25 dias no Brasil.
    aDireitaExatamente(turista(_, _, _, _, 28, _), turista(_, _, _, 25, _, _), ListaSolucao),

    % O turista de Verde está em algum lugar entre o Espanhol e o turista de Branco, nessa ordem.
    entre(turista(verde, _, _, _, _, _), turista(_, espanhol, _, _, _, _), turista(branco, _, _, _, _, _), ListaSolucao),

    % Quem gosta de Chá está exatamente à esquerda de quem veio acompanhado do Amigo.
    aEsquerdaExatamente(turista(_, _, cha, _, _, _), turista(_, _, _, _, _, amigo), ListaSolucao),

    % Na quinta posição está o turista que veio com a Namorada.
    Companhia5 = namorada,

    % Quem está acompanhado da Esposa está ao lado de quem ficará 20 dias no Brasil.
    aoLado(turista(_, _, _, _, _, esposa), turista(_, _, _, 20, _, _), ListaSolucao),

    % O turista que gosta de Café está na quinta posição.
    Bebida5 = cafe,

    % O turista que veio com a Esposa está exatamente à esquerda de quem gosta de Leite.
    aEsquerdaExatamente(turista(_, _, _, _, _, esposa), turista(_, _, leite, _, _, _), ListaSolucao),

    % Os turistas das camisas amarela e vermelha estão lado a lado.
    aoLado(turista(amarelo, _, _, _, _, _), turista(vermelho, _, _, _, _, _), ListaSolucao),

    % O turista de 31 anos veio com o Amigo.
    member(turista(_, _, _, _, 31, amigo), ListaSolucao),   
    
    % Testa todas as possibilidades de Camisa
    camisa(Camisa1), camisa(Camisa2), camisa(Camisa3), camisa(Camisa4), camisa(Camisa5),
    todosDiferentes([Camisa1, Camisa2, Camisa3, Camisa4, Camisa5]),

    % Testa todas as possibilidades de nacionalidade
    nacionalidade(Nacionalidade1), nacionalidade(Nacionalidade2), nacionalidade(Nacionalidade3), nacionalidade(Nacionalidade4), nacionalidade(Nacionalidade5),
    todosDiferentes([Nacionalidade1, Nacionalidade2, Nacionalidade3, Nacionalidade4, Nacionalidade5]),

    % Testa todas as possibilidades de bebida
    bebida(Bebida1), bebida(Bebida2), bebida(Bebida3), bebida(Bebida4), bebida(Bebida5),
    todosDiferentes([Bebida1, Bebida2, Bebida3, Bebida4, Bebida5]),

    % Testa todas as possibilidades de dias
    dias(Dias1), dias(Dias2), dias(Dias3), dias(Dias4), dias(Dias5),
    todosDiferentes([Dias1, Dias2, Dias3, Dias4, Dias5]),

    % Testa todas as possibilidades de idade
    idade(Idade1), idade(Idade2), idade(Idade3), idade(Idade4), idade(Idade5),
    todosDiferentes([Idade1, Idade2, Idade3, Idade4, Idade5]),

    % Testa todas as possibilidades de bebida
    companhia(Companhia1), companhia(Companhia2), companhia(Companhia3), companhia(Companhia4), companhia(Companhia5),
    todosDiferentes([Companhia1, Companhia2, Companhia3, Companhia4, Companhia5]).