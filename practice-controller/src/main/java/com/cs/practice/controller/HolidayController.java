package com.cs.practice.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.cs.practice.bean.Holiday;
import com.cs.practice.service.WorkflowService;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@Controller
public class HolidayController {

    @Reference
    private WorkflowService workflowService;



    @RequestMapping("/toManage")
    public String toManager(){
        return "holiday/manage";
    }

    @RequestMapping("/holiday/addHoliday")
    @ResponseBody
    public String addHoliday(String holiday,String username,String processName){
        JSONObject jsonobject = JSONObject.fromObject(holiday);
        Map<String,Object> map = new HashMap<>();
        Holiday addBean = (Holiday)JSONObject.toBean(jsonobject,Holiday.class);
        addBean.setState("1");
        addBean.setUserId(1);
        workflowService.startProcess(addBean,username,processName);
        return "success";
    }

}
