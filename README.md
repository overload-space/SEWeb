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

+ 测试应该至少建3个账号，对应学生，助教和老师。注意要在student表里把checked这列的值改为1才能登录。在student表里, Level这一列的值,学生为0, 助教为1, 老师为100

```sql
CREATE TABLE `SEWeb`.`Student` (
  `ID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`));

 alter table  `SEWeb`.`Student` add `checked` bit(1) NOT NULL;
 alter table  `SEWeb`.`Student` add `md5token` VARCHAR(45);
 alter table  `SEWeb`.`Student` add `Level` int NOT NULL;
```


```sql
CREATE table `SEWeb`.`Message` (
	`ID`  int not null,
	 `CreateAt` DATETIME NULL,
     `Title` VARCHAR(10897) NOT NULL,
	 `Content` VARCHAR(10897) NULL,
     `Important` BIT(1) NULL,
      `IsRead` BIT(1) NULL,
 PRIMARY KEY (`ID`));
  ALTER TABLE  SEWeb.Message MODIFY Content longtext;          
```

+ 资料
```sql
CREATE table `SEWeb`.`Resource` (
	`ID`  int not null,
	 `CreateAt` DATETIME NULL,
     `FileName` VARCHAR(500) NOT NULL,
	 `Description` VARCHAR(10897) NULL,
     `FileUrl` varchar(500) NULL,
 PRIMARY KEY (`ID`));
 ALTER TABLE `SEWeb`.`Resource` ADD COLUMN `HomeworkID` INT(11) NULL;
```

+ 增加handin表,记录学生交作业的信息

```sql
CREATE TABLE `SEWeb`.`handin` (
  `studentID` INT NOT NULL,
  `homeworkID` INT NOT NULL,
  `submitTime` DATETIME NOT NULL,
  `attachmentID` INT NOT NULL,
  PRIMARY KEY (`studentID`, `homeworkID`));
```

+ 增加homework表,记录发布的作业信息
```sql
CREATE TABLE `SEWeb`.`homework` (
  `homeworkID` INT NOT NULL,
  `CreateAt` DATETIME NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `content` VARCHAR(10000) NOT NULL,
  `deadline` DATETIME NOT NULL,
  `delaydeadline1` DATETIME NULL,
  `delaydeadline2` DATETIME NULL,
  `hasAttachment` BIT(1) NOT NULL,
  PRIMARY KEY (`homeworkID`));
```

> 首页的课程说明保存路径为D:/course_information.txt;
> 资源文件保存目录为D:/Resources
> 作业根目录为D:/Homework