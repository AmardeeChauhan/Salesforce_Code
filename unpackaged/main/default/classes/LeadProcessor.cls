global class LeadProcessor implements 
    Database.Batchable<sObject> {
    
    // instance member to retain state across transactions
    global Integer recordsProcessed = 0;

    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT ID, LeadSource from lead'
        );
    }

    global void execute(Database.BatchableContext bc, List<Lead> scope){
        // process each batch of records
        List<Lead> leads = new List<Lead>();
            for (Lead leadObj : scope) {
                leadObj.LeadSource = 'Dreamforce';
                leads.add(leadObj);
            }
        update leads;
    }    

    global void finish(Database.BatchableContext bc){
    }    

}