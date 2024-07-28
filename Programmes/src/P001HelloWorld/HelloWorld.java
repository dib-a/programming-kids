package P001HelloWorld;

public class HelloWorld {
    public void sayHello() {
        System.out.println("Hello");
    }

    //TODO: Das Programm soll "Hello World!" ausgeben
    public static void main(String[] args) {
        HelloWorld helloWorld = new HelloWorld();
        helloWorld.sayHello();
    }
}
