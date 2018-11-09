% Completar segundo o exemplo em:
% https://swish.swi-prolog.org/example/houses_puzzle.pl
%
% Enunciado do problema em:
% https://www.geniol.com.br/logica/desafios/almoco-de-natal/
%
% 1. Márcio foi de ônibus para o almoço.
% 2. Quem foi de moto chegou 30 minutos antes que o Márcio.
% 3. Quem chegou às 11:00 foi quem foi de moto ou quem foi de ônibus para o almoço.
% 4. Heitor chegou 30 minutos depois que Antônio.
% 5. Antônio usou o carro para ir no almoço.
%
% Domínios de variáveis:
% 
% nomes = antonio[5], heitor[4], marcio[1], rodrigo[x]
% transportes = carro[5], metro[x], moto[2], onibus[1]
% chegadas = 0[3], 15[x], 30[x], 45[x]
% g(nome, transporte, chegada) 
%
guests(Gs) :- 
    length(Gs, 4), 
    Gs = [g(_, _, 0), g(_, _, 15), g(_, _, 30), g(_, _, 45)],
    member(g(antonio,_,_) ,Gs),
    member(g(heitor,_,_) ,Gs),
    member(g(marcio,_,_) ,Gs),
    member(g(rodrigo,_,_) ,Gs),
    member(g(_,carro,_) ,Gs),
    member(g(_,metro,_) ,Gs),
    member(g(_,moto,_) ,Gs),
    member(g(_,onibus,_) ,Gs),
    member(g(_,_,0) ,Gs),
    member(g(_,_,15) ,Gs),
    member(g(_,_,30) ,Gs),
    member(g(_,_,45) ,Gs),
    member(g(marcio, onibus, T2), Gs), % 1, 2
    member(g(_, moto, T1), Gs), % 2
    T1 is T2 - 30, % 2
    member(g(_, V, 0), Gs), % 3
    ( V = moto ; V = onibus ), % 3
    member(g(heitor, _, T3), Gs), % 4
	member(g(antonio, carro, T4), Gs), % 4, 5
    T3 is T4 + 30. % 4
 