public class AccountController {

    // Method to update account name
    public static void updateAccountName(Account acc, String newName) {
        if (acc != null && String.isNotBlank(newName)) {
            acc.Name = newName; // Update the Name field of the Account
            update acc; // Perform the update operation
        } else {
            throw new IllegalArgumentException('Invalid input: Account is null or newName is blank.');
        }
    }

    // Method to delete an account without validation
    public static void deleteAccountWithoutValidation(String accountId) {
        if (String.isNotBlank(accountId)) {
            // Fetch the account record based on the ID
            List<Account> accList = [SELECT Id, Name FROM Account WHERE Id = :accountId LIMIT 1];

            if (!accList.isEmpty()) {
                Account accToDelete = accList[0]; // Get the first record from the list
                delete accToDelete; // Delete the record
                System.debug('Account deleted successfully: ' + accToDelete.Name);
            } else {
                throw new IllegalArgumentException('No account found with the provided ID.');
            }
        } else {
            throw new IllegalArgumentException('Invalid input: accountId is blank.');
        }
    }
}