package P003ConditionIf;

import org.junit.Test;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class ConditionIfTest {

    @Test
    public void testCheckAgeUnderage() {
        ConditionIf condition = new ConditionIf();
        assertFalse("Age 17 should be considered underage.", condition.checkAge(17));
    }

    @Test
    public void testCheckAgeOfAge() {
        ConditionIf condition = new ConditionIf();
        assertTrue("Age 18 should be considered of age.", condition.checkAge(18));
    }

    @Test
    public void testCheckAgeAboveAge() {
        ConditionIf condition = new ConditionIf();
        assertTrue("Age 19 should be considered of age.", condition.checkAge(19));
    }

    @Test
    public void testCheckAgeBoundary() {
        ConditionIf condition = new ConditionIf();
        assertFalse("Age 0 should be considered underage.", condition.checkAge(0));
        assertFalse("Age 17 should be considered underage.", condition.checkAge(17));
        assertTrue("Age 18 should be considered of age.", condition.checkAge(18));
        assertTrue("Age 100 should be considered of age.", condition.checkAge(100));
    }
}
