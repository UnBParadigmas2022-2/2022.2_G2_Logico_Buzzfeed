% load the quiz questions from a file
:- consult('questions.pl').

menu :-
    write('Bem-vindo ao Quiz! Escolha uma das opções abaixo:'), nl,
    write('1 - Iniciar o quiz'), nl,
    write('2 - Sair do programa'), nl,
    read(Choice),
    menu_option(Choice).

% handle the menu options
menu_option(1) :- ask_questions(1).
menu_option(2) :- exit.
menu_option(_):- write('Não é uma opção válida\n\n'), nl, menu.

ask_questions(N) :-
    question(N, Text, Choices, Correct),
    write(Text), nl,
    write_choices(Choices, 1),
    read(Answer),
    check_answer(Answer, Correct),
    Next is N + 1,
    ask_questions(Next).
ask_questions(_) :-
    write('Quiz completed.'), nl, exit.

% write the multiple choice options
write_choices([H|T], N) :-
    write(N), write('. '), write(H), nl,
    Next is N + 1,
    write_choices(T, Next).
write_choices([], _) :- nl.

% check the answer and print the result
check_answer(Answer, Correct) :-
    Answer =:= Correct,
    write('Correct!'), nl.
check_answer(Answer, Correct) :-
    Answer =\= Correct,
    write('Incorrect.'), nl.

% exit the program
exit :- halt.

% start the program
:- initialization(menu).