xquery version "1.0-ml";

(:
The sum of the squares of the first ten natural numbers is
1^2 + 2^2 + ... + 10^2 = 385

The square of the sum of the first ten natural numbers is
(1 + 2 + ... + 10)^2 = 55^2 = 3025

Hence the difference between the sum of the squares of the first ten 
natural numbers and the square of the sum is 3025 - 385 = 2640.

Find the difference between the sum of the squares of the first one 
hundred natural numbers and the square of the sum.
:)

let $range := (1 to 100)

let $sum-of-squares := fn:sum(math:pow($range, 2))
let $sum-squared := math:pow(fn:sum($range), 2)

return $sum-squared - $sum-of-squares
