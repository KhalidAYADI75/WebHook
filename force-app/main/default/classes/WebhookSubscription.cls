@RestResource(urlMapping='/api/Webhooks/pushdetailsdemo/*')
global with sharing class WebhookSubscription {
    @HttpPost
    global static void handleNotification() {
        try {
            RestRequest request = RestContext.request;
            RestResponse response = RestContext.response;
            GitHub_PushDetail__c Detail = new GitHub_PushDetail__c();
            Detail.Commit_message__c = 'encore moi';
            System.debug (request.requestBody.toString());
            Map<String, Object> fieldMap = (Map<String, Object>)JSON.deserializeUntyped(request.requestBody.toString()) ;
           system.debug('fieldmap : ' + fieldMap);
            // Detail.Description__c = JSON.deserializeUntyped(request.requestBody.toString())) ;
    //      JSONParser parser = JSON.createParser(request.requestBody.toString());
    //      system.debug ('teste : ' + parser);
            Detail.Description__c = (String)fieldMap.get('head_commit.message');
            //d
        //    Detail.Description__c = fieldMap.toString();
            insert Detail;

        } catch (Exception e) {
            system.debug(e.getMessage());
        }
    }
}
