package P007Array;

import java.util.Arrays;

public class Array {
    public static void main(String[] args) {
        Array array = new Array();
        int[] zahlen = {1, 2, 3, 4, 5, 6, 7, 8, 9};
        System.out.println(Arrays.toString(zahlen));
        System.out.println("Erste Zahl: " + array.firstValue(zahlen));
        System.out.println("Letzte Zahl: " + array.lastValue(zahlen));
        System.out.println("Summe aller Zahlen: " + array.calcSum(zahlen));
    }

    /*
    TODO: Gebe den ersten Wert aus dem Array zurück
     */
    public int firstValue(int[] zahlen) {
        return 0;
    }

    /*
    TODO: Gebe den letzten Wert im Array zurück
     */
    public int lastValue(int[] zahlen) {
        return 0;
    }

    /*
    TODO: Gebe die Summe aller Elemente im Array zurück
     */
    public int calcSum(int[] zahlen) {
        return 0;
    }
}
