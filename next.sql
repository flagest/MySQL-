# 创建一个表，用于测试
CREATE TABLE user1(
`id` TINYINT UNIQUE PRIMARY KEY
);
# 添加新字段
ALTER TABLE user1 ADD name int NOT NULL AFTER id;
# 表中插入数据
INSERT user1 (id,name) VALUE (1,1);
#更该字段
ALTER TABLE user1 ADD name varchar(10) NOT NULL AFTER id; 
ALTER TABLE user1 ADD email varchar(20) NOT NULL AFTER name;
#删除字段
ALTER TABLE user1 Drop name;
#同时可以添加多个字段
ALTER TABLE user1
ADD age TINYINT UNSIGNED NOT NULL DEFAULT 18,
ADD adder VARCHAR(100) NOT NULL DEFAULT '北京',
DROP email;
#创建表
CREATE TABLE user2(
 id INT UNSIGNED AUTO_INCREMENT KEY ,
 username VARCHAR(20) NOT NULL,
 age TINYINT UNSIGNED NOT NULL DEFAULT 18,
 email varchar (50)
 );
 # 给属性添加字段
 ALTER TABLE user2 ALTER age SET DEFAULT 20;
# 删除字段
ALTER TABLE user2 ALTER email SET DEFAULT '5678@qq.com';
ALTER TABLE user2 ALTER email SET DEFAULT '4456789@QQ.COM';
# 在表中添加地址字段名
ALTER TABLE user2 ADD address VARCHAR(20) NOT NULL DEFAULT '北京';
#创建表
CREATE TABLE user3(
id INT UNSIGNED AUTO_INCREMENT KEY,
username VARCHAR(10)  NOT NULL UNIQUE,
password CHAR(10) NOT NULL,
email VARCHAR(10) NOT NULL
);
 # 将用户名字段类型改为20
 ALTER TABLE user3 MODIFY username VARCHAR(20) NOT NULL UNIQUE;
 # 将密码改为长度20
 ALTER TABLE user3 MODIFY password CHAR(20);
 #将用户名改为user
 ALTER TABLE user3 CHANGE username user VARCHAR(30) NOT NULL UNIQUE;
 #将password改为psd
 ALTER TABLE user3 CHANGE password psd CHAR(10) NOT NULL;
 #将email改为ueremaill类型改为VARCHAR(20) DEFAULT 'IMOOCA@QQ.COM'
ALTER TABLE user3 CHANGE  email useremail VARCHAR(20) DEFAULT 'imooc@qq.com'; 
# 添加删除主键
CREATE TABLE user4(
id INT UNSIGNED,
username VARCHAR(20)
);
 # 添加组件
 ALTER TABLE user4 ADD PRIMARY KEY(id);
 #删除主键
 ALTER TABLE user4 DROP PRIMARY KEY;
#添加UNIQUE
ALTER TABLE user4 ADD UNIQUE (username);
#创建表5
CREATE TABLE user5 (
id INT UNSIGNED AUTO_INCREMENT KEY,
username VARCHAR(20) NOT NULL 
); 
#删除组件
ALTER TABLE user5 DROP PRIMARY KEY;
#先删除auto_incrment
ALTER TABLE user5 MODIFY id INT UNSIGNED;
 #添加测试
 CREATE TABLE user6(
 id INT UNSIGNED AUTO_INCREMENT KEY,
 username VARCHAR(20) NOT NULL UNIQUE,
 password VARCHAR(20) NOT NULL,
 email VARCHAR(20) NOT NULL UNIQUE
 );
 #删除username唯一键
 ALTER TABLE user6 DROP INDEX username;
  #删除email唯一键
  ALTER TABLE user6 DROP INDEX email;
  ALTER TABLE user6 ADD UNIQUE INDEX uni_name (username);
  #重命名表名
  ALTER TABLE user6 RENAME TO chengxinyan;
 #方法二
 RENAME TABLE  user6 TO chenxinyan;
 # 测试MyISAM
 CREATE TABLE test_myisam(
 a INT UNSIGNED,
 B varchar(20),
 c varchar(20)
 )ENGINE =MyISAM;
 
 
 CREATE TABLE myisam_1(
 a char(30),
 b int
 ) ENGINE=MyISAM;
 
 SHOW  TABLE STATUS LIKE  'myisam_1';
  SHOW TABLE  STATUS LIKE 'myisam_3';
 
 CREATE TABLE myisam_2(
 a varchar(30),
 b int
 ) ENGINE=MyISAM;
 #静态
  CREATE TABLE myisam_3(
 a varchar(30),
 b int
 ) ENGINE=MyISAM ROW_FORMAT=FIXED;
 #创建InnoDB
 CREATE TABLE my_innodb(
 id INT UNSIGNED AUTO_INCREMENT KEY,
 username VARCHAR(20) NOT NULL
 );
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 