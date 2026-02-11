package com.example.RepuestosAutomotrices;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class RepuestosYAutomotrices implements CommandLineRunner {

    public static void main(String[] args) {
        SpringApplication.run(RepuestosYAutomotrices.class, args);

    }
    @Override
    public void run(String... args) throws Exception {
        System.out.println("test api");
    }

}
