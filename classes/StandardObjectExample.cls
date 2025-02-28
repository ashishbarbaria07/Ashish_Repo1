public class StandardObjectExample {

    // Method to create an Account, Contact, and Opportunity
    public static void createAccountWithContactAndOpportunity(String accountName, String contactFirstName, String contactLastName, String opportunityName, Decimal opportunityAmount) {
        
        // Step 1: Create an Account
        Account newAccount = new Account(
            Name = accountName,
            Industry = 'Technology'
        );
        
        // Insert the Account record
        insert newAccount;

        // Step 2: Create a Contact linked to the Account
        Contact newContact = new Contact(
            FirstName = contactFirstName,
            LastName = contactLastName,
            AccountId = newAccount.Id
        );
        
        // Insert the Contact record
        insert newContact;

        // Step 3: Create an Opportunity linked to the Account
        Opportunity newOpportunity = new Opportunity(
            Name = opportunityName,
            AccountId = newAccount.Id,
            StageName = 'Prospecting',
            CloseDate = System.today().addDays(30),
            Amount = opportunityAmount
        );
        
        // Insert the Opportunity record
        insert newOpportunity;
    }
}