package com.cs.practice.serivce.imp;

import com.cs.practice.service.HolidayService;
import org.springframework.stereotype.Service;

@Service
@com.alibaba.dubbo.config.annotation.Service
public class HolidayServiceImpl implements HolidayService {
    @Override
    public String sayHello() {
        return "hello world";
    }
}
