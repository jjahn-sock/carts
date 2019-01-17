
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
                        "value" : "$3"    
                       }
                       ]
                   }
                   ]
        }
}
EOF

url="$1/api/v1/events"
echo "Dynatrace URL: $url"
echo "Dynatrace Token: $2"
echo "Environment: $3"
echo "$postData"
curl --url "$url" -H "Content-type: application/json" -H "Authorization: Api-Token "$2 -X POST -d  "$postData"