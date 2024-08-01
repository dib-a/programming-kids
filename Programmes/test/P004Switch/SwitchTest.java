package P004Switch;

import org.junit.Test;

import static org.junit.Assert.assertTrue;

public class SwitchTest {

    @Test
    public void checkMonday() {
        Switch switch1 = new Switch();
        assertTrue("\nEs sollte Montag Ausgegeben werden. Es wurde aber " + switch1.checkWeekDay(1) + " ausgegeben", "Montag".equalsIgnoreCase(switch1.checkWeekDay(1)));
    }

    @Test
    public void checkTuesday() {
        Switch switch1 = new Switch();
        assertTrue("\nEs sollte Montag Ausgegeben werden. Es wurde aber " + switch1.checkWeekDay(2) + " ausgegeben", "Dienstag".equalsIgnoreCase(switch1.checkWeekDay(2)));
    }

    @Test
    public void checkWednesday() {
        Switch switch1 = new Switch();
        assertTrue("\nEs sollte Montag Ausgegeben werden. Es wurde aber " + switch1.checkWeekDay(3) + " ausgegeben", "Mittwoch".equalsIgnoreCase(switch1.checkWeekDay(3)));
    }

    @Test
    public void checkThursday() {
        Switch switch1 = new Switch();
        assertTrue("\nEs sollte Montag Ausgegeben werden. Es wurde aber " + switch1.checkWeekDay(4) + " ausgegeben", "Donnerstag".equalsIgnoreCase(switch1.checkWeekDay(4)));
    }

    @Test
    public void checkFriday() {
        Switch switch1 = new Switch();
        assertTrue("\nEs sollte Montag Ausgegeben werden. Es wurde aber " + switch1.checkWeekDay(5) + " ausgegeben", "Freitag".equalsIgnoreCase(switch1.checkWeekDay(5)));
    }

    @Test
    public void checkSaturday() {
        Switch switch1 = new Switch();
        assertTrue("\nEs sollte Montag Ausgegeben werden. Es wurde aber " + switch1.checkWeekDay(6) + " ausgegeben", "Samstag".equalsIgnoreCase(switch1.checkWeekDay(6)));
    }

    @Test
    public void checkSunday() {
        Switch switch1 = new Switch();
        assertTrue("\nEs sollte Montag Ausgegeben werden. Es wurde aber " + switch1.checkWeekDay(7) + " ausgegeben", "Sonntag".equalsIgnoreCase(switch1.checkWeekDay(7)));
    }

    @Test
    public void checkElse1() {
        Switch switch1 = new Switch();
        assertTrue("\nEs sollte \"Kein Wochentag\" Ausgegeben werden. Es wurde aber " + switch1.checkWeekDay(7) + " ausgegeben", "kein Wochentag".equalsIgnoreCase(switch1.checkWeekDay(0)));
    }

    @Test
    public void checkElse2() {
        Switch switch1 = new Switch();
        assertTrue("\nEs sollte \"Kein Wochentag\" Ausgegeben werden. Es wurde aber " + switch1.checkWeekDay(7) + " ausgegeben", "kein Wochentag".equalsIgnoreCase(switch1.checkWeekDay(100)));
    }
}
