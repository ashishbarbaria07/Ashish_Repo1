public class NewHireNotifier {

    // Method to create Account, Contact, and Opportunity, then update them
    public static String createAndUpdateOpportunity(String accountName, String contactFirstName, String contactLastName, String opportunityName, Decimal opportunityAmount) {
        if (String.isEmpty(accountName) || String.isEmpty(contactFirstName) || String.isEmpty(contactLastName) || String.isEmpty(opportunityName) || opportunityAmount == null) {
            return 'Missing required fields';
        }

        // Create a new Account record
        Account newAccount = new Account(Name = accountName);
        insert newAccount;

        // Create a new Contact record and associate it with the Account
        Contact newContact = new Contact(FirstName = contactFirstName, LastName = contactLastName, AccountId = newAccount.Id);
        insert newContact;

        // Create a new Opportunity record and associate it with the Account and Contact
        Opportunity newOpportunity = new Opportunity(
            Name = opportunityName,
            AccountId = newAccount.Id,
            ContactId = newContact.Id,
            StageName = 'Prospecting',
            CloseDate = System.today().addMonths(1),
            Amount = opportunityAmount
        );
        insert newOpportunity;

        // Update the Opportunity's Amount and Name
        newOpportunity.Amount = opportunityAmount + 5000;
        newOpportunity.Name = opportunityName + ' - Updated';
        update newOpportunity;

        // Update the Contact's Last Name
        newContact.LastName = contactLastName + ' - Updated';
        update newContact;

        // Update the Account's Name
        newAccount.Name = accountName + ' - Updated';
        update newAccount;

        return 'Opportunity, Account, and Contact created and updated successfully';
    }
}