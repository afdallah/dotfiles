#!/bin/bash
# Credit to http://ubuntuforums.org/member.php?u=126210
# This script helps to install fonts
#
# Set your default font storage directory here
##DEFAULT_DIR="$HOME/fonts"
DEFAULT_DIR=`pwd`
# Set the default font installation directory here
DEFAULT_DEST="/Library/Fonts/"
FONT_DIR="fonts"
FONT_NAME="fonts"

# Don't edit anything below unless you know what you're doing.
# echo "Download meslo font from github..."
# wget https://raw.githubusercontent.com/andreberg/Meslo-Font/master/dist/v1.2.1/Meslo%20LG%20DZ%20v1.2.1.zip -O ${FONT_NAME}.zip

echo "Where's the fonts link?"
echo -n "[https://github.com/halyard/font-meslo-powerline/archive/0.0.2.zip]"
read FONT_URL

if [ -z "$FONT_URL" ]; then
    FONT_URL="https://github.com/halyard/font-meslo-powerline/archive/0.0.2.zip"
fi

wget $FONT_URL -O ${FONT_NAME}.zip

echo "Unpacking font..."
mkdir -p ${FONT_NAME}
unzip ${FONT_NAME}.zip -d $FONT_DIR

cd ${FONT_DIR}/**

echo "In which directory are the fonts?"
echo -n "[`pwd`] "
read DIR

echo
echo "What is the extention (without the dot) of the fonts?"
echo -n "[ttf] "
read EXT

echo
echo "Where should the fonts be installed?"
echo "DO NOT CHANGE THIS UNLESS YOU KNOW WHAT YOU'RE DOING!"
echo -n "[$DEFAULT_DEST] "
read DEST

if [ -z "$DIR" ]; then
    DIR=`pwd`
fi

if [ -z "$EXT" ]; then
    EXT="ttf"
else
    EXT="otf"
fi

if [ -z "$DEST" ]; then
    DEST="$DEFAULT_DEST"
fi

sudo -v
if [ $? != 0 ]; then
    echo "Unable to obtain the necessary privileges. Exiting..."
    echo -n "Press <Enter> to continue. "
    read WER
    exit $?
fi

echo
echo

if [ ! -d "$DIR" ]; then
    echo "Directory $DIR does not exist. Exiting..."
    echo -n "Press <Enter> to continue. "
    read SDF
    exit 2
fi

if [ ! -d "$DEST" ]; then
    echo "Directory $DEST does not exist. Exiting..."
    echo -n "Press <Enter> to continue. "
    read DFG
    exit 1
fi

echo "Copying fonts..."
cd "$DIR"
echo `pwd`

count=`ls -1 *.${EXT} 2>/dev/null | wc -l`
if [ $count != 0 ]; then
    for i in *."$EXT"; do
        sudo cp -iv "$i" "$DEST"
    done
else
    for i in **/*."$EXT"; do
        sudo cp -iv "$i" "$DEST"
    done
fi

echo
echo
echo "Cleanup"
cd $DEFAULT_DIR
rm -rf ${FONT_NAME}.zip $FONT_DIR

echo
echo
echo "Finished."
echo
echo "You will probably need to restart running programs to use the new fonts."
echo -n "Press <Enter> to exit. "
read WERT
exit 0
