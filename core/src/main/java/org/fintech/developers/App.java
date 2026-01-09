package org.fintech.developers;

/**
 * Main application class demonstrating Java 21 features
 */
public class App {
    public static void main(String[] args) {
        System.out.println("Hello from Java 21!");
        
        // Demonstrate some Java 21 features
        demonstrateStringTemplates();
        demonstratePatternMatching();

    }
    
    private static void demonstrateStringTemplates() {
        String name = "Java";
        int version = 21;
        System.out.println("\n=== String Interpolation ===");
        System.out.println("Welcome to " + name + " " + version + "!");
    }
    
    private static void demonstratePatternMatching() {
        System.out.println("\n=== Pattern Matching ===");
        Object obj = "Hello, Pattern Matching!";
        
        if (obj instanceof String s) {
            System.out.println("String length: " + s.length());
        }
    }
    

}
