>####ContextLoaderListener


>####targetFilterLifecycle

因为Filter比Bean先加载，也就是Spring会先加载Filter指定的类到Container中，这样Filter中注入的Spring Bean就 
为null了。 
解决办法： 
  先Filter中加入DelegatingFilterProxy类，"targetFilterLifecycle"指明作用于Filter的所有生命周期。原理是 
DelegatingFilterProxy类是一个代理类，所有的请求都会首先发到这个Filter代理，然后再按照"filter-name"委派到Spring 
中的这个Bean。在Spring中配置的Bean的name要和web.xml中的一样。此外，Spring Bean实现了Filter接口，但默认情况下， 
是由Spring容器来管理其生命周期的(不是由tomcat这种服务器容器来管理)。如果设置"targetFilterLifecycle"为true，则 
Spring来管理Filter.init()和Filter.destroy()；若为false，则这两个方法失效!B和A最大的不同是A是一个Filter，优先被 
加载到Container中，无法调用Spring中后续的Bean；而B是一个Spring Bean，可以引用其他的Bean，而请求都通过 
DelegatingFilterProxy类委派给B!

>####filterChainDefinitions
  
    /admin/**=anon ：无参，表示可匿名访问
    /admin/user/**=authc ：无参，表示需要认证才能访问
    /admin/user/**=authcBasic ：无参，表示需要httpBasic认证才能访问
    /admin/user/**=ssl ：无参，表示需要安全的URL请求，协议为https
    /home=user ：表示用户不一定需要通过认证，只要曾被 Shiro 记住过登录状态就可以正常发起 /home 请求
    /edit=authc,perms[admin:edit]：表示用户必需已通过认证，并拥有 admin:edit 权限才可以正常发起 /edit 请求
    /admin=authc,roles[admin] ：表示用户必需已通过认证，并拥有 admin 角色才可以正常发起 /admin 请求
    /admin/user/**=port[8081] ：当请求的URL端口不是8081时，跳转到schemal://serverName:8081?queryString
    /admin/user/**=rest[user] ：根据请求方式来识别，相当于 /admins/user/**=perms[user:get]或perms[user:post] 等等
    /admin**=roles["admin,guest"] ：允许多个参数（逗号分隔），此时要全部通过才算通过，相当于hasAllRoles()
    /admin**=perms["user:add:*,user:del:*"]：允许多个参数（逗号分隔），此时要全部通过才算通过，相当于isPermitedAll()


    
    @Aspect放在类头上，把这个类作为一个切面。
    @Pointcut放在方法头上，定义一个可被别的方法引用的切入点表达式。
    5种通知。
    @Before，前置通知，放在方法头上。
    @After，后置【finally】通知，放在方法头上。
    @AfterReturning，后置【try】通知，放在方法头上，使用returning来引用方法返回值。
    @AfterThrowing，后置【catch】通知，放在方法头上，使用throwing来引用抛出的异常。
    @Around，环绕通知，放在方法头上，这个方法要决定真实的方法是否执行，而且必须有返回值。
    
    
    private static Map<String, Integer> mysqlToJdbcTypesMap = new HashMap<String, Integer>();
     
        static {
            mysqlToJdbcTypesMap.put("BIT", Integer.valueOf(mysqlToJavaType(FIELD_TYPE_BIT)));
            mysqlToJdbcTypesMap.put("TINYINT", Integer.valueOf(mysqlToJavaType(FIELD_TYPE_TINY)));
            mysqlToJdbcTypesMap.put("SMALLINT", Integer.valueOf(mysqlToJavaType(FIELD_TYPE_SHORT)));
            mysqlToJdbcTypesMap.put("MEDIUMINT", Integer.valueOf(mysqlToJavaType(FIELD_TYPE_INT24)));
            mysqlToJdbcTypesMap.put("INT", Integer.valueOf(mysqlToJavaType(FIELD_TYPE_LONG)));
            mysqlToJdbcTypesMap.put("INTEGER", Integer.valueOf(mysqlToJavaType(FIELD_TYPE_LONG)));
            mysqlToJdbcTypesMap.put("BIGINT", Integer.valueOf(mysqlToJavaType(FIELD_TYPE_LONGLONG)));
            mysqlToJdbcTypesMap.put("INT24", Integer.valueOf(mysqlToJavaType(FIELD_TYPE_INT24)));
            mysqlToJdbcTypesMap.put("REAL", Integer.valueOf(mysqlToJavaType(FIELD_TYPE_DOUBLE)));
            mysqlToJdbcTypesMap.put("FLOAT", Integer.valueOf(mysqlToJavaType(FIELD_TYPE_FLOAT)));
            mysqlToJdbcTypesMap.put("DECIMAL", Integer.valueOf(mysqlToJavaType(FIELD_TYPE_DECIMAL)));
            mysqlToJdbcTypesMap.put("NUMERIC", Integer.valueOf(mysqlToJavaType(FIELD_TYPE_DECIMAL)));
            mysqlToJdbcTypesMap.put("DOUBLE", Integer.valueOf(mysqlToJavaType(FIELD_TYPE_DOUBLE)));
            mysqlToJdbcTypesMap.put("CHAR", Integer.valueOf(mysqlToJavaType(FIELD_TYPE_STRING)));
            mysqlToJdbcTypesMap.put("VARCHAR", Integer.valueOf(mysqlToJavaType(FIELD_TYPE_VAR_STRING)));
            mysqlToJdbcTypesMap.put("DATE", Integer.valueOf(mysqlToJavaType(FIELD_TYPE_DATE)));
            mysqlToJdbcTypesMap.put("TIME", Integer.valueOf(mysqlToJavaType(FIELD_TYPE_TIME)));
            mysqlToJdbcTypesMap.put("YEAR", Integer.valueOf(mysqlToJavaType(FIELD_TYPE_YEAR)));
            mysqlToJdbcTypesMap.put("TIMESTAMP", Integer.valueOf(mysqlToJavaType(FIELD_TYPE_TIMESTAMP)));
            mysqlToJdbcTypesMap.put("DATETIME", Integer.valueOf(mysqlToJavaType(FIELD_TYPE_DATETIME)));
            mysqlToJdbcTypesMap.put("TINYBLOB", Integer.valueOf(java.sql.Types.BINARY));
            mysqlToJdbcTypesMap.put("BLOB", Integer.valueOf(java.sql.Types.LONGVARBINARY));
            mysqlToJdbcTypesMap.put("MEDIUMBLOB", Integer.valueOf(java.sql.Types.LONGVARBINARY));
            mysqlToJdbcTypesMap.put("LONGBLOB", Integer.valueOf(java.sql.Types.LONGVARBINARY));
            mysqlToJdbcTypesMap.put("TINYTEXT", Integer.valueOf(java.sql.Types.VARCHAR));
            mysqlToJdbcTypesMap.put("TEXT", Integer.valueOf(java.sql.Types.LONGVARCHAR));
            mysqlToJdbcTypesMap.put("MEDIUMTEXT", Integer.valueOf(java.sql.Types.LONGVARCHAR));
            mysqlToJdbcTypesMap.put("LONGTEXT", Integer.valueOf(java.sql.Types.LONGVARCHAR));
            mysqlToJdbcTypesMap.put("ENUM", Integer.valueOf(mysqlToJavaType(FIELD_TYPE_ENUM)));
            mysqlToJdbcTypesMap.put("SET", Integer.valueOf(mysqlToJavaType(FIELD_TYPE_SET)));
            mysqlToJdbcTypesMap.put("GEOMETRY", Integer.valueOf(mysqlToJavaType(FIELD_TYPE_GEOMETRY)));
        }


fixedRate ：每隔多少毫秒执行一次该方法， 以上一次执行开始时间计算
fixedDelay：当一次方法执行完毕之后，延迟多少毫秒再执行该方法