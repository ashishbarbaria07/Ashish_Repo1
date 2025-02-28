public class AccountContactManager {

    // Method to create an Account and associated Contacts
    public static void createAccountWithContacts(String accountName, List<String> contactNames) {
        // Create an Account record
        Account acc = new Account(Name = accountName);
        insert acc;

        // Create a list to hold Contact records
        List<Contact> contactsToInsert = new List<Contact>();

        // Create Contacts and associate them with the newly created Account
        for (String contactName : contactNames) {
            Contact con = new Contact(
                FirstName = contactName,
                LastName = 'Doe',
                AccountId = acc.Id // Associate Contact with Account
            );
            contactsToInsert.add(con);
        }

        // Insert the Contact records
        insert contactsToInsert;
    }

    // Method to fetch Account and its Contacts
    public static List<Account> getAccountWithContacts(String accountId) {
        // Query for Account and related Contacts using relationship query
        List<Account> accounts = [
            SELECT Id, Name, 
                   (SELECT Id, FirstName, LastName FROM Contacts)
            FROM Account 
            WHERE Id = :accountId
        ];

        return accounts;
    }

    // Method to update Account Name and associated Contacts
    public static void updateAccountAndContacts(String accountId, String newAccountName, List<String> newContactNames) {
        // Fetch the Account record by Id
        Account acc = [SELECT Id, Name FROM Account WHERE Id = :accountId LIMIT 1];
        acc.Name = newAccountName;

        // Update Account record
        update acc;

        // Fetch Contacts related to the Account
        List<Contact> contacts = [SELECT Id, FirstName, LastName FROM Contact WHERE AccountId = :accountId];

        // Update Contact names
        for (Integer i = 0; i < contacts.size(); i++) {
            if (i < newContactNames.size()) {
                contacts[i].FirstName = newContactNames[i];
            }
        }

        // Update Contact records
        update contacts;
    }
}