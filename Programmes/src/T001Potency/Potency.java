package T001Potency;

public class Potency {
    public static void main(String[] args) {
        Potency potency = new Potency();
        // Hier nichts verändern
        System.out.println(potency.calculatePotency(2, 6));
    }

    /*
    TODO: Die Methode calculatePotency soll die Potenz von a hoch b (a^b) lösen
     d.h es soll b mal (a * a * ...) gerechnet werden
     Regeln (damit die Aufgabe nicht so schwer wird):
     - wenn b kleiner als 0 ist soll 0 zurückgegeben werden
     - wenn b gleich 0 ist soll 1 zurückgegeben werden
     */
    public int calculatePotency(int a, int b) {
        return 0;
    }
}
