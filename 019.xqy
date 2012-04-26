xquery version "1.0-ml";

(:
How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
:)

import module namespace functx = "http://www.functx.com" at "/MarkLogic/functx/functx-1.0-nodoc-2007-01.xqy";

declare function local:count-sundays($date as xs:date, $max-date as xs:date, $count as xs:integer)
{
  if ($date gt $max-date) then $count
  else
    let $count-new := if (functx:day-of-week($date) eq 0) then $count + 1 else $count
    return local:count-sundays($date + xs:yearMonthDuration("P1M"), $max-date, $count-new)
};

local:count-sundays(xs:date("1901-01-01"), xs:date("2000-12-31"), 0)
