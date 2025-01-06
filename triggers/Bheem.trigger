trigger Bheem on Donation__c (before insert, before update) {
    for (Donation__c donation : Trigger.new) {
        // Check if Donor Name or Donation Amount is missing
        if (String.isBlank(donation.Donor_Name__c)) {
            donation.addError('Donor Name cannot be blank.');
        }
        if (donation.Donation_Amount__c == null || donation.Donation_Amount__c <= 0) {
            donation.addError('Donation Amount must be greater than 0.');
        }
    }
}