xquery version "1.0-ml";

(:
A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,

a^2 + b^2 = c^2
For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
:)

(
  for $a in (1 to 500), $b in (1 to 500)
  let $c := math:sqrt(($a * $a) + ($b * $b))
  where ($a + $b + $c eq 1000)
  return $a * $b * $c 
)[1]


