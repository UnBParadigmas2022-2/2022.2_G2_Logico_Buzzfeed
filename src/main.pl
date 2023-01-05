% load the quiz questions from a file
:- consult('questions.pl').

% load the quiz menu from a file
:- consult('menu.pl').

% start the program
:- initialization(menu).

% handle the menu options
menu_option(1) :- start_quiz.
menu_option(2) :- add_teams.
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

% list of possible combinations and the related team
teams([
    [[3, 2, 3, 2, 3], 'são Paulo'],
    [[3, 2, 3, 3, 3], 'são Paulo'],
    [[3, 2, 3, 2, 2], 'são Paulo'],
    [[3, 2, 3, 3, 2], 'são Paulo'],
    [[3, 1, 3, 2, 1], 'flamengo'],
    [[3, 1, 3, 1, 1], 'flamengo'],
    [[3, 1, 2, 1, 1], 'vasco'],
    [[3, 1, 2, 1, 1], 'vasco']
]).


% method to compare list of answers from user and list of model answers from the teams
consumeList(AnswerModel, AnswerList, Coincidence, N, OtherTeams, ListF, FinalList) :-
    nth0(N, AnswerModel, Elem),
    nth0(N, AnswerList, Elem2),
    (Elem =:= Elem2 ->  Coincidences is Coincidence + 1; Coincidences is Coincidence),
    Next is N + 1,
    consumeList(AnswerModel, AnswerList, Coincidences, Next, OtherTeams, ListF, FinalList).
consumeList(_, AnswerList, Coincidences, 5, OtherTeams, ListF, FinalList) :-  insert_answer(ListF, Coincidences, Z), compareAnswer(OtherTeams, AnswerList, Z, FinalList).

% method that return each model of "teams" on KB
compareAnswer([[AnswerModel|_]|OtherTeams], AnswerList, List, FinalList) :-
    consumeList(AnswerModel, AnswerList, 0, 0, OtherTeams, List, FinalList).
compareAnswer(_, _, Z, FinalList) :- FinalList = Z.

% return the index from the answer team in "teams" list
getIndexFromAnswerTeam(FinalList, N, HighCoincidence, HighIndex, Index) :-
    nth0(N, FinalList, Coincidence),
    Next is N + 1,
    (Coincidence > HighCoincidence -> getIndexFromAnswerTeam(FinalList, Next, Coincidence, N, Index); getIndexFromAnswerTeam(FinalList, Next, HighCoincidence, HighIndex, Index)).
getIndexFromAnswerTeam(_, 8, _, HighIndex, Index) :- Index = HighIndex.

% return only the name of the team from the index of the answer
getTeam(Teams, Index, Team) :-
    nth0(Index, Teams, [_|[Team|[]]]).

% final answer
answer(AnswerList, Answer) :-
    teams(Teams),
    compareAnswer(Teams, AnswerList, [], FinalList),
    getIndexFromAnswerTeam(FinalList, 0, 0, 0, Index),
    getTeam(Teams, Index, Team),
    string_concat('Você é torcedor do time do ', Team, Temp1),
    string_concat(Temp1, '!', Answer).
answer(_, _, _, 'Desculpe, mas não encontramos um time de futebol para você.').

% write the choices for a question
write_choices([H|T], N) :-
    write(N), write('. '), write(H), nl,
    Next is N + 1,
    write_choices(T, Next).
write_choices([], _) :- nl.

% manipulate list

append_list([],L,L).
append_list([X1|L1],L2,[X1|L3]) :- append_list(L1,L2,L3).

insert_answer(L, X, NewL) :- append_list(L, [X], NewL).

% adding teams
add_teams :-
    read_questions,
    write('Qual time deseja adicionar?'), nl,
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
    teams(TeamsList),
    % write(TeamsList), nl,
    append_list(TeamsList, [NewT], NewTeamList), 
    % write(NewTeamList), nl,
    write_file(NewTeamList).
    % write(He), nl,
    % laco(Team,TeamsList).

write_file(NewList) :-  
    open("teams.txt", write, File),
    [Head|Tail] = NewList,
    write(File, Head),
    loop_print(File, Tail),
    close(File).

loop_print(File,[H1|T1]) :- T1 = [], write(File, ', '), write(File, H1).
loop_print(File,[H1|T1]) :- write(File, ', '), write(File, H1), loop_print(File, T1).

% choices for the questions in add_teams
allChoices([['Norte', 'Nordeste', 'Sudeste', 'Sul'], 
              ['Verde', 'Branco', 'Vermelho', 'Azul'], 
              ['Posse de Bola', 'Finalizações', 'Contra-ataque', 'Defesa Sólida'],
              ['Fanaticos', 'Gostam de acompanhar', 'Torcida modinha', 'Estadios vazios']
]).

% appending the name of the team with the choices
list_member(X,[X|_]).
list_member(X,[_|TAIL]) :- list_member(X,TAIL).

list_append(A,T,T) :- list_member(A,T),!.
list_append(A,T,[A|T]).
   
% exit the program
exit :- halt.
