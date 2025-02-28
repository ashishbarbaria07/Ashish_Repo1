public class RandomApexClass {

    // Method to generate a random integer within a specified range (inclusive)
    public static Integer getRandomInteger(Integer min, Integer max) {
        if (min > max) {
            throw new IllegalArgumentException('Min value cannot be greater than max value.');
        }
        return Integer.valueOf(Math.floor(Math.random() * (max - min + 1)) + min);
    }

    // Method to generate a random decimal within a specified range
    public static Decimal getRandomDecimal(Decimal min, Decimal max) {
        if (min > max) {
            throw new IllegalArgumentException('Min value cannot be greater than max value.');
        }
        return (Math.random() * (max - min)) + min;
    }

    // Method to get a random item from a list
    public static String getRandomItemFromList(List<String> items) {
        if (items == null || items.isEmpty()) {
            throw new IllegalArgumentException('The list cannot be null or empty.');
        }
        Integer randomIndex = getRandomInteger(0, items.size() - 1);
        return items[randomIndex];
    }

    // Method to generate a random boolean value (true or false)
    public static Boolean getRandomBoolean() {
        return Math.random() > 0.5;
    }

    // Method to generate a random string of a given length (using alphanumeric characters)
    public static String getRandomString(Integer length) {
        String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        String result = '';
        for (Integer i = 0; i < length; i++) {
            Integer randomIndex = getRandomInteger(0, chars.length() - 1);
            result += chars.substring(randomIndex, randomIndex + 1);
        }
        return result;
    }

    // Method to calculate a random discount (between 5% and 25%)
    public static Decimal getRandomDiscount() {
        return getRandomDecimal(0.05, 0.25);
    }

    // Method to log random values for testing
    public static void logRandomValues() {
        Integer randomInt = getRandomInteger(1, 100);
        Decimal randomDecimal = getRandomDecimal(1.0, 100.0);
        Boolean randomBool = getRandomBoolean();
        List<String> colors = new List<String>{'Red', 'Green', 'Blue', 'Yellow', 'Purple'};
        String randomColor = getRandomItemFromList(colors);
        String randomString = getRandomString(8);
        Decimal randomDiscount = getRandomDiscount();

        System.debug('Random Integer: ' + randomInt);
        System.debug('Random Decimal: ' + randomDecimal);
        System.debug('Random Boolean: ' + randomBool);
        System.debug('Random Color: ' + randomColor);
        System.debug('Random String: ' + randomString);
        System.debug('Random Discount: ' + randomDiscount);
    }
}