#Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
aws appmesh delete-route --route-name jazz-route --virtual-router-name jazz-router_example --mesh-name example-mesh --no-verify-ssl                                    
aws appmesh delete-route --route-name metal-route --virtual-router-name metal-router_example --mesh-name example-mesh --no-verify-ssl                                    

aws appmesh delete-virtual-service --virtual-service-name metal.example.svc.cluster.local --mesh-name example-mesh --no-verify-ssl                                            
aws appmesh delete-virtual-service --virtual-service-name jazz.example.svc.cluster.local --mesh-name example-mesh --no-verify-ssl                                             

aws appmesh delete-virtual-router --virtual-router-name jazz-router_example --mesh-name example-mesh --no-verify-ssl                                                          
aws appmesh delete-virtual-router --virtual-router-name metal-router_example --mesh-name example-mesh --no-verify-ssl                                                         

aws appmesh delete-virtual-node --virtual-node-name dj_example --mesh-name example-mesh --no-verify-ssl                                                                       
aws appmesh delete-virtual-node --virtual-node-name jazz-v1_example --mesh-name example-mesh --no-verify-ssl                                                                  
aws appmesh delete-virtual-node --virtual-node-name jazz-v2_example --mesh-name example-mesh --no-verify-ssl                                                                  
aws appmesh delete-virtual-node --virtual-node-name metal-v1_example --mesh-name example-mesh --no-verify-ssl                                                                 
aws appmesh delete-virtual-node --virtual-node-name metal-v2_example --mesh-name example-mesh --no-verify-ssl                                                                 
