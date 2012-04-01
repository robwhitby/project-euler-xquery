xquery version "1.0-ml";

(:
If the numbers 1 to 5 are written out in words: one, two, three, four, five,
then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written 
out in words, how many letters would be used?
:)

fn:sum((
  for $i in 1 to 1000
  let $s := xdmp:format-number($i,"W","en",(),(),(),(),())
  let $len := fn:string-length(fn:replace($s, "[^A-Z]", ""))
  return ($len, if ($i gt 100 and $i mod 100 ne 0) then 3 else 0)
))
