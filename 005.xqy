xquery version "1.0-ml";

(:
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
:)

declare function local:fold($fn, $x, $seq) { 
  if (fn:exists($seq)) 
  then local:fold($fn, xdmp:apply($fn, $x, $seq[1]), fn:subsequence($seq, 2)) 
  else $x
};
      
declare function local:gcd($a, $b) {
  if ($b eq 0) then $a else local:gcd($b, $a mod $b)
};

declare function local:lcm($a, $b) {
  ($a * $b div local:gcd($a, $b))
};

local:fold(xdmp:function(xs:QName("local:lcm")), 2520, (11 to 20))