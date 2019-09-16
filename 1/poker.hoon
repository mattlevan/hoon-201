::  deal two hands and check which one wins according to poker rules
::
/+  playing-cards
:-  %say
|=  [[* eny=@uv *] *]
:-  %noun
=/  deck  (shuffle-deck:playing-cards make-deck:playing-cards eny)
=/  hand-one  (draw:playing-cards 5 deck)
=/  hand-two  (draw:playing-cards 5 deck)
