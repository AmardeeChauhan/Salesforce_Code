public class RandomContactFactory{
    public static List<Contact> generateRandomContacts(integer intNumber,String lastNamePass) {
    List<Contact> contactList = new List<Contact>();
    Contact contactObj ;
    for(integer i=0;i<intNumber;i++)
    {
        contactObj = new Contact (Firstname ='Test'+i, Lastname = lastNamePass);
        contactList.add(contactObj);
       
    }
        return contactList;
    }
  

}