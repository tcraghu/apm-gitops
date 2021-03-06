#Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
aws appmesh delete-virtual-node --virtual-node-name podinfo-canary_example --mesh-name example-mesh --no-verify-ssl
aws appmesh delete-virtual-node --virtual-node-name podinfo-primary_example --mesh-name example-mesh --no-verify-ssl                                                                                                           
aws appmesh delete-virtual-node --virtual-node-name podinfo-primary_example --mesh-name example-mesh --no-verify-ssl                                                                                                           

aws appmesh delete-virtual-router --virtual-router-name podinfo-canary_example --mesh-name example-mesh --no-verify-ssl
aws appmesh delete-virtual-router --virtual-router-name podinfo_example --mesh-name example-mesh --no-verify-ssl

aws appmesh delete-virtual-service --virtual-service-name podinfo.example --mesh-name example-mesh --no-verify-ssl
aws appmesh delete-virtual-service --virtual-service-name podinfo-canary.example --mesh-name example-mesh --no-verify-ssl
