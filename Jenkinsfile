pipeline {
    agent {
        label 'DockerHost'
    }
    parameters {
       string(
            name: 'DISPATCHER_GRID_HOST', 
            defaultValue: 'default', 
            description: 'Address of the arachni_dispatcher_grid container, listenning on 7331 by default. (A.B.C.D:E)')
        string(
            name: 'DOCKER_HOST_WebUI', 
            defaultValue: 'tcp://127.0.0.1:2375', 
            description: 'Socket tcp of the WebUI Docker host.')
        string(
            name: 'URL', 
            defaultValue: 'http://testhtml5.vulnweb.com/', 
            description: 'Url scanned by Arachni')
	string(
            name: 'SPAWNS', 
            defaultValue: '1', 
            description: 'Amount of child (RPC::Server::Instances) to spawn when performing multi-RPC::Server::Instance scans.')
	string(	
	     name: 'GRID_MODE',
	     defaultValue: 'balance',
	     description: 'Grid mode of operation for this scan (balance or aggregate)')
	string(
            name: 'SCOPE_DIRECTORY_DEPTH_LIMIT', 
            defaultValue: '1', 
            description: 'How deep Arachni should go into the site structure')
	string(
            name: 'SCOPE_PAGE_LIMIT', 
            defaultValue: '1', 
            description: 'How many pages to crawl and audit.')
	string(
            name: 'REPORT_NAME', 
            defaultValue: 'report', 
            description: 'Precises the name of the report.')
	string(
            name: 'CHECK_SCAN', 
            defaultValue: 'xss*', 
	    description: 'Checks are system components which perform security checks and log issues.')
  booleanParam(
            name: 'PROXY_PLUGIN', 
            defaultValue: false , 
            description: 'Activate proxy plugin with the rpc client.')
}
    }
  	stage('ScanUrlArachni') {
            steps {
		sh "./scan.sh ${params.DISPATCHER_GRID_HOST} ${params.DOCKER_HOST_WebUI} ${params.URL} ${params.SPAWNS} ${params.GRID_MODE} ${params.SCOPE_DIRECTORY_DEPTH_LIMIT} ${params.SCOPE_PAGE_LIMIT} ${params.REPORT_NAME} ${params.CHECK_SCAN} ${params.PROXY_PLUGIN} "
            }
	}
    }
}

