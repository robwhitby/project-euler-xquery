xquery version "3.0";

(:
Find the sum of the digits in the number 100!

How to go as high as 100?
:)
declare variable $n := 10;

declare function local:factorial($i as xs:integer) {
  fn:fold-left(function($a, $b) { $a * $b }, 1, (1 to $i))
};

declare function local:to-digits($i) {
  fn:string-to-codepoints(xs:string($i)) ! xs:integer(fn:codepoints-to-string(.))
};


fn:fold-left(function($a, $b) { $a + $b }, 0, local:to-digits(local:factorial($n)))
