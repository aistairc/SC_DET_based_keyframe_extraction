
# Download SMRS
$SMRS = "SMRS_v1.0"
if (-Not (Test-Path "./${SMRS}.zip")) {
    Write-Host "> Download ${SMRS}."
    Invoke-WebRequest -Uri "http://www.ccs.neu.edu/home/eelhami/codes/${SMRS}.zip" -Outfile ./${SMRS}.zip
}
if (Test-Path "./${SMRS}.zip") {
    Write-Host "> Extract SMRS files."
    Expand-Archive -Path ./${SMRS}.zip -DestinationPath ./ -Force
    $copyItems = @{
        Path = "./${SMRS}/findRep.m",
               "./${SMRS}/rmRep.m"
        Destination = "./"
        Force = $true
    }
    Copy-Item @copyItems
    Remove-Item -Path "./${SMRS}" -Recurse -Force
    Remove-Item -Path "./__MACOSX" -Recurse -Force
}

# Download ksvdbox
$KSVDBOX = "ksvdbox9"
if (-Not (Test-Path "./${KSVDBOX}.zip")) {
    Write-Host "> Download ${KSVDBOX}."
    Invoke-WebRequest -Uri "http://www.cs.technion.ac.il/~ronrubin/Software/${KSVDBOX}.zip" -Outfile ./${KSVDBOX}.zip
}
if (Test-Path "./${KSVDBOX}.zip") {
    Write-Host "> Extract ${KSVDBOX} files."
    Expand-Archive -Path ./${KSVDBOX}.zip -DestinationPath ./${KSVDBOX} -Force
    $copyItems = @{
        Path = "./${KSVDBOX}/private/normrows.m",
               "./${KSVDBOX}/private/normcols.m"
        Destination = "./"
        Force = $true
    }
    Copy-Item @copyItems
    Remove-Item -Path "./${KSVDBOX}" -Recurse -Force
}

# Download SumMe
if (-Not (Test-Path "./SumMe.zip")) {
    Write-Host "> Download SumMe data."
    Invoke-WebRequest -Uri "https://data.vision.ee.ethz.ch/cvl/SumMe/SumMe.zip" -Outfile "./SumMe.zip"
}
if (Test-Path "./SumMe.zip") {
    Write-Host "> Extract SumMe files."
    Expand-Archive -Path ./SumMe.zip -DestinationPath ./SumMe -Force
    $copyItems = @{
        Path = "./SumMe/videos/Jumps.mp4",
               "./SumMe/matlab/summe_evaluateSummary.m"
        Destination = "./"
        Force = $true
    }
    Copy-Item @copyItems
    Remove-Item -Path "./SumMe" -Recurse -Force
}
