package com.example.ss12b1;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
    @GetMapping("/")
    public String home() {
        return "SS12-B1: Spring Boot CI Matrix - Java 17 & 21";
    }
}
