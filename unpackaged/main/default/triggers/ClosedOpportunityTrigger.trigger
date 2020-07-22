trigger ClosedOpportunityTrigger on Opportunity (after update,after insert) {

List<Task> listOfTask = new List<Task>();

for (Opportunity opportunityObj :Trigger.new) {
      if(opportunityObj.StageName == 'Closed Won')
      {
          Task taskObj = new Task();
          taskObj.subject = 'Follow Up Test Task';
          taskObj.WhatId = opportunityObj.Id;
          listOfTask .add(taskObj);
      }
      }
if(listOfTask.size() > 0)      
{
Insert listOfTask;

}
}