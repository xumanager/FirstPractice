package com.cs.practice.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * @program: dubbo-admin
 * @ClassName ActTaskEntity
 * @description:
 * @author: 许
 * @create: 2020-01-21 13:13
 * @Version 1.0
 **/
@Data
public class ActTaskEntity {
    private String id;
    private String name;
    private String assignee;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date createTime;
}
