#!/bin/sh
# Saves all *.svg as *.png
# Check if SVG files are in this folder else exit
indir=$(ls -1 *.svg | wc -l)>/dev/null 2>&1;
if [ "$indir" -gt "0" ]
then
# Check if width-parameter is given else state an error and exit
if [ -z "$1" ]
then
echo 'Script usage: ./svg2png width [height]';
echo 'Where [height] is optional. If not given [height] = width';
exit;
>&2; 
exit 1;
fi

# Check if height-parameter is given. If yes: $height=$height If not: $height=$width and process all *.svg-files in the directory.

if [ -z "$2" ] 
then
#echo -en 'Processing file '$c' of '$indir'\e[5m...'
c="0";
for file in *.svg
do
     /usr/bin/inkscape -z -f "${file}" -w $1 -h $1 -e "${file}.png" >/dev/null 2>&1;
     echo -en "\r$i\e[0m";
     echo -en 'Processing file '$c' of '$indir'\e[5m...'
     ((c = c + 1));
done

else
c="0";
for file in *.svg
do
     /usr/bin/inkscape -z -f "${file}" -w $1 -h $2 -e "${file}.png" >/dev/null 2>&1;
     echo -en "\r$i\e[0m";
     echo -en 'Processing file '$c' of '$indir'\e[5m...'
     ((c = c + 1));
done
fi
# Output success message
echo -en "\r$i";
echo '\e[0m\e[1mSuccess: '$c' files have been processed!'

# When there are no SVG files to process abort script
else
echo -e "There are no SVG files to process. Aborting.";
fi
