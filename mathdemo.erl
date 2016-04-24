-module(mathdemo).
-export([abs/1,product/1]).

abs(Number) when Number < 0 -> -Number;
abs(Number) -> Number.

product([]) -> 0;
product(List) -> product(List, 1).

product([], Product) -> Product;
product([Head|Tail], Product) -> product(Tail, Product * Head ).
