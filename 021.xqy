xquery version "1.0";

(:
Let d(n) be defined as the sum of proper divisors of n 
(numbers less than n which divide evenly into n).

If d(a) = b and d(b) = a, where a != b, then a and b are an amicable pair 
and each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; 
therefore d(220) = 284. 

The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.
:)

declare function local:d($n as xs:integer) {
  let $to := $n idiv 2
  return fn:sum((1 to $to)[$n mod . eq 0])
};


fn:sum(
  for $a in (1 to 9999)
  let $b := local:d($a)
  where $a ne $b and local:d($b) eq $a
  return $a
)
