# apm-gitops
Test the APM-M Gitops

# Bootstrap cluster with github repository
Make sure flux pre-check is good

    flux check --pre
    
Make sure you have git repository access, personal access token
Make sure you have fargate profile created with namespace `flux-system`

    #This will use SSH, not working in our environment
    $Env:GITHUB_TOKEN="<personal-access-token-for-service-account>"
    flux bootstrap github `
    --owner=tcraghu `
    --repository=apm-gitops `
    --path=clusters/devops `
    --branch main `
    --personal

    #This will use HTTPS, working in our environment
    $Env:GITHUB_TOKEN="<personal-access-token-for-service-account>"
    flux bootstrap github `
    --owner=tcraghu `
    --repository=apm-gitops `
    --path=clusters/devops `
    --branch main `
    --token-auth `
    --personal

