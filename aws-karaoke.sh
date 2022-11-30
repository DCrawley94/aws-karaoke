#!/usr/bin/env bash

songs=$(ls -1 songs | sed 's/\.[^.]*$//')
singers="Aditi Amy Astrid Bianca Brian Camila Carla Carmen Celine Chantal Conchita Cristiano Dora Emma Enrique Ewa Filiz Gabrielle Geraint Giorgio Gwyneth Hans Ines Ivy Jacek Jan Joanna Joey Justin Karl Kendra Kevin Kimberly Lea Liv Lotte Lucia Lupe Mads Maja Marlene Mathieu Matthew Maxim Mia Miguel Mizuki Naja Nicole Olivia Penelope Raveena Ricardo Ruben Russell Salli Seoyeon Takumi Tatyana Vicki Vitoria Zeina Zhiyu Aria Ayanda Arlet Hannah Arthur Daniel Liam Pedro Kajal Hiujin Laura Elin Ida Suvi Ola Hala"

echo -e "\nChoose your song:\n"

select name in $songs; do
    SONG_CHOICE=$name
    break
done

echo -e "\nChoose your singer:\n"

select singer in $singers; do
    SINGER_CHOICE=$singer
    break
done

echo -e "You have chosen $SONG_CHOICE performed by by $SINGER_CHOICE\n"

if [ -d "mp3s" ]; then
    mkdir mp3s
fi

aws polly synthesize-speech --output-format mp3 --text "file://songs/$SONG_CHOICE.txt" --voice-id "$SINGER_CHOICE" "mp3s/$SINGER_CHOICE-$SONG_CHOICE.mp3" >log.txt

sleep 1

rm log.txt

afplay "mp3s/$SINGER_CHOICE-$SONG_CHOICE.mp3"
