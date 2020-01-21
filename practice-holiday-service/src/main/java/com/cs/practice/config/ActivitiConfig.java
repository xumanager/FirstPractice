package com.cs.practice.config;

import org.activiti.engine.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @program: dubbo-admin
 * @ClassName ActivitiConfig
 * @description:
 * @author: 许
 * @create: 2020-01-20 11:37
 * @Version 1.0
 **/
@Configuration
public class ActivitiConfig {

    @Bean
    public ProcessEngine getProcessEngine(){
        return ProcessEngines.getDefaultProcessEngine();
    }

    @Bean
    public RepositoryService getRepositoryService(){
        return ProcessEngines.getDefaultProcessEngine().getRepositoryService();
    }

    @Bean
    public RuntimeService getRuntimeService(){
        return ProcessEngines.getDefaultProcessEngine().getRuntimeService();
    }

    @Bean
    public TaskService getTaskService()  {
        return ProcessEngines.getDefaultProcessEngine().getTaskService();
    }

    @Bean
    public HistoryService getHistoryService() {
        return ProcessEngines.getDefaultProcessEngine().getHistoryService();
    }



}
