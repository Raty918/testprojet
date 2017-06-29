#!/bin/sh

#Export report to pdf format
docker -H $1 exec v4_web_1 bin/arachni_reporter /home/arachniwebreport/reportafr/$2.afr --reporter=html:outfile=/home/arachniwebreport/reporthtml/$2.html.zip
docker -H $1 exec v4_web_1 unzip -o /home/arachniwebreport/reporthtml/$2.html.zip -d /tmp/$2
docker -H $1 exec v4_web_1 /bin/sh -c 'if [ ! -d /home/arachniwebreport/reportpng/'$2' ]; then mkdir /home/arachniwebreport/reportpng/'$2'; fi'
docker -H $1 exec v4_web_1 /bin/sh -c 'xvfb-run -a --server-args="-screen 0 1780x720x24" python /home/arachniwebreport/htmltopng.py '$2
docker -H $1 exec v4_web_1 convert /home/arachniwebreport/reportpng/$2/1.png /home/arachniwebreport/reportpng/$2/2.png /home/arachniwebreport/reportpng/$2/3.png /home/arachniwebreport/reportpng/$2/4.png /home/arachniwebreport/reportpng/$2/$2.pdf
