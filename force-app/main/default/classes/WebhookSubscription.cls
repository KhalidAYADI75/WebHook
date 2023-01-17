@RestResource(urlMapping='/api/Webhooks/pushdetailsdemo/*')
global with sharing class WebhookSubscription {
    @HttpPost
    global static void handleNotification() {
        try {
            RestRequest request = RestContext.request;
            RestResponse response = RestContext.response;
            GitHub_PushDetail__c Detail = new GitHub_PushDetail__c();
            Detail.Commit_message__c = 'encoire moi';
            Detail.Description__c = JSON.deserializeUntyped(request.requestBody.toString()) ;
            insert Detail;

        } catch (Exception e) {
            system.debug(e.getMessage());
        }
    }
}