package com.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.*;

@SpringBootApplication
@RestController
@RequestMapping("/api/calculator")
public class Calculator {

    public static void main(String[] args) {
        SpringApplication.run(Calculator.class, args);
    }

    @GetMapping("/add")
    public String add(@RequestParam int a, @RequestParam int b) {
        int result = a + b;
        return "{\"operation\": \"add\", \"a\": " + a + ", \"b\": " + b + ", \"result\": " + result + "}";
    }

    @GetMapping("/subtract")
    public String subtract(@RequestParam int a, @RequestParam int b) {
        int result = a - b;
        return "{\"operation\": \"subtract\", \"a\": " + a + ", \"b\": " + b + ", \"result\": " + result + "}";
    }

    @GetMapping("/multiply")
    public String multiply(@RequestParam int a, @RequestParam int b) {
        int result = a * b;
        return "{\"operation\": \"multiply\", \"a\": " + a + ", \"b\": " + b + ", \"result\": " + result + "}";
    }

    @GetMapping("/divide")
    public String divide(@RequestParam int a, @RequestParam int b) {
        if (b == 0) return "{\"error\": \"Cannot divide by zero\"}";
        double result = (double) a / b;
        return "{\"operation\": \"divide\", \"a\": " + a + ", \"b\": " + b + ", \"result\": " + result + "}";
    }

    @GetMapping("/health")
    public String health() {
        return "{\"status\": \"UP\", \"message\": \"Calculator API is running!\"}";
    }
}
