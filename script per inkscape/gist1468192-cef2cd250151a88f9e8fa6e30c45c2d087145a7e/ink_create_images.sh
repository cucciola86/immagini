#!/bin/bash

#Requires Inkscape to be installed.

#This script scales and creates images at the correct dpi level for Android.
#It gets placed in a folder called res/drawable/_source_images/ in your
#Android project along with all your svg files.
#When creating svg files set the image size to the size that you want your hdpi images to be.
#To use simply run the create_images script from its folder and it will generate images for all the svg files.

for f in *.svg;
do
	echo "Processing $f"
	/Applications/Inkscape.app/Contents/Resources/bin/inkscape -e ../drawable-hdpi/${f/.svg}.png ./$f
	/Applications/Inkscape.app/Contents/Resources/bin/inkscape -d 60 -e ../drawable-mdpi/${f/.svg}.png ./$f
	/Applications/Inkscape.app/Contents/Resources/bin/inkscape -d 45 -e ../drawable-ldpi/${f/.svg}.png ./$f
done
