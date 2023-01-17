@RestResource(urlMapping='/api/Webhooks/pushdetailsdemo/*')
global with sharing class WebhookSubscription {
    @HttpPost
    global static void handleNotification() {
        try {
            RestRequest request = RestContext.request;
            RestResponse response = RestContext.response;
            GitHub_PushDetail__c Detail = new GitHub_PushDetail__c();
            Detail.Commit_message__c = 'encore moi';
        
            Map<String, Object> fieldMap = (Map<String, Object>)JSON.deserializeUntyped(request.requestBody.toString()) ;

    //      JSONParser parser = JSON.createParser(request.requestBody.toString());
            
            Detail.Description__c = (String) fieldMap.get('commits.message');        
       
            insert Detail;

        } catch (Exception e) {
            system.debug(e.getMessage());
        }
    }
}
