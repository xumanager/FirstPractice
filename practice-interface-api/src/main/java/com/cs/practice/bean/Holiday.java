package com.cs.practice.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName LeaveBill
 * @description:    请假实体类
 * @author: 许
 * @create: 2020-01-20 08:06
 * @Version 1.0
 **/
@Data
@Entity
@Table(name = "holiday")
public class Holiday implements Serializable {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Basic
    @Column(name = "title")
    private String title;

    @Basic
    @Column(name = "content")
    private String content;

    @Basic
    @Column(name = "days")
    private Double days;

    @Basic
    @Column(name = "leavetime")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date leavetime;

    @Basic
    @Column(name = "state")
    private String state;  //0未提交 1审批中 2审批完成  3已停用

    @Basic
    @Column(name = "userId")
    private Integer userId;

}
