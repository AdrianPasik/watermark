Purpose
=======

Purpose of this script is to add watermark to a set of pictures. This script will require Image Magick to be installed on your computer

How to set it up
----------------

If you go to watermark.ps1 script you will find bunch of variables that need to have proper values:

`$desiredWidth` = width of output pictures (height will be auto-calculated to match original ratio)  
`$workdir` - work directory, this is where your raw pictures should land  
`$watermarkOriginalPath` - directory with water mark file  
`$waterMarkFile` - name of the watermark file  
`$tempDirectory` - temp directory, used for program flow  
`$finalOutputDir` - output folder  
`$magickExeFile` - path to ImageMagick 'exe' file (complete)  


