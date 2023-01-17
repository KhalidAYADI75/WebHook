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
            
            List<Object> detailSubscriptions = (List<Object>) fieldMap.get('repository');        
            for (Object detailSub : detailSubscriptions ) {
                Detail.Description__c = 'dede';
            }
            insert Detail;

        } catch (Exception e) {
            system.debug(e.getMessage());
        }
    }
}
