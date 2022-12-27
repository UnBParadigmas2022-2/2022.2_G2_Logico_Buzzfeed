% load the quiz questions from a file
:- consult('questions.pl').

menu :-
    write('Bem-vindo ao Quiz! Escolha uma das opções abaixo:'), nl,
    write('1 - Iniciar o quiz'), nl,
    write('2 - Sair do programa'), nl,
    read(Choice),
    menu_option(Choice).

% handle the menu options
menu_option(1) :- start_quiz.
menu_option(2) :- exit.
menu_option(_):- write('Não é uma opção válida\n\n'), nl, menu.

% list of possible combinations and the related team
teams([
    (3, 2, 3, 'São Paulo!'),
    (3, 1, 3, 'Flamengo!')
]).

% final answer
answer(X, Y, Z, Answer) :-
    teams(Teams),
    member((X, Y, Z, Team), Teams),
    !, % cut to stop searching for more solutions
    string_concat('Você é torcedor do time do ', Team, Temp1),
    string_concat(Temp1, '!', Answer).
answer(_, _, _, 'Desculpe, mas não encontramos um time de futebol para você.').

% start the quiz and compute the final answer
start_quiz :-
    ask_questions(1, X, Y, Z),
    answer(X, Y, Z, Answer),
    write(Answer), nl.

ask_questions(N, X, Y, Z) :-
    question(N, Text, Choices),
    write(Text), nl,
    write_choices(Choices, 1),
    read(Response),
    (   N =:= 1
    ->  X = Response
    ;   N =:= 2
    ->  Y = Response
    ;   N =:= 3
    ->  Z = Response
    ),
    Next is N + 1,
    ask_questions(Next, X, Y, Z).
ask_questions(_, _, _, _).

% write the choices for a question
write_choices([H|T], N) :-
    write(N), write('. '), write(H), nl,
    Next is N + 1,
    write_choices(T, Next).
write_choices([], _) :- nl.

% exit the program
exit :- halt.

% start the program
:- initialization(menu).
