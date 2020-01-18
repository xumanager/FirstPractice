package com.cs.practice;

import com.alibaba.dubbo.config.spring.context.annotation.EnableDubbo;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@EnableDubbo    //启动扫描
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

}
