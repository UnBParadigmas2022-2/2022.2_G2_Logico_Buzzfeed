read_questions :-
    open('../questions.txt', read, Str),
    read_file(Str,Lines),
    close(Str),
    traverse(Lines, 1).

read_file(Stream, []) :-
    at_end_of_stream(Stream).

read_file(Stream, [X|L]) :-
    \+ at_end_of_stream(Stream),
    read(Stream, X),
    read_file(Stream, L).

traverse([Head|Tail], Num) :-
    nth0(0, Head, Question),
    nth0(1, Head, Options),
    assert_question(Num, Question, Options),
    NewNum is Num + 1,
    traverse(Tail, NewNum).
traverse([end_of_file], _).
traverse([], _).

assert_question(Num, Question, Options) :-
    assert(question(Num, Question, Options)).
