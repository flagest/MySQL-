#创建库
CREATE DATABASE IF NOT EXISTS King CHARACTER SET =UTF8;
USE king;
CREATE TABLE IF NOT EXISTS user(
id INT UNSIGNED AUTO_INCREMENT KEY COMMENT'编号',
username VARCHAR(20) UNICODE NOT NULL COMMENT'用户名',
age TINYINT UNIQUE DEFAULT 18 COMMENT'年龄',
email VARCHAR(50) NOT NULL DEFAULT 'imooc@qq.com'
)ENGINE=InnoDB CHARSET=UTF8;
# 插入数据
INSERT user VALUE(1,'王五',34,'2345@qq.com');
INSERT user VALUES(NULL,'李四',12,'123456@qq.com');
INSERT user VALUES(DEFAULT,'田七',13,'567890@qq.com');
INSERT user VALUES(NULL,'a',default,DEFAULT ),(NULL,'B',11,'234567@QQ.COM'),(NULL,'C',22,'67890@qq.com');
INSERT user SET username='战三',age=34,email='567890@qq.com';