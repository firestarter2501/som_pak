@echo off
rem SOM_PAK animal.dat bat file


rem Initialize
echo Execute randinit ...
randinit -din animal.dat -cout animali.cod -xdim 12 -ydim 10 -topol hexa -neigh bubble -rand 123

rem Learning Step
echo Execute vsom ...
vsom -din animal.dat -cin animali.cod -cout animal2.cod -rlen 7000 -alpha 0.04 -radius 6 -rand 0

rem Labeling
echo Execute vcal ...
vcal -din animal.dat -cin animali.cod -cout animaliv.cod
vcal -din animal.dat -cin animal2.cod -cout animal2v.cod

rem Create EPS file of U-Matrix map
echo Execute umat ...
umat -cin animaliv.cod -eps -o animaliv.eps
umat -cin animal2v.cod -eps -o animal2v.eps

rem Create PS fle of U-Matrix map
umat -cin animaliv.cod -ps -o animaliv.ps
umat -cin animal2v.cod -ps -o animal2v.ps

rem Create Sammon's map
echo Execute sammon ...
sammon -cin animal2v.cod -cout animal2v.sam -rlen 100 -eps

rem Create Plane map
rem plane 1: is small
rem plane 4: is night
rem plane 16: eat grass
echo Execute planes ...
planes -cin animal2v.cod -plane 1
planes -cin animal2v.cod -plane 4
planes -cin animal2v.cod -plane 16