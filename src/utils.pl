% questions reading
read_questions :-
    write('Deseja carregar as questões de um arquivo ou de uma API?'), nl,
    write('1 - Arquivo'), nl,
    write('2 - API'), nl,
    read(Choice),
    questions_menu_option(Choice).

questions_menu_option(1) :- read_questions_from_file.
questions_menu_option(2) :- read_questions_from_api.
questions_menu_option(_):- write('Não é uma opção válida\n\n'), nl, read_questions.

% manipulate list
append_list([],L,L).
append_list([X1|L1],L2,[X1|L3]) :- append_list(L1,L2,L3).

insert_answer(L, X, NewL) :- append_list(L, [X], NewL).

% list of possible combinations and the related team
teams([
    [[_, _, _, _, _], '<Inexistente na base de dados>'],
    % Sudeste (Rio de Janeiro)
    [[3, 1, 3, 1, 1], 'Flamengo'],
    [[3, 1, 3, 2, 1], 'Flamengo'],
    [[3, 1, 3, 1, 2], 'Flamengo'],
    [[3, 1, 3, 2, 2], 'Flamengo'],
    [[3, 1, 2, 1, 1], 'Vasco'],
    [[3, 1, 2, 1, 1], 'Vasco'],

    % Sudeste (São Paulo)
    [[3, 2, 3, 2, 3], 'São Paulo'],
    [[3, 2, 3, 3, 3], 'São Paulo'],
    [[3, 2, 3, 2, 2], 'São Paulo'],
    [[3, 2, 3, 3, 2], 'São Paulo'],
    [[3, 2, 2, 3, 1], 'Corinthians'],
    [[3, 2, 2, 4, 1], 'Corinthians'],
    [[3, 2, 2, 3, 2], 'Corinthians'],
    [[3, 2, 2, 4, 2], 'Corinthians'],

    % Nordeste
    [[2, 3, 3, 2, 1], 'Fortaleza'],
    [[2, 3, 4, 4, 2], 'Fortaleza'],
    [[2, 3, 1, 3, 1], 'Ceará'],
    [[2, 3, 1, 3, 2], 'Ceará'],

    [[2, _, 2, 2, 1], 'Bahia'],
    [[2, _, 3, 2, 1], 'Bahia'],
    [[2, _, 4, 1, 2], 'Sport'],
    [[2, _, 2, 1, 2], 'Sport'],
    [[2, _, 3, 1, 1], 'Vitória'],
    [[2, _, 3, 2, 4], 'Campinense'],

    % Sul
    [[4, 4, 4, 2, 4], 'Grêmio'],
    [[4, 4, 4, 4, 3], 'Grêmio'],
    [[4, 4, 3, 1, 2], 'Inter'],
    [[4, 4, 3, 2, 3], 'Inter'],

    [[4, _, 1, 2, 2], 'Coritiba'],
    [[4, _, 2, 3, 2], 'Londrina'],
    [[4, _, _, 3, 4], 'Criciúma'],

    % Norte
    [[1, _, 2, _, 1], 'Rio Branco F.C.'],
    [[1, _, 3, _, 1], 'Rio Branco F.C.'],
    [[1, _, 2, _, 4], 'Náutico F.C.'],
    [[1, _, 3, _, 4], 'Náutico F.C.'],
    [[1, _, 4, 1, _], 'São Raimundo E.C.'],
    [[1, _, 4, 2, _], 'Nacional F.C.'],
    [[1, _, _, 3, 1], 'Amazonas F.C.'],
    [[1, _, 1, 4, 4], 'Náuas E.C.'],
    [[1, _, 1, 2, 3], 'Tapajós F.C.']
]).

% method to compare list of answers from user and list of model answers from the teams
consumeList(AnswerModel, AnswerList, Coincidence, N, OtherTeams, ListF, FinalList) :-
    nth0(N, AnswerModel, Elem),
    nth0(N, AnswerList, Elem2),
    (Elem == Elem2 ->  Coincidences is Coincidence + 1; Coincidences is Coincidence),
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
getIndexFromAnswerTeam(_, 40, _, HighIndex, Index) :- Index = HighIndex.

% return only the name of the team from the index of the answer
getTeam(Teams, Index, Team) :-
    nth0(Index, Teams, [_|[Team|[]]]).

% final answer
answer(AnswerList, Answer) :-
    teams(Teams),
    compareAnswer(Teams, AnswerList, [], FinalList),
    getIndexFromAnswerTeam(FinalList, 0, 0, 0, Index),
    getTeam(Teams, Index, Team),
    string_concat('Você é torcedor do time: ', Team, Temp1),
    string_concat(Temp1, '!', Answer).
answer(_, _, _, 'Desculpe, mas não encontramos um time de futebol para você.').
