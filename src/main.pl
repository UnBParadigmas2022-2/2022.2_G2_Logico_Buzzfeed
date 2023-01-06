% load the quiz questions from a file
:- consult('questions.pl').

% load the quiz menu from a file
:- consult('menu.pl').

% load visual interface
:- consult('interface.pl').

% load the general use functions
:- consult('utils.pl').

% start the program
:- initialization(menu).

% handle the menu options
menu_option(1) :- start_quiz.
menu_option(2) :- start_interface.
menu_option(3) :- add_teams.
menu_option(4) :- exit.
menu_option(_):- write('Não é uma opção válida\n\n'), nl, menu.

% start the quiz and compute the final answer
start_quiz :-
    read_questions,
    ask_questions(1, [], NewList),
    answer(NewList, Answer),

    write('Você é torcedor do time:\n'),
    write(Answer), nl, exit.

ask_questions(N, Answers, NewList) :-
    question(N, Text, Choices),
    write(Text), nl,
    write_choices(Choices, 1),
    read(Response),
    insert_answer(Answers, Response, Z),
    answers_list(N, NewList, Z),
    Next is N + 1,
    ask_questions(Next, Z, NewList).
ask_questions(_, _, _).

answers_list(5, NewList, Z) :- NewList = Z.
answers_list(_, _, _).


% write the choices for a question
write_choices([H|T], N) :-
    write(N), write('. '), write(H), nl,
    Next is N + 1,
    write_choices(T, Next).
write_choices([], _) :- nl.

% adding teams
add_teams :-
    read_questions,
    write('Qual time deseja adicionar? (Não utilizar letras maiusculas)'), nl,
    read(Team),
    allChoices(AllChoices),
    write('De qual região esse time pertence?'), nl,
    [Choices1|_] = AllChoices,
    write_choices(Choices1, 1),
    read(Region),
    write('Qual cor principal desse time?'), nl,
    [_,Choice2,_,_] = AllChoices,
    write_choices(Choice2, 1),
    read(Color),
    write('Qual a caracteristica do time?'), nl,
    [_,_,Choice3,_] = AllChoices,
    write_choices(Choice3, 1),
    read(Quality),
    write('Como é a torcida desse time?'), nl,
    [_,_,_,Choice4] = AllChoices,
    write_choices(Choice4, 1),
    read(Fans),
    list_append([Region, Region, Color, Quality, Fans], [Team], NewT),
    save_team(NewT).
   
% exit the program
exit :- halt.
