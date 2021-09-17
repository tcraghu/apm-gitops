#Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
aws appmesh delete-virtual-node --virtual-node-name dj_default --mesh-name default-mesh --no-verify-ssl                                                                       
aws appmesh delete-virtual-node --virtual-node-name jazz-v1_default --mesh-name default-mesh --no-verify-ssl                                                                  
aws appmesh delete-virtual-node --virtual-node-name jazz-v2_default --mesh-name default-mesh --no-verify-ssl                                                                  
aws appmesh delete-virtual-node --virtual-node-name metal-v1_default --mesh-name default-mesh --no-verify-ssl                                                                 
aws appmesh delete-virtual-node --virtual-node-name metal-v2_default --mesh-name default-mesh --no-verify-ssl                                                                 

aws appmesh delete-virtual-service --virtual-service-name metal.default.svc.cluster.local --mesh-name default-mesh --no-verify-ssl                                            
aws appmesh delete-virtual-service --virtual-service-name jazz.default.svc.cluster.local --mesh-name default-mesh --no-verify-ssl                                             

aws appmesh delete-route --route-name jazz-route --virtual-router-name jazz-router_default --mesh-name default-mesh --no-verify-ssl                                    
aws appmesh delete-virtual-router --virtual-router-name jazz-router_default --mesh-name default-mesh --no-verify-ssl                                                          
aws appmesh delete-route --route-name metal-route --virtual-router-name metal-router_default --mesh-name default-mesh --no-verify-ssl                                    
aws appmesh delete-virtual-router --virtual-router-name metal-router_default --mesh-name default-mesh --no-verify-ssl                                                         

