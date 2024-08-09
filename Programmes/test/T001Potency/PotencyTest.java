package T001Potency;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class PotencyTest {

    @Test
    public void testCalculatePotencyWithPositiveExponents() {
        Potency potency = new Potency();
        assertEquals("\nEs sollte 1 ausgegeben werden, es wurde aber " +
                        potency.calculatePotency(5, 0) + " ausgegeben",
                1, potency.calculatePotency(5, 0));
        assertEquals("\nEs sollte 5 ausgegeben werden, es wurde aber " +
                        potency.calculatePotency(5, 1) + " ausgegeben",
                5, potency.calculatePotency(5, 1));
        assertEquals("\nEs sollte 25 ausgegeben werden, es wurde aber " +
                        potency.calculatePotency(5, 2) + " ausgegeben",
                25, potency.calculatePotency(5, 2));
        assertEquals("\nEs sollte 125 ausgegeben werden, es wurde aber " +
                        potency.calculatePotency(5, 3) + " ausgegeben",
                125, potency.calculatePotency(5, 3));
    }

    @Test
    public void testCalculatePotencyWithNegativeExponents() {
        Potency potency = new Potency();
        assertEquals("\nEs sollte 0 ausgegeben werden, es wurde aber " +
                        potency.calculatePotency(2, -1) + " ausgegeben",
                0, potency.calculatePotency(2, -1));
        assertEquals("\nEs sollte 0 ausgegeben werden, es wurde aber " +
                        potency.calculatePotency(5, -3) + " ausgegeben",
                0, potency.calculatePotency(5, -3));
    }

    @Test
    public void testCalculatePotencyWithBaseZero() {
        Potency potency = new Potency();
        assertEquals("\nEs sollte 0 ausgegeben werden, es wurde aber " +
                        potency.calculatePotency(0, 1) + " ausgegeben",
                0, potency.calculatePotency(0, 1));
        assertEquals("\nEs sollte 0 ausgegeben werden, es wurde aber " +
                        potency.calculatePotency(0, 5) + " ausgegeben",
                0, potency.calculatePotency(0, 5));
    }

    @Test
    public void testCalculatePotencyWithExponentZero() {
        Potency potency = new Potency();
        assertEquals("\nEs sollte 1 ausgegeben werden, es wurde aber " +
                        potency.calculatePotency(3, 0) + " ausgegeben",
                1, potency.calculatePotency(3, 0));
        assertEquals("\nEs sollte 1 ausgegeben werden, es wurde aber " +
                        potency.calculatePotency(10, 0) + " ausgegeben",
                1, potency.calculatePotency(10, 0));
        assertEquals("\nEs sollte 1 ausgegeben werden, es wurde aber " +
                        potency.calculatePotency(0, 0) + " ausgegeben",
                1, potency.calculatePotency(0, 0));
    }

    @Test
    public void testCalculatePotencyWithLargeNumbers() {
        Potency potency = new Potency();
        assertEquals("\nEs sollte 1024 ausgegeben werden, es wurde aber " +
                        potency.calculatePotency(2, 10) + " ausgegeben",
                1024, potency.calculatePotency(2, 10));
        assertEquals("\nEs sollte 59049 ausgegeben werden, es wurde aber " +
                        potency.calculatePotency(3, 10) + " ausgegeben",
                59049, potency.calculatePotency(3, 10));
    }
}
