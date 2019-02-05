#!/bin/bash

function curse
{
  in="$1"
  out="$2"
  
  tr "$in" "$out" < cursed_emotes.txt > cursed_emotes.tmp
  
  mv cursed_emotes.tmp cursed_emotes.txt
}

cp emotes.txt cursed_emotes.txt

curse "a" "а"
curse "e" "е"
curse "i" "і"
curse "o" "о"
#curse "u" "⋃"

curse "c" "с"
curse "p" "р"
curse "j" "ј"
curse "y" "у"
curse "x" "х"
curse "v" "v"
#curse "m" "ⅿ"
curse "g" "ɡ"

while read emote
do
  cursed=`echo $emote | sed -e 's/:/꞉/'`
  sed -e "s/$emote/$cursed/" < cursed_emotes.txt > cursed_emotes.tmp
  mv cursed_emotes.tmp cursed_emotes.txt
done < <(sort emotes.txt cursed_emotes.txt |uniq -c | grep "2" | sed -e 's/ *2 *//')
