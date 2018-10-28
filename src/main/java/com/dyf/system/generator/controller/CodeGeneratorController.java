package com.dyf.system.generator.controller;

import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.DateType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;
import com.dyf.common.controller.BaseController;
import com.dyf.common.msg.MsgInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * @className: CodeGeneratorController
 * @description: TODO
 * @auther: duyafei
 * @date: 2018/10/29 14:49
 */
@Slf4j
@Controller
@RequestMapping("generator")
public class CodeGeneratorController extends BaseController {


    @ResponseBody
    @RequestMapping("mysqlGenerator")
    public MsgInfo MysqlGenerator(StrategyConfig sc) {

        return MsgInfo.success();
    }

    private void generator(StrategyConfig strategyConfig) {
        String[] include = {"sys_log"}; //表名数组
        String moduleName = "log"; //模块名
        String author = "dyfSama";  //作者
        String parentPacakge = "com.dyf.modules"; //父包
        String mapperLocation = "/src/main/resources/mapper/com/dyf/modules/"; //mapper位置
        String superControllerClass = "com.dyf.common.controller.BaseController";//父controller
        String superEntityClass = "com.dyf.common.persistence.DataEntity";//父类实体
        //父类公共字段
        String[] superEntityColumns = {"id", "status", "create_date", "create_by", "update_date", "update_by", "remarks"};
        // 代码生成器
        AutoGenerator mpg = new AutoGenerator();

        // 全局配置
        GlobalConfig gc = new GlobalConfig();
        String projectPath = System.getProperty("user.dir");
        gc.setOutputDir(projectPath + "/src/main/java");
        gc.setAuthor(author);
        gc.setOpen(false);
        gc.setEnableCache(true); //mapper添加二级缓存配置
        gc.setFileOverride(true);//是否覆盖已有文件
        gc.setBaseColumnList(true); //开启 baseColumnList
        gc.setBaseResultMap(true); //开启 BaseResultMap
        gc.setDateType(DateType.ONLY_DATE);
//        gc.setEntityName(moduleName);
        mpg.setGlobalConfig(gc);

        // 数据源配置
        DataSourceConfig dsc = new DataSourceConfig();
        dsc.setUrl("jdbc:mysql://192.168.56.201:3306/ssm?useUnicode=true&useSSL=false&characterEncoding=utf8");
        // dsc.setSchemaName("public");
        dsc.setDriverName("com.mysql.jdbc.Driver");
        dsc.setUsername("root");
        dsc.setPassword("root");
        mpg.setDataSource(dsc);

        // 包配置
        PackageConfig pc = new PackageConfig();
        pc.setModuleName(moduleName);
        pc.setParent(parentPacakge);
        mpg.setPackageInfo(pc);

        // 自定义配置
        InjectionConfig cfg = new InjectionConfig() {
            @Override
            public void initMap() {
                // to do nothing
            }
        };
        List<FileOutConfig> focList = new ArrayList<>();
        focList.add(new FileOutConfig("/templates/mapper.xml.ftl") {
            @Override
            public String outputFile(TableInfo tableInfo) {
                // 自定义输入文件名称
                return projectPath + mapperLocation + pc.getModuleName()
                        + "/" + tableInfo.getEntityName() + "Mapper" + StringPool.DOT_XML;
            }
        });
        cfg.setFileOutConfigList(focList);
        mpg.setCfg(cfg);
        mpg.setTemplate(new TemplateConfig().setXml(null));

        // 策略配置
        StrategyConfig strategy = new StrategyConfig();
        strategy.setNaming(NamingStrategy.underline_to_camel);
        strategy.setColumnNaming(NamingStrategy.underline_to_camel);
        strategy.setSuperEntityClass(superEntityClass);
        strategy.setEntityLombokModel(true);
        strategy.setSuperControllerClass(superControllerClass);
        strategy.setInclude(include);
        strategy.setSuperEntityClass(superEntityClass);
        strategy.setSuperEntityColumns(superEntityColumns);
        strategy.setControllerMappingHyphenStyle(true);
        strategy.setTablePrefix("sys_");//表前缀
        mpg.setStrategy(strategy);
        // 选择 freemarker 引擎需要指定如下加，注意 pom 依赖必须有！
        mpg.setTemplateEngine(new FreemarkerTemplateEngine());
        mpg.execute();
    }

    public static void main(String[] args) {
        new CodeGeneratorController().generator(null);
    }

}
