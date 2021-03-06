-module(mph_drop).
-export([mph_drop/0]).

mph_drop() ->
    process_flag(trap_exit, true),
    Drop=spawn_link(drop, drop, []),
    convert(Drop).

convert(Drop) ->
    receive
        {Planemo, Distance} ->
            Drop ! {self(), Planemo, Distance},
            convert(Drop);
        {'EXIT', Pid, Reason} ->
            io:format("FAILURE: ~p died because of ~p.~n", [Pid, Reason]),
            NewDrop=spawn_link(drop, drop, []),
            convert(NewDrop);
        {Planemo, Distance, Velocity} ->
            MphVelocity = 2.3693629 * Velocity,
            io:format("On ~p, a fall of ~p meters yields a fall of velocity ~p mph.~n", [Planemo, Distance, MphVelocity]),
            convert(Drop)
    end.
