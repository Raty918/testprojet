#!/bin/sh

#Import repport to the WebUI
docker -H $1 exec v4_web_1 bin/arachni_web_scan_import /home/arachniwebreport/reportafr/$2.afr 1
