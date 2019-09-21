package com.example.project;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.fail;
import org.junit.jupiter.api.Test;

class MyClassTests {
    @Test
    public void testMultiply() {
        fail("Not Implemented");
        // No Input
        // Output : org.opentest4j.AssertionFailedError: Not Implemented
    }

    @Test
    public void testSimpleMultiply() {
        MyClass tester = new MyClass();
        assertEquals(15, tester.multiply(10, 5));
    }

    @Test
    public void testDividedByZero() {
        MyClass tester = new MyClass();
        tester.multiply(10, 0);
    }

    @Test
    public void testByZero() {
        MyClass tester = new MyClass();
        assertEquals(0, tester.multiply(0, 7));
    }

    @Test
    public void testByMaxPlus() {
        MyClass tester = new MyClass();
        tester.multiply(1000, 1);
        // Output : java.lang.IllegalArgumentException: Number > 999 
    }

    @Test
    public void testByMax() {
        MyClass tester = new MyClass();
        assertEquals(998, tester.multiply(998, 1));
    }
}