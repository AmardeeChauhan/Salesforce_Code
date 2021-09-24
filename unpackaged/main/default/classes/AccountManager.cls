@RestResource(urlMapping='/Accounts/*/contacts')
//@RestResource(urlMapping='/Accounts/*')
global with sharing class AccountManager {

    @HttpGet
    global static Account getAccount() {
    // adding comments for Github
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        String accountId = (request.requestURI.substringAfter('/Accounts/')).substringBefore('/contacts');
        System.debug('accountId :'+accountId);
        Account  accoutObj = [SELECT Id,Name, (Select id,name FROM Contacts where accountId = :accountId) FROM Account where id = : accountId];
        // this is a change 
        return accoutObj;
        
    }

}
