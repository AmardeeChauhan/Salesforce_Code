public class DataTableEditRemoveController {

   public List<Account> accs { get; set; }
  public List<Child_Form__c> childForm{get;set;}
   //used to get a hold of the account record selected for deletion
   public string SelectedAccountId { get; set; }
  
   public DataTableEditRemoveController() {
       //load account data into our DataTable
       LoadData();
   }
   
   
  
  
   private void LoadData() {
   
   String FormId = 'a0028000003dswV';
        childForm =  [select Is_Required__c,Label__c,Object_Name__c,Sub_Type__c,Type__c,Values__c 
        from Child_Form__c  limit :3];
   
       accs = [Select id, name, BillingStreet, BillingCity, BillingPostalCode, BillingCountry from Account limit 20];
   }
  
   public void DeleteAccount()
   {
      // if for any reason we are missing the reference 
      if (SelectedAccountId == null) {
      
         return;
      }
     
      // find the account record within the collection
      Child_Form__c tobeDeleted = null;
      for(Child_Form__c a : childForm)
       if (a.Id == SelectedAccountId) {
          tobeDeleted = a;
          break;
       }
      
      //if account record found delete it
      if (tobeDeleted != null) {
       Delete tobeDeleted;
      }
     
      //refresh the data
      LoadData();
   }    
  
  
}