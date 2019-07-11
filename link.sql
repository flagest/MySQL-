CREATE DATABASE IF NOT EXISTS link DEFAULT CHARACTER SET=UTF8;
USE link;
CREATE TABLE IF NOT EXISTS emp(
id INT UNSIGNED AUTO_INCREMENT KEY,
username VARCHAR(20) NOT NULL UNIQUE COMMENT '编号',
age TINYINT UNSIGNED NOT NULL DEFAULT 108 COMMENT '年龄',
sex ENUM('男','女','保密') DEFAULT '男' COMMENT '性别',
addr VARCHAR(23) NOT NULL DEFAULT '北京',
depId TINYINT UNSIGNED NOT NULL COMMENT'部门对应编号'
)ENGINE=InnoDB CHARSET =UTF8;
INSERT emp (username,age,depId) VALUES('king',12,1),
('imooc',33,2),
('queen',24,1),
('lily',25,1),
('rose',28,3),
('john',26,3);


#新建dep表  
INSERT emp(username,age,depId) VALUES ('测试用户',39,6);

CREATE TABLE dep(
id TINYINT UNSIGNED AUTO_INCREMENT KEY,
depName VARCHAR(40) NOT NULL UNIQUE,
depDesc VARCHAR(40) NOT NULL DEFAULT ''
)ENGINE=InnoDB CHARSET=UTF8;
INSERT dep(depName,depDesc)VALUES('PHP教学部','php研发部'),
('java教学部','java研发部'),
('web教学部','web教学部'),
('ios教学部','ios教学部');
#查询 emp id username age 部门名称 dep depName
SELECT emp.id,username,age,dep.id FROM emp,dep WHERE emp.depId=dep.id; 
#两张表的笛卡尔查询
SELECT emp.id,emp.username,emp.age,dep.depName FROM emp,dep;
#内连接
SELECT e.id,e.username,e.age,d.depName FROM emp AS e Inner JOIN dep AS d ON e.depId=d.id;
#试一试右外连接
SELECT e.id,e.username,e.age,d.depName,d.depDesc FROM emp AS e  RIGHT join dep AS d ON e.depID=d.id;


USE link;
#创建用户表
CREATE TABLE IF NOT EXISTS  user1(
id TINYINT UNSIGNED AUTO_INCREMENT KEY COMMENT '编号',
usename VARCHAR(20) NOT NULL UNIQUE COMMENT '用户名',
email VARCHAR(50) NOT NULL DEFAULT 'ty456789@qq.com' COMMENT '邮箱',
proName VARCHAR(50) NOT NULL DEFAULT '台湾' COMMENT '用户所在省份'
)ENGINE=InnoDB CHAR SET=UTF8;
#插入数据
INSERT user1(usename,proName)VALUES('a','北京'),
('b','哈尔滨'),
('c','上海'),
('d','深圳'),
('e','广州'),
('f','重庆');
#创建省份表
CREATE TABLE IF NOT EXISTS  pro(
id TINYINT NOT NULL  AUTO_INCREMENT KEY COMMENT '编号',
proName VARCHAR(10) NOT NULL UNIQUE  COMMENT '省份名称'
)ENGINE =InnoDB CHAR SET=UTF8;
#向表中插入数据
INSERT pro (proName) VALUES('北京'),('上海'),('深圳');

#创建用户表
CREATE TABLE IF NOT EXISTS user(
id TINYINT  NOT NULL AUTO_INCREMENT KEY COMMENT '编号',
username VARCHAR(10) UNIQUE  COMMENT '用户名',
email VARCHAR(20) NOT NULL DEFAULT '3456789qq.com',
proId  TINYINT  UNSIGNED NOT NULL  COMMENT '用户所在省份编号'
); 
#在表中插入数据
INSERT user(username,proId) VALUES ('a',1),
('b',1),
('c',1),
('d',2),
('e',3),
('f',1),
('g',1);
#查询user表中的id,username, pro表中的proName
SELECT u.id,u.username,p.proName FROM user AS u INNER JOIN pro AS p ON u.proId=p.id;
#将Pro表中proName改为首都
UPDATE user1 SET proName='首都' WHERE id=1;
#创建管理员表
CREATE TABLE IF NOT EXISTS adm(
id  TINYINT NOT NULL AUTO_INCREMENT KEY COMMENT'编号',
username VARCHAR(10) NOT NULL UNIQUE  COMMENT '用户名',
email VARCHAR(10) NOT NULL DEFAULT '567890qq.com' COMMENT '邮箱',
proId TINYINT    UNSIGNED NOT NULL  COMMENT '用户所在省份编号' 
);
#插入数据
INSERT adm(username,proId)VALUES('king',1),('queen',2);
#创建商品分类
CREATE TABLE IF NOT  EXISTS goods(
id TINYINT  UNSIGNED NOT NULL AUTO_INCREMENT KEY COMMENT '编号',
cateName VARCHAR(20) NOT NULL UNIQUE COMMENT '商品分类',
cateDesc VARCHAR(20) NOT NULL DEFAULT ''
);
#在表中插入数据
INSERT goods (cateName) VALUES ('母婴'),('服装'),('电子');

#创建商品表
CREATE TABLE IF NOT EXISTS shopping (
id INT UNSIGNED NOT NULL AUTO_INCREMENT KEY COMMENT '编号',
producName VARCHAR(50) NOT NULL UNIQUE  COMMENT '商品编号',
price    FLOAT(8,2) NOT NULL DEFAULT 0 COMMENT '价格',
cateId TINYINT  UNSIGNED NOT NULL  COMMENT '商品编号所在列',
adminId TINYINT  UNSIGNED NOT NULL COMMENT '管理员编号'
);
#在表中插入数据
INSERT shopping(producName,price,cateId,adminId) VALUES('i9',98888,3,1),
('adidass',388,2,2),
('nike',888,2,2),
('奶瓶',299,1,1);
# 查询shopping表里面的price id produceNamae ------------goods cateName
SELECT s.id,s.producName,s.price ,g.cateName FROM shopping AS s INNER JOIN goods AS g ON s.cateId=g.id;

#查询admin id，username, email   pro proName
SELECT a.id,a.username,a.email ,p.proName FROM adm AS a INNER JOIN pro AS p ON a.proID=p.id;

-- 这是三张表查询

  #查询 shopping id,productName price
  #goods cateName
  #admin username email 
  SELECT s.id,s.producName ,s.price ,g.cateName,a.username,a.email FROM shopping AS s  INNER JOIN goods AS g 
  ON s.adminId=g.id INNER JOIN adm AS a ON s.cateId=a.id WHERE s.price>200 ORDER BY s.price DESC LIMIT 0,2;
  
  
  
#四表查询
# shopping , id productName price
# goods,cateName;
#adm username email
# pro proName
SELECT s.id,s.producName,s.price,g.cateName ,a.username,a.email,p.proName FROM shopping AS s INNER JOIN goods AS
g ON s.adminId=g.id INNER JOIN adm AS a ON s.cateId=a.id INNER JOIN pro AS p ON s.id=p.id;

#新建新闻表
CREATE TABLE IF NOT EXISTS new_cate(
id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT KEY COMMENT'编号', 
 cateName VARCHAR(50) NOT NULL UNIQUE COMMENT '分类名称',
 cateDesc VARCHAR(100) NOT NULL DEFAULT '' COMMENT '分类描述'
)ENGINE=InnoDB CHAR SET=UTF8;  
  #插入数据
  INSERT new_cate(cateName) VALUES ('国内新闻'),
  ('国际新闻'),('娱乐新闻'),('体育新闻');
  #新建新闻表
  CREATE TABLE IF NOT EXISTS news(
  id INT NOT NULL AUTO_INCREMENT UNIQUE KEY COMMENT '编号',
  title VARCHAR(100)  NOT NULL UNIQUE COMMENT '新闻标题',
  content VARCHAR(1000) NOT NULL COMMENT '新闻类容',
  cateId TINYINT NOT NULL COMMENT '新闻所属编号',
   CONSTRAINT cateId_fk_newCate FOREIGN KEY (cateId) REFERENCES new_cate(id)
  )ENGINE=INNODB;
  #向表中添加值
  INSERT news (title,content,cateId) VALUES('a1','aaaa1',1),
  ('a2','aaaa2',1),
  ('a3','aaaa3',4),
  ('a4','aaaa4',2),
  ('a5','aaaa5',3);
  
  #查询news  ,id ,title ,content
  #news_cate  cateName;
  SELECT n.id,n.title,n.content,nc.cateName FROM news AS n INNER JOIN new_cate AS nc ON n.cateId=nc.id;
#测试非法数据
INSERT news(title,content,cateId)VALUES('b1','bbbb1',8);  
#更新测试
UPDATE new_cate SET cateName='教育新闻' WHERE id=5;  
#动态删除外键
ALTER TABLE news DROP FOREIGN KEY cateId_fk_newCate; 
#动态添加外键
ALTER  TABLE news ADD FOREIGN KEY (cateId) REFERENCES new_cate (id); 
#动态删除外键
ALTER TABLE news DROP  FOREIGN KEY new_ibfk_1;  
#动态添加外键 
ALTER TABLE news ADD CONSTRAINT cateId_fk_newCate FOREIGN KEY (cateId) REFERENCES new_cate(id); 
#动态删除表
ALTER TABLE news DROP FOREIGN KEY  cateId_fk_newCate;
#删除表
ALTER TABLE news DROP FOREIGN KEY cateId_fk_newCate;
ALTER TABLE news DROP FOREIGN KEY cateId_fk_1;
#动态添加外键级联操作
ALTER TABLE nwes ADD CONSTRAINT cateId_fk_newCate FOREIGN KEY (cateId) REFERENCES  new_cate(id)
ON DELETE CASCADE ON UPDATE CASCADE;
#使用子查询
SELECT * FROM emp WHERE depId IN(SELECT id FROM emp);  
#创建学生表
CREATE TABLE IF NOT EXISTS stu(
id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT KEY COMMENT '编号',
username VARCHAR(20) NOT NULL UNIQUE COMMENT'学院名称',
score TINYINT UNSIGNED NOT NULL COMMENT '学院分数' 
)ENGINE=INNODB CHAR SET =UTF8;
  #插入数据
  INSERT stu(username,score) VALUES('king',95),
  ('queen',75),
  ('zhangsan',69),
  ('lisi',78),
  ('wanngwu',87),
  ('zhaoliu',88),
  ('tainqi',98),
  ('censhi',99),
  ('tiancai',55);
  #创建分数级别表
  CREATE TABLE IF NOT EXISTS level(
  id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT KEY COMMENT'编号',
  score TINYINT UNSIGNED COMMENT '分数'
  )ENGINE =INNODB CHAR SET=UTF8;
  #插入数据
  INSERT level(score) VALUES(90),
  (80),
  (70);
#查询成绩最好的
SELECT * FROM stu WHERE score>=(SELECT score FROM level WHERE id=1);
#查询评级别的同学
SELECT * FROM stu WHERE score <=(SELECT score FROM level WHERE id=3);  
#由EXISTS 引发子查询
SELECT * FROM emp WHERE EXISTS (SELECT depName FROM dep WHERE id =1);
#使用 ANY  ALL 	
SELECT * FROM stu WHERE score>ANY(SELECT score FROM level);
  #ALL代表是代表score最大值
  SELECT * FROM emp WHERE score>=ALL(SELECT score FROM level);
#测试
SELECT * FROM stu WHERE score<ALL(SELECT score FROM level);  
SELECT * FROM stu WHERE score=ANY(SELECT score FROM level);  
SELECT * FROM stu WHERE score!=ALL(SELECT score FROM level);
#在创建的时候就把数据插入进来了
CREATE TABLE IF NOT EXISTS user3 (
id TINYINT UNSIGNED NOT NULL  AUTO_INCREMENT KEY COMMENT '编号',
username  VARCHAR(20)
)SELECT id,username FROM emp;  
  INSERT user3 (username) SELECT username FROM user;
  #更新表中的数据
  UPDATE stu SET username=(SELECT username FROM user4 WHERE id=12);
  INSERT user SET username=(SELECT username FROM user4 WHERE id=12);
#去掉重复的值
SELECT DISTINCT(username) FROM user4;
#使用union
SELECT email,proId FROM user UNION SELECT id ,username FROM user4;  
SELECT * FROM user4 UNION SELECT * FROM user4;  
  #创建一个cate表
  CREATE TABLE IF NOT EXISTS cate(
  id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT KEY COMMENT '编号',
  cateName VARCHAR(100) UNIQUE COMMENT '分类名称',
  pId SMALLINT UNSIGNED NOT NULL DEFAULT '0' COMMENT '父id'
  )ENGINE =INNODB CHAR SET=UTF8;
  #在表中添加数据
  INSERT cate(cateName,pId) VALUES('服装',0),
  ('数码',0),
  ('玩具',0);
  #插入服装子类
  INSERT cate(cateName,pId)VALUES('男装',1),
  ('女装',1),
  ('内衣',1);
 #插入数码子类
 INSERT cate(cateName,pId) VALUES('电视',2),
 ('冰箱',2),
 ('洗衣机',2);
  #插入玩具分类
  INSERT cate(cateName,pId) VALUES('爱马仕',3),
  ('LV',3),
  ('GUCCI',3);
  #插入男装子类
   INSERT cate(cateName,pId) VALUES('夹克',4),
  ('衬衫',4),
  ('裤子',4);
  #插入电视分类
   INSERT cate(cateName,pId) VALUES('液晶电视',10),
  ('等离电视',10),
  ('背投电视',10);
 #查询所有分类信息，并且得到器父类
 SELECT s.id,s.cateName AS sCatename ,p.cateName AS pCateName 
 FROM cate AS s LEFT JOIN cate AS p ON s.pId=p.id;
 #查询父分类下的子分类
  SELECT p.id ,p.cateName AS pCateName ,s.cateName AS sCatename 
 FROM cate AS s RIGHT JOIN cate AS p ON s.pId=p.id;
  
#查询分类并切得到子分类的数目
SELECT p.id,p.cateName AS pCateName,COUNT(p.cateName) AS count FROM cate AS s RIGHT JOIN cate AS p ON s.pId=p.id
ORDER BY id ASC;
#创建good表
CREATE TABLE IF NOT EXISTS good (
id INT AUTO_INCREMENT KEY COMMENT '商品编号',
name VARCHAR(20) NOT NULL  COMMENT '商品名称',
price FLOAT NOT NULL       COMMENT '商品价格',
desp  VARCHAR(30) NOT NULL COMMENT '商品描述'
);
#向表中插入数据
INSERT INTO good(name,price,desp) VALUES('手机',2000.0,'黑色，存储容量为32g'),
('冰箱',1500.0,'银色，对开门'),
('洗衣机',3000.0,'滚筒'),
('空调',4000.0,'变频空调');
# 创建表
CREATE TABLE IF NOT EXISTS  user (
username VARCHAR(30),  
pw TINYINT(20)
);
INSERT  user(username,pw)VALUES('aaa','111');
#添加字段
ALTER TABLE user ADD id TINYINT(20) AUTO_INCREMENT KEY FIRST ;


































