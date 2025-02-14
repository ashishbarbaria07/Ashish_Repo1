public class Star {

    public String name;
    public Integer magnitude;

    // Constructor
    public Star(String starName, Integer starMagnitude) {
        this.name = starName;
        this.magnitude = starMagnitude;
    }

    // Method to display star information
    public void displayStarInfo() {
        System.debug('Star Name: ' + this.name);
        System.debug('Magnitude: ' + this.magnitude);
    }


    // Example of a static method (doesn't require an instance of the class)
    public static String getStarClassification(Integer magnitude) {
        if (magnitude < 0) {
            return 'Bright Star';
        } else if (magnitude < 3) {
            return 'Visible Star';
        } else {
            return 'Faint Star';
        }
    }


    // Example of instance method showing use of instance variables
    public Boolean isBrighterThan(Star otherStar) {
        return this.magnitude < otherStar.magnitude;
    }


    // Example of another instance method
    public String  getDescription() {
        return 'This is the ' + this.name + ' star. Its magnitude is ' + this.magnitude + '.';
    }


}