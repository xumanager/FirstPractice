package com.cs.practice.serivce.imp;

import com.cs.practice.bean.ActTaskEntity;
import com.cs.practice.bean.Holiday;
import com.cs.practice.dao.HolidayDao;
import com.cs.practice.service.WorkflowService;
import org.activiti.engine.*;
import org.activiti.engine.task.Task;
import org.junit.Test;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@com.alibaba.dubbo.config.annotation.Service
public class HolidayServiceImpl implements WorkflowService {

    @Autowired
    private HolidayDao holidayDao;

    @Autowired
    private RepositoryService repositoryService;
    @Autowired
    private RuntimeService runtimeService;
    @Autowired
    private TaskService taskService;
    @Autowired
    private HistoryService historyService;


    @Override
    public List<Holiday> findAllHoliday() {
        return holidayDao.findAll();
    }

    @Override
    @Transactional
    public void startProcess(Holiday addBean, String username, String processName) {
        holidayDao.save(addBean);
        String processDefinitionKey = "holiday";
        String businessKey = processDefinitionKey+":"+addBean.getId();
        Map<String,Object> variables = new HashMap<>();
        variables.put("username","许成思xuchengsi");

        runtimeService.startProcessInstanceByKey(processDefinitionKey,businessKey,variables);
    }

    @Override
    public void addHolday(Holiday addBean) {
        holidayDao.save(addBean);
    }

//    @Test
//    //创建数据库的activiti表
//    public void createTable(){
//        ProcessEngineConfiguration configuration = ProcessEngineConfiguration
//                .createProcessEngineConfigurationFromResource("activiti.cfg.xml");
//        ProcessEngine processEngine = configuration.buildProcessEngine();
//        System.out.println(processEngine);
//    }

//    @Test
//    //流程部署
//    public void processDeploy(){
//        ProcessEngine processEngine = ProcessEngines.getDefaultProcessEngine();
//        //定义的操作对象
//        RepositoryService repositoryService = processEngine.getRepositoryService();
//
//        Deployment deployment = repositoryService.createDeployment()
//                .addClasspathResource("diagram/holiday.bpmn")
//                .addClasspathResource("diagram/holiday.png")
//                .disableSchemaValidation()   //如果没有这个会报错  org.activiti.bpmn.exceptions.XMLException: cvc-complex-type.2.4.a: 发现了以元素 ‘process’ 开头的无效内容。
//                .name("请假流程")
//                .deploy();
//    }

    @Test
    public void queryCurrentUserTask(){
        TaskService taskService =  ProcessEngines.getDefaultProcessEngine().getTaskService();
        List<Task> list = taskService.createTaskQuery().taskAssignee("许成思xuchengsi").list();
        List<ActTaskEntity> taskList = new ArrayList<>();
        for(Task task : list){
            ActTaskEntity actTaskEntity = new ActTaskEntity();
            BeanUtils.copyProperties(task,actTaskEntity);
            taskList.add(actTaskEntity);
        }

        for (ActTaskEntity en : taskList){
            System.out.println(en);
        }
    }

}
