menu :-
    write('Bem-vindo ao Quiz! Escolha uma das opções abaixo:'), nl,
    write('1 - Iniciar o quiz'), nl,
    write('2 - Sair do programa'), nl,
    read(Choice),
    menu_option(Choice).

% handle the menu options
menu_option(1) :- write('Iniciar o quiz\n\n'), nl, menu.
menu_option(2) :- exit.
menu_option(_):- write('Não é uma opção válida\n\n'), nl, menu.

% exit the program
exit :- halt.

% start the program
:- initialization(menu).