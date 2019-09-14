$workdir="C:\test_rysunkow";
$watermarkOutputDir="C:\test_rysunkow\outputaaa";
$magickExeFile = "C:\Program Files\ImageMagick-7.0.8-Q16\magick.exe";

if(Test-Path $magickExeFile) {
    Write-Host "Image Magick found!" -ForegroundColor Green
} else {
    Write-Host "Image Magick not found, aborting script" -ForegroundColor Red
    exit
}

if(Test-Path $watermarkOutputDir) {
    Write-Host "Watermark output directory founded, proceeding" -ForegroundColor Green;
} else {
    New-Item -Path $watermarkOutputDir -ItemType Directory
    Write-Host "Watermark directory not found, creating" - -ForegroundColor Green
}

Write-Host "Starting watermark" -ForegroundColor Green

$files = Get-ChildItem -File $workdir;
foreach($file in $files) {
    $arguments = "composite -dissolve 50% -gravity center -quality 100 $workdir\watermark.png $workdir\$file $watermarkOutputDir\$file"
    Start-Process -NoNewWindow -FilePath $magickExeFile -ArgumentList "$arguments"
}
