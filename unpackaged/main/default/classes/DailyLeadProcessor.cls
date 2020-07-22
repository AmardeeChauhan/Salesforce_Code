global class DailyLeadProcessor implements Schedulable {

    global void execute(SchedulableContext ctx) {
        List<Lead> updateLeadList = new List<Lead>();
        List<Lead> leadList = [SELECT Id, Name, LeadSource FROM Lead
            WHERE (LeadSource = '' OR  LeadSource = null)];
        
         for (Lead leadObj : leadList) {
             leadObj.LeadSource = 'Dreamforce';
          updateLeadList.add(leadObj);
        }
        update updateLeadList;  
    }
}