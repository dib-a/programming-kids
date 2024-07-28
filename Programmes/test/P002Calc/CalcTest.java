package P002Calc;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;

import static org.junit.Assert.assertEquals;

public class CalcTest {

    private final ByteArrayOutputStream outContent = new ByteArrayOutputStream();
    private final PrintStream originalOut = System.out;

    @Before
    public void setUpStreams() {
        System.setOut(new PrintStream(outContent));
    }

    @After
    public void restoreStreams() {
        System.setOut(originalOut);
    }

    @Test
    public void testAdd() {
        Calc calc = new Calc();
        assertEquals(calc.add(1.0, 2.0), 3, 0.1);
    }

    @Test
    public void testSub() {
        Calc calc = new Calc();
        assertEquals(calc.sub(2.0, 1.0), 1, 0.1);
    }

    @Test
    public void testMul() {
        Calc calc = new Calc();
        assertEquals(calc.mul(2.0, 3.0), 6, 0.1);
    }

    @Test
    public void testDiv() {
        Calc calc = new Calc();
        assertEquals(calc.div(5.0, 2.0), 2.5, 0.1);
    }

}
