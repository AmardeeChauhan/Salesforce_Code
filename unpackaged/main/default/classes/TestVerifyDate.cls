@isTest
private class TestVerifyDate{
    @isTest static void testCheckDates() {
        Date date1 = Date.newInstance(2017, 07, 15);
        Date date2 = Date.newInstance(2017, 08, 12);
        Date returnDate = VerifyDate.CheckDates(date1,date2);
         date2 = Date.newInstance(2017, 08, 17);
         Date returnDate1 = VerifyDate.CheckDates(date1,date2);
    }
}