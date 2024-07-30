package P003ConditionIf;

import org.junit.Test;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class ConditionIfTest {

    @Test
    public void testCheckAgeUnderage() {
        ConditionIf condition = new ConditionIf();
        assertFalse("Alter 17 ist nicht größer oder gleich 18", condition.checkAge(17));
    }

    @Test
    public void testCheckAgeOfAge() {
        ConditionIf condition = new ConditionIf();
        assertTrue("Alter 18 ist größer oder gleich 18.", condition.checkAge(18));
    }

    @Test
    public void testCheckAgeAboveAge() {
        ConditionIf condition = new ConditionIf();
        assertTrue("Alter 19 ist größer oder gleich 18", condition.checkAge(19));
    }

    @Test
    public void testCheckAgeBoundary() {
        ConditionIf condition = new ConditionIf();
        assertFalse("Alter 0 ist nicht größer oder gleich 18.", condition.checkAge(0));
        assertFalse("Alter 17 ist nicht größer oder gleich 18", condition.checkAge(17));
        assertTrue("Alter 18 ist größer oder gleich 18", condition.checkAge(18));
        assertTrue("Alter 100 ist größer oder gleich 18", condition.checkAge(100));
    }
}
