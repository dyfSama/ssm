/*
package com.dyf.system.job.controller;

import java.util.Date;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import javax.servlet.http.HttpServletRequest;

import com.sun.org.apache.bcel.internal.generic.ReturnInstruction;
import org.apache.log4j.Logger;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.Trigger;
import org.springframework.scheduling.TriggerContext;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.SchedulingConfigurer;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;
import org.springframework.scheduling.support.CronTrigger;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Lazy(value = false)
@Component
@EnableScheduling
@Controller
@RequestMapping("job")
public class DynamicCronTask implements SchedulingConfigurer {


    @RequestMapping("toList")
    public String toList() {
        return "system/job/jobList";
    }


    private static Logger log = Logger.getLogger(DynamicCronTask.class);
    public static String cron = "0/10 * * * * ?";

    @RequestMapping("/setDynamicCronTask")
    public String setSpringDynamicCronTask(HttpServletRequest request, String setCron) {
        System.out.println("cron setDynamicCronTaskto:" + setCron);
        cron = setCron;
        System.err.println("cron change to:" + cron);
        return "";
    }

    @Override
    public void configureTasks(ScheduledTaskRegistrar taskRegister) {
        taskRegister.setScheduler(taskExecutor());
        taskRegister.addTriggerTask(new Runnable() {
            @Override
            public void run() {
                // 逻辑任务
                System.out.println("dynamicCronTask is running...");
            }
        }, new Trigger() {
            @Override
            public Date nextExecutionTime(TriggerContext triggerContext) {
                // 任务触发，可修改任务的执行周期
                CronTrigger trigger = new CronTrigger(cron);
                System.out.println("cron:" + cron);
                Date nextExecutor = trigger.nextExecutionTime(triggerContext);
                return nextExecutor;
            }
        });
    }

    @Bean(destroyMethod="shutdown")
    public Executor taskExecutor() {
        return Executors.newScheduledThreadPool(100);
    }



}
*/
