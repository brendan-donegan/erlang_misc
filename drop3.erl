-module(drop3).
-export([fall_velocity/2]).

fall_velocity(Planemo, Distance) ->
    try
        Gravity = case Planemo of
            earth -> 9.8;
            moon -> 1.6;
            mars -> 3.71
        end,
        math:sqrt(2 * Gravity * Distance)
    catch
        error:Error -> {error, Error}
    end.
