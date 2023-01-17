@RestResource(urlMapping='/api/Webhooks/pushdetailsdemo/*')
global with sharing class WebhookSubscription {
    @HttpPost
    global static void handleNotification() {
        try {
            RestRequest request = RestContext.request;
            RestResponse response = RestContext.response;
            GitHub_PushDetail__c Detail = new GitHub_PushDetail__c();        
            Map<String, Object> requestPayload = (Map<String, Object>)JSON.deserializeUntyped(request.requestBody.toString()) ;
            Map<String, Object> requestPayloadCommit = (Map<String, Object>) requestPayload.get('head_commit');
    //      JSONParser parser = JSON.createParser(request.requestBody.toString());     
            Detail.Commit_message__c = (String)requestPayloadCommit.get('message');
            insert Detail;

        } catch (Exception e) {
            system.debug(e.getMessage());
        }
    }
}
