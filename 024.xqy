xquery version "1.0";

(:
A permutation is an ordered arrangement of objects. For example, 3124 is one 
possible permutation of the digits 1, 2, 3 and 4. If all of the permutations 
are listed numerically or alphabetically, we call it lexicographic order. 
The lexicographic permutations of 0, 1 and 2 are:

012 021 102 120 201 210

What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
:)

declare variable $seq := (0 to 9);

fn:subsequence((
  for $a in $seq, 
    $b in $seq[fn:not(. = $a)], 
    $c in $seq[fn:not(. = ($a,$b))],
    $d in $seq[fn:not(. = ($a,$b,$c))],
    $e in $seq[fn:not(. = ($a,$b,$c,$d))],
    $f in $seq[fn:not(. = ($a,$b,$c,$d,$e))],
    $g in $seq[fn:not(. = ($a,$b,$c,$d,$e,$f))],
    $h in $seq[fn:not(. = ($a,$b,$c,$d,$e,$f,$g))],
    $i in $seq[fn:not(. = ($a,$b,$c,$d,$e,$f,$g,$h))],
    $j in $seq[fn:not(. = ($a,$b,$c,$d,$e,$f,$g,$h,$i))]
  return fn:concat($a,$b,$c,$d,$e,$f,$g,$h,$i,$j)
  ), 1000000, 1)