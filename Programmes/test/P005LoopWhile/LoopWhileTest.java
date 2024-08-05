package P005LoopWhile;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class LoopWhileTest {
    @Test
    public void testCalculateSum() {
        LoopWhile calculator = new LoopWhile();
        int erwarteteSumme = 5050;
        int actualSum = calculator.calculateSum();
        assertEquals("\nDie berechnete Summe der Zahlen von 1 bis 100 ist nicht korrekt\nEs Ergebnis sollte " +
                erwarteteSumme + " sein, war aber " + actualSum + "; ", erwarteteSumme, actualSum);
    }
}
