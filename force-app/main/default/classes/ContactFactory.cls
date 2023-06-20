public class ContactFactory implements DataFactoryInterface {
    public sObject getRecord() {
        return new Contact(
            LastName = 'My Contact'
        );
    }

    public sObject createRecord() {
        Contact contact = (Contact)getRecord();
        insert contact;
        return contact;
    }
}