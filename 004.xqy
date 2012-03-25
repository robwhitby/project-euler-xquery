xquery version "1.0";

(:
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 99.

Find the largest palindrome made from the product of two 3-digit numbers.
:)

declare function local:palindrome($x) {
  for $i in fn:reverse((1 to $x)), $j in fn:reverse((1 to $x))
  let $p := $i * $j 
  where xs:string($p) eq fn:codepoints-to-string(fn:reverse(fn:string-to-codepoints(xs:string($p))))
  return $p
};

fn:max(local:palindrome(999))