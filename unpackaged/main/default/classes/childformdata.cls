public class childformdata {

   public List<ChildFormwrapper> listToInsertWrapper {get;set;}
 //  public String val {get;set;}
      public List<Child_Form__C> childforminsert {get;set;}
      public Integer numberOfRowToRemove { get; set; }
            public String CorrespondingFields1{ get; set; }

      public String val {get;set;}
      
   public childformdata()
   { 
       listToInsertWrapper = new List<ChildFormwrapper>();
       for(integer i =1 ; i<4 ;i++)
        {
             listToInsertWrapper.add(new ChildFormwrapper());
            //val = 'AcceptedEventRelation';
        }
  }
  
   public PageReference addNewObject(){

     listToInsertWrapper.add(new ChildFormwrapper());
        return null;
    }
     
         public PageReference removeNewObject(){

       listToInsertWrapper.remove(numberOfRowToRemove);   

        return null;
    }
    
    
    
     public Void submit()
    {
        //childforminsert.clear();
        System.debug('@@@enter is submit'+listToInsertWrapper);
       for ( ChildFormwrapper chw :listToInsertWrapper)
       { 
           Child_Form__C chnew = new Child_Form__C();
           chnew=chw.ch;
           chnew.Object_Name__c = chw.val;
           system.debug('@@@@chw.CorrespondingFields;'+chw.CorrespondingFields);
           chnew.Field_Name__c= chw.CorrespondingFields;
          // childforminsert 
       system.debug('List complete'+chnew);
       }
       
     

   /*        for(Child_Form__C xyz: listToInsertWrapper )    
        {
            //xyz=listToInsertWrapper.ch;
        } */
        //return null;
    }
    

    
        
 // Wrapper Class for Child form object
  public class ChildFormwrapper
  {
     public Child_Form__C ch {get;set;}
     public list<selectOption> objectname {get;set;}
     public list<selectOption> fieldname {get;set;}
     public list<selectOption> fieldnames {get;set;}
     public List<String> fieldNameToString { get; set; }
     
      

     public String val {get;set;}
      public String CorrespondingFields{ get; set; }

     public ChildFormwrapper()
     {
         ch = new Child_Form__C ();
         objectname = getobjectname();
         system.debug('object list 2'+ objectname );
            val = 'AcceptedEventRelation';
          getFieldName();
         
     }

      
            public Void setfield()
       {
       system.debug('field name in setfield method'+CorrespondingFields);
       }
        
     public List<selectOption> getobjectname()
     {

         List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();     
         List<SelectOption> options = new List<SelectOption>();
        for(Schema.SObjectType f : gd)
          {
            options.add(new SelectOption(f.getDescribe().getName(),f.getDescribe().getName()));
            options.sort();
           }
           System.debug('Object Name' + options);
         return options;
     }
     
     
     public void getFieldName()
     {
           fieldNames = new List<SelectOption>();
           System.debug('Val Value' + Val);
            if(val!= null){
              Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
              Schema.SObjectType ObjectSchema = schemaMap.get(val);
              Map<String, Schema.SObjectField> fieldMap = ObjectSchema.getDescribe().fields.getMap();
              for(String fieldName: fieldMap.keySet()) 
               {  
                fieldNames.add(new SelectOption(fieldName,fieldName));
                //fieldNameToString.add(fieldName);
               }
                          System.debug('Field Name' + fieldNames);
                          System.debug('Field Name CorrespondingFields' + CorrespondingFields);
                          

            }
            
           // return fieldNames;
     }
     
      
  }
}