public class AccountProcessor{

    // Call async from triggers, etc, where callouts are not permitted.
    @future
    public static void countContacts(List<Id> accountIdList) {
        Map<id,Integer> accountIdCountMap = new Map<id,Integer>();
        List<Account> accountUpdateList = new List<Account>();
        List<Contact> contactList = [select id,AccountId from Contact where AccountId IN :accountIdList];
        for(Contact contactObj :contactList )
        {
            if(accountIdCountMap.get(contactObj.AccountId) != null)
            {
                Integer currentCount = accountIdCountMap.get(contactObj.AccountId);
                currentCount = currentCount +1;
                accountIdCountMap.put(contactObj.AccountId,currentCount);               
            }
            else
            {
                accountIdCountMap.put(contactObj.AccountId,1);
            }
        }
        List<Account> accountList = [select id,Number_of_Contacts__c from Account where Id IN :accountIdList];
        for(Account accountObj :accountList )
        {
            accountObj.Number_of_Contacts__c = accountIdCountMap.get(accountObj.Id);
            accountUpdateList.add(accountObj);      
        }
        update accountUpdateList;
    }
}