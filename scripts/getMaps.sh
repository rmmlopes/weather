#!/bin/sh
DATE_DAY=`date -u +%Y_%m_%d`
DATE_BASE=`date -u +%Y_%m_%d_%H_`
DATE_MINUTE=`date -u +%M | sed 's/[0-9]/0/2'`
FILENAME_GIF=XSM_PRECIP_RAIN_$DATE_BASE$DATE_MINUTE.GIF
FILENAME_PNG=XSM_PRECIP_RAIN_$DATE_BASE$DATE_MINUTE.png
URL=http://www.weatheroffice.gc.ca/data/radar/temp_image/XSM/$FILENAME_GIF
LOG=./getMaps.log

if [ ! -e ./$DATE_DAY/GIF/$FILENAME_GIF ] ; then 
    wget -a $LOG -nv -P ./$DATE_DAY/GIF $URL
    
    if [ ! -d ./$DATE_DAY/PNG ] ; then
	mkdir ./$DATE_DAY/PNG
    fi
    
    convert ./$DATE_DAY/GIF/$FILENAME_GIF ./$DATE_DAY/PNG/$FILENAME_PNG
fi 
