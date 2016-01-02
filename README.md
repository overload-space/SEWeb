# SEWeb
软件工程课程网站

## Commit内容 _ by 高端 2016.1.2
+ 增加通知的查看
+ 增加管理员对通知的修改和删除
> 为方便测试，传递isAdmin默认为真。

下面是我测试用的数据库结构，对应的Model在model目录下的Message类中。
> 王雨阳同学负责这部分内容，最后merge的时候以王雨阳同学的数据库和model为准。

```sql
CREATE table `SEWeb`.`Message` (
	`ID`  int not null,
	 `Time` DATETIME NULL,
     `Subject` VARCHAR(10897) NOT NULL,
	 `Content` VARCHAR(10897) NULL,
     `Important` BIT(1) NULL,
      `Read` BIT(1) NULL,
 PRIMARY KEY (`ID`));
 
```
+ 增加资料的显示界面
> 目前还没有对应的后端，没有进行测试。



-------------------------

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
  # 以下为更新内容，添加 checked标识和md5token值
 alter table  `SEWeb`.`Student` add `checked` int NOT NULL;
 alter table  `SEWeb`.`Student` add `md5token` VARCHAR(45);
```





