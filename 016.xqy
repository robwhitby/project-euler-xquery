xquery version "1.0";

(:
2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?
:)

declare function local:double(
  $digits as xs:integer*
) as xs:integer*
{
  local:dbl(fn:reverse($digits), (), ())
};

declare function local:dbl(
  $todo as xs:integer*,
  $previous as xs:integer?,
  $done as xs:integer*
) as xs:integer*
{
  if (fn:empty($todo)) then (if ($previous gt 9) then (1, $previous - 10) else $previous, $done)
  else
    if ($previous gt 9) then local:dbl(fn:subsequence($todo, 2), ($todo[1] * 2) + 1, ($previous - 10, $done))
    else local:dbl(fn:subsequence($todo, 2), $todo[1] * 2, ($previous, $done))
};

declare function local:pow2(
  $exp as xs:integer,
  $digits as xs:integer*
) as xs:integer* {
  if ($exp lt 2) then $digits else local:pow2($exp - 1, local:double($digits))
};


fn:sum(local:pow2(1000, 2))
