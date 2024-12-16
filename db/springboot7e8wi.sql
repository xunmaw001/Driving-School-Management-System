-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: springboot7e8wi
-- ------------------------------------------------------
-- Server version	5.7.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `springboot7e8wi`
--

/*!40000 DROP DATABASE IF EXISTS `springboot7e8wi`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `springboot7e8wi` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `springboot7e8wi`;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'picture1','upload/picture1.jpg'),(2,'picture2','upload/picture2.jpg'),(3,'picture3','upload/picture3.jpg');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussjiashizhishi`
--

DROP TABLE IF EXISTS `discussjiashizhishi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussjiashizhishi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `avatarurl` longtext COMMENT '头像',
  `nickname` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext NOT NULL COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='驾驶知识评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussjiashizhishi`
--

LOCK TABLES `discussjiashizhishi` WRITE;
/*!40000 ALTER TABLE `discussjiashizhishi` DISABLE KEYS */;
/*!40000 ALTER TABLE `discussjiashizhishi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussjiaxiaocheliang`
--

DROP TABLE IF EXISTS `discussjiaxiaocheliang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussjiaxiaocheliang` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `avatarurl` longtext COMMENT '头像',
  `nickname` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext NOT NULL COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='驾校车辆评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussjiaxiaocheliang`
--

LOCK TABLES `discussjiaxiaocheliang` WRITE;
/*!40000 ALTER TABLE `discussjiaxiaocheliang` DISABLE KEYS */;
/*!40000 ALTER TABLE `discussjiaxiaocheliang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exampaper`
--

DROP TABLE IF EXISTS `exampaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exampaper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(200) NOT NULL COMMENT '笔试考试名称',
  `time` int(11) NOT NULL COMMENT '驾校考试时长(分钟)',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '笔试考试状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='笔试考试表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exampaper`
--

LOCK TABLES `exampaper` WRITE;
/*!40000 ALTER TABLE `exampaper` DISABLE KEYS */;
INSERT INTO `exampaper` VALUES (1,'2023-02-09 08:42:10','十万个为什么',60,1);
/*!40000 ALTER TABLE `exampaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examquestion`
--

DROP TABLE IF EXISTS `examquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examquestion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `paperid` bigint(20) NOT NULL COMMENT '所属笔试考试id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '笔试考试名称',
  `questionname` varchar(200) NOT NULL COMMENT '考试题目名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `type` bigint(20) DEFAULT '0' COMMENT '考试题目类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空）',
  `sequence` bigint(20) DEFAULT '100' COMMENT '考试题目排序，值越大排越前面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='考试题目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examquestion`
--

LOCK TABLES `examquestion` WRITE;
/*!40000 ALTER TABLE `examquestion` DISABLE KEYS */;
INSERT INTO `examquestion` VALUES (1,'2023-02-09 08:42:10',1,'十万个为什么','下面动物不属于昆虫的是（）。','[{\"text\":\"A.苍蝇\",\"code\":\"A\"},{\"text\":\"B.蜜蜂\",\"code\":\"B\"},{\"text\":\"C.蜂鸟\",\"code\":\"C\"}]',20,'C','蜂鸟',0,1),(2,'2023-02-09 08:42:10',1,'十万个为什么','油着火后可以用水扑灭。','[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]',20,'B','油着火后不可以用水扑灭',2,2),(3,'2023-02-09 08:42:10',1,'十万个为什么','地球是个球体，中间是（ ）。','[]',30,'赤道','赤道',3,3),(4,'2023-02-09 08:42:10',1,'十万个为什么','下面动物中会流汗的有（ ）。','[{\"text\":\"A.马\",\"code\":\"A\"},{\"text\":\"B.猫\",\"code\":\"B\"},{\"text\":\"C.狗\",\"code\":\"C\"}]',30,'A,B','狗不会流汗',1,4);
/*!40000 ALTER TABLE `examquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examrecord`
--

DROP TABLE IF EXISTS `examrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `paperid` bigint(20) NOT NULL COMMENT '笔试考试id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '笔试考试名称',
  `questionid` bigint(20) NOT NULL COMMENT '考试题目id（外键）',
  `questionname` varchar(200) NOT NULL COMMENT '考试题目名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `myscore` bigint(20) NOT NULL DEFAULT '0' COMMENT '考试题目得分',
  `myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='驾校考试记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examrecord`
--

LOCK TABLES `examrecord` WRITE;
/*!40000 ALTER TABLE `examrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `examrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jiashizhishi`
--

DROP TABLE IF EXISTS `jiashizhishi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jiashizhishi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) NOT NULL COMMENT '标题',
  `fengmiantu` longtext COMMENT '封面图',
  `biaoqian` varchar(200) DEFAULT NULL COMMENT '标签',
  `jiashizhengleixing` varchar(200) DEFAULT NULL COMMENT '驾驶证类型',
  `kemu` varchar(200) NOT NULL COMMENT '科目',
  `shipin` longtext COMMENT '视频',
  `zhishijieshao` longtext COMMENT '知识介绍',
  `faburiqi` date DEFAULT NULL COMMENT '发布日期',
  `clicktime` datetime DEFAULT NULL COMMENT '最近点击时间',
  `clicknum` int(11) DEFAULT '0' COMMENT '点击次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COMMENT='驾驶知识';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jiashizhishi`
--

LOCK TABLES `jiashizhishi` WRITE;
/*!40000 ALTER TABLE `jiashizhishi` DISABLE KEYS */;
INSERT INTO `jiashizhishi` VALUES (91,'2023-02-09 08:42:10','标题1','upload/jiashizhishi_fengmiantu1.jpg,upload/jiashizhishi_fengmiantu2.jpg,upload/jiashizhishi_fengmiantu3.jpg','标签1','驾驶证类型1','科目一','','知识介绍1','2023-02-09','2023-02-09 16:42:10',1),(92,'2023-02-09 08:42:10','标题2','upload/jiashizhishi_fengmiantu2.jpg,upload/jiashizhishi_fengmiantu3.jpg,upload/jiashizhishi_fengmiantu4.jpg','标签2','驾驶证类型2','科目一','','知识介绍2','2023-02-09','2023-02-09 16:42:10',2),(93,'2023-02-09 08:42:10','标题3','upload/jiashizhishi_fengmiantu3.jpg,upload/jiashizhishi_fengmiantu4.jpg,upload/jiashizhishi_fengmiantu5.jpg','标签3','驾驶证类型3','科目一','','知识介绍3','2023-02-09','2023-02-09 16:42:10',3),(94,'2023-02-09 08:42:10','标题4','upload/jiashizhishi_fengmiantu4.jpg,upload/jiashizhishi_fengmiantu5.jpg,upload/jiashizhishi_fengmiantu6.jpg','标签4','驾驶证类型4','科目一','','知识介绍4','2023-02-09','2023-02-09 16:42:10',4),(95,'2023-02-09 08:42:10','标题5','upload/jiashizhishi_fengmiantu5.jpg,upload/jiashizhishi_fengmiantu6.jpg,upload/jiashizhishi_fengmiantu7.jpg','标签5','驾驶证类型5','科目一','','知识介绍5','2023-02-09','2023-02-09 16:42:10',5),(96,'2023-02-09 08:42:10','标题6','upload/jiashizhishi_fengmiantu6.jpg,upload/jiashizhishi_fengmiantu7.jpg,upload/jiashizhishi_fengmiantu8.jpg','标签6','驾驶证类型6','科目一','','知识介绍6','2023-02-09','2023-02-09 16:42:10',6),(97,'2023-02-09 08:42:10','标题7','upload/jiashizhishi_fengmiantu7.jpg,upload/jiashizhishi_fengmiantu8.jpg,upload/jiashizhishi_fengmiantu9.jpg','标签7','驾驶证类型7','科目一','','知识介绍7','2023-02-09','2023-02-09 16:42:10',7),(98,'2023-02-09 08:42:10','标题8','upload/jiashizhishi_fengmiantu8.jpg,upload/jiashizhishi_fengmiantu9.jpg,upload/jiashizhishi_fengmiantu10.jpg','标签8','驾驶证类型8','科目一','','知识介绍8','2023-02-09','2023-02-09 16:42:10',8);
/*!40000 ALTER TABLE `jiashizhishi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jiaxiaocheliang`
--

DROP TABLE IF EXISTS `jiaxiaocheliang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jiaxiaocheliang` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `cheliangmingcheng` varchar(200) NOT NULL COMMENT '车辆名称',
  `cheliangtupian` longtext COMMENT '车辆图片',
  `jiashizhengleixing` varchar(200) DEFAULT NULL COMMENT '驾驶证类型',
  `chepaihaoma` varchar(200) NOT NULL COMMENT '车牌号码',
  `cheliangzhuangkuang` varchar(200) DEFAULT NULL COMMENT '车辆状况',
  `cheliangxinxi` longtext COMMENT '车辆信息',
  `keyueshijian` varchar(200) DEFAULT NULL COMMENT '可约时间',
  `jiaolianzhanghao` varchar(200) DEFAULT NULL COMMENT '教练账号',
  `jiaolianxingming` varchar(200) DEFAULT NULL COMMENT '教练姓名',
  `thumbsupnum` int(11) DEFAULT '0' COMMENT '赞',
  `crazilynum` int(11) DEFAULT '0' COMMENT '踩',
  `clicknum` int(11) DEFAULT '0' COMMENT '点击次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='驾校车辆';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jiaxiaocheliang`
--

LOCK TABLES `jiaxiaocheliang` WRITE;
/*!40000 ALTER TABLE `jiaxiaocheliang` DISABLE KEYS */;
INSERT INTO `jiaxiaocheliang` VALUES (31,'2023-02-09 08:42:10','车辆名称1','upload/jiaxiaocheliang_cheliangtupian1.jpg,upload/jiaxiaocheliang_cheliangtupian2.jpg,upload/jiaxiaocheliang_cheliangtupian3.jpg','驾驶证类型1','车牌号码1','车辆状况1','车辆信息1','可约时间1','教练账号1','教练姓名1',1,1,1),(32,'2023-02-09 08:42:10','车辆名称2','upload/jiaxiaocheliang_cheliangtupian2.jpg,upload/jiaxiaocheliang_cheliangtupian3.jpg,upload/jiaxiaocheliang_cheliangtupian4.jpg','驾驶证类型2','车牌号码2','车辆状况2','车辆信息2','可约时间2','教练账号2','教练姓名2',2,2,2),(33,'2023-02-09 08:42:10','车辆名称3','upload/jiaxiaocheliang_cheliangtupian3.jpg,upload/jiaxiaocheliang_cheliangtupian4.jpg,upload/jiaxiaocheliang_cheliangtupian5.jpg','驾驶证类型3','车牌号码3','车辆状况3','车辆信息3','可约时间3','教练账号3','教练姓名3',3,3,3),(34,'2023-02-09 08:42:10','车辆名称4','upload/jiaxiaocheliang_cheliangtupian4.jpg,upload/jiaxiaocheliang_cheliangtupian5.jpg,upload/jiaxiaocheliang_cheliangtupian6.jpg','驾驶证类型4','车牌号码4','车辆状况4','车辆信息4','可约时间4','教练账号4','教练姓名4',4,4,4),(35,'2023-02-09 08:42:10','车辆名称5','upload/jiaxiaocheliang_cheliangtupian5.jpg,upload/jiaxiaocheliang_cheliangtupian6.jpg,upload/jiaxiaocheliang_cheliangtupian7.jpg','驾驶证类型5','车牌号码5','车辆状况5','车辆信息5','可约时间5','教练账号5','教练姓名5',5,5,5),(36,'2023-02-09 08:42:10','车辆名称6','upload/jiaxiaocheliang_cheliangtupian6.jpg,upload/jiaxiaocheliang_cheliangtupian7.jpg,upload/jiaxiaocheliang_cheliangtupian8.jpg','驾驶证类型6','车牌号码6','车辆状况6','车辆信息6','可约时间6','教练账号6','教练姓名6',6,6,6),(37,'2023-02-09 08:42:10','车辆名称7','upload/jiaxiaocheliang_cheliangtupian7.jpg,upload/jiaxiaocheliang_cheliangtupian8.jpg,upload/jiaxiaocheliang_cheliangtupian9.jpg','驾驶证类型7','车牌号码7','车辆状况7','车辆信息7','可约时间7','教练账号7','教练姓名7',7,7,7),(38,'2023-02-09 08:42:10','车辆名称8','upload/jiaxiaocheliang_cheliangtupian8.jpg,upload/jiaxiaocheliang_cheliangtupian9.jpg,upload/jiaxiaocheliang_cheliangtupian10.jpg','驾驶证类型8','车牌号码8','车辆状况8','车辆信息8','可约时间8','教练账号8','教练姓名8',8,8,8);
/*!40000 ALTER TABLE `jiaxiaocheliang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jiaxiaojiaolian`
--

DROP TABLE IF EXISTS `jiaxiaojiaolian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jiaxiaojiaolian` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jiaolianzhanghao` varchar(200) NOT NULL COMMENT '教练账号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `jiaolianxingming` varchar(200) DEFAULT NULL COMMENT '教练姓名',
  `nianling` int(11) DEFAULT NULL COMMENT '年龄',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `jiaoling` varchar(200) DEFAULT NULL COMMENT '教龄',
  `touxiang` longtext COMMENT '头像',
  `lianxidianhua` varchar(200) DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jiaolianzhanghao` (`jiaolianzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='驾校教练';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jiaxiaojiaolian`
--

LOCK TABLES `jiaxiaojiaolian` WRITE;
/*!40000 ALTER TABLE `jiaxiaojiaolian` DISABLE KEYS */;
INSERT INTO `jiaxiaojiaolian` VALUES (21,'2023-02-09 08:42:10','教练账号1','123456','教练姓名1',1,'男','教龄1','upload/jiaxiaojiaolian_touxiang1.jpg','13823888881'),(22,'2023-02-09 08:42:10','教练账号2','123456','教练姓名2',2,'男','教龄2','upload/jiaxiaojiaolian_touxiang2.jpg','13823888882'),(23,'2023-02-09 08:42:10','教练账号3','123456','教练姓名3',3,'男','教龄3','upload/jiaxiaojiaolian_touxiang3.jpg','13823888883'),(24,'2023-02-09 08:42:10','教练账号4','123456','教练姓名4',4,'男','教龄4','upload/jiaxiaojiaolian_touxiang4.jpg','13823888884'),(25,'2023-02-09 08:42:10','教练账号5','123456','教练姓名5',5,'男','教龄5','upload/jiaxiaojiaolian_touxiang5.jpg','13823888885'),(26,'2023-02-09 08:42:10','教练账号6','123456','教练姓名6',6,'男','教龄6','upload/jiaxiaojiaolian_touxiang6.jpg','13823888886'),(27,'2023-02-09 08:42:10','教练账号7','123456','教练姓名7',7,'男','教龄7','upload/jiaxiaojiaolian_touxiang7.jpg','13823888887'),(28,'2023-02-09 08:42:10','教练账号8','123456','教练姓名8',8,'男','教龄8','upload/jiaxiaojiaolian_touxiang8.jpg','13823888888');
/*!40000 ALTER TABLE `jiaxiaojiaolian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kaoshianpai`
--

DROP TABLE IF EXISTS `kaoshianpai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kaoshianpai` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kaoshikemu` varchar(200) DEFAULT NULL COMMENT '考试科目',
  `fengmian` longtext COMMENT '封面',
  `kaoshifeiyong` int(11) DEFAULT NULL COMMENT '考试费用',
  `kaoshididian` varchar(200) DEFAULT NULL COMMENT '考试地点',
  `kaoshishijian` varchar(200) DEFAULT NULL COMMENT '考试时间',
  `kaoshijieshao` longtext COMMENT '考试介绍',
  `jiashizhengleixing` varchar(200) DEFAULT NULL COMMENT '驾驶证类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='考试安排';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kaoshianpai`
--

LOCK TABLES `kaoshianpai` WRITE;
/*!40000 ALTER TABLE `kaoshianpai` DISABLE KEYS */;
INSERT INTO `kaoshianpai` VALUES (61,'2023-02-09 08:42:10','考试科目1','upload/kaoshianpai_fengmian1.jpg,upload/kaoshianpai_fengmian2.jpg,upload/kaoshianpai_fengmian3.jpg',1,'考试地点1','考试时间1','考试介绍1','驾驶证类型1'),(62,'2023-02-09 08:42:10','考试科目2','upload/kaoshianpai_fengmian2.jpg,upload/kaoshianpai_fengmian3.jpg,upload/kaoshianpai_fengmian4.jpg',2,'考试地点2','考试时间2','考试介绍2','驾驶证类型2'),(63,'2023-02-09 08:42:10','考试科目3','upload/kaoshianpai_fengmian3.jpg,upload/kaoshianpai_fengmian4.jpg,upload/kaoshianpai_fengmian5.jpg',3,'考试地点3','考试时间3','考试介绍3','驾驶证类型3'),(64,'2023-02-09 08:42:10','考试科目4','upload/kaoshianpai_fengmian4.jpg,upload/kaoshianpai_fengmian5.jpg,upload/kaoshianpai_fengmian6.jpg',4,'考试地点4','考试时间4','考试介绍4','驾驶证类型4'),(65,'2023-02-09 08:42:10','考试科目5','upload/kaoshianpai_fengmian5.jpg,upload/kaoshianpai_fengmian6.jpg,upload/kaoshianpai_fengmian7.jpg',5,'考试地点5','考试时间5','考试介绍5','驾驶证类型5'),(66,'2023-02-09 08:42:10','考试科目6','upload/kaoshianpai_fengmian6.jpg,upload/kaoshianpai_fengmian7.jpg,upload/kaoshianpai_fengmian8.jpg',6,'考试地点6','考试时间6','考试介绍6','驾驶证类型6'),(67,'2023-02-09 08:42:10','考试科目7','upload/kaoshianpai_fengmian7.jpg,upload/kaoshianpai_fengmian8.jpg,upload/kaoshianpai_fengmian9.jpg',7,'考试地点7','考试时间7','考试介绍7','驾驶证类型7'),(68,'2023-02-09 08:42:10','考试科目8','upload/kaoshianpai_fengmian8.jpg,upload/kaoshianpai_fengmian9.jpg,upload/kaoshianpai_fengmian10.jpg',8,'考试地点8','考试时间8','考试介绍8','驾驶证类型8');
/*!40000 ALTER TABLE `kaoshianpai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kaoshiyuyue`
--

DROP TABLE IF EXISTS `kaoshiyuyue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kaoshiyuyue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yuyuehao` varchar(200) DEFAULT NULL COMMENT '预约号',
  `kaoshikemu` varchar(200) DEFAULT NULL COMMENT '考试科目',
  `kaoshididian` varchar(200) DEFAULT NULL COMMENT '考试地点',
  `jiashizhengleixing` varchar(200) DEFAULT NULL COMMENT '驾驶证类型',
  `kaoshifeiyong` int(11) DEFAULT NULL COMMENT '考试费用',
  `kaoshishijian` varchar(200) DEFAULT NULL COMMENT '考试时间',
  `xueyuanzhanghao` varchar(200) DEFAULT NULL COMMENT '学员账号',
  `xueyuanxingming` varchar(200) DEFAULT NULL COMMENT '学员姓名',
  `shenfenzheng` varchar(200) DEFAULT NULL COMMENT '身份证',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `tijiaoshijian` datetime DEFAULT NULL COMMENT '提交时间',
  `zhuangtai` varchar(200) NOT NULL COMMENT '状态',
  `ispay` varchar(200) DEFAULT '未支付' COMMENT '是否支付',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yuyuehao` (`yuyuehao`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COMMENT='考试预约';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kaoshiyuyue`
--

LOCK TABLES `kaoshiyuyue` WRITE;
/*!40000 ALTER TABLE `kaoshiyuyue` DISABLE KEYS */;
INSERT INTO `kaoshiyuyue` VALUES (71,'2023-02-09 08:42:10','1111111111','考试科目1','考试地点1','驾驶证类型1',1,'考试时间1','学员账号1','学员姓名1','440300199101010001','13823888881','2023-02-09 16:42:10','已取消','未支付'),(72,'2023-02-09 08:42:10','2222222222','考试科目2','考试地点2','驾驶证类型2',2,'考试时间2','学员账号2','学员姓名2','440300199202020002','13823888882','2023-02-09 16:42:10','已取消','未支付'),(73,'2023-02-09 08:42:10','3333333333','考试科目3','考试地点3','驾驶证类型3',3,'考试时间3','学员账号3','学员姓名3','440300199303030003','13823888883','2023-02-09 16:42:10','已取消','未支付'),(74,'2023-02-09 08:42:10','4444444444','考试科目4','考试地点4','驾驶证类型4',4,'考试时间4','学员账号4','学员姓名4','440300199404040004','13823888884','2023-02-09 16:42:10','已取消','未支付'),(75,'2023-02-09 08:42:10','5555555555','考试科目5','考试地点5','驾驶证类型5',5,'考试时间5','学员账号5','学员姓名5','440300199505050005','13823888885','2023-02-09 16:42:10','已取消','未支付'),(76,'2023-02-09 08:42:10','6666666666','考试科目6','考试地点6','驾驶证类型6',6,'考试时间6','学员账号6','学员姓名6','440300199606060006','13823888886','2023-02-09 16:42:10','已取消','未支付'),(77,'2023-02-09 08:42:10','7777777777','考试科目7','考试地点7','驾驶证类型7',7,'考试时间7','学员账号7','学员姓名7','440300199707070007','13823888887','2023-02-09 16:42:10','已取消','未支付'),(78,'2023-02-09 08:42:10','8888888888','考试科目8','考试地点8','驾驶证类型8',8,'考试时间8','学员账号8','学员姓名8','440300199808080008','13823888888','2023-02-09 16:42:10','已取消','未支付');
/*!40000 ALTER TABLE `kaoshiyuyue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `introduction` longtext COMMENT '简介',
  `picture` longtext NOT NULL COMMENT '图片',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8 COMMENT='驾校公告';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (151,'2023-02-09 08:42:10','有梦想，就要努力去实现','不管你想要怎样的生活，你都要去努力争取，不多尝试一些事情怎么知道自己适合什么、不适合什么呢?你说你喜欢读书，让我给你列书单，你还问我哪里有那么多时间看书;你说自己梦想的职业是广告文案，问我如何成为一个文案，应该具备哪些素质;你说你计划晨跑，但总是因为学习、工作辛苦或者身体不舒服第二天起不了床;你说你一直梦想一个人去长途旅行，但是没钱，父母觉得危险。','upload/news_picture1.jpg','<p>不管你想要怎样的生活，你都要去努力争取，不多尝试一些事情怎么知道自己适合什么、不适合什么呢?</p><p>你说你喜欢读书，让我给你列书单，你还问我哪里有那么多时间看书;你说自己梦想的职业是广告文案，问我如何成为一个文案，应该具备哪些素质;你说你计划晨跑，但总是因为学习、工作辛苦或者身体不舒服第二天起不了床;你说你一直梦想一个人去长途旅行，但是没钱，父母觉得危险。其实，我已经厌倦了你这样说说而已的把戏，我觉得就算我告诉你如何去做，你也不会照做，因为你根本什么都不做。</p><p>真正有行动力的人不需要别人告诉他如何做，因为他已经在做了。就算碰到问题，他也会自己想办法，自己动手去解决或者主动寻求可以帮助他的人，而不是等着别人为自己解决问题。</p><p>首先要学习独立思考。花一点时间想一下自己喜欢什么，梦想是什么，不要别人说想环游世界，你就说你的梦想是环游世界。</p><p>很多人说现实束缚了自己，其实在这个世界上，我们一直都可以有很多选择，生活的决定权也—直都在自己手上，只是我们缺乏行动力而已。</p><p>如果你觉得安于现状是你想要的，那选择安于现状就会让你幸福和满足;如果你不甘平庸，选择一条改变、进取和奋斗的道路，在这个追求的过程中，你也一样会感到快乐。所谓的成功，即是按照自己想要的生活方式生活。最糟糕的状态，莫过于当你想要选择一条不甘平庸、改变、进取和奋斗的道路时，却以一种安于现状的方式生活，最后抱怨自己没有得到想要的人生。</p><p>因为喜欢，你不是在苦苦坚持，也因为喜欢，你愿意投入时间、精力，长久以往，获得成功就是自然而然的事情。</p>'),(152,'2023-02-09 08:42:10','又是一年毕业季','又是一年毕业季，感慨万千，还记的自己刚进学校那时候的情景，我拖着沉重的行李箱站在偌大的教学楼前面，感叹自己未来的日子即将在这个陌生的校园里度过，而如今斗转星移，浮光掠影，弹指之间，那些青葱岁月如同白驹过隙般悄然从指缝溜走。过去的种种在胸口交集纠结，像打翻的五味瓶，甜蜜，酸楚，苦涩，一并涌上心头。','upload/news_picture2.jpg','<p>又是一年毕业季，感慨万千，还记的自己刚进学校那时候的情景，我拖着沉重的行李箱站在偌大的教学楼前面，感叹自己未来的日子即将在这个陌生的校园里度过，而如今斗转星移，浮光掠影，弹指之间，那些青葱岁月如同白驹过隙般悄然从指缝溜走。</p><p>过去的种种在胸口交集纠结，像打翻的五味瓶，甜蜜，酸楚，苦涩，一并涌上心头。一直都是晚会的忠实参与者，无论是台前还是幕后，忽然间，角色转变，那种感觉确实难以用语言表达。</p><p>	过去的三年，总是默默地期盼着这个好雨时节，因为这时候，会有灿烂的阳光，会有满目的百花争艳，会有香甜的冰激凌，这是个毕业的季节，当时不经世事的我们会殷切地期待学校那一大堆的活动，期待穿上绚丽的演出服或者礼仪服，站在大礼堂镁光灯下尽情挥洒我们的澎拜的激情。</p><p>百感交集，隔岸观火与身临其境的感觉竟是如此不同。从来没想过一场晚会送走的是我们自己的时候会是怎样的感情，毕业就真的意味着结束吗?倔强的我们不愿意承认，谢谢学弟学妹们慷慨的将这次的主题定为“我们在这里”。我知道，这可能是他们对我们这些过来人的尊敬和施舍。</p><p>没有为这场晚会排练、奔波，没有为班级、学生会、文学院出点力，还真有点不习惯，百般无奈中，用“工作忙”个万能的借口来搪塞自己，欺骗别人。其实自己心里明白，那只是在逃避，只是不愿面对繁华落幕后的萧条和落寞。大四了，大家各奔东西，想凑齐班上的人真的是难上加难，敏燕从越南回来，刚落地就匆匆回了学校，那么恋家的人也启程回来了，睿睿学姐也是从家赶来跟我们团圆。大家—如既往的寒暄、打趣、调侃对方，似乎一切又回到了当初的单纯美好。</p><p>看着舞台上活泼可爱的学弟学妹们，如同一群机灵的小精灵，清澈的眼神，稚嫩的肢体，轻快地步伐，用他们那热情洋溢的舞姿渲染着在场的每一个人，我知道，我不应该羡慕嫉妒他们，不应该顾自怜惜逝去的青春，不应该感叹夕阳无限好，曾经，我们也拥有过，曾经，我们也年轻过，曾经，我们也灿烂过。我深深地告诉自己，人生的每个阶段都是美的，年轻有年轻的活力，成熟也有成熟的魅力。多—份稳重、淡然、优雅，也是漫漫时光掠影遗留下的.珍贵赏赐。</p>'),(153,'2023-02-09 08:42:10','挫折路上，坚持常在心间','回头看看，你会不会发现，曾经的你在这里摔倒过;回头看看，你是否发现，一次次地重复着，却从没爬起过。而如今，让我们把视线转向前方，那一道道金色的弧线，是流星飞逝的痕迹，或是成功运行的轨道。今天的你，是否要扬帆起航，让幸福来敲门?清晨的太阳撒向大地，神奇的宇宙赋予它神奇的色彩，大自然沐浴着春光，世界因太阳的照射而精彩，林中百鸟啾啾，河水轻轻流淌，汇成清宁的山间小调。','upload/news_picture3.jpg','<p>回头看看，你会不会发现，曾经的你在这里摔倒过;回头看看，你是否发现，一次次地重复着，却从没爬起过。而如今，让我们把视线转向前方，那一道道金色的弧线，是流星飞逝的痕迹，或是成功运行的轨道。今天的你，是否要扬帆起航，让幸福来敲门?</p><p>清晨的太阳撒向大地，神奇的宇宙赋予它神奇的色彩，大自然沐浴着春光，世界因太阳的照射而精彩，林中百鸟啾啾，河水轻轻流淌，汇成清宁的山间小调。</p><p>是的，面对道途上那无情的嘲讽，面对步伐中那重复的摔跤，面对激流与硬石之间猛烈的碰撞，我们必须选择那富于阴雨，却最终见到彩虹的荆棘路。也许，经历了那暴风雨的洗礼，我们便会变得自信，幸福也随之而来。</p><p>司马迁屡遭羞辱，却依然在狱中撰写《史记》，作为一名史学家，不因王权而极度赞赏，也不因卑微而极度批判，然而他在坚持自己操守的同时，却依然要受统治阶级的阻碍，他似乎无权选择自己的本职。但是，他不顾于此，只是在面对道途的阻隔之时，他依然选择了走下去的信念。终于一部开山巨作《史记》诞生，为后人留下一份馈赠，也许在他完成毕生的杰作之时，他微微地笑了，没有什么比梦想实现更快乐的了......</p><p>	或许正如“长风破浪会有时，直挂云帆济沧海”一般，欣欣然地走向看似深渊的崎岖路，而在一番耕耘之后，便会发现这里另有一番天地。也许这就是困难与快乐的交融。</p><p>也许在形形色色的社会中，我们常能看到一份坚持，一份自信，但这里却还有一类人。这类人在暴风雨来临之际，只会闪躲，从未懂得这也是一种历炼，这何尝不是一份快乐。在阴暗的角落里，总是独自在哭，带着伤愁，看不到一点希望。</p><p>我们不能堕落于此，而要像海燕那般，在苍茫的大海上，高傲地飞翔，任何事物都无法阻挡，任何事都是幸福快乐的。</p>'),(154,'2023-02-09 08:42:10','挫折是另一个生命的开端','当遇到挫折或失败，你是看见失败还是看见机会?挫折是我们每个人成长的必经之路，它不是你想有就有，想没有就没有的。有句名言说的好，如果你想一生摆脱苦难，你就得是神或者是死尸。这句话形象地说明了挫折是伴随着人生的，是谁都逃不掉的。','upload/news_picture4.jpg','<p>当遇到挫折或失败，你是看见失败还是看见机会?</p><p>挫折是我们每个人成长的必经之路，它不是你想有就有，想没有就没有的。有句名言说的好，如果你想一生摆脱苦难，你就得是神或者是死尸。这句话形象地说明了挫折是伴随着人生的，是谁都逃不掉的。</p><p>人生在世，从古到今，不分天子平民，机遇虽有不同，但总不免有身陷困境或遭遇难题之处，这时候唯有通权达变，才能使人转危为安，甚至反败为胜。</p><p>大部分的人，一生当中，最痛苦的经验是失去所爱的人，其次是丢掉一份工作。其实，经得起考验的人，就算是被开除也不会惊慌，要学会面对。</p><p>	“塞翁失马，焉知非福。”人生的道路，并不是每一步都迈向成功，这就是追求的意义。我们还要认识到一点，挫折作为一种情绪状态和一种个人体验，各人的耐受性是大不相同的，有的人经历了一次次挫折，就能够坚忍不拔，百折不挠;有的人稍遇挫折便意志消沉，一蹶不振。所以，挫折感是一种主观感受，因为人的目的和需要不同，成功标准不同，所以同一种活动对于不同的人可能会造成不同的挫折感受。</p><p>凡事皆以平常心来看待，对于生命顺逆不要太执著。能够“破我执”是很高层的人生境界。</p><p>人事的艰难就是一种考验。就像—支剑要有磨刀来磨，剑才会利:一块璞玉要有粗石来磨，才会发出耀眼的光芒。我们能够做到的，只是如何减少、避免那些由于自身的原因所造成的挫折，而在遇到痛苦和挫折之后，则力求化解痛苦，争取幸福。我们要知道，痛苦和挫折是双重性的，它既是我们人生中难以完全避免的，也是我们在争取成功时，不可缺少的一种动力。因为我认为，推动我们奋斗的力量，不仅仅是对成功的渴望，还有为摆脱痛苦和挫折而进行的奋斗。</p>'),(155,'2023-02-09 08:42:10','你要去相信，没有到不了的明天','有梦想就去努力，因为在这一辈子里面，现在不去勇敢的努力，也许就再也没有机会了。你要去相信，一定要相信，没有到不了的明天。不要被命运打败，让自己变得更强大。不管你现在是一个人走在异乡的街道上始终没有找到一丝归属感，还是你在跟朋友们一起吃饭开心址笑着的时候闪过一丝落寞。','upload/news_picture5.jpg','<p>有梦想就去努力，因为在这一辈子里面，现在不去勇敢的努力，也许就再也没有机会了。你要去相信，一定要相信，没有到不了的明天。不要被命运打败，让自己变得更强大。</p><p>不管你现在是一个人走在异乡的街道上始终没有找到一丝归属感，还是你在跟朋友们一起吃饭开心址笑着的时候闪过一丝落寞。</p><p>	不管你现在是在图书馆里背着怎么也看不进去的英语单词，还是你现在迷茫地看不清未来的方向不知道要往哪走。</p><p>不管你现在是在努力着去实现梦想却没能拉近与梦想的距离，还是你已经慢慢地找不到自己的梦想了。</p><p>你都要去相信，没有到不了的明天。</p><p>	有的时候你的梦想太大，别人说你的梦想根本不可能实现;有的时候你的梦想又太小，又有人说你胸无大志;有的时候你对死党说着将来要去环游世界的梦想，却换来他的不屑一顾，于是你再也不提自己的梦想;有的时候你突然说起将来要开个小店的愿望，却发现你讲述的那个人，并没有听到你在说什么。</p><p>不过又能怎么样呢，未来始终是自己的，梦想始终是自己的，没有人会来帮你实现它。</p><p>也许很多时候我们只是需要朋友的一句鼓励，一句安慰，却也得不到。但是相信我，世界上还有很多人，只是想要和你说说话。</p><p>因为我们都一样。一样的被人说成固执，一样的在追逐他们眼里根本不在意的东西。</p><p>所以，又有什么关系呢，别人始终不是你、不能懂你的心情，你又何必多去解释呢。这个世界会来阻止你，困难也会接踵而至，其实真正关键的只有自己，有没有那个倔强。</p><p>这个世界上没有不带伤的人，真正能治愈自己的，只有自己。</p>'),(156,'2023-02-09 08:42:10','离开是一种痛苦，是一种勇气，但同样也是一个考验，是一个新的开端','无穷无尽是离愁，天涯海角遍寻思。当离别在即之时，当面对着相濡以沫兄弟般的朋友时，当面对着经历了四年的磨合而形成的真挚友谊之时，我内心激动无语，说一声再见，道一声珍重都很难出口。回想自己四年大学的风风雨雨，回想我们曾经共同经历的岁月流年，我感谢大家的相扶相依，感谢朋友们的莫大支持与帮助。虽然舍不得，但离别的脚步却不因我们的挚情而停滞。','upload/news_picture6.jpg','<p>无穷无尽是离愁，天涯海角遍寻思。当离别在即之时，当面对着相濡以沫兄弟般的朋友时，当面对着经历了四年的磨合而形成的真挚友谊之时，我内心激动无语，说一声再见，道一声珍重都很难出口。回想自己四年大学的风风雨雨，回想我们曾经共同经历的岁月流年，我感谢大家的相扶相依，感谢朋友们的莫大支持与帮助。虽然舍不得，但离别的脚步却不因我们的挚情而停滞。离别的确是一种痛苦，但同样也是我们走入社会，走向新环境、新领域的一个开端，希望大家在以后新的工作岗位上能够确定自己的新起点，坚持不懈，向着更新、更高的目标前进，因为人生最美好的东西永远都在最前方!</p><p>忆往昔峥嵘岁月，看今朝潮起潮落，望未来任重而道远。作为新时代的我们，就应在失败时，能拼搏奋起，去谱写人生的辉煌。在成功时，亦能居安思危，不沉湎于一时的荣耀、鲜花和掌声中，时时刻刻怀着一颗积极寻找自己新的奶酪的心，处变不惊、成败不渝，始终踏着自己坚实的步伐，从零开始，不断向前迈进，这样才能在这风起云涌、变幻莫测的社会大潮中成为真正的弄潮儿!</p>'),(157,'2023-02-09 08:42:10','Leave未必是一种痛苦','无穷无尽是离愁，天涯海角遍寻思。当离别在即之时，当面对着相濡以沫兄弟般的朋友时，当面对着经历了四年的磨合而形成的真挚友谊之时，我内心激动无语，说一声再见，道一声珍重都很难出口。回想自己四年大学的风风雨雨，回想我们曾经共同经历的岁月流年，我感谢大家的相扶相依，感谢朋友们的莫大支持与帮助。虽然舍不得，但离别的脚步却不因我们的挚情而停滞。','upload/news_picture7.jpg','<p>无穷无尽是离愁，天涯海角遍寻思。当离别在即之时，当面对着相濡以沫兄弟般的朋友时，当面对着经历了四年的磨合而形成的真挚友谊之时，我内心激动无语，说一声再见，道一声珍重都很难出口。回想自己四年大学的风风雨雨，回想我们曾经共同经历的岁月流年，我感谢大家的相扶相依，感谢朋友们的莫大支持与帮助。虽然舍不得，但离别的脚步却不因我们的挚情而停滞。离别的确是一种痛苦，但同样也是我们走入社会，走向新环境、新领域的一个开端，希望大家在以后新的工作岗位上能够确定自己的新起点，坚持不懈，向着更新、更高的目标前进，因为人生最美好的东西永远都在最前方!</p><p>忆往昔峥嵘岁月，看今朝潮起潮落，望未来任重而道远。作为新时代的我们，就应在失败时，能拼搏奋起，去谱写人生的辉煌。在成功时，亦能居安思危，不沉湎于一时的荣耀、鲜花和掌声中，时时刻刻怀着一颗积极寻找自己新的奶酪的心，处变不惊、成败不渝，始终踏着自己坚实的步伐，从零开始，不断向前迈进，这样才能在这风起云涌、变幻莫测的社会大潮中成为真正的弄潮儿!</p>'),(158,'2023-02-09 08:42:10','坚持才会成功','回头看看，你会不会发现，曾经的你在这里摔倒过;回头看看，你是否发现，一次次地重复着，却从没爬起过。而如今，让我们把视线转向前方，那一道道金色的弧线，是流星飞逝的痕迹，或是成功运行的轨道。今天的你，是否要扬帆起航，让幸福来敲门?清晨的太阳撒向大地，神奇的宇宙赋予它神奇的色彩，大自然沐浴着春光，世界因太阳的照射而精彩，林中百鸟啾啾，河水轻轻流淌，汇成清宁的山间小调。','upload/news_picture8.jpg','<p>回头看看，你会不会发现，曾经的你在这里摔倒过;回头看看，你是否发现，一次次地重复着，却从没爬起过。而如今，让我们把视线转向前方，那一道道金色的弧线，是流星飞逝的痕迹，或是成功运行的轨道。今天的你，是否要扬帆起航，让幸福来敲门?</p><p>清晨的太阳撒向大地，神奇的宇宙赋予它神奇的色彩，大自然沐浴着春光，世界因太阳的照射而精彩，林中百鸟啾啾，河水轻轻流淌，汇成清宁的山间小调。</p><p>是的，面对道途上那无情的嘲讽，面对步伐中那重复的摔跤，面对激流与硬石之间猛烈的碰撞，我们必须选择那富于阴雨，却最终见到彩虹的荆棘路。也许，经历了那暴风雨的洗礼，我们便会变得自信，幸福也随之而来。</p><p>司马迁屡遭羞辱，却依然在狱中撰写《史记》，作为一名史学家，不因王权而极度赞赏，也不因卑微而极度批判，然而他在坚持自己操守的同时，却依然要受统治阶级的阻碍，他似乎无权选择自己的本职。但是，他不顾于此，只是在面对道途的阻隔之时，他依然选择了走下去的信念。终于一部开山巨作《史记》诞生，为后人留下一份馈赠，也许在他完成毕生的杰作之时，他微微地笑了，没有什么比梦想实现更快乐的了......</p><p>	或许正如“长风破浪会有时，直挂云帆济沧海”一般，欣欣然地走向看似深渊的崎岖路，而在一番耕耘之后，便会发现这里另有一番天地。也许这就是困难与快乐的交融。</p><p>也许在形形色色的社会中，我们常能看到一份坚持，一份自信，但这里却还有一类人。这类人在暴风雨来临之际，只会闪躲，从未懂得这也是一种历炼，这何尝不是一份快乐。在阴暗的角落里，总是独自在哭，带着伤愁，看不到一点希望。</p><p>我们不能堕落于此，而要像海燕那般，在苍茫的大海上，高傲地飞翔，任何事物都无法阻挡，任何事都是幸福快乐的。</p>');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quxiaokaoshi`
--

DROP TABLE IF EXISTS `quxiaokaoshi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quxiaokaoshi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yuyuehao` varchar(200) DEFAULT NULL COMMENT '预约号',
  `kaoshikemu` varchar(200) DEFAULT NULL COMMENT '考试科目',
  `kaoshididian` varchar(200) DEFAULT NULL COMMENT '考试地点',
  `kaoshifeiyong` int(11) DEFAULT NULL COMMENT '考试费用',
  `kaoshishijian` varchar(200) DEFAULT NULL COMMENT '考试时间',
  `xueyuanzhanghao` varchar(200) DEFAULT NULL COMMENT '学员账号',
  `xueyuanxingming` varchar(200) DEFAULT NULL COMMENT '学员姓名',
  `shenfenzheng` varchar(200) DEFAULT NULL COMMENT '身份证',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `quxiaoyuanyin` varchar(200) NOT NULL COMMENT '取消原因',
  `dengjishijian` datetime DEFAULT NULL COMMENT '登记时间',
  `sfsh` varchar(200) DEFAULT '待审核' COMMENT '是否审核',
  `shhf` longtext COMMENT '审核回复',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COMMENT='取消考试';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quxiaokaoshi`
--

LOCK TABLES `quxiaokaoshi` WRITE;
/*!40000 ALTER TABLE `quxiaokaoshi` DISABLE KEYS */;
INSERT INTO `quxiaokaoshi` VALUES (81,'2023-02-09 08:42:10','预约号1','考试科目1','考试地点1',1,'考试时间1','学员账号1','学员姓名1','440300199101010001','13823888881','取消原因1','2023-02-09 16:42:10','是',''),(82,'2023-02-09 08:42:10','预约号2','考试科目2','考试地点2',2,'考试时间2','学员账号2','学员姓名2','440300199202020002','13823888882','取消原因2','2023-02-09 16:42:10','是',''),(83,'2023-02-09 08:42:10','预约号3','考试科目3','考试地点3',3,'考试时间3','学员账号3','学员姓名3','440300199303030003','13823888883','取消原因3','2023-02-09 16:42:10','是',''),(84,'2023-02-09 08:42:10','预约号4','考试科目4','考试地点4',4,'考试时间4','学员账号4','学员姓名4','440300199404040004','13823888884','取消原因4','2023-02-09 16:42:10','是',''),(85,'2023-02-09 08:42:10','预约号5','考试科目5','考试地点5',5,'考试时间5','学员账号5','学员姓名5','440300199505050005','13823888885','取消原因5','2023-02-09 16:42:10','是',''),(86,'2023-02-09 08:42:10','预约号6','考试科目6','考试地点6',6,'考试时间6','学员账号6','学员姓名6','440300199606060006','13823888886','取消原因6','2023-02-09 16:42:10','是',''),(87,'2023-02-09 08:42:10','预约号7','考试科目7','考试地点7',7,'考试时间7','学员账号7','学员姓名7','440300199707070007','13823888887','取消原因7','2023-02-09 16:42:10','是',''),(88,'2023-02-09 08:42:10','预约号8','考试科目8','考试地点8',8,'考试时间8','学员账号8','学员姓名8','440300199808080008','13823888888','取消原因8','2023-02-09 16:42:10','是','');
/*!40000 ALTER TABLE `quxiaokaoshi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quxiaoyuyue`
--

DROP TABLE IF EXISTS `quxiaoyuyue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quxiaoyuyue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yuyuehao` varchar(200) DEFAULT NULL COMMENT '预约号',
  `cheliangmingcheng` varchar(200) NOT NULL COMMENT '车辆名称',
  `cheliangtupian` longtext COMMENT '车辆图片',
  `chepaihaoma` varchar(200) NOT NULL COMMENT '车牌号码',
  `cheliangzhuangkuang` varchar(200) DEFAULT NULL COMMENT '车辆状况',
  `yuyueshijian` varchar(200) DEFAULT NULL COMMENT '预约时间',
  `jiaolianzhanghao` varchar(200) DEFAULT NULL COMMENT '教练账号',
  `jiaolianxingming` varchar(200) DEFAULT NULL COMMENT '教练姓名',
  `xueyuanzhanghao` varchar(200) DEFAULT NULL COMMENT '学员账号',
  `xueyuanxingming` varchar(200) DEFAULT NULL COMMENT '学员姓名',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `quxiaoyuanyin` longtext NOT NULL COMMENT '取消原因',
  `quxiaoshijian` datetime DEFAULT NULL COMMENT '取消时间',
  `sfsh` varchar(200) DEFAULT '待审核' COMMENT '是否审核',
  `shhf` longtext COMMENT '审核回复',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='取消预约';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quxiaoyuyue`
--

LOCK TABLES `quxiaoyuyue` WRITE;
/*!40000 ALTER TABLE `quxiaoyuyue` DISABLE KEYS */;
INSERT INTO `quxiaoyuyue` VALUES (51,'2023-02-09 08:42:10','预约号1','车辆名称1','upload/quxiaoyuyue_cheliangtupian1.jpg,upload/quxiaoyuyue_cheliangtupian2.jpg,upload/quxiaoyuyue_cheliangtupian3.jpg','车牌号码1','车辆状况1','预约时间1','教练账号1','教练姓名1','学员账号1','学员姓名1','手机1','取消原因1','2023-02-09 16:42:10','是',''),(52,'2023-02-09 08:42:10','预约号2','车辆名称2','upload/quxiaoyuyue_cheliangtupian2.jpg,upload/quxiaoyuyue_cheliangtupian3.jpg,upload/quxiaoyuyue_cheliangtupian4.jpg','车牌号码2','车辆状况2','预约时间2','教练账号2','教练姓名2','学员账号2','学员姓名2','手机2','取消原因2','2023-02-09 16:42:10','是',''),(53,'2023-02-09 08:42:10','预约号3','车辆名称3','upload/quxiaoyuyue_cheliangtupian3.jpg,upload/quxiaoyuyue_cheliangtupian4.jpg,upload/quxiaoyuyue_cheliangtupian5.jpg','车牌号码3','车辆状况3','预约时间3','教练账号3','教练姓名3','学员账号3','学员姓名3','手机3','取消原因3','2023-02-09 16:42:10','是',''),(54,'2023-02-09 08:42:10','预约号4','车辆名称4','upload/quxiaoyuyue_cheliangtupian4.jpg,upload/quxiaoyuyue_cheliangtupian5.jpg,upload/quxiaoyuyue_cheliangtupian6.jpg','车牌号码4','车辆状况4','预约时间4','教练账号4','教练姓名4','学员账号4','学员姓名4','手机4','取消原因4','2023-02-09 16:42:10','是',''),(55,'2023-02-09 08:42:10','预约号5','车辆名称5','upload/quxiaoyuyue_cheliangtupian5.jpg,upload/quxiaoyuyue_cheliangtupian6.jpg,upload/quxiaoyuyue_cheliangtupian7.jpg','车牌号码5','车辆状况5','预约时间5','教练账号5','教练姓名5','学员账号5','学员姓名5','手机5','取消原因5','2023-02-09 16:42:10','是',''),(56,'2023-02-09 08:42:10','预约号6','车辆名称6','upload/quxiaoyuyue_cheliangtupian6.jpg,upload/quxiaoyuyue_cheliangtupian7.jpg,upload/quxiaoyuyue_cheliangtupian8.jpg','车牌号码6','车辆状况6','预约时间6','教练账号6','教练姓名6','学员账号6','学员姓名6','手机6','取消原因6','2023-02-09 16:42:10','是',''),(57,'2023-02-09 08:42:10','预约号7','车辆名称7','upload/quxiaoyuyue_cheliangtupian7.jpg,upload/quxiaoyuyue_cheliangtupian8.jpg,upload/quxiaoyuyue_cheliangtupian9.jpg','车牌号码7','车辆状况7','预约时间7','教练账号7','教练姓名7','学员账号7','学员姓名7','手机7','取消原因7','2023-02-09 16:42:10','是',''),(58,'2023-02-09 08:42:10','预约号8','车辆名称8','upload/quxiaoyuyue_cheliangtupian8.jpg,upload/quxiaoyuyue_cheliangtupian9.jpg,upload/quxiaoyuyue_cheliangtupian10.jpg','车牌号码8','车辆状况8','预约时间8','教练账号8','教练姓名8','学员账号8','学员姓名8','手机8','取消原因8','2023-02-09 16:42:10','是','');
/*!40000 ALTER TABLE `quxiaoyuyue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeup`
--

DROP TABLE IF EXISTS `storeup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `refid` bigint(20) DEFAULT NULL COMMENT '商品id',
  `tablename` varchar(200) DEFAULT NULL COMMENT '表名',
  `name` varchar(200) NOT NULL COMMENT '名称',
  `picture` longtext NOT NULL COMMENT '图片',
  `type` varchar(200) DEFAULT '1' COMMENT '类型(1:收藏,21:赞,22:踩,31:竞拍参与,41:关注)',
  `inteltype` varchar(200) DEFAULT NULL COMMENT '推荐类型',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeup`
--

LOCK TABLES `storeup` WRITE;
/*!40000 ALTER TABLE `storeup` DISABLE KEYS */;
/*!40000 ALTER TABLE `storeup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemintro`
--

DROP TABLE IF EXISTS `systemintro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemintro` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `subtitle` varchar(200) DEFAULT NULL COMMENT '副标题',
  `content` longtext NOT NULL COMMENT '内容',
  `picture1` longtext COMMENT '图片1',
  `picture2` longtext COMMENT '图片2',
  `picture3` longtext COMMENT '图片3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='关于我们';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemintro`
--

LOCK TABLES `systemintro` WRITE;
/*!40000 ALTER TABLE `systemintro` DISABLE KEYS */;
INSERT INTO `systemintro` VALUES (1,'2023-02-09 08:42:10','系统简介','SYSTEM INTRODUCTION','当遇到挫折或失败，你是看见失败还是看见机会?挫折是我们每个人成长的必经之路，它不是你想有就有，想没有就没有的。有句名言说的好，如果你想一生摆脱苦难，你就得是神或者是死尸。这句话形象地说明了挫折是伴随着人生的，是谁都逃不掉的。人生在世，从古到今，不分天子平民，机遇虽有不同，但总不免有身陷困境或遭遇难题之处，这时候唯有通权达变，才能使人转危为安，甚至反败为胜。大部分的人，一生当中，最痛苦的经验是失去所爱的人，其次是丢掉一份工作。其实，经得起考验的人，就算是被开除也不会惊慌，要学会面对。','upload/systemintro_picture1.jpg','upload/systemintro_picture2.jpg','upload/systemintro_picture3.jpg');
/*!40000 ALTER TABLE `systemintro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,1,'admin','users','管理员','yikb62t9ltajjxyhoyci44cvm3f2l1oj','2023-02-09 08:45:02','2023-02-09 09:46:28'),(2,28,'教练账号8','jiaxiaojiaolian','管理员','pgxoyp94w04ems2uw4lz2okrqksbxorn','2023-02-09 08:45:42','2023-02-09 09:45:43');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','管理员','2023-02-09 08:42:10');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xueyuan`
--

DROP TABLE IF EXISTS `xueyuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xueyuan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xueyuanzhanghao` varchar(200) NOT NULL COMMENT '学员账号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xueyuanxingming` varchar(200) DEFAULT NULL COMMENT '学员姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `shenfenzheng` varchar(200) DEFAULT NULL COMMENT '身份证',
  `touxiang` longtext COMMENT '头像',
  `jiashizhengleixing` varchar(200) DEFAULT NULL COMMENT '驾驶证类型',
  PRIMARY KEY (`id`),
  UNIQUE KEY `xueyuanzhanghao` (`xueyuanzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='学员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xueyuan`
--

LOCK TABLES `xueyuan` WRITE;
/*!40000 ALTER TABLE `xueyuan` DISABLE KEYS */;
INSERT INTO `xueyuan` VALUES (11,'2023-02-09 08:42:10','学员账号1','123456','学员姓名1','男','13823888881','440300199101010001','upload/xueyuan_touxiang1.jpg','驾驶证类型1'),(12,'2023-02-09 08:42:10','学员账号2','123456','学员姓名2','男','13823888882','440300199202020002','upload/xueyuan_touxiang2.jpg','驾驶证类型2'),(13,'2023-02-09 08:42:10','学员账号3','123456','学员姓名3','男','13823888883','440300199303030003','upload/xueyuan_touxiang3.jpg','驾驶证类型3'),(14,'2023-02-09 08:42:10','学员账号4','123456','学员姓名4','男','13823888884','440300199404040004','upload/xueyuan_touxiang4.jpg','驾驶证类型4'),(15,'2023-02-09 08:42:10','学员账号5','123456','学员姓名5','男','13823888885','440300199505050005','upload/xueyuan_touxiang5.jpg','驾驶证类型5'),(16,'2023-02-09 08:42:10','学员账号6','123456','学员姓名6','男','13823888886','440300199606060006','upload/xueyuan_touxiang6.jpg','驾驶证类型6'),(17,'2023-02-09 08:42:10','学员账号7','123456','学员姓名7','男','13823888887','440300199707070007','upload/xueyuan_touxiang7.jpg','驾驶证类型7'),(18,'2023-02-09 08:42:10','学员账号8','123456','学员姓名8','男','13823888888','440300199808080008','upload/xueyuan_touxiang8.jpg','驾驶证类型8');
/*!40000 ALTER TABLE `xueyuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xueyuanchengji`
--

DROP TABLE IF EXISTS `xueyuanchengji`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xueyuanchengji` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xueyuanzhanghao` varchar(200) DEFAULT NULL COMMENT '学员账号',
  `xueyuanxingming` varchar(200) DEFAULT NULL COMMENT '学员姓名',
  `jiashizhengleixing` varchar(200) DEFAULT NULL COMMENT '驾驶证类型',
  `kemu` varchar(200) DEFAULT NULL COMMENT '科目',
  `fenshu` int(11) DEFAULT NULL COMMENT '分数',
  `shifouhege` varchar(200) DEFAULT NULL COMMENT '是否合格',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `dengjishijian` date DEFAULT NULL COMMENT '登记时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 COMMENT='学员成绩';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xueyuanchengji`
--

LOCK TABLES `xueyuanchengji` WRITE;
/*!40000 ALTER TABLE `xueyuanchengji` DISABLE KEYS */;
INSERT INTO `xueyuanchengji` VALUES (101,'2023-02-09 08:42:10','学员账号1','学员姓名1','驾驶证类型1','科目一',1,'合格','备注1','2023-02-09'),(102,'2023-02-09 08:42:10','学员账号2','学员姓名2','驾驶证类型2','科目一',2,'合格','备注2','2023-02-09'),(103,'2023-02-09 08:42:10','学员账号3','学员姓名3','驾驶证类型3','科目一',3,'合格','备注3','2023-02-09'),(104,'2023-02-09 08:42:10','学员账号4','学员姓名4','驾驶证类型4','科目一',4,'合格','备注4','2023-02-09'),(105,'2023-02-09 08:42:10','学员账号5','学员姓名5','驾驶证类型5','科目一',5,'合格','备注5','2023-02-09'),(106,'2023-02-09 08:42:10','学员账号6','学员姓名6','驾驶证类型6','科目一',6,'合格','备注6','2023-02-09'),(107,'2023-02-09 08:42:10','学员账号7','学员姓名7','驾驶证类型7','科目一',7,'合格','备注7','2023-02-09'),(108,'2023-02-09 08:42:10','学员账号8','学员姓名8','驾驶证类型8','科目一',8,'合格','备注8','2023-02-09');
/*!40000 ALTER TABLE `xueyuanchengji` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yuyuexinxi`
--

DROP TABLE IF EXISTS `yuyuexinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yuyuexinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yuyuehao` varchar(200) DEFAULT NULL COMMENT '预约号',
  `cheliangmingcheng` varchar(200) NOT NULL COMMENT '车辆名称',
  `cheliangtupian` longtext COMMENT '车辆图片',
  `jiashizhengleixing` varchar(200) DEFAULT NULL COMMENT '驾驶证类型',
  `chepaihaoma` varchar(200) NOT NULL COMMENT '车牌号码',
  `cheliangzhuangkuang` varchar(200) DEFAULT NULL COMMENT '车辆状况',
  `yuyueshijian` datetime NOT NULL COMMENT '预约时间',
  `jiaolianzhanghao` varchar(200) DEFAULT NULL COMMENT '教练账号',
  `jiaolianxingming` varchar(200) DEFAULT NULL COMMENT '教练姓名',
  `xueyuanzhanghao` varchar(200) DEFAULT NULL COMMENT '学员账号',
  `xueyuanxingming` varchar(200) DEFAULT NULL COMMENT '学员姓名',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `dengjishijian` datetime DEFAULT NULL COMMENT '登记时间',
  `zhuangtai` varchar(200) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yuyuehao` (`yuyuehao`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='预约信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yuyuexinxi`
--

LOCK TABLES `yuyuexinxi` WRITE;
/*!40000 ALTER TABLE `yuyuexinxi` DISABLE KEYS */;
INSERT INTO `yuyuexinxi` VALUES (41,'2023-02-09 08:42:10','1111111111','车辆名称1','upload/yuyuexinxi_cheliangtupian1.jpg,upload/yuyuexinxi_cheliangtupian2.jpg,upload/yuyuexinxi_cheliangtupian3.jpg','驾驶证类型1','车牌号码1','车辆状况1','2023-02-09 16:42:10','教练账号1','教练姓名1','学员账号1','学员姓名1','13823888881','2023-02-09 16:42:10','已取消'),(42,'2023-02-09 08:42:10','2222222222','车辆名称2','upload/yuyuexinxi_cheliangtupian2.jpg,upload/yuyuexinxi_cheliangtupian3.jpg,upload/yuyuexinxi_cheliangtupian4.jpg','驾驶证类型2','车牌号码2','车辆状况2','2023-02-09 16:42:10','教练账号2','教练姓名2','学员账号2','学员姓名2','13823888882','2023-02-09 16:42:10','已取消'),(43,'2023-02-09 08:42:10','3333333333','车辆名称3','upload/yuyuexinxi_cheliangtupian3.jpg,upload/yuyuexinxi_cheliangtupian4.jpg,upload/yuyuexinxi_cheliangtupian5.jpg','驾驶证类型3','车牌号码3','车辆状况3','2023-02-09 16:42:10','教练账号3','教练姓名3','学员账号3','学员姓名3','13823888883','2023-02-09 16:42:10','已取消'),(44,'2023-02-09 08:42:10','4444444444','车辆名称4','upload/yuyuexinxi_cheliangtupian4.jpg,upload/yuyuexinxi_cheliangtupian5.jpg,upload/yuyuexinxi_cheliangtupian6.jpg','驾驶证类型4','车牌号码4','车辆状况4','2023-02-09 16:42:10','教练账号4','教练姓名4','学员账号4','学员姓名4','13823888884','2023-02-09 16:42:10','已取消'),(45,'2023-02-09 08:42:10','5555555555','车辆名称5','upload/yuyuexinxi_cheliangtupian5.jpg,upload/yuyuexinxi_cheliangtupian6.jpg,upload/yuyuexinxi_cheliangtupian7.jpg','驾驶证类型5','车牌号码5','车辆状况5','2023-02-09 16:42:10','教练账号5','教练姓名5','学员账号5','学员姓名5','13823888885','2023-02-09 16:42:10','已取消'),(46,'2023-02-09 08:42:10','6666666666','车辆名称6','upload/yuyuexinxi_cheliangtupian6.jpg,upload/yuyuexinxi_cheliangtupian7.jpg,upload/yuyuexinxi_cheliangtupian8.jpg','驾驶证类型6','车牌号码6','车辆状况6','2023-02-09 16:42:10','教练账号6','教练姓名6','学员账号6','学员姓名6','13823888886','2023-02-09 16:42:10','已取消'),(47,'2023-02-09 08:42:10','7777777777','车辆名称7','upload/yuyuexinxi_cheliangtupian7.jpg,upload/yuyuexinxi_cheliangtupian8.jpg,upload/yuyuexinxi_cheliangtupian9.jpg','驾驶证类型7','车牌号码7','车辆状况7','2023-02-09 16:42:10','教练账号7','教练姓名7','学员账号7','学员姓名7','13823888887','2023-02-09 16:42:10','已取消'),(48,'2023-02-09 08:42:10','8888888888','车辆名称8','upload/yuyuexinxi_cheliangtupian8.jpg,upload/yuyuexinxi_cheliangtupian9.jpg,upload/yuyuexinxi_cheliangtupian10.jpg','驾驶证类型8','车牌号码8','车辆状况8','2023-02-09 16:42:10','教练账号8','教练姓名8','学员账号8','学员姓名8','13823888888','2023-02-09 16:42:10','已取消');
/*!40000 ALTER TABLE `yuyuexinxi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-12 16:28:54
