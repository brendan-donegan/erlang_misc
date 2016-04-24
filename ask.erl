-module(ask)
-export([line/0])

line() ->
    Planemo = get_planemo(),
    Distance = get_distance(),
    drop:fall_velocity({Planemo, Distance}).

get_planemo() ->
    io:format("Where are you?~n"),
    io:format("1. Earth~n"),
    io:format("2. Moon~n"),
    io:format("3. Mars~n"),
    Answer = io:get_line("Which? > "),

    Value = hd(Answer)
