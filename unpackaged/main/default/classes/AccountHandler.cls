public class AccountHandler {
    public static void insertAccount(Integer value)
    {
        Integer counter = 1;
                value = 3;

        List<Account> addAccounts = new List<Account>();
        
        while(counter <= value) {
            //create a new account
            Account store = new Account();
            store.Name = 'Acme Inc ' + counter;
            store.AccountNumber = 'A000 ' + counter;
            addAccounts.add(store);
            counter = counter + 1;
            
        }
        insert addAccounts;
    }
}