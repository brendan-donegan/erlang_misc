-module(bounce).
-export([report/1]).

report(Count) ->
    NewCount = receive
        X -> io:format("Received #~p: ~p~n", [Count, X]),
        Count / 0
    end,
    report(NewCount).
