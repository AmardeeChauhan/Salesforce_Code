@isTest
private class LeadProcessorTest{
    @isTest static void testCheckDates() {
    
        Test.StartTest();
        Lead leadObj = new Lead();
        leadObj.LastName = 'test Lead name';
        leadObj.Company = 'testLead';
        leadObj.Status = 'Open - Not Contacted';
        leadObj.LeadSource = 'dreamForce';
        insert leadObj;
        
        LeadProcessor myBatchObject = new LeadProcessor(); 
        Id batchId = Database.executeBatch(myBatchObject);
        Test.StopTest();
        
    }
}