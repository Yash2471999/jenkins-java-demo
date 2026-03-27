package com.demo;

import org.junit.Test;
import static org.junit.Assert.*;

public class CalculatorTest {

    @Test
    public void testAdd() {
        assertEquals(15, 10 + 5);
    }

    @Test
    public void testSubtract() {
        assertEquals(5, 10 - 5);
    }

    @Test
    public void testMultiply() {
        assertEquals(50, 10 * 5);
    }

    @Test
    public void testDivide() {
        assertEquals(2.0, (double) 10 / 5, 0.001);
    }
}
