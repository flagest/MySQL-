#新建一张表
CREATE DATABASE IF NOT EXISTS up CHAR SET=UTF8;
USE up;
CREATE TABLE IF NOT EXISTS user (
id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
username VARCHAR(20) NOT NULL,
age INT  NOT NULL DEFAULT 18,
addre VARCHAR(10) NOT NULL DEFAULT '杭州'
);
# 跟新
UPDATE test1 SET username='sd';
DELETE FROM user where username=king;
UPDATE user SET age=12 WHERE id=1;
#修改字段名属性
ALTER TABLE user MODIFY age INT NOT NULL;
#删除表中所用记录表
DELETE FROM user;
#彻底清除表和auto_increment
TRUNCATE TABLE user ;
#创建表
CREATE TABLE IF NOT EXISTS user1(
id INT UNSIGNED AUTO_INCREMENT KEY,
username VARCHAR(20) NOT NULL UNIQUE COMMENT '编号',
age TINYINT UNSIGNED NOT NULL DEFAULT 108 COMMENT '年龄',
sex ENUM('男','女','保密') DEFAULT '男' COMMENT '性别',
addr VARCHAR(23) NOT NULL DEFAULT '北京',
marride TINYINT(0) NOT NULL DEFAULT 0 COMMENT '0代表结婚,1代表未婚',
salary FLOAT(8,2) NOT NULL DEFAULT 0 COMMENT '薪水'  
)ENGINE=InnoDB CHARSET =UTF8;
#插入数据
INSERT user1 VALUES(1,'king',23,'男','北京',1,50000);
INSERT user1 (username,age,sex,addr,marride,salary)VALUES('queen',3,'女','上海',0,123456);
INSERT user1 SET username='imooc',age=212,sex='女',addr='北京',marride=1,salary=234;
INSERT user1 VALUES(NULL,'张三',34,'男','上海',1,678),
(NULL,'李四',34,'男','上海',1,678),
(NULL,'王五',34,'男','上海',1,678),
(NULL,'赵柳',34,'男','上海',1,678),
(NULL,'天气',34,'男','上海',1,678),
(NULL,'久久',34,'男','上海',1,678);
#查询id=1，的username，age
SELECT username,age FROM user1 WHERE id=1;
#给user1表的id去个别名
SELECT id AS '编号',username AS '用户名' FROM up.user1;
#给表器别名
SELECT age,username FROM user1 AS user2  WHERE id=1;
#增加字段
ALTER TABLE user1 ADD userDesc VARCHAR(20);
#更新id<=9的用户 userDesc='this is test'
UPDATE user1 SET userDesc='this is test' WHERE id<9;
#查询用户Desc为NULL
SELECT age, username,userDesc FROM user1 WHERE userDesc<=>null;
#可以用 IS null来判断
SELECT age,username,userDesc FROM user1 WHERE userDesc IS NULL;
#在判断age
SELECT age,username,salary FROM user1 WHERE id BETWEEN 4 and 5;
#测试指定集合 in
SELECT age, username,salary FROM user1 WHERE id IN (1,2,3,4,5);
SELECT id,username,age,sex FROM user1 WHERE id<5 AND age<=30;

 SELECT id,username,age,sex FROM user1 WHERE id >=5 AND age < 30 AND sex='男';
 #查询名字为两个字的童鞋
 SELECT id,username,age,sex FROM user1 WHERE username LIKE '李_';
 SELECT id,username,age,sex FROM user1 WHERE username LIKE '__';
 #按照性别分组
 SELECT * FROM user1 GROUP BY sex;
 SELECT id,GROUP_CONCAT(username),age,sex FROM user1 GROUP BY username; 
 SELECT id,GROUP_CONCAT(username),age,GROUP_CONCAT(sex) FROM user1 GROUP BY username,sex;
 #统计个数
 SELECT COUNT(id) AS toals FROM user1;
 #通过用户分组，得到用户信息,并且分组中人数
 SELECT GROUP_CONCAT(username) AS userdetail,COUNT(*) AS tousers FROM user1 GROUP BY sex; 
 #安找addr分组，得到用的详情，中人数，得到组中年龄综合，年龄最大值，最小值，平均年龄
 SELECT addr ,
 GROUP_CONCAT(username) AS userdetail ,
 COUNT(*) AS totaldetai, 
  SUM(age) AS sum_age,
   MAX(age) AS max_age ,
 AVG(age) AS avg_age,
 MIN(age) AS min_age
FROM user1 
GROUP BY addr; 

SELECT sex,
GROUP_CONCAT(username) AS toalusername,
COUNT(*) AS total,
SUM(age) AS sum_age,
AVG(age) AS avg_age,
MAX(age) AS max_age,
MIN(age) AS min_age
FROM user GROUP BY sex;

#WITH ROLLUP
SELECT GROUP_CONCAT(username) AS userdetail ,
COUNT(*) AS total
FROM user1
GROUP BY sex
WITH ROLLUP;
#按照addr分组进行,进行人数统计
SELECT addr,GROUP_CONCAT(username) AS userdetail ,COUNT(*) AS total FROM user1 GROUP BY addr;
#对分组结果进行二次筛选,条件组中人数大于等于3；
SELECT addr,GROUP_CONCAT(username) AS userdetail ,COUNT(*) AS total FROM user1 GROUP BY addr HAVING COUNT(*)>=3;
#对薪水进行排序
SELECT salary ,age ,sex FROM user1 order by salary DESC;
#对年龄的排序,如果是第一个字段的排序是相同的可以用第二个字段排序
SELECT age,username,salary,addr FROM user1 order by age ASC,salary DESC;
SELECT age,username,salary FROM user1 order by rand();
#LimIt显示结果条数
SELECT age,username,addr,salary FROM user1 LIMIT 4;
# 0 是偏移量
SELECT age,username,addr,salary FROM user1 LIMIT 0,4;
UPDATE user SET age=age+5  LIMIT 3;
SELECT age,username,salary,id,addr  FROM user1 ORDER BY id DESC ; 
UPDATE user1 SET age=age-10 ORDER BY id DESC LIMIT 3;
#删除表中前三个记录
DELETE FROM user1 LIMIT 3;
#删除user1表中前三个id记录降序排列前三个字段
DELETE FROM user1  ORDER BY id DESC LIMIT 3;
#SELECT 完整性的句子
SELECT addr,GROUP_CONCAT(username) AS userdetail,COUNT(*) AS totol,SUM (age) AS sum_age,
AVG(age) AS avg_age, MAX(age) AS max_age,MIN(age) AS min_age
FROM user1 WHERE id>=2 GROUP BY addr ORDER BY totol DESC;






























