public class HealthCalculator {
    // Method to calculate BMI given weight in kilograms and height in meters
    public static Decimal calculateBMI(Decimal weightKg, Decimal heightM) {
        // BMI formula: BMI = weight (kg) / (height (m) ^ 2)
        Decimal bmi = weightKg / (heightM * heightM);
        return bmi;
    }
}