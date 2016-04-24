-module(demo).
-export([double/1, printAll/1, average/1, launch/0, echo/0]).

 % This is a comment

double(X) ->
    times(X, 2).

times(X, N) ->
    X * N.

printAll([]) ->
    io:format("~n", []);

printAll([X|Xs]) ->
    io:format("~p ", [X]),
    printAll(Xs).

average(X) -> average(X,0,0).

average([H|T], Length, Sum) ->
    average(T, Length+1, Sum+H);

average([], Length, Sum) ->
    Sum/Length.

launch() ->
    register(echo, spawn(demo, echo, [])).

echo() ->
    receive
        {Pid, Msg} ->
            Pid ! Msg
    end.
