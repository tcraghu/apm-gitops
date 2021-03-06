#Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
aws appmesh delete-gateway-route --gateway-route-name gateway-route-paths_example --virtual-gateway-name ingress-gw_example --mesh-name example-mesh --no-verify-ssl          
aws appmesh delete-gateway-route --gateway-route-name gateway-route-headers_example --virtual-gateway-name ingress-gw_example --mesh-name example-mesh --no-verify-ssl        

aws appmesh delete-virtual-gateway --virtual-gateway-name ingress-gw_example --mesh-name example-mesh --no-verify-ssl                                                         

aws appmesh delete-virtual-service --virtual-service-name color-headers.example.svc.cluster.local --mesh-name example-mesh --no-verify-ssl                                    
aws appmesh delete-virtual-service --virtual-service-name color-paths.example.svc.cluster.local --mesh-name example-mesh --no-verify-ssl                                      


aws appmesh delete-virtual-service --virtual-service-name color-paths.example.svc.cluster.local --mesh-name example-mesh --no-verify-ssl                                      
aws appmesh delete-virtual-service --virtual-service-name color-headers.example.svc.cluster.local --mesh-name example-mesh --no-verify-ssl                                    

aws appmesh delete-route --route-name color-route-green --virtual-router-name color-paths_example --mesh-name example-mesh --no-verify-ssl                                    
aws appmesh delete-route --route-name color-route-red --virtual-router-name color-paths_example --mesh-name example-mesh --no-verify-ssl                                      
aws appmesh delete-route --route-name color-route-yellow --virtual-router-name color-paths_example --mesh-name example-mesh --no-verify-ssl                                   
aws appmesh delete-route --route-name color-route-blue --virtual-router-name color-paths_example --mesh-name example-mesh --no-verify-ssl                                     
aws appmesh delete-route --route-name color-route-white --virtual-router-name color-paths_example --mesh-name example-mesh --no-verify-ssl                                    
aws appmesh delete-virtual-router --virtual-router-name color-paths_example --mesh-name example-mesh --no-verify-ssl                                                          

aws appmesh delete-route --route-name color-route-green --virtual-router-name color-headers_example --mesh-name example-mesh --no-verify-ssl                                  
aws appmesh delete-route --route-name color-route-red --virtual-router-name color-headers_example --mesh-name example-mesh --no-verify-ssl                                 
aws appmesh delete-route --route-name color-route-yellow --virtual-router-name color-headers_example --mesh-name example-mesh --no-verify-ssl                                  
aws appmesh delete-route --route-name color-route-blue --virtual-router-name color-headers_example --mesh-name example-mesh --no-verify-ssl                                   
aws appmesh delete-route --route-name color-route-white --virtual-router-name color-headers_example --mesh-name example-mesh --no-verify-ssl                                    
aws appmesh delete-virtual-router --virtual-router-name color-headers_example --mesh-name example-mesh --no-verify-ssl                                                        

aws appmesh delete-virtual-node --virtual-node-name green_example --mesh-name example-mesh --no-verify-ssl                                                                     
aws appmesh delete-virtual-node --virtual-node-name red_example --mesh-name example-mesh --no-verify-ssl                                                                    
aws appmesh delete-virtual-node --virtual-node-name yellow_example --mesh-name example-mesh --no-verify-ssl                                                                      
aws appmesh delete-virtual-node --virtual-node-name blue_example --mesh-name example-mesh --no-verify-ssl                                                                    
aws appmesh delete-virtual-node --virtual-node-name white_example --mesh-name example-mesh --no-verify-ssl                                                                   

