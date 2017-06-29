#!/bin/sh

#Do Arachni images exist ? 
if [ ! $(docker -H $2 images arachnirpcdlocal:latest | tail -n +2 | awk '{print $1}') ]; 
	then
		echo "Creating image: arachnirpcdlocal" 
		docker -H $2 build -t arachnirpcdlocal arachnicompose/v4/arachnirpcd/ 
fi

if [ ! $(docker -H $2 images arachniweblocal:latest | tail -n +2 | awk '{print $1}') ]; 
	then
		echo "Creating image: arachniweblocal" 
		docker -H $2 build -t arachniweblocal arachnicompose/v4/arachniwebui/ 
fi

#Arachni is running ?
if [ ! $(docker -H $2 ps -q -f name='v4_web_1') ]; 
	then
		echo "Arachni is not running."    
    		echo "Setting up Arachni..."
		docker-compose -H $2 -f $1 down
    		docker-compose -H $2 -f $1  up -d               	
		sleep 80

    	#Import all existing reports 
        if [ "$4" = true ];
        	then
        		docker -H $2 exec v4_web_1 \
        			/bin/sh -c 'for files in /home/arachniwebreport/reportafr/*.afr ; do bin/arachni_web_scan_import $files 1; done'  
		fi
fi

echo "Arachni is running"
        
#Set numbers of Arachni agents.
docker-compose -H $2 -f $1 scale web=1 dispatcher=$3 dispatcher_grid=1



