package P004LoopWhile;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class LoopWhileTest {
    @Test
    public void testCalculateSum() {
        LoopWhile calculator = new LoopWhile();
        int erwarteteSumme = 2550;
        int actualSum = calculator.calculateSum();
        assertEquals("Die berechnete Summe der geraden Zahlen von 1 bis 100 ist nicht korrekt", erwarteteSumme, actualSum);
    }
}
