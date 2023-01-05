:- use_module(library(pce)).
:- consult('utils.pl').

start_interface :-
        read_questions,
        % create window
        new(@Window, dialog('BuzzFeed')),

        % resize window
        send(@Window, size, size(600, 600)),

        % set the background
        new(@BackgroundImage, bitmap('src/assets/backgroundImage.jpg')),
        send(@Window, display, @BackgroundImage, point(0, 0)),

        % set the main text
        new(@MainText, text('BuzzFeed')),
        send(@MainText, font, font(tahoma, bold, 45)),
        send(@MainText, colour(colour(white))),
        send(@Window, display, @MainText, point(200, 255)),

        % set start button
        send(@Window, display, button(iniciar, and(
            message(@Window, destroy),
            message(@prolog, show_question, 1, prolog([]), prolog([]))
            )), point(275, 400)),

        % show window
        send(@Window, open).

show_question(6, Answers, LastAnswer) :-
        append_list(Answers, LastAnswer, NewAnswers),
        answer(NewAnswers, Answer),
        show_result(Answer).
show_question(QuestionNumber, Answers, LastAnswer) :-
        % create window
        new(@Window, dialog('BuzzFeed')),

        % resize window
        send(@Window, size, size(600, 600)),

        % set the background
        new(@BackgroundImage, bitmap('src/assets/backgroundImage.jpg')),
        send(@Window, display, @BackgroundImage, point(0, 0)),


        question(QuestionNumber, Question, Choices),

        % set the question text
        new(@QuestionText, text(Question)),
        send(@QuestionText, font, font(tahoma, bold, 20)),
        send(@QuestionText, colour(colour(white))),
        send(@Window, display, @QuestionText, point(50, 50)),

        NextQuestion is QuestionNumber + 1,

        % adding last answer to list
        append_list(Answers, LastAnswer, NewAnswers),

        % set first answer
        nth0(0, Choices, FirstAnswer),
        send(@Window, display, button(FirstAnswer, and(
            message(@Window, destroy),
            message(@prolog, show_question, NextQuestion, prolog(NewAnswers), prolog([1]))
            )), point(225, 150)),

        % set second answer
        nth0(1, Choices, SecondAnswer),
        send(@Window, display, button(SecondAnswer, and(
            message(@Window, destroy),
            message(@prolog, show_question, NextQuestion, prolog(NewAnswers), prolog([2]))
            )), point(225, 250)),

        % set third answer
        nth0(2, Choices, ThirdAnswer),
        send(@Window, display, button(ThirdAnswer, and(
            message(@Window, destroy),
            message(@prolog, show_question, NextQuestion, prolog(NewAnswers), prolog([3]))
            )), point(225, 350)),

        % set fourth answer
        nth0(3, Choices, FourthAnswer),
        send(@Window, display, button(FourthAnswer, and(
            message(@Window, destroy),
            message(@prolog, show_question, NextQuestion, prolog(NewAnswers), prolog([4]))
            )), point(225, 450)),

        % show window
        send(@Window, open).

show_result(Answer) :-
        % create window
        new(@Window, dialog('BuzzFeed')),

        % resize window
        send(@Window, size, size(600, 600)),

        % set the background
        new(@BackgroundImage, bitmap('src/assets/backgroundImage.jpg')),
        send(@Window, display, @BackgroundImage, point(0, 0)),

        % set the title text
        new(@TitleText, text('Resultado')),
        send(@TitleText, font, font(tahoma, bold, 35)),
        send(@TitleText, colour(colour(white))),
        send(@Window, display, @TitleText, point(200, 55)),

        % set white background
        new(@WhiteBackground, box(500,400)),
        send(@WhiteBackground, colour(colour(white))),
        send(@WhiteBackground, fill_pattern, colour(white)),
        send(@Window, display, @WhiteBackground, point(50, 150)),

        % set the presentation text
        new(@PresentationText, text('Voce tirou:')),
        send(@PresentationText, font, font(tahoma, bold, 30)),
        % send(@PresentationText, colour(colour(white))),
        send(@Window, display, @PresentationText, point(215, 300)),

        % set the result text
        new(@ResultText, text(Answer)),
        send(@ResultText, font, font(tahoma, bold, 25)),
        send(@ResultText, colour(colour(red))),
        send(@Window, display, @ResultText, point(235, 350)),


        % set cancel button
        send(@Window, display, button(sair, and(
            message(@Window, destroy))
            ), point(275, 450)),

        % show window
        send(@Window, open).
