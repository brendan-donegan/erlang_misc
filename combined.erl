-module(combined).
-export([height_to_mph/1]). % there will be more soon!

%%% combines logic from other modules into a convenience function
height_to_mph(Meters) -> convert:mps_to_mph(drop:fall_velocity(Meters)).
