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
menu_option(2) :- start.
menu_option(3) :- exit.
menu_option(_):- write('Não é uma opção válida\n\n'), nl, menu.

% start the quiz and compute the final answer
start_quiz :-
    read_questions,
    ask_questions(1, [], NewList),
    answer(NewList, Answer),
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

% exit the program
exit :- halt.
