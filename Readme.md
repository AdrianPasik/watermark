Purpose
=======

Purpose of this script is to add watermark to a set of pictures. This script will require Image Magick to be installed on your computer

How does it work
----------------

User needs to create own watermark file. Typically it is transparent png file with some text inside. Purpose of this script is to blend raw files with this watermark in automated way.

Typical output
--------------

If everything is set up correctly, you should see something like this:
```
Image Magick found!
Watermark output directory founded, proceeding
Temp directory founded, proceeding
Watermark file founded, proceeding
Starting watermark
1 / 2 Working on P1030219.JPG
2 / 2 Working on P10302192.JPG
Job is finished
```

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


