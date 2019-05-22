-- 2018.03.08 星期四 第一周 早8:00~10:00
-- 实验一数据库
-- 实验1.1 数据库
create database testbase1
on
  (name=testbase1_data,filename='e:\张小山数据库\testbase1_data.mdf')
log on
  (name=testbase1_log,filename='e:\张小山数据库\testbase1_log.ldf')
go
/******************************************************************/
create database testbase2
on
primary
  (name=testbase2_prim_sub_dat1,
  filename='e:\张小山数据库\testbase2_prim_sub1_dat.mdf',
  size=5MB,
maxsize=50MB,
filegrowth=20%),
(name=testbase2_prim_sub_dat2,
filename='e:\张小山数据库\testbase2_prim_sub2_dat.ndf',
size=5MB,
maxsize=50MB,
filegrowth=20%),
filegroup testbase2_Group1
(name=testbase2_group1_sub1,
filename='e:\张小山数据库\testbase2_group1_sub1_dat.ndf',
size=5MB,
maxsize=50MB,
filegrowth=5MB),
(name=testbase2_group1_sub2,
filename='e:\张小山数据库\testbase2_group1_sub2_dat.ndf',
size=5MB,
maxsize=50MB,
filegrowth=5MB),
filegroup testbase2_Group2
(name=testbase2_group2_sub1,
filename='e:\张小山数据库\testbase2_group2_sub1_dat.ndf',
size=5MB,
maxsize=50MB,
filegrowth=15%),
(name=testbase2_group2_sub2,
filename='e:\张小山数据库\testbase2_group2_sub2_dat.ndf',
size=5MB,
maxsize=50MB,
filegrowth=15%)
log on
(name=testbase2_log,
filename='e:\张小山数据库\testbase2_log_file.ldf',
size=5MB,
maxsize=500MB,
filegrowth=10MB)
go
-- 实验1.2 分离数据库
exec sp_detach_db testbase1,true;
-- 实验1.3 数据库文件备份
-- 实验1.4 附加数据库
exec sp_attach_single_file_db @dbname='testbase1',
@physname='e:\张小山数据库\testbase1_data.mdf';
-- 实验1.5 删除数据库
drop database testbase1;
--2018.03.22 星期四 第三周 早8:00~10:00
--实验二数据库
-- 实验2.1 创建数据库表
create table c(cno char(2) not null,
cn char(10) not null,
ct tinyint)
create table sc(sno char(2),
cno char(2))
create table tc(tno char(2),
con char(2))
-- 实验2.2 修改数据库表结构
alter table s
add native char(40) null
alter table s
alter column native char(16) null
-- 删除数据库表
use jxsk
go
drop table t
go
-- 实验1 数据库
-- 实验1.1 创建数据库
--（4）创建指定数据库testbase1
-- 3．使用Transact-SQL指定参数创建数据库
CREATE DATABASE testbase1
ON
( NAME=testbase1_data,
  FILENAME='e:\张小山数据库\testbase1_data.mdf')
LOG ON
( NAME=testbase1_log,
  FILENAME='e:\张小山数据库\testbase1_log.ldf')
GO
--（5）指定多个参数创建数据库testbase2
USE master
GO
CREATE  DATABASE testbase2
ON
PRIMARY
(NAME=prim_sub_dat1,
   FILENAME='E:\张小山数据库\prim_sub1_dat.mdf',
   SIZE=5MB,
  MAXSIZE=50MB,
  FILEGROWTH=20% ),
(NAME=prim_sub_dat2,
   FILENAME='E:\张小山数据库\prim_sub2_dat.ndf',
   SIZE=5MB,
  MAXSIZE=50MB,
  FILEGROWTH=20% ),
FILEGROUP Grouptest1
(NAME=group1_sub1,
   FILENAME='E:\张小山数据库\group1_sub1_dat.ndf',
   SIZE=5MB,
  MAXSIZE=50MB,
  FILEGROWTH=5MB ),
(NAME=group1_sub2,
   FILENAME='E:\张小山数据库\group1_sub2_dat.ndf',
   SIZE=5MB,
  MAXSIZE=50MB,
  FILEGROWTH=5MB ),
FILEGROUP Grouptest2
(NAME=group2_sub1,
   FILENAME='E:\张小山数据库\group2_sub1_dat.ndf',
   SIZE=5MB,
  MAXSIZE=50MB,
  FILEGROWTH=15% ),
(NAME=group2_sub2,
   FILENAME='E:\张小山数据库\group2_sub2_dat.ndf',
   SIZE=5MB,
  MAXSIZE=50MB,
  FILEGROWTH=15% )
LOG ON
 (NAME=testbase2_log,
    FILENAME='E:\张小山数据库\testbase2_log_file.ldf',
    SIZE=5MB,
   MAXSIZE=25MB,
   FILEGROWTH=5MB )
GO

-- 实验1.2  分离数据库
-- 2．使用系统存储过程分离数据库testbase1
  exec sp_detach_db testbase1, true

-- 实验1.4   附加数据库
-- 2．使用系统存储过程安装数据库testbase1
EXEC sp_attach_single_file_db @dbname='testbase1',
@physname='e:\张小山数据库\testbase1_data.mdf '
-- 实验1.5  删除数据库
-- 2．使用Transact-SQL删除数据库testbase1
        DROP  DATABASE testbase1
-- 实验2  数据库表
-- 实验2．1   创建数据库表
-- 3．用SQL语句创建数据表C
CREATE TABLE C(CNO CHAR(2),
               CN CHAR(10),
               CT TINYINT )
-- 4．用SQL 语句创建数据表SC
CREATE TABLE SC(SNO CHAR(2),
CNO NCHAR(2),
SCORE TINYINT)
-- 5．用SQL 语句创建数据表TC
CREATE TABLE TC(TNO CHAR(2),
CNO CHAR(2))

--实验2．2   修改数据库表结构
-- 1．	用SQL向数据表S中添加列NATIVE、修改列NATIVE
-- （2）向S表中添加新列。新列定义为，列名：NATIVE，数据类型：NCHAR，长度：40， NULL。
ALTER TABLE S
                  ADD NATIVE NCHAR(40)  NULL
--（6）修改表S中的列名为NATIVE的定义。新定义为，列名：NATIVE，数据类型：CHAR，
-- 长度：16，NULL。
ALTER TABLE S
         ALTER  COLUMN  NATIVE  CHAR(16)  NULL
-- 实验2.3   删除数据库表
-- 2．用SQL删除数据表test2。
USE  jxsk
DROP TABLE test2
        GO
-- 实验3  数据操作
-- 3．使用INSERT INTO语句插入数据至数据表C中
--（2）插入如图3-8所示中的第一行记录。在查询窗口中，输入下面INSERT-INTO语句：
   USE jxsk
   INSERT INTO C VALUES('C1','程序设计','60'）

-- 实验3.2  修改数据
-- 2．用SQL语句修改数据表T中的数据
-- （3）修改数据表T中“张兰”教师的职称。
   USE jxsk
   UPDATE  T  SET  PROF='教授' WHERE TN ='张兰'

-- 2．用SQL语句删除数据表T中的数据
-- （2）删除数据表T中“张兰”教师的记录。
   USE jxsk
   DELETE FROM T WHERE TN ='张兰'

-- 实验3.4  复制数据库表
-- 1．用SQL复制数据表S生成一新表test1
--（1）创建复制数据表的SQL命令。
         USE jxsk
         SELECT * INTO test1 FROM S
         GO

-- 2．用SQL复制数据表T中“男”同学记录，生成一新表test2
-- （1）创建复制数据表T的SQL命令，复制数据表T中男同学的列：TN,SEX,AGE,PROF，生成一个新表test2：
         use jxsk
         Select TN,SEX,AGE,PROF into test2 From T
         where sex ='男'
         go
-- 实验4  完整性约束

-- 实验4．1 实体完整性约束
-- 3．用SQL为现有表T在TNO列上创建PRIMARY KEY 约束
-- （3）为表T在列TNO上创建主键：
        ALTER TABLE T
            ADD CONSTRAINT PK_TNO PRIMARY KEY(TNO)
-- 4．用SQL创建新表TEST_C，并以列约束形式创建PRIMARY KEY 约束
-- （2）创建新表及其主键约束。创建数据表TEST_C，并以列约束的形式在列CNO上创建主键：
       USE  jxsk
   CREATE TABLE  TEST_C(
CNO  CHAR(2)  CONSTRAINT  PK_TEST_C PRIMARY KEY,
CN  CHAR(10),
        CT  TINYINT)
-- 5．用SQL创建新表TEST_TC，并以表约束形式创建PRIMARY KEY 约束
-- （2）创建新表及其主键约束。创建数据表TEST_TC，并以表约束的形式在列TNO和CNO上创建主键，主键约束名为PK_TEST_TC：
      USE  jxsk
CREAT  TABLE  TEST_TC(
TNO  CHAR(2) ,
      CNO  CHAR(2) ,
        CONSTRAINT PK_TEST_TC  PRIMARY KEY(TNO, CNO))

-- 7．用SQL为现有表C中的CN列创建“UNIQUE约束”
-- （2）为数据表C在课程名CN列上创建UNIQUE约束，约束名为UNIQUE_C：
USE  jxsk
ALTER TABLE C
      ADD CONSTRAINT UNIQUE_C  UNIQUE(CN)

-- 9．用SQL为现有表TEST_TC增加新列ID_TC，并创建此列属性为IDENTITY
-- （2）为数据表TEST_TC增加一个新列ID_TC，并设置此列为IDENTITY：
USE  jxsk
ALTER TABLE TEST_TC
      ADD ID_TC  INT  IDENTITY

-- 11．用SQL删除表C中CN列的UNIQUE约束UNIQUE_C
-- （2）删除数据表C中的唯一约束“UNIQUE_C”：
USE  jxsk
ALTER TABLE C  DROP UNIQUE_C
-- 实验4.2  域完整性约束
-- 1.	用SQL给现有表S中的年龄列AGE创建取值范围在14至40岁之间的CHECK约束，并检查表中的现有数据是否符合此CHECK约束
--（2）约束名为CHECK_AGE：
         USE  jxsk
 ALTER TABLE S WITH CHECK
    ADD CONSTRAINT CHECK_AGE CHECK( AGE>=14 AND AGE<=40)
         GO
-- 3．用SQL创建一新表TEST_S，包含DEFAULT和CHECK约束。
--（2）约束名为CHECK_AGE：
        USE  jxsk
CREATE TABLE TEST_S(
  SNO CHAR(2) NOT NULL,
SN CHAR(8)  NOT NULL,
SEX CHAR(2) NULL CONSTRAINT DEFAULT_SEX  DEFAULT '男'
        CONSTRAINT CHECK_SEX CHECK(SEX='男' OR SEX='女'),
AGE TINYINT  NULL CONSTRAINT DEFAULT_AGE  DEFAULT 18,
CONSTRAINT CHECK_S_AGE CHECK(AGE>=14 AND AGE<=40))
GO
-- 4．用SQL删除表T中的PROF和COMM之间的CHECK约束CHECK_T
         USE  jxsk
 ALTER TABLE T
    DROP CONSTRAINT CHECK_T
         GO
-- 实验4.3  引用完整性约束
-- 2．用SQL创建表T与表TC之间的引用关系
-- （2）创建表T与表TC的关联关系的SQL语句。
      ALTER TABLE TC WITH NOCHECK
         ADD CONSTRAINT FK_T_TC FOREIGN KEY (TNO) REFERENCES T(TNO)
         ON DELETE CASCADE
-- 实验4.4  规 则
-- 1．	用SQL创建、绑定、解除规则
-- （2）创建规则RU_SEX：
USE jxsk
GO
CREATE  RULE  RU_SEX  AS  @SEX  IN('男' , '女' )
GO
-- （4）绑定规则RU_SEX到表T中的SEX列。
         USE  jxsk
         EXEC  sp_bindrule  RU_SEX , 'T.SEX'
         GO
-- （7）解除规则在表T上的绑定。
USE  jxsk
         EXEC sp_unbindrule  'T.SEX'
GO
-- 实验5.1  创建索引
-- 1．	用SQL为表T在TNO列上按降序创建聚簇索引IND_TNO
-- （2）创建SQL语句，为表T在的TNO列上按降序创建聚簇索引IND_TNO：
       USE  jxsk
CREATE  CLUSTERED INDEX  IND_TNO  ON  T(TNO DESC)
       GO
-- 4．用SQL为表C在CN列上按升序创建唯一索引IND_CN
-- （2）创建SQL语句, 为表C在的CN列上按降序创建聚簇索引IND_CN：
       USE  jxsk
CREATE  UNIQUE  INDEX  IND_CN  ON  C(CN)
       GO
-- 实验5.2  删除索引
-- 2．用SQL删除表T中的索引IND_SN_AGE
-- （3）创建SQL语句，删除表T中的索引IND_SN_AGE：
       USE  jxsk
DROP  INDEX  T.IND_SN_AGE
GO
-- 实验6  视  图
-- 1．	使用SQL创建课程表视图VIEW_CTABLE
USE jxsk
GO
CREATE VIEW VIEW_CTABLE
       AS SELECT TN,CN FROM T,C,TC
       WHERE T.TNO=TC.TNO AND C.CNO=TC.CNO
GO
-- 2．对视图VIEW_S执行INSERT语句
USE jxsk
INSERT INTO VIEW_S VALUES ( '古明', '男',18, '自动化' )
GO
-- 3．修改视图VIEW_S的定义，使其包含S表的主键，再执行插入操作
-- （2）创建修改视图的SQL语句，使其包含表S中的字段：SNO，SN，SEX，DEPT
USE jxsk
GO
ALTER VIEW VIEW_S
       AS  SELECT  SNO,  SN,  SEX,  DEPT  FROM  S
GO
-- （5）创建SQL语句，向视图中插入数据：
USE jxsk
INSERT INTO VIEW_S VALUES（'S8',  '古明' , '男' , '自动化'）

-- 4．对视图VIEW_S执行UPDATE语句，查看此视图的基本表S中数据的变化
USE jxsk
UPDATE VIEW_S  SET  DEPT='计算机'  WHERE  SN= '古明'
GO

-- 实验6.3  修改视图
-- 2．使用SQL给视图VIEW_CTABLE增加一个课时字段：CT TINYNIT
USE jxsk
GO
ALTER VIEW VIEW_CTABLE
       AS SELECT TN,CN,CT FROM T,C,TC
          WHERE T.TNO=TC.TNO AND C.CNO=TC.CNO
GO

-- 2．使用SQL删除视图VIEW_CTABLE
-- （3）创建删除视图的SQL语句。
USE jxsk
GO
DROP VIEW VIEW_CTABLE
GO

-- 2018.05.17 星期四 第十周 早8:00~10:00
-- 实验七数据查询
--  实验7.1  单表查询
-- 1．指定列或全部列查询。
-- （1）查询S表中全体学生的详细记录
USE jxsk
SELECT  *  FROM  S
GO
--（2）查询所有学生的姓名及其出生年份。
      USE jxsk
SELECT SN,  year(date)-AGE  FROM  S
GO

--2．按条件查询及模糊查询
--（1）查询考试成绩有不及格学生的学号。
USE jxsk
SELECT DISTINCT SNO  FROM  SC  WHERE SCORE < 60
GO
--（2）查询年龄在20~23岁之间的学生姓名、系名、年龄。
    USE jxsk
SELECT SN,  DEPT,  AGE   FROM S
  WHERE AGE BETWEEN 20 AND 23
GO
--（3）查询姓李的学生的姓名、学号和性别。
    USE jxsk
SELECT SN,  SNO,  SEX   FROM  S
    WHERE SN  LIKE  '李%' 
GO
--（4）查询名字中第2个字为“明”字的男学生的姓名和系名。
USE jxsk
SELECT SN AS 姓名,  DEPT AS 系名  FROM S
WHERE SN LIKE  '_明%'  AND  SEX = '男' 
GO
--3．对查询结果排序
--（1）查询信息系、计算机系学生的姓名、系名，结果按系名升序，姓名降序排序。
USE jxsk
SELECT SN AS 姓名，DEPT AS 系名  FROM S
WHERE DEPT IN（'信息'  ,  '计算机' ）
ORDER BY DEPT , SN DESC
GO
--（2）查询所有有课程号C2成绩的学生的学号、课程号和成绩，并按成绩降序排序。
USE jxsk
SELECT SNO AS 学号,  CNO AS 课号,  SCORE AS 成绩  FROM SC
WHERE CNO='C2'   AND  SCORE IS NOT NULL
ORDER BY SCORE DESC
GO
--4．使用聚集函数的查询
--（1）查询计算机系学生总人数。
USE jxsk
SELECT  COUNT(*)  FROM  SC
WHERE  DEPT= '计算机' 
GO
--（2）查询选修了微机原理课程的学生人数、平均成绩、最高成绩。
USE jxsk
SELECT COUNT(*)  AS 人数, AVG(SCORE)  AS 平均分数, MAX(SCORE)  AS 最高分数 
FROM C，SC
WHERE CN='微机原理'  AND  C.CNO=SC.CNO
GO
--5．对查询结果分组
--（1）查询各个课程号及相应的选课人数。
USE jxsk
SELECT CNO AS 课程号,   COUNT(SNO)  AS 人数,
FROM  SC
GROUP BY CNO
GO
--（2）查询选修了2门以上课程的学生姓名和平均成绩。
USE jxsk
SELECT SN AS 姓名,  AVG(SCORE) AS 平均成绩
FROM  S, SC
WHERE  S.SNO = SC.SNO  
GROUP BY S.SN
HAVING COUNT(*)>2
GO
--实验7.2  连接查询
--1．连接查询
--（1）查询所有选课学生的学号、姓名、选课名称及成绩。
USE jxsk
SELECT S.SNO,  SN,  CN,  SCORE  
FROM  S,  C,  SC
WHERE S.SNO=SC.SNO AND C.CNO=SC.CNO
GO
--（2）查询每门课程的课程号、任课教师姓名及其选课人数。
USE jxsk
SELEC  C.CNO, TN,  COUNT(SC.SNO)  AS 学生人数 
FROM  T, TC, C, SC
WHERE T.TNO=TC.TNO AND C.CNO=TC.CNO AND  C.CNO=SC.CNO 
GROUP BY C.CN,T.TN
GO
--2．自身连接
--（1）查询所有比“刘伟”工资高的教师姓名、工资和刘伟的工资。
USE jxsk
SELECT  X.TN  AS 姓名,  X.SAL  AS 教师工资, Y.SAL  AS 刘伟工资
FROM  T AS X， T AS Y
WHERE X.SAL>Y.SAL  AND  Y.TN='刘伟'
GO
--（2）查询同时选修了“程序设计”和“微机原理”的学生姓名、系名。
USE jxsk
SELECT  DISTINCT(SN) AS 姓名,C1.CN AS 课程名1,C2.CN AS 课程名2
FROM  C AS C1, C AS C2,SC AS SC1 ,SC AS SC2,S
WHERE  C1.CNO = SC1.CNO AND C2.CNO=SC2.CNO AND
         C1.CN='程序设计' AND C2.CN='微机原理' AND
         SC1.SNO=SC2.SNO AND SC1.SNO=S.SNO
GO
--3．外连接
--查询所有学生的学号、姓名、选课名称及成绩（没有选课的同学的选课信息显示为空）
USE jxsk
SELECT  S.SNO, SN,CN,SCORE  FROM  S
LEFT OUTER JOIN SC  ON S.SNO=SC.SNO
LEFT OUTER JOIN C  ON C.CNO=SC.CNO
GO
--实验7.3  嵌套查询
--1．返回一个值的子查询
--（1） 查询与“刘伟”教师职称相同的教师号、姓名和职称。
USE jxsk
SELECT TNO,  TN,  PROF  FROM  T
WHERE PROF=（SELECT PROF FROM T
WHERE TN='刘伟' ）
GO
--2．返回一组值的子查询
--（1）使用ANY谓词查询讲授课程号为C5的教师姓名
USE jxsk
SELECT  TN  FROM  T
WHERE  (TNO=ANY  (SELECT TNO FROM TC
WHERE CNO='C5' ))
--（2）使用“IN”谓词查询讲授课程号为C5的教师姓名
USE jxsk
SELECT  TN   FROM  T
WHERE  (TNO IN  (SELECT TNO FROM TC   WHERE CNO='C5' ))
GO
--（3）使用“ALL”谓词查询其他系中比计算机系所有教师工资都高的教师的姓名、工资和所在系。
USE jxsk
SELECT TN, SAL, DEPT  FROM  T
WHERE  (SAL>ALL  (SELECT SAL FROM T
WHERE DEPT='计算机')   AND  (DEPT<>'计算机' ) )
GO
--（4）使用“EXISTS”谓词查询没有讲授课程号为C5的教师姓名、所在系。
USE jxsk
SELECT TN,  DEPT  FROM T
WHERE  (NOT EXISTS   (SELECT * FROM TC
WHERE TNO=T.TNO AND  CNO='C5' ))
GO
--（5）使用“NOT EXISTS”谓词查询至少选修了学生S2选修的全部课程的学生学号。
USE jxsk
SELECT  DISTINCT  SNO  FROM  SC SCX
WHERE NOT EXISTS  (SELECT * FROM SC SCY   WHERE SCY.SNO='S2' AND
                        NOT EXISTS  (SELECT * FROM SC SCZ
   WHERE CZ.SNO=SCX.SNO  
AND SCZ.CNO=SCY.CNO))GO
     GO
--实验7.4  集合查询
--查询计算机系的学生及年龄不大于19岁的学生。
USE jxsk
SELECT * FROM  S  WHERE DEPT='计算机' 
UNION
SELECT * FROM S  WHERE AGE<=19
GO
--实验8   存储过程
--实验8.1 创建并执行存储过程
--1．用企业管理器创建并执行一存储过程
--（1）创建存储过程Pro_Qsinf：通过学生学号来查询学生的姓名、年龄、系名。
USE jxsk
GO
Create Procedure Pro_Qsinf
@sno_in char(8)= 'S2', @sname_out char(8) output,@sage_out int output,@dept_out char(10) output
As  select @sname_out=sn,@sage_out=age ,@dept_out=dept
From S where sno=@sno_in
GO
--（2）执行存储过程Pro_Qsinf。查询并显示出默认学号（即S2）和学号为S4学生的姓名和年龄。
USE jxsk
declare  @sno_in char(8),
        @sname_out char(8),
        @sage_out int,
        @sdept_out char(10)      
exec Pro_Qsinf default, @sname_out output, @sage_out output,
                   @sdept_out output
print @sname_out
print @sage_out
print @sdept_out
select @sno_in='S4'
exec Pro_Qsinf @sno_in,@sname_out output,@sage_out output,
                       @sdept_out output
print @sname_out
print @sage_out
print @sdept_out
go

--2．用SQL创建一存储过程
--（1）创建存储过程Pro_Qscore ：通过学生姓名和课程名查询该生该课程的成绩。
USE jxsk
go
CREATE Procedure Pro_Qscore
  @sname_in char(8), @cname_in char(10) ,
        @score_out tinyint output
As select @score_out=score from s,c,sc 
   where s.sno=sc.sno and c.cno=sc.cno and sn=@sname_in and cn=@cname_in
go
--（2）执行存储过程Pro_Qscore。查询并显示学生“李思”的“程序设计”课程的成绩。
USE jxsk
declare @sname_in char(8),
        @cname_in char(8),
        @score_out tinyint
select @sname_in='李思'
select @cname_in='程序设计'
exec Pro_Qscore @sname_in,@cname_in,
                @score_out output
print  Rtrim ( @sname_in) +' = '+Ltrim( str(@score_out ) )
go
--实验8.2  修改存储过程
--2．用SQL修改存储过程Prc_Qsinf
USE jxsk
GO
Alter Procedure Pro_Qsinf
@sno_in char(2)= 'S1', @sname_out char(8) output,
@ssex_out char(2) output，@dept_out char(10) output
As 
select @sname_out=sn,@ssex_out=sex ,@dept_out=dept
from s where sno=@sno_in
GO
--实验8.3  删除存储过程
--2．用SQL删除存储过程Prc_Qscore
USE  jxsk
Drop procedure  Pro_Qscore
Go
-- 实验9  触发器
-- 1．用企业管理器为表S创建一级联更新触发器TRIGGER_S。
CREATE TRIGGER TRIGGER_S
          ON S
          FOR UPDATE AS
          IF UPDATE(SNO)
          BEGIN
              DECLARE @SNO_NEW CHAR(2),@SNO_OLD CHAR(2)
SELECT @SNO_NEW=SNO FROM INSERTED
SELECT @SNO_OLD=SNO FROM DELETED
UPDATE SC SET SNO=@SNO_NEW  WHERE SNO=@SNO_OLD
           END
-- 2．企业管理器为表SC创建一限制更新触发器TRIGGER_SC
-- 要求：若修改SC表中一记录的学号，则要检查表S中是否存在与该学号相同的记录，若有则不许修改，若没有则可修改。
-- （1）创建触发器
  CREATE TRIGGER TRIGGER_SC
      ON SC
      FOR UPDATE AS
      IF UPDATE(SNO)
        BEGIN
           DECLARE @SNO_NEW CHAR(2)，@SNO_OLD CHAR(2),SNO_CNT INT
SELECT @SNO_OLD=SNO FROM DELETED
SELECT @SNO_CNT=COUNT(*) FROM S WHERE SNO=@SNO_OLD
IF  @SNO_CNT<>0
   ROLLBACK TRANSACTION
         END
-- 3．用SQL为表SC创建一触发器Score_sc_tri
-- (1)要求：当插入一个记录或修改成绩时，确保此记录的成绩在0～100之间。
Create trigger  Score_sc_tri
       On SC For Insert,update
       As  declare  @scroe_read  tinyint
          Select  @scroe_read=scroe from inserted
          If  @scroe_read>=0 and  @scroe_read<=100 
             begin
               Print  ' 操作完成！'
               Return  
             End
          Print  ' 成绩超出0～100之间！请重新输入。'
          Rollback  Transaction
GO


-- （2）验证触发器Score_sc_tri的作用。
INSERT INTO SC VALUES('S1','C5',190)
    GO  
INSERT INTO SC VALUES('S1','C5',100)
GO
UPDATE sc SET Score=130 WHERE sno='S2'AND cno='C5'
GO
UPDATE sc SET Score=60 WHERE sno='S2'AND cno='C5'
GO
-- 4．用SQL为表C创建一个级联删除触发器TRIGGER_DC：通过课程名从C表中删除某课程
-- 信息，同时删除SC表中与此课程相关的选课记录
USE jxsk
GO
Create trigger  TRIGGER_DC 
      On SC For DELETE
      As declare @CNO_DEL CHAR(2)
Select @CNO_DEL=CNO  From DELETED
DELETE FROM SC  WHERE CNO=@CNO_DEL          
GO
-- （2）验证触发器的作用。
USE jxsk
Delete from C where CNO= 'C1'
           GO
-- 实验9.2  修改触发器
-- 1. 用企业管理器修改表S的触发器TRIGGER_S
Create trigger  TRIGGER_S 
    On S For DELETE
    As declare @SNO_DEL CHAR(2)
Select @SNO_DEL=SNO  From DELETED
DELETE From SC Where SNO=@SNO_DEL      
-- 2. 用SQL修改表C的触发器TRIGGER_DC
-- 要求：通过课程名从C表中删除某课程信息，同时删除SC表和TC表中与此课程相关的记录。
USE jxsk
GO
Alter trigger  TRIGGER_DC 
    On SC For DELETE
    As declare @CNO_DEL CHAR(2)
Select @CNO_DEL=CNO  from DELETED
DELETE from SC WHERE CNO=@CNO_DEL          
DELETE from TC WHERE CNO=@CNO_DEL          
GO
-- 实验9.3  删除触发器
-- 2．用SQL删除表C的触发器TRIGGER_DC
USE jxsk
DROP TRIGGER  TRIGGER_DC 
GO
-- 实验10  T-SQL程序设计
-- 1．计算1~100之间所有能被3整除的数的个数和总和
DECLARE @SUM SMALLINT,
@I SMALLINT,@NUMS SMALLINT
SET @SUM=0
SET @I=1
SET @NUMS=0
WHILE (@I<=100)
  BEGIN
    IF (@I%3=0 )
      BEGIN
        SET @SUM=@SUM+@I
        SET @NUMS=@NUMS+1
      END
    SET @I=@I+1
  END
PRINT '总和是：' + STR( @SUM )
PRINT '个数是：' + STR( @NUMS )

-- 2．从学生表中选取SNO，SN，SEX，如果为“男”则输出“M”，如果为“女”则输出“F”
USE jxsk
SELECT SNO AS 学号,  SN AS 姓名,  性别 =
   CASE SEX
           WHEN '男'  THEN  'M'
WHEN '女'  THEN  'F'
 END
FROM  S
GO
-- 实验10.2   面向复杂T-SQL程序设计
-- 1．从教学数据库jxsk中查询所有同学选课成绩情况：姓名、课程名、成绩。要求：凡成绩为空者输出“未考”、小于60分的输出“不及格”；60分至70分的输出“及格”；70分至80分的输出“中”；80分至90分的输出“良好”；90分至100分的输出“优秀”。并且输出记录按下列要求排序：先按SNO升序，再按CNO号升序，最后按成绩降序。
USE jxsk
SELECT SN AS 姓名,
CN AS 课程名,
成绩 =
    CASE 
           WHEN SCORE IS NULL THEN '未考'
   WHEN SCORE<60 THEN '不及格'
   WHEN SCORE>=60 AND SCORE<70 THEN '及格'
   WHEN SCORE>=70 AND SCORE<80  THEN '中'
   WHEN SCORE>=80 AND SCORE<90  THEN '良好'
   WHEN SCORE>=90 THEN '优'
   END
FROM SC, S, C
WHERE S.SNO=SC.SNO AND C.CNO=SC.CNO
ORDER BY S.SNO, C.CNO, SCORE DESC
GO
-- 2．现给教师增加工资的操作
-- 要求：必须任2门以上课程且涨幅按总收入分成三个级别：4000元以上涨300；3000元以上涨200；3000以下涨100。只任1门课程的涨50。其他情况的不涨。
UPDATE t SET sal = sal +
CASE 
  WHEN t.tno IN 
     (SELECT TC.tno 
      FROM T,TC 
      WHERE  T.tno = TC.tno AND (SAL+COMM) >=4000
      GROUP BY TC.TNO HAVING COUNT(cno)>=2)  THEN  300
  WHEN T.tno IN 
     (SELECT TC.tno 
      FROM  T,TC 
     WHERE  T.tno = TC.tno AND (SAL+COMM)>=3000 AND (SAL+COMM)<4000
      GROUP BY  TC.Tno HAVING COUNT(cno)>=2)  THEN 200
  WHEN T.Tno IN 
     (SELECT Tc.Tno 
      FROM  T, TC 
      WHERE  T.Tno = TC.Tno AND (T.Sal+t.COMM<3000)
      GROUP BY tno  HAVING COUNT(cno)>=2)  THEN 100
  WHEN T.Tno in 
      (SELECT TC.Tno
       FROM T,TC
       GROUP BY  TC.Tno  HAVING COUNT(*) =1) THEN 50
END
-- 实验11 用户定义数据类型与自定义函数
-- 实验11.1  创建和使用用户定义数据类型
-- 1．创建和使用一用户定义的数据类型Idnum
-- （1）用SQL语句创建一个用户定义的数据类型Idnum。
USE jxsk
EXEC sp_addtype Idnum, ' char(6)' ,  ' NOT NULL'
GO
-- （2）使用用户定义的数据类型Idnum ，创建一个学生表STUDENT和一个教师表TEACHER。
      USE jxsk
CREATE TABLE STUDENT(
SNO Idnum ,
SN CHAR(11) ,
SSEX CHAR(2),
SAGE TINYINT )
CREATE TABLE TEACHER(
TNO Idnum ,
TN CHAR(11),
TSEX CHAR(2),
TAGE TINYINT,
TPROF CHAR(11) )
-- （2）使用用户定义的数据类型Nameperson。修改学生表STUDENT中的姓名类型为Nameperson和教师表中的教师姓名类型为Nameperson。
USE jxsk
ALTER TABLE STUDENT
ALTER COLUMN SN Nameperson
ALTER TABLE TEACHER
ALTER COLUMN TN Nameperson 
-- 实验11.2  删除用户定义数据类型
-- 1．使用系统存储过程删除用户定义的数据类型Nameperson
USE jxsk
ALTER TABLE student ALTER COLUMN SNO CHAR(6)  NOT NULL
ALTER TABLE teacher ALTER COLUMN TNO CHAR(6)  NOT NULL
EXEC  Sp_droptype  Nameperson
      GO
-- 实验11.3 创建和使用用户定义的函数
-- ③ 创建用户定义函数Score_FUN。
CREATE FUNCTION Score_FUN( @SNAME_IN  CHAR(11),@CNAME_IN CHAR(11) )
RETURNS TINYINT
AS
BEGIN
   DECLARE @SCORE_OUT TINYINT
   SELECT @SCORE_OUT=score FROM sc,s,c 
where s.sno=sc.sno and c.cno=sc.cno and 
Sn=@SNAME_IN and Cn=@CNAME_IN 
   RETURN(@SCORE_OUT)
END
-- （2）使用用户定义的函数Score_FUN，查询学生钱尔的编译原理课程的成绩。
DECLARE @S_Score tinyint
USE jxsk
EXEC @S_Score=dbo.Score_FUN  '钱尔'，'编译原理'
Print  ' 钱尔的编译原理成绩是 '+ STR( @S_Score )
GO
-- 2．用SQL创建一个内嵌函数
-- （1）用SQL创建一个内嵌函数S_Score_FUN
USE jxsk
GO
CREATE FUNCTION S_Score_FUN( @SNAME_IN CHAR(10) )
RETURNS TABLE
AS
   RETURN (SELECT CN, SCORE FROM  SC, S, C 
            Where S.Sno=SC.Sno and
                  S.cno=SC.Cno and Sn=@SNAME_IN  )
GO
-- （2）使用用户定义的函数S_Score_FUN，查询学生钱尔所有课程的成绩。
USE jxsk
SELECT * FROM S_Score_FUN ( '钱尔' )
GO
-- 3．用SQL创建一个多语句函数
-- （1）用SQL创建一个多语句函数ALL_Score_FUN。
USE jxsk
GO
CREATE FUNCTION ALL_Score_FUN ( @CNAME_IN CHAR(10) )
RETURNS @ALL_SCORE_TAB TABLE ( SNO CHAR(6) PRIMARY KEY,
SN CHAR (10) NOT NULL ,
SEX CHAR (2),
SCORE TINYINT )
AS
BEGIN
   INSERT @ALL_SCORE_TAB
   SELECT S.SNO,SN,SEX,SCORE 
   FROM  SC, S, C 
   WHERE S.Sno = SC.Sno and C.Cno=SC.Cno and Cn=@CNAME_IN  
   RETURN
END
GO
-- （2）使用用户定义的函数ALL_Score_FUN，查询选择微机原理课程的学生的成绩。
USE jxsk
SELECT * FROM ALL_Score_FUN ( '微机原理' )
GO
-- 实验11.4  修改用户定义的函数
-- 1．用企业管理器修改函数
-- （1）用企业管理器修改函数Score_FUN
CREATE FUNCTION Score_FUN( @SNAME_IN  CHAR(10),@CNAME_IN CHAR(10) )
RETURNS CHAR(8)
AS
BEGIN
   DECLARE @SCORE_OUT CHAR(8)
   SELECT @SCORE_OUT=
CASE
WHEN SCORE IS NULL THEN '未考'
WHEN SCORE <60 THEN '不及格'
WHEN SCORE >=60 AND SCORE <70 THEN  '及格'
WHEN SCORE >=70 AND SCORE <80 THEN  '中'
WHEN SCORE >=80 AND SCORE <90 THEN  '良好'
WHEN SCORE >= 90 THEN  '优秀'
          END
FROM sc,s,c 
WHERE s.sno=sc.sno and c.cno=sc.cno and Sn=@SNAME_IN and Cn=@CNAME_IN 
   RETURN(@SCORE_OUT)
END
-- （2）使用用户定义的函数Score_FUN，查询学生钱尔的编译原理课程的成绩
DECLARE @S_Score CHAR(8)
USE jxsk
EXEC @S_Score=dbo.Score_FUN  '钱尔'，'编译原理'
Print  ' 钱尔的编译原理成绩是 ' + @S_Score 
GO

-- 2．用SQL修改函数
-- （1）用SQL修改函数S_Score_FUN，要求增加一输出列对应成绩的等级。
USE jxsk
GO
ALTER FUNCTION S_Score_FUN( @SNAME_IN CHAR(10) )
RETURNS TABLE
AS
   RETURN (SELECT CN, SCORE,
LEVER= 
CASE
WHEN SCORE IS NULL THEN  '未考'
WHEN SCORE <60 THEN   '不及格' 
WHEN SCORE >=60 AND SCORE <70 THEN   '及格'
WHEN SCORE >=70 AND SCORE <80 THEN   '中' 
WHEN SCORE >=80 AND SCORE <90 THEN   '良好' 
WHEN SCORE >= 90 THEN  '优秀'
          END
FROM SC, S, C 
            WHERE S.Sno=SC.Sno  and  C.cno=SC.Cno and Sn=@SNAME_IN  )
GO

-- （2）使用用户定义的函数S_Score_FUN，查询学生钱尔所有课程的成绩。
USE jxsk
SELECT * FROM S_Score_FUN ( '钱尔' )
GO
-- 实验11.5 删除用户定义的函数
-- 2．用SQL删除函数S_Score_FUN
USE jxsk
DROP  FUNCTION  S_Score_FUN
      GO
-- 实验12.4  对象级许可权限管理
-- 2．授予用户SQLUser对数据库jiaoxuedb表Student 的INSERT权限；废除对表Student的UPDATE权限
          USE  jiaoxuedb
          GO
          GRANT INSERT ON Student TO SQLUser
          REVOKE UPDATE ON Student TO SQLUser
          GO

-- 实验13  SQL Server事务设计
-- 实验13.1 设计并执行事务
-- 1．设计并执行事务1
-- 将学生“陈东辉”的“计算机基础”课程成绩改为77分。
BEGIN TRANSACTION
USE jiaoxuedb
GO
UPDATE SC SET score=77  WHERE Sno IN (SELECT SNO  FROM Student
        WHERE Sname='陈东辉') AND Cno IN (SELECT CNO FROM Course
        WHERE Cname='计算机基础')
 GO
COMMIT
GO  

-- 2．设计事务2
-- 将课程“数据结构”的课号与“微机原理”的课号互换。
BEGIN TRANSACTION
USE jiaoxuedb
GO
Declare @cno1 char(5),@cno2 char(5)
Select @cno1=cno From Course Where Cname='数据结构'
Select @cno2=cno From Course Where Cname='微机原理'
UPDATE Course SET Cno=@cno1 WHERE Cname='微机原理'
UPDATE Course SET Cno=@cno2 WHERE Cname='数据结构'
GO
COMMIT
GO
-- 3．设计事务3
-- 教师“许永军”退休，由他讲授的2门课程中，课程“微机原理”转给教师“张朋”讲授；“数据库”转给“李英”讲授。
BEGIN TRANSACTION
USE jiaoxuedb
GO
Declare @cno char(5),@tno1 char(6),@tno2 char(6)
Select @tno1=Tno From Teacher Where Tname='许永军'
Select @tno2=Tno From Teacher Where Tname='张朋'
Select @cno=Cno From Course Where Cname='微机原理'
UPDATE TC SET Tno=@tno2 WHERE Tno=@tno1 AND Cno=@cno
Select @tno1=Tno From Teacher Where Tname='许永军'
Select @tno2=Tno From Teacher Where Tname='李英'
Select @cno=Cno From Course Where Cname='数据库'UPDATE TC SET Tno=@tno2 WHERE Tno=@tno1 AND Cno=@cno
COMMIT
GO

-- 实验13.2设计复杂事务
-- 1．设计并执行事务1
-- 学生“王一山”打算选修“计算机网络”课程，根据要求，此门课程选修的人数最多为30人，该生是否可以选修此门课程，给出结果提示。

BEGIN TRANSACTION
USE jiaoxuedb
GO
Declare @person_num tinyint, @cno char(5),@sno char(6)
Select @cno=cno From Course Where Cname='计算机网络'
Select @sno=sno From Student Where Sname='王一山'
Select @person_num = count(*)  From SC  Where Cno=@cno
If @person_num<30
Begin 
   Insert into SC(Sno, Cno) Values (@sno, @cno)
   Commit   /* 提交事务*/
   Print  '王一山同学选修计算机网络课程注册成功！'
End
        Else
Begin 
   Rollback Transaction  /* 回滚事务*/
   Print  '选修计算机网络课程的人数已满，王一山同学不能再选修此课程！'
End
GO       
--实验14  数据库备份和恢复
--实验14.1完全数据库备份与简单恢复
--2．使用T-SQL执行完全数据库备份及其简单恢复
--（1）操作1：对现有数据库执行完全备份Fullbackup_jiaoxuedb2
USE jiaoxuedb
GO
BACKUP DATABASE jiaoxuedb
   TO DISK='D:\备份数据库\Fullbackup_jiaoxuedb2'
   WITH  INIT
GO

--（2）操作2：将张彬同学的名字改为：“张斌”
      USE jiaoxuedb  
UPDATE Student SET Sname='张斌 'WHERE Sname='张彬'
GO
--（3）操作3：执行恢复，将数据库恢复到操作2之前的状态。
USE master
GO
RESTORE DATABASE jiaoxuedb
 FROM  DISK='D:\备份数据库\Fullbackup_jiaoxuedb2'
 WITH  RECOVERY
GO
--实验14.2 差异数据库备份与简单恢复
--2．使用T-SQL执行数据库差异备份及其恢复
--（1）操作1：创建数据库jiaoxuedb一个完全数据库备份Fbackup_jiaoxuedb2。
USE jiaoxuedb
GO
BACKUP DATABASE jiaoxuedb
   TO DISK='D:\备份数据库\Fbackup_jiaoxuedb2'
   WITH  INIT
GO
--（2）操作2：把表SC中学号为001201课程号为02002的记录删除。
USE jiaoxuedb
GO
DELETE FROM SC WHERE Sno='001201' and Cno='02002'
GO
--（3）操作3：进行差异备份当前数据库Dbackup_jiaoxuedb2。
USE jiaoxuedb
GO
BACKUP DATABASE jiaoxuedb
   TO DISK='D:\备份数据库\Dbackup_jiaoxuedb2'
   WITH  DIFFERENTIAL
GO
--（4）操作4：向表SC中插入记录：学号：001201、课号：02002、成绩：79
USE jiaoxuedb
GO
INSERT INTO SC VALUES('001201', '02002' ,79 )
GO
--（5）操作5：把数据库恢复到操作2完成后的状态。
USE master
GO
RESTORE DATABASE jiaoxuedb
  FROM  DISK='D:\备份数据库\Fbackup_jiaoxuedb2'
  WITH  NORECOVERY
GO
RESTORE DATABASE jiaoxuedb
  FROM DISK='D:\备份数据库\Dbackup_jiaoxuedb2'
  WITH  FILE=2
GO
--实验15  数据的导入、导出
--实验15.2 bcp实用程序

--1．	使用bcp从源数据表导出数据至Excel表

bcp “SELECT * From  jiaoxuedb.dbo.Teacher Order by Tno” 
queryout  e:\张小山数据库\teacher_Excel.xls  –c –SMXM –Usa –Psa
--2.	使用bcp从源数据库表导出数据至txt格式的文件
bcp "Select * From jiaoxuedb.dbo.Student" 
queryout e:\张小山数据库\Student_txt.txt  -T -c -SMXM\SQLEXPRESS

--3.	使用bcp从Excel文件导入数据到数据库表
bcp jiaoxuedb.dbo.Course 
in e:\张小山数据库\Course_Excel.xls  -T  -c  -SMXM\SQLEXPRESS

--实验16  SQL Server中对大对象数据的访问
--实验16.1 用普通方法访问大值类型数据
--（2）设置large value types out of row选项为OFF，在数据行中存储大值数据类型数据项。
sp_tableoption N'MyTable', 'large value types out of row', 'OFF'
	
--（4）查询resume数据。
Select  Sn,  resume  From  Teacher  Where Sn='王一凡'

--实验16.2访问大值数据类型
--(1)开启large value types out of row选项。
use jiaoxuedb
Go
sp_tableoption  'Teacher', 'large value types out of row', 'ON'
Go

--(2)给resume插入数据。
--为教师“许红霞”写入简历数据。
use jiaoxuedb
Go
/* 给许红霞的简历resume列输入值*/
UPDATE  teacher
SET resume .WRITE ( '1993年月毕业于东北财经学院金融系，1993年7月任教于东北财经大学。1995年9月就读于中国财经学院研究生，1998年10月获得硕士学位。', 0, null  ) 
WHERE   Tname = '许红霞'
Go
/*查询刚插入的resume值*/
Select resume From teacher Where Tname = '许红霞'
Go

--(3) 读取resume列数据。
Use jiaoxuedb
Go
select resume from teacher where Tname = '许红霞'
Go

--(4) 修改resume列数据。
/*将数据列resume中的1995改为1996*/
UPDATE  teacher
SET resume .WRITE ( '6', 39, 1  ) 
WHERE   Tname = '许红霞'
GO
/*将数据列resume中的1998改为2000*/
UPDATE  teacher
SET resume .WRITE ( '2000', 56, 4  )
WHERE   Tname = '许红霞'
GO
/*查询刚修改的resume值*/
Select resume From teacher Where Tname = '许红霞'
Go

--(5) 在resume列追加数据。
    use jiaoxuedb
GO
/*在resume列结尾追加数据by setting @Offset to NULL.*/
UPDATE  teacher
SET resume .WRITE ('2005年获北京大学博士学位。', null,0 ) WHERE   Tname = '许红霞'
Go
select resume from teacher where Tname = '许红霞'
Go

--(6) 删除resume列部分数据。
use jiaoxuedb
GO
/*删除resume列部分数据*/
UPDATE  teacher
SET resume .WRITE ('', 19,17 ) WHERE   Tname = '许红霞'
go
/*查询已部分删除的resume值*/
select resume from teacher where Tname = '许红霞'
go

--(7) 删除resume列全部数据。
use jiaoxuedb
GO
/*删除resume所有数据*/
UPDATE  teacher
SET resume .WRITE (null, 0,0 ) WHERE   Tname = '许红霞'
Go
/*查询已全部删除的resume值*/
Select resume From teacher Where Tname = '许红霞'
Go