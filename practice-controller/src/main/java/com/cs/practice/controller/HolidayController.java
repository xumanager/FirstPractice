package com.cs.practice.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.cs.practice.service.HolidayService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HolidayController {

    @Reference
    private HolidayService holidayService;

    @RequestMapping("/hello")
    public String toManager(){

        return holidayService.sayHello();
    }


}
