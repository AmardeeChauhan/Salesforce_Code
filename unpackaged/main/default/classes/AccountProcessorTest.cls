@isTest
private class AccountProcessorTest{
    @isTest static void testCheckDates() {
    
        Test.StartTest();
        Account accountObj= new Account();
        accountObj.name = 'test name';
        insert accountObj;
        
        Contact contact1 =  new Contact();
        contact1.LastName  = 'testContact2';
        
        contact1.AccountId = accountObj.Id;
        insert contact1;
        
        Contact contact2 =  new Contact();
        contact2.LastName  = 'testContact2';
        contact2.AccountId = accountObj.Id;
        insert contact2;
        
        List<Id> accountIdList  = new List<Id>();
        accountIdList.add(accountObj.Id);
        
        AccountProcessor.countContacts(accountIdList);
        Test.StopTest();
        
    }
}