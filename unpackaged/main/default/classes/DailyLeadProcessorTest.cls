@isTest
private class DailyLeadProcessorTest{
    @isTest static void testDailyLeadProcessor() {
    String CRON_EXP = '0 0 0 15 3 ? 2022';

        Test.StartTest();
        List<Lead> leadList = new List<Lead>();
         for (Integer i = 0; i < 200; i++) {
            leadList.add(new Lead(      
             LastName = 'test Lead name'+i,
            Company = 'testLead',
            Status = 'Open - Not Contacted'
            ));
        }
        insert leadList;

        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP, 
            new DailyLeadProcessor());  
        
        Test.StopTest();
        
    }
}