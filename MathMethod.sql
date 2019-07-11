#创建函数库
CREATE DATABASE IF NOT EXISTS funtion CHAR SET=UTF8;
USE funtion;
CREATE TABLE IF NOT EXISTS user(
id INT UNSIGNED AUTO_INCREMENT KEY,
username VARCHAR(20) NOT NULL UNIQUE COMMENT '编号',
age TINYINT UNSIGNED NOT NULL DEFAULT 108 COMMENT '年龄',
sex ENUM('男','女','保密') DEFAULT '男' COMMENT '性别',
addr VARCHAR(23) NOT NULL DEFAULT '北京',
marride TINYINT(0) NOT NULL DEFAULT 0 COMMENT '0代表结婚,1代表未婚',
salary FLOAT(8,2) NOT NULL DEFAULT 0 COMMENT '薪水'  
)ENGINE=InnoDB CHARSET =UTF8;

INSERT user VALUES(1,'king',23,'男','北京',1,50000);
INSERT user (username,age,sex,addr,marride,salary)VALUES('queen',3,'女','上海',0,123456);
INSERT user SET username='imooc',age=212,sex='女',addr='北京',marride=1,salary=234;
INSERT user VALUES(NULL,'张三',34,'男','上海',1,678),
(NULL,'李四',34,'男','上海',1,678),
(NULL,'王五',34,'男','上海',1,678),
(NULL,'赵柳',34,'男','上海',1,678),
(NULL,'天气',34,'男','上海',1,678),
(NULL,'久久',34,'男','上海',1,678);
# 数学函数
SELECT SIN(-12);
#取反
SELECT SIGN(-23);
#更新薪水
UPDATE user SET salary =salary+12.34;

#创建字符串函数
SELECT char_length('abc');
#CHAR_LENGTH是得到字符串个数
SELECT CHAR_LENGTH("abc");
SELECT CHAR_LENGTH('你好');
SELECT CHAR_LENGTH("你好啊");

#LENGTH返回字符串长度
SELECT LENGTH('你好');
SELECT LENGTH("你好");
# CONCAT是将字符串合并一个字符串
SELECT CONCAT('a','b','c');
#如果字符串包含NULL,放回值为null
SELECT CONCAT(NULL,'B','C');
# CONCAT_WS指定分隔符串
SELECT CONCAT_WS('-','B','E','C','A');
SELECT CONCAT_WS('*','B','D','D','E',NULL);
# REVERSE字符串反转
SELECT REVERSE('CB');
# LEFT ,RIGHT获取字符串前后几位
SELECT LEFT('HJKL',2);#获取字符串的前2位
#获取字符串的后2位
SELECT RIGHT('HJKL',2);
#LPAD()| RPAD()用字符串填充指定长度·
SELECT LPAD('FGHJK',12,'@');
SELECT RPAD('VBNM',12,'>');
#去掉字符串空格TRIM() ,RTRIM(), LTRIM();
SELECT TRIM(' ABC ');
SELECT RTRIM(' ABD ');
SELECT CONCAT('*',RTRIM(' ABD '),'*');
SELECT CONCAT('>',LTRIM(' ABD '),'<');
#重复字符串REPEAT
	SELECT CONCAT('*',REPEAT('hello',4),'*');
#字符串的替换 REPLACE
SELECT replace('KINGQUEE','KING','HAHAHAH');
#截取字符串SUBSTRING
SELECT SUBSTRING('SDFASDF',1,3);
#比较字符串 STRCMP
SELECT STRCMP('A','B');
SELECT STRCMP('a','a');
SELECT STRCMP('b','a');





#返回当前日期
SELECT CURDATE();
#返回当前时间
SELECT CURDATE();
SELECT CURRENT_TIME();
#返回当前日期时间
SELECT now();
SELECT NOW(),CURRENT_TIMESTAMP(),SYSDAYE();
#函数嵌套形式
SELECT  MONTH(current_date());
#获取单前月份
SELECT MONTH(CURDATE());
#获取当前日
SELECT DAYNAME(NOW());
SELECT DAYOFWEEK(NOW());
#获取年月日
SELECT YEAR(NOW()),MONTH(NOW()),DAY(NOW()),CURTIME();
# DATEDIFF()计算两个日期相差的天数
SELECT DATEDIFF('2017-2-2','2019-6-6');


#其他类型的函数
SELECT VERSION();
SELECT CONNECTION_ID();
SELECT SCHEMA();
#得到上一步操作产生的id,其实是auto_increment的值
SELECT LAST_INSERT_ID();
#MD5加密
SELECT MD5('king');
SELECT LENGTH(MD5('king'));
#password加密算法
SELECT PASSWORD('root');
SELECT * FROM mysql.user WHERE user='root';



















