public class AreaConverter {

    // Method to convert square meters to square feet
    public static Decimal squareMetersToSquareFeet(Decimal squareMeters) {
        return squareMeters * 10.7639;
    }

    // Method to convert square feet to square meters
    public static Decimal squareFeetToSquareMeters(Decimal squareFeet) {
        return squareFeet / 10.7639;
    }

    // Method to convert square kilometers to square miles
    public static Decimal squareKilometersToSquareMiles(Decimal squareKilometers) {
        return squareKilometers * 0.386102;
    }

    // Method to convert square miles to square kilometers
    public static Decimal squareMilesToSquareKilometers(Decimal squareMiles) {
        return squareMiles / 0.386102;
    }

    // Method to convert square meters to square kilometers
    public static Decimal squareMetersToSquareKilometers(Decimal squareMeters) {
        return squareMeters / 100;
    }

    // Method to convert square kilometers to square meters
    public static Decimal squareKilometersToSquareMeters(Decimal squareKilometers) {
        return squareKilometers * 100;
    }

    // Method to convert acres to square feet
    public static Decimal acresToSquareFeet(Decimal acres) {
        return acres * 43560;
    }

    // Method to convert square feet to acres
    public static Decimal squareFeetToAcres(Decimal squareFeet) {
        return squareFeet / 43560;
    }

    // Method to convert hectares to square meters
    public static Decimal hectaresToSquareMeters(Decimal hectares) {
        return hectares * 100;
    }

    // Method to convert square meters to hectares
    public static Decimal squareMetersToHectares(Decimal squareMeters) {
        return squareMeters / 100;
    }

}