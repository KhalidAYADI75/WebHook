@RestResource(urlMapping='/api/Webhooks/pushdetailsdemo/*')
global with sharing class WebhookSubscription {
    @HttpPost
    global static void handleNotification() {
        try {
            RestRequest request = RestContext.request;
            RestResponse response = RestContext.response;
            GitHub_PushDetail__c Detail = new GitHub_PushDetail__c();        
            Map<String, Object> objectMap = (Map<String, Object>)JSON.deserializeUntyped(request.requestBody.toString()) ;
            Map<String, Object> objectMap1 = (Map<String, Object>) objectMap.get('head_commit');
    //      JSONParser parser = JSON.createParser(request.requestBody.toString());     
            Detail.Commit_message__c = (String)objectMap1.get('message');
            insert Detail;

        } catch (Exception e) {
            system.debug(e.getMessage());
        }
    }
}
