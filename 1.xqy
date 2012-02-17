xquery version "1.0-ml";

(:
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
:)

declare function local:sum-mod($x, $mod) 
{
  (($x idiv $mod) * ($mod + (($x idiv $mod) * $mod))) div 2
};

local:sum-mod(999, 3) + local:sum-mod(999, 5) - local:sum-mod(999, 15)