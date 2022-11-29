#!/usr/bin/env bash

songs=$(ls songs)
singers="Aditi Amy Astrid Bianca Brian Camila Carla Carmen Celine Chantal Conchita Cristiano Dora Emma Enrique Ewa Filiz Gabrielle Geraint Giorgio Gwyneth Hans Ines Ivy Jacek Jan Joanna Joey Justin Karl Kendra Kevin Kimberly Lea Liv Lotte Lucia Lupe Mads Maja Marlene Mathieu Matthew Maxim Mia Miguel Mizuki Naja Nicole Olivia Penelope Raveena Ricardo Ruben Russell Salli Seoyeon Takumi Tatyana Vicki Vitoria Zeina Zhiyu Aria Ayanda Arlet Hannah Arthur Daniel Liam Pedro Kajal Hiujin Laura Elin Ida Suvi Ola Hala"

echo -e "\nChoose your singer:\n"

select name in $songs; do
    SONG_CHOICE=$name
    break
done

echo -e "\n"

select singer in $singers; do
    SINGER_CHOICE=$singer
    break
done

echo -e "You have chosen $SONG_CHOICE performed by by $SINGER_CHOICE\n"

if [ -d "mp3s" ]; then
    aws polly synthesize-speech --output-format mp3 --text "file://songs/$SONG_CHOICE" --voice-id "$SINGER_CHOICE" "mp3s/$SINGER_CHOICE-$SONG_CHOICE.mp3"
else
    mkdir mp3s
    aws polly synthesize-speech --output-format mp3 --text "file://songs/$SONG_CHOICE" --voice-id "$SINGER_CHOICE" "mp3s/$SINGER_CHOICE-$SONG_CHOICE.mp3"
fi

sleep 1

afplay "mp3s/$SINGER_CHOICE-$SONG_CHOICE.mp3"
