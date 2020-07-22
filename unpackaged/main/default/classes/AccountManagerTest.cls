@IsTest
private class AccountManagerTest {

    @isTest static void testgetAccount() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri ='https://testtrailheadnew-dev-ed.my.salesforce.com/services/apexrest/Accounts/'+ recordId;
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
         AccountManager.getAccount();
        // Verify results
    }

  // Helper method
    static Id createTestRecord() {
        // Create test record
        Account accountObj = new Account(Name ='testAccount');
        insert accountObj;
        Contact contactObj = new Contact();
        
        contactObj.lastname = 'testContact';
        contactObj.accountId= accountObj.Id;
        insert contactObj;
        
        return accountObj.Id;
    }  
    
}