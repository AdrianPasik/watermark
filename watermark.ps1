$workdir="C:\test_rysunkow";
$targetDir="C:\test_rysunkow\output";
$magickExeFile = "C:\Program Files\ImageMagick-7.0.8-Q16\magick.exe";

$files = Get-ChildItem -File $workdir;

foreach($file in $files) {
    # $command = "$magickExeFile convert $workdir\$file -resize 50% $targetDir\$file"
    # & $command;
    Start-Process -NoNewWindow -FilePath $magickExeFile -ArgumentList "convert $workdir\$file -resize 50% $targetDir\$file"

}
