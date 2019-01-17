
postData=$cat <<EOF
    {
        "eventType" : "CUSTOM_DEPLOYMENT",
        "source" : "AzureDevops" ,
        "deploymentName" : "$Release.DefinitionName",
        "deploymentVersion" : "$Release.ReleaseId"  ,
        "deploymentProject" : "$System.TeamProject" ,
        "ciBackLink" : "$System.TeamFoundationCollectionUri",
        "attachRules" : {
               "tagRule" : [
                   {
                       "meTypes":"SERVICE" ,
                   "tags" : [
                       {
                           "context" : "KUBERNETES",
                           "key": "app",
                        "value" : "carts"    
                       },
                       {
                           "context" : "CONTEXTLESS",
                           "key": "environment",
                        "value" : "$stageName"    
                       }
                       ]
                   }
                   ]
        }
}
EOF
)
url="$dynatraceTenantUrl/api/v1/events"
echo "API URL: $url"
echo "$postData"
curl --url "$url" -H "Content-type: application/json" -H "Authorization: Api-Token "$dynatraceApiToken -X POST -d  "$postData"