xquery version "1.0-ml";

(:
The following iterative sequence is defined for the set of positive integers:

n -> n/2 (n is even)
n -> 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:

13  40  20  10  5  16  8  4  2  1
It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it 
has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.
:)

declare variable $cache := map:map();

declare function local:chain($n, $inc) {
  if ($n eq 1) then $inc
  else 
    let $cached := map:get($cache, fn:string($n))
    return
      if (fn:exists($cached)) then $inc + $cached
      else
        let $next := if ($n mod 2 eq 0) then $n * .5 else ($n * 3) + 1
        return local:chain($next, $inc + 1)
};


(
for $n in (2 to 999999)
let $chain := local:chain($n, 1)
let $_ := map:put($cache, fn:string($n), $chain)
order by $chain descending
return $n
)[1]
