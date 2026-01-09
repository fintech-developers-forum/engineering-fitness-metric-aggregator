#!/bin/bash

# Create project root directory
cd core

# Create Maven directory structure
mkdir -p src/main/java/com/example
mkdir -p src/main/resources
mkdir -p src/test/java/com/example
mkdir -p src/test/resources

# Create pom.xml
cat > pom.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 
         http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.example</groupId>
    <artifactId>my-app</artifactId>
    <version>1.0-SNAPSHOT</version>
    <packaging>jar</packaging>

    <name>my-app</name>
    <description>A Maven project using Java 21</description>

    <properties>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        <maven.compiler.source>21</maven.compiler.source>
        <maven.compiler.target>21</maven.compiler.target>
        <maven.compiler.release>21</maven.compiler.release>
    </properties>

    <dependencies>
        <!-- JUnit 5 for testing -->
        <dependency>
            <groupId>org.junit.jupiter</groupId>
            <artifactId>junit-jupiter</artifactId>
            <version>5.10.1</version>
            <scope>test</scope>
        </dependency>
    </dependencies>

    <build>
        <plugins>
            <!-- Maven Compiler Plugin -->
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.12.1</version>
                <configuration>
                    <source>21</source>
                    <target>21</target>
                    <release>21</release>
                </configuration>
            </plugin>

            <!-- Maven Surefire Plugin for running tests -->
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-surefire-plugin</artifactId>
                <version>3.2.3</version>
            </plugin>

            <!-- Maven Jar Plugin for executable JAR -->
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-jar-plugin</artifactId>
                <version>3.3.0</version>
                <configuration>
                    <archive>
                        <manifest>
                            <mainClass>com.example.App</mainClass>
                        </manifest>
                    </archive>
                </configuration>
            </plugin>
        </plugins>
    </build>
</project>
EOF

# Create main application class
cat > src/main/java/com/example/App.java << 'EOF'
package com.example;

/**
 * Main application class demonstrating Java 21 features
 */
public class App {
    public static void main(String[] args) {
        System.out.println("Hello from Java 21!");
        
        // Demonstrate some Java 21 features
        demonstrateStringTemplates();
        demonstratePatternMatching();
        demonstrateRecords();
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
    
    private static void demonstrateRecords() {
        System.out.println("\n=== Records ===");
        Person person = new Person("Alice", 30);
        System.out.println(person);
        System.out.println("Name: " + person.name());
        System.out.println("Age: " + person.age());
    }
}
EOF

# Create a Record class (Java 21 feature)
cat > src/main/java/com/example/Person.java << 'EOF'
package com.example;

/**
 * Record class demonstrating Java records feature
 */
public record Person(String name, int age) {
    
    // Compact constructor with validation
    public Person {
        if (age < 0) {
            throw new IllegalArgumentException("Age cannot be negative");
        }
    }
    
    // Additional method
    public boolean isAdult() {
        return age >= 18;
    }
}
EOF

# Create a utility class
cat > src/main/java/com/example/Calculator.java << 'EOF'
package com.example;

/**
 * Simple calculator utility class
 */
public class Calculator {
    
    public int add(int a, int b) {
        return a + b;
    }
    
    public int subtract(int a, int b) {
        return a - b;
    }
    
    public int multiply(int a, int b) {
        return a * b;
    }
    
    public double divide(int a, int b) {
        if (b == 0) {
            throw new IllegalArgumentException("Cannot divide by zero");
        }
        return (double) a / b;
    }
}
EOF

# Create test class for App
cat > src/test/java/com/example/AppTest.java << 'EOF'
package com.example;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

/**
 * Unit tests for App class
 */
class AppTest {
    
    @Test
    void testApplicationRuns() {
        // Test that main method executes without exceptions
        assertDoesNotThrow(() -> App.main(new String[]{}));
    }
}
EOF

# Create test class for Person
cat > src/test/java/com/example/PersonTest.java << 'EOF'
package com.example;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

/**
 * Unit tests for Person record
 */
class PersonTest {
    
    @Test
    void testPersonCreation() {
        Person person = new Person("Alice", 30);
        assertEquals("Alice", person.name());
        assertEquals(30, person.age());
    }
    
    @Test
    void testIsAdult() {
        Person adult = new Person("Bob", 25);
        Person minor = new Person("Charlie", 15);
        
        assertTrue(adult.isAdult());
        assertFalse(minor.isAdult());
    }
    
    @Test
    void testNegativeAge() {
        assertThrows(IllegalArgumentException.class, () -> {
            new Person("Invalid", -5);
        });
    }
}
EOF

# Create test class for Calculator
cat > src/test/java/com/example/CalculatorTest.java << 'EOF'
package com.example;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

/**
 * Unit tests for Calculator class
 */
class CalculatorTest {
    
    private Calculator calculator;
    
    @BeforeEach
    void setUp() {
        calculator = new Calculator();
    }
    
    @Test
    void testAdd() {
        assertEquals(5, calculator.add(2, 3));
        assertEquals(0, calculator.add(-1, 1));
    }
    
    @Test
    void testSubtract() {
        assertEquals(1, calculator.subtract(3, 2));
        assertEquals(-2, calculator.subtract(1, 3));
    }
    
    @Test
    void testMultiply() {
        assertEquals(6, calculator.multiply(2, 3));
        assertEquals(0, calculator.multiply(5, 0));
    }
    
    @Test
    void testDivide() {
        assertEquals(2.0, calculator.divide(6, 3));
        assertEquals(2.5, calculator.divide(5, 2));
    }
    
    @Test
    void testDivideByZero() {
        assertThrows(IllegalArgumentException.class, () -> {
            calculator.divide(5, 0);
        });
    }
}
EOF

# Create .gitignore
cat > .gitignore << 'EOF'
# Maven
target/
pom.xml.tag
pom.xml.releaseBackup
pom.xml.versionsBackup
pom.xml.next
release.properties
dependency-reduced-pom.xml
buildNumber.properties

# IDE
.idea/
*.iml
.vscode/
.settings/
.project
.classpath

# OS
.DS_Store
Thumbs.db
EOF

# Create README
cat > README.md << 'EOF'
# Maven Java 21 Project

A sample Maven project demonstrating Java 21 features.

## Prerequisites

- Java 21 or higher
- Maven 3.6 or higher

## Project Structure

```
my-app/
├── pom.xml
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/example/
│   │   │       ├── App.java
│   │   │       ├── Person.java
│   │   │       └── Calculator.java
│   │   └── resources/
│   └── test/
│       ├── java/
│       │   └── com/example/
│       │       ├── AppTest.java
│       │       ├── PersonTest.java
│       │       └── CalculatorTest.java
│       └── resources/
└── README.md
```

## Building the Project

```bash
# Compile the project
mvn clean compile

# Run tests
mvn test

# Package as JAR
mvn package

# Run the application
java -jar target/my-app-1.0-SNAPSHOT.jar
# Or
mvn exec:java -Dexec.mainClass="com.example.App"
```

## Features Demonstrated

- Java Records
- Pattern Matching
- JUnit 5 Testing
- Maven build configuration

## License

This project is open source and available under the MIT License.
EOF

echo "✅ Maven Java 21 project created successfully!"
echo ""
echo "📁 Project structure:"
tree -L 3 my-app 2>/dev/null || find my-app -type f -o -type d | head -20
echo ""
echo "🚀 Next steps:"
echo "   cd my-app"
echo "   mvn clean compile"
echo "   mvn test"
echo "   mvn package"
echo "   java -jar target/my-app-1.0-SNAPSHOT.jar"
