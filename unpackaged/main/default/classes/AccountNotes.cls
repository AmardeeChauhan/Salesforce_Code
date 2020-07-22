public class AccountNotes {
    private List<attachment> attz;

    private Account accnt; 
    public AccountNotes(ApexPages.StandardController controller) {
        this.accnt= (Account)controller.getRecord();
    }
    public List<attachment> getAttz()
    {
        if (accnt == null)
             return null;
        attz = [Select id, Name, CreatedById,LastModifiedById,LastModifiedDate, CreatedDate from Attachment where ParentID = :accnt.id];
        return attz;
    }
}