xquery version "1.0";

(:
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, 
we can see that the 6th prime is 13.

What is the 10 001st prime number?
:)

declare function local:if-prime($primes as xs:integer*, $n as xs:integer) 
as xs:integer?
{
  if (fn:empty($primes[1])) then $n
  else if ($n mod $primes[1] eq 0) then ()
  else local:if-prime(fn:subsequence($primes, 2), $n)
};

declare function local:primes($primes as xs:integer*, $n as xs:integer, $nth as xs:integer)
as xs:integer*
{
  if (fn:count($primes) eq $nth) then $primes
  else local:primes(($primes, local:if-prime($primes, $n)), $n + 1, $nth)
};

declare function local:nth-prime($n as xs:integer)
as xs:integer
{
  local:primes(2, 3, $n)[fn:last()]
};

local:nth-prime(10001)
