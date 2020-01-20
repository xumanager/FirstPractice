package com.cs.practice.dao;

import com.cs.practice.bean.Holiday;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @program: dubbo-admin
 * @ClassName HolidayDao
 * @description:
 * @author: 许
 * @create: 2020-01-20 10:39
 * @Version 1.0
 **/
public interface HolidayDao extends JpaRepository<Holiday,Integer>, JpaSpecificationExecutor<Holiday> {
}
