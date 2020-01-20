package com.cs.practice.serivce.imp;

import com.cs.practice.bean.Holiday;
import com.cs.practice.dao.HolidayDao;
import com.cs.practice.service.HolidayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@com.alibaba.dubbo.config.annotation.Service
public class HolidayServiceImpl implements HolidayService {

    @Autowired
    private HolidayDao holidayDao;

    @Override
    public List<Holiday> findAllHoliday() {
        return holidayDao.findAll();
    }
}
