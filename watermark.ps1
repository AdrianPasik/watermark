function Get-ImageWidthHeight {
    param (
        [string] $filePath
    )
    Add-Type -AssemblyName System.Drawing
    $png = New-Object System.Drawing.Bitmap $filePath
    $ret = [System.Tuple]::Create($png.Width, $png.Height)
    $png.Dispose();
    return $ret;
}

$desiredWidth = 500;
$workdir="C:\test_rysunkow";
$watermarkOriginalPath="C:\test_rysunkow\watermark";
$waterMarkFile="watermark-final.png";
$tempDirectory="C:\test_rysunkow\temp"
$finalOutputDir="C:\test_rysunkow\output";
$magickExeFile = "C:\Program Files\ImageMagick-7.0.8-Q16\magick.exe";

if(Test-Path $magickExeFile) {
    Write-Host "Image Magick found!" -ForegroundColor Green
} else {
    Write-Host "Image Magick not found, aborting script" -ForegroundColor Red
    exit
}

if(Test-Path $finalOutputDir) {
    Write-Host "Watermark output directory founded, proceeding" -ForegroundColor Green;
} else {
    New-Item -Path $finalOutputDir -ItemType Directory
    Write-Host "Watermark directory not found, creating" - -ForegroundColor Green
}

if(Test-Path $tempDirectory) {
    Write-Host "Temp directory founded, proceeding" -ForegroundColor Green;
} else {
    New-Item -Path $tempDirectory -ItemType Directory
    Write-Host "Temp directory not found, creating" - -ForegroundColor Green
}

if(Test-Path "$watermarkOriginalPath\$waterMarkFile") {
    Write-Host "Watermark file founded, proceeding" -ForegroundColor Green;
} else {
    Write-Host "Watermark file not found, aborting script" -ForegroundColor Red
    exit
}

Write-Host "Starting watermark" -ForegroundColor Green

$files = Get-ChildItem -File $workdir;
foreach($file in $files) {
    $watermarkImageInfo = Get-ImageWidthHeight -filePath $watermarkOriginalPath\$waterMarkFile
    $fileImageInfo = Get-ImageWidthHeight -filePath $workdir\$file;
    $ratio = $fileImageInfo.Item1 / $fileImageInfo.Item2;
    if($fileImageInfo.Item1 -gt $desiredWidth) {
        #file
        $height = [int]($desiredWidth * $ratio);
        $resizeVal = $desiredWidth.ToString() + "x" + $height.ToString()
        $arguments = "convert $workdir\$file -resize $resizeVal  $tempDirectory\$file"
        Start-Process -NoNewWindow -FilePath $magickExeFile -ArgumentList "$arguments"
        #watermark
        $height = [int]($desiredWidth * ($watermarkImageInfo.Item1 / $watermarkImageInfo.Item2))
        $resizeVal = $desiredWidth.ToString() + "x" + $height.ToString()
        $arguments = "convert $watermarkOriginalPath\$waterMarkFile -resize $resizeVal $tempDirectory\$waterMarkFile"
        Start-Process -NoNewWindow -FilePath $magickExeFile -ArgumentList "$arguments"
    } else {
        Copy-Item -Path $workdir\$file -Destination $tempDirectory\$file
        #watermark
        $resizeVal = $fileImageInfo.Item1.ToString() + "x" + $fileImageInfo.Item2.ToString();
        $arguments = "convert $watermarkOriginalPath\$waterMarkFile -resize $resizeVal $tempDirectory\$waterMarkFile"
        Start-Process -NoNewWindow -FilePath $magickExeFile -ArgumentList "$arguments"
    }
    $arguments = "composite -dissolve 50% -gravity center -quality 100 $tempDirectory\$waterMarkFile $tempDirectory\$file $finalOutputDir\$file"
    Start-Process -NoNewWindow -FilePath $magickExeFile -ArgumentList "$arguments"
    $removePath = "$tempDirectory\*.*";
    Remove-Item $removePath -Force -Recurse
    

    # to jest gotowy watermarking do zdjęcia
    #$watermarkOriginalPath="C:\test_rysunkow\"
    #$arguments = "composite -dissolve 50% -gravity center -quality 100 $workdir\watermark.png $workdir\$file $finalOutputDir\$file"
    #Start-Process -NoNewWindow -FilePath $magickExeFile -ArgumentList "$arguments"
}


