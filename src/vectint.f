
create vbuf 255 allot
variable vec

: vQUERY ( addr cnt -- )
  (SOURCE) 2! >IN OFF 0 TO SOURCE-ID 0 TO SOURCE-POSITION ;

: vtype ( addr cnt -- )
  vbuf +place s"  " vbuf +place ;    \ add text to a counted string

\ interpret input from a string; result in a string
: vectint ( addr cnt -- addr cnt)  \ vectored interpret
  0 vbuf c!
  ['] type 4 + @ vec !
  ['] vtype is type
  vquery
  ['] interpret
  catch ?dup if ." error " . then
  vbuf count dup 0= if drop s" ok" then ;

