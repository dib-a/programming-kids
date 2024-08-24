package P007Array;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class ArrayTest {
    @Test
    public void testFirstValue1() {
        Array array = new Array();
        int[] zahlen = {1, 2, 3, 4, 5, 6, 7, 8, 9};
        int expected = 1;
        int actual = array.firstValue(zahlen);
        String message = "Es sollte " + expected + " zurück gegeben werden\n" +
                "Es wurde aber " + actual + " zurück gegeben\n";
        assertEquals(message, expected, actual);
    }

    @Test
    public void testLastValue1() {
        Array array = new Array();
        int[] zahlen = {1, 2, 3, 4, 5, 6, 7, 8, 9};
        int expected = 9;
        int actual = array.lastValue(zahlen);
        String message = "Es sollte " + expected + " zurück gegeben werden\n" +
                "Es wurde aber " + actual + " zurück gegeben\n";
        assertEquals(message, expected, actual);
    }

    @Test
    public void testCalcValue1() {
        Array array = new Array();
        int[] zahlen = {1, 2, 3, 4, 5, 6, 7, 8, 9};
        int expected = 45;
        int actual = array.calcSum(zahlen);
        String message = "Es sollte " + expected + " zurück gegeben werden\n" +
                "Es wurde aber " + actual + " zurück gegeben\n";
        assertEquals(message, expected, actual);
    }

    @Test
    public void testFirstValue2() {
        Array array = new Array();
        int[] zahlen = {3, 4, 5, 6, 7};
        int expected = 3;
        int actual = array.firstValue(zahlen);
        String message = "Es sollte " + expected + " zurück gegeben werden\n" +
                "Es wurde aber " + actual + " zurück gegeben\n";
        assertEquals(message, expected, actual);
    }

    @Test
    public void testLastValue2() {
        Array array = new Array();
        int[] zahlen = {3, 4, 5, 6, 7};
        int expected = 7;
        int actual = array.lastValue(zahlen);
        String message = "Es sollte " + expected + " zurück gegeben werden\n" +
                "Es wurde aber " + actual + " zurück gegeben\n";
        assertEquals(message, expected, actual);
    }

    @Test
    public void testCalcValue3() {
        Array array = new Array();
        int[] zahlen = {3, 4, 5, 6, 7};
        int expected = 25;
        int actual = array.calcSum(zahlen);
        String message = "Es sollte " + expected + " zurück gegeben werden\n" +
                "Es wurde aber " + actual + " zurück gegeben\n";
        assertEquals(message, expected, actual);
    }
}
