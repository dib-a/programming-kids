package P008Array2;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class Array2Test {
    @Test
    public void testGetBiggestNumber1() {
        Array2 array = new Array2();
        int[] test = {1, 2, 3, 4, 5, 6, 7, 8, 9};
        int actual = array.getBiggestNumber(test);
        int expected = 9;
        runTest(expected, actual);
    }

    @Test
    public void testGetBiggestNumber2() {
        Array2 array = new Array2();
        int[] test = {6, 7, 100, 8, 9};
        int actual = array.getBiggestNumber(test);
        int expected = 100;
        runTest(expected, actual);
    }

    @Test
    public void testSmallestNumber1() {
        Array2 array = new Array2();
        int[] test = {6, 7, 100, 8, 9};
        int actual = array.getSmallestNumber(test);
        int expected = 6;
        runTest(expected, actual);
    }

    @Test
    public void testSmallestNumber2() {
        Array2 array = new Array2();
        int[] test = {1, 2, 3, 4, 5, 6, 7, 8, 9};
        int actual = array.getSmallestNumber(test);
        int expected = 1;
        runTest(expected, actual);
    }

    @Test
    public void testNumberOfOccurrencesOf11() {
        Array2 array = new Array2();
        int[] test = {1, 2, 3, 4, 5, 6, 7, 8, 9};
        int actual = array.getNumberOfOccurrenceOf1(test);
        int expected = 1;
        runTest(expected, actual);
    }

    @Test
    public void testNumberOfOccurrencesOf12() {
        Array2 array = new Array2();
        int[] test = {1, 2, 3, 1, 5, 6, 1, 1, 9};
        int actual = array.getNumberOfOccurrenceOf1(test);
        int expected = 4;
        runTest(expected, actual);
    }

    @Test
    public void testNumberOfOccurrencesOf13() {
        Array2 array = new Array2();
        int[] test = {0, 2, 3, 4, 5, 6, 7, 8, 9};
        int actual = array.getNumberOfOccurrenceOf1(test);
        int expected = 0;
        runTest(expected, actual);
    }

    private void runTest(int expected, int actual) {
        String message = "Es sollte " + expected + " zurück gegeben werden\n" +
                "Es wurde aber " + actual + " zurück gegeben\n";
        assertEquals(message, expected, actual);
    }
}
