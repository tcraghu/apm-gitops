#Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
aws appmesh delete-virtual-service --virtual-service-name color-headers.default.svc.cluster.local --mesh-name default-mesh --no-verify-ssl                                    
aws appmesh delete-virtual-service --virtual-service-name color-paths.default.svc.cluster.local --mesh-name default-mesh --no-verify-ssl                                      

aws appmesh delete-gateway-route --gateway-route-name gateway-route-paths_default --virtual-gateway-name ingress-gw_default --mesh-name default-mesh --no-verify-ssl          
aws appmesh delete-gateway-route --gateway-route-name gateway-route-headers_default --virtual-gateway-name ingress-gw_default --mesh-name default-mesh --no-verify-ssl        

aws appmesh delete-virtual-gateway --virtual-gateway-name ingress-gw_default --mesh-name default-mesh --no-verify-ssl                                                         

aws appmesh delete-virtual-service --virtual-service-name color-paths.default.svc.cluster.local --mesh-name default-mesh --no-verify-ssl                                      
aws appmesh delete-virtual-service --virtual-service-name color-headers.default.svc.cluster.local --mesh-name default-mesh --no-verify-ssl                                    

aws appmesh delete-route --route-name color-route-green --virtual-router-name color-paths_default --mesh-name default-mesh --no-verify-ssl                                    
aws appmesh delete-route --route-name color-route-red --virtual-router-name color-paths_default --mesh-name default-mesh --no-verify-ssl                                      
aws appmesh delete-route --route-name color-route-yellow --virtual-router-name color-paths_default --mesh-name default-mesh --no-verify-ssl                                   
aws appmesh delete-route --route-name color-route-blue --virtual-router-name color-paths_default --mesh-name default-mesh --no-verify-ssl                                     
aws appmesh delete-route --route-name color-route-white --virtual-router-name color-paths_default --mesh-name default-mesh --no-verify-ssl                                    
aws appmesh delete-virtual-router --virtual-router-name color-paths_default --mesh-name default-mesh --no-verify-ssl                                                          

aws appmesh delete-route --route-name color-route-green --virtual-router-name color-headers_default --mesh-name default-mesh --no-verify-ssl                                  
aws appmesh delete-route --route-name color-route-red --virtual-router-name color-headers_default --mesh-name default-mesh --no-verify-ssl                                 
aws appmesh delete-route --route-name color-route-yellow --virtual-router-name color-headers_default --mesh-name default-mesh --no-verify-ssl                                  
aws appmesh delete-route --route-name color-route-blue --virtual-router-name color-headers_default --mesh-name default-mesh --no-verify-ssl                                   
aws appmesh delete-route --route-name color-route-white --virtual-router-name color-headers_default --mesh-name default-mesh --no-verify-ssl                                    
aws appmesh delete-virtual-router --virtual-router-name color-headers_default --mesh-name default-mesh --no-verify-ssl                                                        

aws appmesh delete-virtual-node --virtual-node-name green_default --mesh-name default-mesh --no-verify-ssl                                                                     
aws appmesh delete-virtual-node --virtual-node-name red_default --mesh-name default-mesh --no-verify-ssl                                                                    
aws appmesh delete-virtual-node --virtual-node-name yellow_default --mesh-name default-mesh --no-verify-ssl                                                                      
aws appmesh delete-virtual-node --virtual-node-name blue_default --mesh-name default-mesh --no-verify-ssl                                                                    
aws appmesh delete-virtual-node --virtual-node-name white_default --mesh-name default-mesh --no-verify-ssl                                                                   

