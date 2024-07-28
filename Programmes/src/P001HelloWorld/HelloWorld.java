package P001HelloWorld;

public class HelloWorld {
    public static void main(String[] args) {
        // Hier wird ein Objekt von (der Klasse) HelloWorld erzeugt
        HelloWorld helloWorld = new HelloWorld();
        // Hier wird die Methode sayHello() aufgerufen
        helloWorld.sayHello();
    }

    //TODO: Das Programm soll "Hello World!" ausgeben
    public void sayHello() {
        System.out.println("Hello");
    }
}
