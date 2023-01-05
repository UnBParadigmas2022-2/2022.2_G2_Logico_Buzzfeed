:- use_module(library(pce)).

start :-
        % create window
        new(@Window, dialog('BuzzFeed')),

        % resize window
        send(@Window, size, size(600, 600)),

        % set the background
        new(@BackgroundImage, bitmap('../src/icons/backgroundImage.jpg')),
        send(@Window, display, @BackgroundImage, point(0, 0)),

        % set the main text
        new(@MainText, text('BuzzFeed')),
        send(@MainText, font, font(tahoma, bold, 45)),
        send(@MainText, colour(colour(white))),
        send(@Window, display, @MainText, point(200, 255)),

        % set start button
        send(@Window, display, button(iniciar, and(
            message(@Window, destroy),
            message(@prolog, start_quiz)
            )), point(275, 400)),

        % show window
        send(@Window, open).

start_quiz :-
        % create window
        new(@Window, dialog('Quizz')),

        % resize window
        send(@Window, size, size(600, 600)),

        % set the background
        new(@BackgroundImage, bitmap('../src/icons/backgroundImage.jpg')),
        send(@Window, display, @BackgroundImage, point(0, 0)),

        % show window
        send(@Window, open).
