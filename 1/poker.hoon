::  write a %say generator that deals two poker hands and 
::  determines which one wins, according to normal poker rules
/+  playing-cards
:-  %say
|=  [[* eny=@uvJ *] *]
:-  %noun
=<  (play-poker hands:(deal-hands:playing-cards [2 5 eny]))
|%
++  play-poker
  =|  hands=(list deck)
  ^-  tape
  ::  evaluate each hand separately, in descending order of value
  ::  (i.e., check if the hand is a royal flush and, if so, no other 
  ::  evaluation should happen) and, in the case of ties, compare 
  ::  highest ranked cards to determine the winner
  ::  
  ::  report the winner with the winning hand, or a tie
  ::
  (report-winner hands)
++  report-winner
  |=  hands=(list deck)
  ^-  tape
  =/  scores  (turn hands evaluate-hand)
  =/  high-score  (roll scores max)
  =/  winning-indices  (fand ~[high-score] scores)
  ?:  (gth (lent winning-indices) 1)
    "Tie!"
  ?:  =(0 (snag 0 winning-indices))
    "Hand one wins!"
  "Hand two wins!"
++  evaluate-hand
  |=  h=deck
  ^-  @ud
  ?:  (royal-flush h)
    1
  ?:  (straight-flush h)
    2
  ?:  (four-of-a-kind h)
    3
  ?:  (full-house h)
    4
  ?:  (flush h)
    5
  ?:  (straight h)
    6
  ?:  (three-of-a-kind h)
    7
  ?:  (two-pair h)
    8
  ?:  (one-pair h)
    9
  10
++  num-to-hand
  %-  my
  :~  :-  1   "Royal Flush"
      :-  2   "Straight Flush"
      :-  3   "Four of a Kind"
      :-  4   "Full House"
      :-  5   "Flush"
      :-  6   "Straight"
      :-  7   "Three of a Kind"
      :-  8   "Two Pair"
      :-  9   "One Pair"
      :-  10  "High Card"
  ==
++  royal-flush
  |=  h=deck
  ^-  ?
++  straight-flush
  |=  h=deck
  ^-  ?
++  four-of-a-kind
  |=  h=deck
  ^-  ?
++  full-house
  |=  h=deck
  ^-  ?
++  flush
  |=  h=deck
  ^-  ?
++  straight
  |=  h=deck
  ^-  ?
++  three-of-a-kind
  |=  h=deck
  ^-  ?
++  two-pair
  |=  h=deck
  ^-  ?
++  one-pair
  |=  h=deck
  ^-  ?
-- 
