:- use_module(library(http/http_open)).
:- use_module(library(http/json)).

read_questions_from_file :-
    open('questions.txt', read, Str),
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

% The g2_buzzfeed_api hostname is the docker container name
read_questions_from_api :-
    http_open('http://g2_buzzfeed_api:5000/questions', In, [request_header('Accept'='application/json')]),
    json_read_dict(In, Dict),
    close(In),
    read_api_questions(Dict.get(questions)).

read_api_questions([Head|Tail]) :-
    assert_question(Head.get(num), Head.get(question), Head.get(options)),
    read_api_questions(Tail).
read_api_questions([Head]) :-
    assert_question(Head.get(num), Head.get(question), Head.get(options)).

assert_question(Num, Question, Options) :-
    assert(question(Num, Question, Options)).
