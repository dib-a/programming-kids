package P006LoopFor;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class LoopForTest {
    @Test
    public void testCalculateSum() {
        LoopFor calculator = new LoopFor();
        int erwarteteSumme = 5050;
        int actualSum = calculator.calculateSum();
        assertEquals("\nDie berechnete Summe der Zahlen von 1 bis 100 ist nicht korrekt\nEs Ergebnis sollte " +
                erwarteteSumme + " sein, war aber " + actualSum + "; ", erwarteteSumme, actualSum);
    }
}