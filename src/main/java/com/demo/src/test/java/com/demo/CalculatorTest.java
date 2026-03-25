package com.demo;

import org.junit.Test;
import static org.junit.Assert.*;

public class CalculatorTest {

    Calculator calc = new Calculator();

    @Test
    public void testAdd() {
        assertEquals(15, calc.add(10, 5));
    }

    @Test
    public void testSubtract() {
        assertEquals(5, calc.subtract(10, 5));
    }

    @Test
    public void testMultiply() {
        assertEquals(50, calc.multiply(10, 5));
    }

    @Test
    public void testDivide() {
        assertEquals(2.0, calc.divide(10, 5), 0.001);
    }

    @Test(expected = ArithmeticException.class)
    public void testDivideByZero() {
        calc.divide(10, 0);
    }
}
