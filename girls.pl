% Completar segundo o exemplo em:
% https://swish.swi-prolog.org/example/houses_puzzle.pl
%
% Enunciado do problema em:
% https://www.geniol.com.br/logica/desafios/meninas-na-escola/
%
% 1. A menina que gosta de português gosta de suco de abacaxi. V
% 2. A mochila de Manuela não é laranja. V
% 3. A garota da mochila vermelha gosta de suco de limão. V
% 4. Aline gosta de história e não gosta de suco de uva. V
% 5. Flávia não gosta de matemática.
%
% Domínios de variáveis:
% 
% nomes = Aline[4], Flávia[5], Manuela[2]
% sucos = Abacaxi[1], Limão[3], Uva[4]
% matérias = História[4], Matemática[5] e Português[1]
% mochilas = Laranja[2], Vermelha[3] e Rosa [X]
% g(nome, suco, materia, mochila) 
%
girls(Gs) :- 
    length(Gs, 3), 
    Gs = [g(aline, _, _, _), g(flavia, _, _, _), _],
    member(g(aline,_,_,_) ,Gs),
    member(g(flavia,_,_,_) ,Gs),
    member(g(manuela,_,_,_) ,Gs),
    member(g(_,abacaxi,_,_) ,Gs),
    member(g(_,limao,_,_) ,Gs),
    member(g(_,uva,_,_) ,Gs),
    member(g(_,_,historia,_) ,Gs),
    member(g(_,_,matematica,_) ,Gs),
    member(g(_,_,portugues,_) ,Gs),
    member(g(_,_,_,laranja) ,Gs),
    member(g(_,_,_,vermelha) ,Gs),
    member(g(_,_,_,rosa) ,Gs),
    member(g(_,abacaxi,portugues,_) ,Gs), %1
    member(g(manuela,_,_,C) ,Gs), %2
    C \= laranja, %2
    member(g(_,limao,_,vermelha) ,Gs), %3
    member(g(aline,S,historia,_), Gs), %4
    S \= uva, %4
    member(g(flavia,_,M,_), Gs), %5
	M \= matematica. %5
 