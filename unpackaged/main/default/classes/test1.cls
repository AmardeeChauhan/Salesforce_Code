public with sharing class test1 {

    public List<Child_Form__c> objectsToInsert { get; set; }
    public Integer numberOfRowToRemove { get; set; }
    public String val {get;set;}
    public String CorrespondingFields{ get; set; }
    public List<String> fieldNameToString { get; set; }
    public List<SelectOption> fieldNames{get; set;}
    //public String AllObjectsList { get; set; }
     public List<Child_Form__C> listToInsert {get;set;}

    public List<ChildFormwrapper> listToInsertWrapper {get;set;}
    
    public class ChildFormwrapper{
        public list<selectOption> objectname {get;set;}
        public list<selectOption> fieldname {get;set;}
       
    }
    

    public class innerWrapperClass{
        List<String> SelectedFieldsName { get; set; }
        
        public String objectname { get; set; }
        public list<selectOption> leftSelectOptionList {get;set;}
    }
 
 
    public PageReference submit()
    {
        try{
            system.debug('@@objectsToInsert : '+ objectsToInsert);
            for(Child_Form__c childForm : objectsToInsert){
                if(!String.isBlank(childForm.Label__c)){
                    childForm.Form_Parent__c = 'a0028000003dswV';
                    childForm.Object_Name__c = val;
                    listToInsert.add(childForm);
                }
            }
            system.debug('@@listToInsert : '+ listToInsert);
            if(!listToInsert.isEmpty()){
                insert listToInsert;
            }
            
        } catch(Exception ex){
            system.debug(ex.getMessage());
            ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.ERROR, ex.getMessage() + '\r\n' + ex.getStackTraceString() + '\r\n' + ex.getTypeName() + '\r\n' + System.now() + '\r\n' + '--------------'));
        }
        return null;
    }
    
    public test1()
    {
   
        listToInsert = new List<Child_Form__c>();
        objectsToInsert = new List<Child_Form__c>();
        for(integer i =1 ; i<4 ;i++)
        {
            Child_Form__c newObject = new Child_Form__c();
            objectsToInsert.add(newObject);
            val = 'AcceptedEventRelation';
            
            getAllFields();
            system.debug('!@@@val'+val);
        }
       
       
    }

    // The method to add a new item to the list
    public PageReference addNewObject(){

        Child_Form__c newObject = new Child_Form__c();
        ChildFormwrapper obj = new ChildFormwrapper();
        //newObject.Object_Name__c=
        objectsToInsert.add(newObject);

        return null;
    }

    // The method to remove an item from the list
    public PageReference removeNewObject(){

        objectsToInsert.remove(numberOfRowToRemove);  

        return null;
    }
    
     public List<SelectOption> getName()
  {
    List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();     
    List<SelectOption> options = new List<SelectOption>();
    
    for(Schema.SObjectType f : gd)
    {
       options.add(new SelectOption(f.getDescribe().getName(),f.getDescribe().getName()));
       options.sort();
    }
 
    return options;
   }
    public void getAllFields() {
           System.debug('Test script');
        fieldNameToString = new List<String>();
        fieldNames = new List<SelectOption>();

        if(val!= null){
        system.debug('!!!val' +val);
            Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
            Schema.SObjectType ObjectSchema = schemaMap.get(val);
            Map<String, Schema.SObjectField> fieldMap = ObjectSchema.getDescribe().fields.getMap();
            
            for(String fieldName: fieldMap.keySet()) {  
                fieldNames.add(new SelectOption(fieldName,fieldName));
                fieldNameToString.add(fieldName);
            }
        }

    }
}