package org.fintech.developers;

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
