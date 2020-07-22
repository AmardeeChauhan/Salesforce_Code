public class AddPrimaryContact implements Queueable {
    
    private Contact contacts;
    private String mailingState;
    
    public AddPrimaryContact(Contact records, String stateAbbreviation) {
        this.contacts = records;
        this.mailingState  = stateAbbreviation;
        
    }

    public void execute(QueueableContext context) {         
        List<Contact> contactList = new List<Contact>();
        List<Account> accountList  = [select id, name from Account where  BillingState != null limit 200];
        Contact contactObj;
        for (Account accountObj : accountList) {
          contactObj = new Contact();   
          contactObj.MailingState = mailingState;
          contactObj.AccountId = accountObj.Id;
          contactObj.LastName = 'testLastname';
          contactList.add(contactObj);
        }
        insert contactList;
    }
    
}