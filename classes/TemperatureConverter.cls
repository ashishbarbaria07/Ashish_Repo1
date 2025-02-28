public class TemperatureConverter {
    
    // Method to convert Fahrenheit to Celsius
    public static Double fahrenheitToCelsius(Double fahrenheit) {
        // Formula to convert Fahrenheit to Celsius: (F - 32) * 5/9
        Double celsius = (fahrenheit - 32) * 5 / 9;
        return celsius;
    }
     //i created this hehe
    // Optional: You can also create a method to convert Celsius to Fahrenheit if needed
    public static Double celsiusToFahrenheit(Double celsius) {
        // Formula to convert Celsius to Fahrenheit: (C * 9/5) + 32
        Double fahrenheit = (celsius * 9 / 5) + 32;
        return fahrenheit;
    }
}