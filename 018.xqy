xquery version "1.0-ml";

(:
By starting at the top of the triangle below and moving to adjacent numbers on
the row below, the maximum total from top to bottom is 23.

3
7 4
2 4 6
8 5 9 3

That is, 3 + 7 + 4 + 9 = 23.

Find the maximum total from top to bottom of the triangle below:
:)


declare function local:process($sums as xs:integer*, $triangle as map:map, $row-index as xs:integer)
{
  let $row := map:get($triangle, fn:string($row-index))
  return
    if ($row-index eq 1) then $row + fn:max($sums)
    else
      let $sums-next := for $n at $i in $row return $n + fn:max(($sums[$i], $sums[$i + 1], 0))
      return local:process($sums-next, $triangle, ($row-index - 1))
};


let $triangle := map:map()
let $_ := map:put($triangle, "1",  (75))
let $_ := map:put($triangle, "2",  (95, 64))
let $_ := map:put($triangle, "3",  (17, 47, 82))
let $_ := map:put($triangle, "4",  (18, 35, 87, 10))
let $_ := map:put($triangle, "5",  (20, 04, 82, 47, 65))
let $_ := map:put($triangle, "6",  (19, 01, 23, 75, 03, 34))
let $_ := map:put($triangle, "7",  (88, 02, 77, 73, 07, 63, 67))
let $_ := map:put($triangle, "8",  (99, 65, 04, 28, 06, 16, 70, 92))
let $_ := map:put($triangle, "9",  (41, 41, 26, 56, 83, 40, 80, 70, 33))
let $_ := map:put($triangle, "10", (41, 48, 72, 33, 47, 32, 37, 16, 94, 29))
let $_ := map:put($triangle, "11", (53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14))
let $_ := map:put($triangle, "12", (70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57))
let $_ := map:put($triangle, "13", (91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48))
let $_ := map:put($triangle, "14", (63, 66, 04, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31))
let $_ := map:put($triangle, "15", (04, 62, 98, 27, 23,  9, 70, 98, 73, 93, 38, 53, 60, 04, 23))

return local:process((), $triangle, 15)
