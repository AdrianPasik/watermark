Purpose
=======

Purpose of this script is to add watermark to a set of pictures. This script will require Image Magick to be installed on your computer

How to set it up
----------------

If you go to watermark.ps1 script you will find bunch of variables that need to have proper values:

`$desiredWidth` = 800;
`$workdir` - work directory, this is where your raw pictures should land
`$watermarkOriginalPath` - directory with water mark file
'$waterMarkFile'="watermark-final.png";
$tempDirectory="C:\test_rysunkow\temp"
$finalOutputDir="C:\test_rysunkow\output";
$magickExeFile = "C:\Program Files\ImageMagick-7.0.8-Q16\magick.exe";


