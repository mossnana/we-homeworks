package com.example.project;


public class MyClass {
    public int multiply(int x, int y) {
        if(x > 999) {
            throw new IllegalArgumentException("Number > 999");
        }
        return x / y;
    }
}
