public class ContactManager {
    
    // Method to create a new Contact record and send an email notification
    public static void createContact(String firstName, String lastName, String email) {
        // Check if the email is valid
        if (String.isBlank(email) || !isValidEmail(email)) {
            throw new IllegalArgumentException('Invalid email address.');
        }
        
        // Create new Contact record
        Contact newContact = new Contact(
            FirstName = firstName,
            LastName = lastName,
            Email = email
        );
        
        try {
            // Insert the new contact
            insert newContact;
            
            // Send email notification
            sendEmailNotification(newContact);
            
        } catch (DmlException e) {
            // Handle DML exception (e.g., failure to insert the record)
            System.debug('Error inserting contact: ' + e.getMessage());
            throw new AuraHandledException('Failed to create Contact record.');
        }
    }
    
    // Helper method to validate the email format
    private static Boolean isValidEmail(String email) {
        return email != null && email.contains('@');
    }
    
    // Method to send an email notification to the contact
    private static void sendEmailNotification(Contact contact) {
        // Create an email message
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
        // Set email parameters
        mail.setToAddresses(new String[] { contact.Email });
        mail.setSubject('Welcome to our Service');
        mail.setPlainTextBody('Dear ' + contact.FirstName + ',\n\nThank you for signing up. We look forward to serving you!');
        
        // Send the email
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}