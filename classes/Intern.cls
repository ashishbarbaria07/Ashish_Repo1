public class Intern {
    // Method to update Title field on Contact records
    public static void updateContactTitle(List<Contact> contacts) {
        for(Contact con : contacts) {
            // Update the Title field to 'Intern'
            con.Title = 'Intern';
        }
        update contacts;  // Perform the DML operation to save changes
    }
}