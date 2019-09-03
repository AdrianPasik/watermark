$workdir="C:\test_rysunkow";
$targetDir="C:\test_rysunkow\output";
$magickExeFile = "C:\Program Files\ImageMagick-7.0.8-Q16\magick.exe";

#$arguments = "convert $workdir\watermark.png +profile \""icc\"" $workdir\tmp.png"
#Start-Process -NoNewWindow -FilePath $magickExeFile -ArgumentList "$arguments"

$files = Get-ChildItem -File $workdir;
foreach($file in $files) {
    # $command = "$magickExeFile convert $workdir\$file -resize 50% $targetDir\$file"
    # & $command;
    # Start-Process -NoNewWindow -FilePath $magickExeFile -ArgumentList "convert $workdir\$file -resize 50% $targetDir\$file"ccc
    #$arguments = "convert $workdir\$file -background transparent -fill grey -font Calibri -pointsize 14 -gravity center caption:\""Dom\n sadf\"" $targetDir\$file"
    
    $arguments = "composite -gravity center $workdir\watermark.png $workdir\$file $targetDir\$file"
    Start-Process -NoNewWindow -FilePath $magickExeFile -ArgumentList "$arguments"
}
