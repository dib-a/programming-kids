package T001Potency;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class PotencyTest {

    @Test
    public void testCalculatePotencyWithPositiveExponents() {
        Potency potency = new Potency();
        assertEquals(1, potency.calculatePotency(5, 0));  // Test für a^0 = 1
        assertEquals(5, potency.calculatePotency(5, 1));  // Test für a^1 = a
        assertEquals(25, potency.calculatePotency(5, 2)); // Test für 5^2 = 25
        assertEquals(125, potency.calculatePotency(5, 3)); // Test für 5^3 = 125
    }

    @Test
    public void testCalculatePotencyWithNegativeExponents() {
        Potency potency = new Potency();
        assertEquals(0, potency.calculatePotency(2, -1));  // Test für negative Exponenten, erwartet wird 0
        assertEquals(0, potency.calculatePotency(5, -3));  // Test für negative Exponenten, erwartet wird 0
    }

    @Test
    public void testCalculatePotencyWithBaseZero() {
        Potency potency = new Potency();
        assertEquals(0, potency.calculatePotency(0, 1));  // Test für 0^1 = 0
        assertEquals(0, potency.calculatePotency(0, 5));  // Test für 0^n = 0, n > 0
    }

    @Test
    public void testCalculatePotencyWithExponentZero() {
        Potency potency = new Potency();
        assertEquals(1, potency.calculatePotency(3, 0));  // Test für a^0 = 1, a > 0
        assertEquals(1, potency.calculatePotency(10, 0)); // Test für a^0 = 1, a > 0
        assertEquals(1, potency.calculatePotency(0, 0));  // Test für 0^0, normalerweise 1
    }

    @Test
    public void testCalculatePotencyWithLargeNumbers() {
        Potency potency = new Potency();
        assertEquals(1024, potency.calculatePotency(2, 10));  // Test für 2^10 = 1024
        assertEquals(59049, potency.calculatePotency(3, 10)); // Test für 3^10 = 59049
    }
}
