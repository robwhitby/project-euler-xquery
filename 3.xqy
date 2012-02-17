declare function local:max-prime-factor($x as xs:long)
{
  let $factor := (2 to xs:long(math:sqrt($x)))[$x mod . eq 0][1]
  return
    if ($factor) 
    then local:max-prime-factor($x div $factor)
    else $x
};

local:max-prime-factor(600851475143)