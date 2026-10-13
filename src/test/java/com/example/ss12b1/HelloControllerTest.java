package com.example.ss12b1;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

class HelloControllerTest {
    @Test
    void homeReturnsExpectedMessage() {
        assertEquals("SS12-B1: Spring Boot CI Matrix - Java 17 & 21", new HelloController().home());
    }
}
