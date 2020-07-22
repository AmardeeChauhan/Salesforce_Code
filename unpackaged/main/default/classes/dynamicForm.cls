public with sharing class dynamicForm {

 
public List<Child_Form__c> childFormList{get;set;}

public List<Childclass> childList{get;set;}

public dynamicForm() 
{
        String FormId = 'a0028000003dswV';
        childFormList =  [select id,Name,Field_Name__c,Form_Parent__c,Is_Required__c,Label__c,Object_Name__c,Sub_Type__c,Type__c,Values__c 
        from Child_Form__c where  Form_Parent__c = :FormId];
        childList = new List<Childclass>();
         Childclass childClssObj ;
         for(Child_Form__c childObj :  childFormList)
         {
             childClssObj =  new Childclass(childObj.Field_Name__c,''+childObj.Form_Parent__c,childObj.Is_Required__c,childObj.Label__c,childObj.Object_Name__c,childObj.Sub_Type__c,childObj.Type__c,childObj.Values__c);
             childList.add(childClssObj);           
         }
       System.debug('childList....'+childList); 
}

public static List<SelectOption> getItemsvalues(String values)
    {
         List<SelectOption> options = new List<SelectOption>();
        for(String key : values.split(','))
        {
            options.add(new SelectOption(key,key));
        }   
        return options;
    }
    
public void Save(){}    
public class Childclass { 

public String FieldName{get;set;}
public String parent{get;set;}
public boolean isRequired{get;set;}
public String Label{get;set;}
public String ObjectName{get;set;}
public String SubType{get;set;}
public String Type{get;set;}
public String value{get;set;}
public String dropDownSelectValue{get;set;}
public String sectionHeaderValue{get;set;}
public List<SelectOption> dropDownValues{get;set;}
     
    public Childclass(String FieldName , String parent ,boolean isRequired ,String Label,String ObjectName ,String SubType ,String Type , String value)
    {
        this.FieldName = FieldName;
        this.parent = parent;
        
        if(isRequired == null)
        this.isRequired =  false;
        else
        this.isRequired = isRequired;
        
        this.Label = Label;
        this.ObjectName = ObjectName;
        this.SubType = SubType;
        this.Type = Type;
        
        this.Type = Type;
        if(Type == 'Section header'){
        	sectionHeaderValue = value;
        }
        else
        {
        	this.dropDownValues = dynamicForm.getItemsvalues(value);	
        }
        
        
    }
}
}