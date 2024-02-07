#!/usr/bin/env bash

# Clear the screen with \033c. It is ESCc, the VT100 terminal reset command.
printf "\033c"
echo --------------------------------
echo BuildBarCodeReaderExample.sh builds
echo "    BarCodeReaderExample.jar"
echo and puts it and support files in the ..\dist_via_jdk directory.
echo The .class files are put in the ..\build_via_jdk directory.
echo
echo BuildBarCodeReaderExample.sh does not use NetBeans.
echo It only uses the JDK\'s javac and jar to build the .jar.
echo
echo This script assumes the JDK is installed.
echo Note: You can check with
echo "    which jar"
echo "    which javac"
echo "    java -version"
echo --------------------------------
# Get the script's directory path.
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Change working directory to the /src directory.
cd $SCRIPT_DIR/../../src

# Compile the .java file to a .class file.
printf "pwd: "
pwd
printf "javac @../scripts/barcodereader/javac_linux.txt\n"
javac @../scripts/barcodereader/javac_linux.txt

# Build the .class file(s) into the .jar file along with a manifest.
# The manifest states the main class.
printf "\njar -cvfe BarCodeReaderExample.jar BarCodeReaderExample barcodereaderexample/*.class\n"
jar -cvfe BarCodeReaderExample.jar BarCodeReaderExample barcodereaderexample/*.class

# Remove a possibly pre-existing dist_via_jdk
rm -rf ../dist_via_jdk

# Create and populate a new dist_via_jdk.
mkdir ../dist_via_jdk
mv ../src/BarCodeReaderExample.jar ../dist_via_jdk
cp ../scripts/barcodereader/BarCodeReaderExample.cmd ../dist_via_jdk
cp ../scripts/barcodereader/BarCodeReaderExample.sh ../dist_via_jdk
cp ../jpos.linux.xml ../dist_via_jdk/jpos.xml
cp ../brand.properties ../dist_via_jdk
cp ../dls.properties ../dist_via_jdk

# Remove a possibly pre-existing build_via_jdk.
rm -rf ../build_via_jdk

# Create and populate a new build_via_jdk.
mkdir ../build_via_jdk
mv ../src/barcodereaderexample/*.class ../build_via_jdk

echo
echo Look at the dist_via_jdk directory.