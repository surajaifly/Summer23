public class AccountFactory implements DataFactoryInterface {
    public sObject getRecord() {
        return new Account(
            Name = 'My Account'
        );
    }

    public sObject createRecord() {
        Account account = (Account)getRecord();
        insert account;
        return account;
    }
}