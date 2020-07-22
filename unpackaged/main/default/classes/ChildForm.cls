public with sharing class ChildForm{
        public String val {get;set;}
 
public List<Child_Form__c> childForm{get;set;}

public ChildForm()
{
        String FormId = 'a0028000003dswV';
        childForm =  [select id,Name,Field_Name__c,Form_Parent__c,Is_Required__c,Label__c,Object_Name__c,Sub_Type__c,Type__c,Values__c 
        from Child_Form__c where  Form_Parent__c = :FormId];
        System.debug('childForm...'+childForm);

}
  public List<SelectOption> getName()
  {
    List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();     
    List<SelectOption> options = new List<SelectOption>();
    
    for(Schema.SObjectType f : gd)
    {
       options.add(new SelectOption(f.getDescribe().getLabel(),f.getDescribe().getLabel()));
    }
    return options;
   }
   
   



}