%% @author Brendan Donegan <brendan.j.donegan@gmail.com>
%% @doc Functions calculating velocities achieved by objects
%% dropped in a vacuum
%% @reference from <a href="http://shop.oreilly.com">Introducing Erlang</a>,
%% O'Reilly Media
%% @copyright 2016 by Brendan Donegan
%% @version 0.1

-module(drop).
-export([drop/0,fall_velocity/1,fall_velocities/1]).

drop() ->
    receive
        {From, Planemo, Distance} ->
            From ! {Planemo, Distance, fall_velocity(Planemo, Distance)},
            drop()
    end.

fall_velocity({Planemo, Distance}) -> fall_velocity(Planemo, Distance).

fall_velocity(earth, Distance) when Distance >= 0 -> math:sqrt(2 * 9.8 * Distance);
fall_velocity(moon, Distance) when Distance >= 0 -> math:sqrt(2 * 1.6 * Distance);
fall_velocity(mars, Distance) when Distance >= 0 -> math:sqrt(2 * 3.71 * Distance).

fall_velocities(List) -> fall_velocities(List,[]).

fall_velocities([], Results) -> lists:reverse(Results);
fall_velocities([Head|Tail], Results) -> fall_velocities(Tail, [fall_velocity(Head) | Results]).
