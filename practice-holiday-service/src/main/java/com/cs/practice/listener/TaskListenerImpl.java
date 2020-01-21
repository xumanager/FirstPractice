package com.cs.practice.listener;

import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.TaskListener;

/**
 * @ClassName TaskListenerImpl
 * @description:
 *          一般来说指定任务执行人有三种方法：
 *          1、直接在bpmn指定【除非固定，否则不用】
 *          2、流程变量
 *          3、接口
 * @author: 许
 * @create: 2020-01-20 15:43
 * @Version 1.0
 **/
public class TaskListenerImpl implements TaskListener {
    @Override
    public void notify(DelegateTask delegateTask) {

    }
}
