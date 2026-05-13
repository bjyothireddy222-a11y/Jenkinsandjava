package com.example;

public class Application {

    public static void main(String[] args) {

        System.out.println("Java App Running Successfully!");

        while (true) {
            try {
                Thread.sleep(10000);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
