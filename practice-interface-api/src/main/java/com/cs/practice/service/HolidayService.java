package com.cs.practice.service;

import com.cs.practice.bean.Holiday;

import java.util.List;

/**
 * @program: dubbo-admin
 * @ClassName HolidayService
 * @description:
 * @author: 许
 * @create: 2020-01-20 08:43
 * @Version 1.0
 **/
public interface HolidayService {

    public List<Holiday> findAllHoliday();
}
