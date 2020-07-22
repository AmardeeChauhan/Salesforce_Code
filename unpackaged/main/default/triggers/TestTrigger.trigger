trigger TestTrigger on Case (before insert) {
    if(Control.firstRun)
    {
        Control.firstRun = false;
        insert new Case();
    }    
}