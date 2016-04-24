%% @author Brendan Donegan <brendan.j.donegan@gmail.com>
%% @doc Functions calculating velocities achieved by objects
%% dropped in a vacuum
%% @reference from <a href="http://shop.oreilly.com">Introducing Erlang</a>,
%% O'Reilly Media
%% @copyright 2016 by Brendan Donegan
%% @version 0.1

-module(drop2).
-export([fall_velocity/2]).

fall_velocity(Planemo, Distance) when Distance >= 0 ->
    Gravity = case Planemo of
        earth -> 9.8;
        moon -> 1.6;
        mars -> 3.71
    end,
    
    Velocity = math:sqrt(2 * Gravity * Distance),

    Description = if
        Velocity == 0 -> stable;
        Velocity < 5 -> slow;
        Velocity >= 5, Velocity < 10 -> moving;
        Velocity >= 10, Velocity < 20 -> fast;
        Velocity >= 20 -> speedy
    end,

    if
        (Velocity > 40) -> io:format("Look out below!~n");
        true -> true
    end,

    Description.
