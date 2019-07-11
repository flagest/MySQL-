-- 测试枚举类型
CREATE TABLE IF NOT EXISTS test_enum(
     sex enum('男','女','保密')
);
-- 插入数据
INSERT test_enum (sex) value('男');
INSERT test_enum(sex) value('男1');
INSERT test_enum(sex) value(3);
INSERT test_enum(sex) value(4);
INSERT test_enum(sex) value(5);
-- 测试集合set
CREATE TABLE IF NOT EXISTS test_set(
a set('A','B','C')
);
INSERT test_set (a) VALUE ('A');
INSERT test_set (a) VALUE ('A','B');
INSERT test_set (a) VALUE ('A','B','C');
-- 时间表
CREATE TABLE IF NOT EXISTS test_data(
a TIME
);
-- 向其中插入记录
INSERT test_data (a) value('12:23:43');
-- 测试组件
CREATE TABLE IF NOT EXISTS  test_primr_key(
id INT UNSIGNED PRIMARY KEY,
username VARCHAR(20)
);
-- 插入数据
INSERT test_primr_key(id,username) VALUE (1,'张三');
INSERT test_primr_key(id,username)VALUE (2,'李四');

CREATE TABLE IF NOT EXISTS table_primr_key2(id INT UNSIGNED,username VARCHAR(20), primary key(id));
CREATE TABLE IF NOT EXISTS table_primr_key3(
id INT UNSIGNED,
courseid INT UNSIGNED,
emial VARCHAR(50),
username VARCHAR(20),
 primary key(id,courseid)
);
DESC table_primr_key3;
-- 测试自动增长
CREATE TABLE test_auto_increament(
 id INT UNSIGNED KEY AUTO_INCREMENT,
 username VARCHAR(29)
);
#增加数据实现自动增长
INSERT test_auto_increament (id,username) VALUE (1,'张三');
INSERT test_auto_increament (username) VALUE ('A');
INSERT test_auto_increament (username) VALUE ('B');
INSERT test_auto_increament (username) VALUE ('C');
INSERT test_auto_increament (username) VALUE ('D');





















