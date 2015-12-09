# SEWeb
软件工程课程网站

## 目录说明

+ web/WEB-INF目录下为Spring配置文件
+ web/jsp目录下为前端jsp页面
+ web/static目录下为前端静态资源
+ src/controller目录下为各个controller类
+ src/model目录下为各个model类
+ lib目录下为项目的依赖库
+ .idea目录下为Intellij IDEA配置文件
+ 根目录下的.classpath和.project为eclipse配置文件

## 数据库配置

+ 数据库配置项在web/WEB-INF/SEWeb-servlet.xml中, 你需要修改用户名和密码为你本地mysql的用户名和密码, 并在本地建立SEWeb数据库
+ 连接数据库的简单例子写在了RegisterController里的post方法里, 用于用户注册
+ 要测试注册功能需要在数据库中添加Student表:

```sql
CREATE TABLE `SEWeb`.`Student` (
  `ID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`));
```
