xquery version "1.0-ml";

(:
Starting in the top left corner of a 2x2 grid, there are 6 routes (without backtracking) to the bottom right corner.

How many routes are there through a 20x20 grid?
:)

declare function local:factorial($n as xs:integer) as xs:double {
  if ($n eq 1) then 1 else $n * local:factorial($n - 1)
};

let $size := 20

return local:factorial($size * 2) div math:pow(local:factorial($size), 2)
