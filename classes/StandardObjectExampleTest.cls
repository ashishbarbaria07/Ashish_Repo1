@isTest
public class StandardObjectExampleTest {

    @isTest
    static void testCreateAccountWithContactAndOpportunity() {
        
        // Step 1: Set up test data
        String testAccountName = 'Test Account';
        String testContactFirstName = 'John';
        String testContactLastName = 'Doe';
        String testOpportunityName = 'Test Opportunity';
        Decimal testOpportunityAmount = 10000.00;
        
        // Step 2: Start the test
        Test.startTest();
        
        // Call the method to create Account, Contact, and Opportunity
        StandardObjectExample.createAccountWithContactAndOpportunity(
            testAccountName, testContactFirstName, testContactLastName, testOpportunityName, testOpportunityAmount
        );
        
        // Step 3: Stop the test
        Test.stopTest();

        // Step 4: Query and verify the inserted records

        // Query Account
        Account insertedAccount = [SELECT Id, Name, Industry FROM Account WHERE Name = :testAccountName LIMIT 1];
        System.assertNotEquals(null, insertedAccount, 'Account should have been inserted.');
        System.assertEquals('Technology', insertedAccount.Industry, 'Account industry should be Technology.');

        // Query Contact
        Contact insertedContact = [SELECT Id, FirstName, LastName, AccountId FROM Contact WHERE AccountId = :insertedAccount.Id LIMIT 1];
        System.assertNotEquals(null, insertedContact, 'Contact should have been inserted.');
        System.assertEquals(testContactFirstName, insertedContact.FirstName, 'Contact first name should match.');
        System.assertEquals(testContactLastName, insertedContact.LastName, 'Contact last name should match.');

        // Query Opportunity
        Opportunity insertedOpportunity = [SELECT Id, Name, Amount, AccountId, StageName FROM Opportunity WHERE AccountId = :insertedAccount.Id LIMIT 1];
        System.assertNotEquals(null, insertedOpportunity, 'Opportunity should have been inserted.');
        System.assertEquals(testOpportunityName, insertedOpportunity.Name, 'Opportunity name should match.');
        System.assertEquals(testOpportunityAmount, insertedOpportunity.Amount, 'Opportunity amount should match.');
    }
}