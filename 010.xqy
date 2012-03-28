xquery version "1.0";

declare namespace math="java:java.lang.Math";

(: 
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
:)

declare function local:sieve($seq, $primes, $max)
{
  let $p := $seq[. lt $max][1]
  return 
    if (fn:empty($p)) then ($primes, $seq)
    else local:sieve($seq[. mod $p ne 0], ($primes, $p), $max)
};

declare function local:sieve($max as xs:integer) {
  local:sieve((2 to $max), (), math:sqrt($max))  
};

fn:sum(local:sieve(2000000))
