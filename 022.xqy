xquery version "1.0-ml";

(:
Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing 
over five-thousand first names, begin by sorting it into alphabetical order. Then 
working out the alphabetical value for each name, multiply this value by its alphabetical 
position in the list to obtain a name score.

For example, when the list is sorted into alphabetical order, COLIN, which is worth 
3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. 
So, COLIN would obtain a score of 938 x 53 = 49714.

What is the total of all the name scores in the file?
:)

let $names-txt := xdmp:document-get("/Users/rob/Git/project-euler-xquery/names.txt")

let $names :=  
  for $name in fn:tokenize(fn:replace($names-txt, '"', ""), ",") 
  order by $name
  return $name

return fn:sum(
  for $name at $i in $names
  return $i * fn:sum(fn:string-to-codepoints($name) ! (. - 64))
)
