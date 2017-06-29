#!/bin/sh

SCAN_OPTIONS=" $3 --spawns="$4" --grid-mode="$5" --checks="$9" --report-save-path=/home/arachniwebreport/reportafr/$8.afr"

#SCOPE_DIRECTORY_DEPTH_LIMIT option
if [ "$6" != "inf" ]; 
        then
                SCAN_OPTIONS="$SCAN_OPTIONS --scope-directory-depth-limit=$6 "
fi

#SCOPE_PAGE_LIMIT option
if [ [ "$7" != "inf" ] && [ "$10" = false ] ]; 
        then
		echo "SCOPE PAGE LIMIT OPTIONS"
               # SCAN_OPTIONS="$SCAN_OPTIONS --scope-page-limit=$7 "
fi

#Proxy Plugin Activated 
if [ "$10" = true ];
        then
		# To skip crawling and only audit elements discovered by using the proxy
		# the scope page-limit option is set to '0'.
echo "SCOPE PAGE LIMIT OPTIONS"
       		 # SCAN_OPTIONS="$SCAN_OPTIONS --plugin 'proxy:bind_address=0.0.0.0' --scope-page-limit=0 "
fi

        
#Send scan command to the RPC Server
#if [ "$1" != "default" ]; #DISPATCHER_GRID_HOST not set
 #       then
#		( exec "./wait-for-it.sh -t 0 $1" )	
 #               docker -H $2 exec -t v4_web_1 bin/arachni_rpc --dispatcher-url $1 $SCAN_OPTIONS   
  #      else  
   #             add=$(docker -H $2 inspect v4_dispatcher_grid_1 | grep IPAddress | cut -d '"' -f 4):7331
    #            ( exec "./wait-for-it.sh -t 0 $add" )	
	#        docker -H $2 exec -t v4_web_1 bin/arachni_rpc --dispatcher-url $add $SCAN_OPTIONS
#fi

