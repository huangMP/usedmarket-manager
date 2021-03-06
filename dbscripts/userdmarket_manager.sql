/*
SQLyog v10.2 
MySQL - 5.7.17-log : Database - usedmarket-manager
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`usedmarket-manager` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `usedmarket-manager`;

/*Table structure for table `db_fhdb` */

DROP TABLE IF EXISTS `db_fhdb`;

CREATE TABLE `db_fhdb` (
  `FHDB_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '操作用户',
  `BACKUP_TIME` varchar(32) DEFAULT NULL COMMENT '备份时间',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `SQLPATH` varchar(300) DEFAULT NULL COMMENT '存储位置',
  `TYPE` int(1) NOT NULL COMMENT '类型',
  `DBSIZE` varchar(10) DEFAULT NULL COMMENT '文件大小',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FHDB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `db_fhdb` */

/*Table structure for table `db_timingbackup` */

DROP TABLE IF EXISTS `db_timingbackup`;

CREATE TABLE `db_timingbackup` (
  `TIMINGBACKUP_ID` varchar(100) NOT NULL,
  `JOBNAME` varchar(50) DEFAULT NULL COMMENT '任务名称',
  `CREATE_TIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `STATUS` int(1) NOT NULL COMMENT '类型',
  `FHTIME` varchar(30) DEFAULT NULL COMMENT '时间规则',
  `TIMEEXPLAIN` varchar(100) DEFAULT NULL COMMENT '规则说明',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TIMINGBACKUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `db_timingbackup` */

insert  into `db_timingbackup`(`TIMINGBACKUP_ID`,`JOBNAME`,`CREATE_TIME`,`TABLENAME`,`STATUS`,`FHTIME`,`TIMEEXPLAIN`,`BZ`) values ('311e06c34a5e4518a86d5d30799f9b55','sys_app_user_515762','2016-04-11 17:04:55','sys_app_user',2,'1/2 * * ? * *','每个月的 每周 每天 每小时执行一次','备份任务');

/*Table structure for table `oa_department` */

DROP TABLE IF EXISTS `oa_department`;

CREATE TABLE `oa_department` (
  `DEPARTMENT_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT '编码',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT '上级ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `HEADMAN` varchar(30) DEFAULT NULL COMMENT '负责人',
  `TEL` varchar(50) DEFAULT NULL COMMENT '电话',
  `FUNCTIONS` varchar(255) DEFAULT NULL COMMENT '部门职能',
  `ADDRESS` varchar(255) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`DEPARTMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `oa_department` */

insert  into `oa_department`(`DEPARTMENT_ID`,`NAME`,`NAME_EN`,`BIANMA`,`PARENT_ID`,`BZ`,`HEADMAN`,`TEL`,`FUNCTIONS`,`ADDRESS`) values ('0956d8c279274fca92f4091f2a69a9ad','销售会计','xiaokuai','05896','d41af567914a409893d011aa53eda797','','','','',''),('3e7227e11dc14b4d9e863dd1a1fcedf6','成本会计','chengb','03656','d41af567914a409893d011aa53eda797','','','','',''),('5cccdb7c432449d8b853c52880058140','B公司','b','002','0','冶铁','李四','112','冶铁','河北'),('83a25761c618457cae2fa1211bd8696d','销售B组','xiaob','002365','cbbc84eddde947ba8af7d509e430eb70','','李四','','',''),('8f8b045470f342fdbc4c312ab881d62b','销售A组','xiaoA','0326','cbbc84eddde947ba8af7d509e430eb70','','张三','0201212','',''),('a0982dea52554225ab682cd4b421de47','1队','yidui','02563','8f8b045470f342fdbc4c312ab881d62b','','小王','12356989','',''),('a6c6695217ba4a4dbfe9f7e9d2c06730','A公司','a','001','0','挖煤','张三','110','洼煤矿','山西'),('cbbc84eddde947ba8af7d509e430eb70','销售部','xiaoshoubu','00201','5cccdb7c432449d8b853c52880058140','推销商品','小明','11236','推销商品','909办公室'),('d41af567914a409893d011aa53eda797','财务部','caiwubu','00101','a6c6695217ba4a4dbfe9f7e9d2c06730','负责发工资','王武','11236','管理财务','308办公室');

/*Table structure for table `sys_app_user` */

DROP TABLE IF EXISTS `sys_app_user`;

CREATE TABLE `sys_app_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `PHONE` varchar(100) DEFAULT NULL,
  `SFID` varchar(100) DEFAULT NULL,
  `START_TIME` varchar(100) DEFAULT NULL,
  `END_TIME` varchar(100) DEFAULT NULL,
  `YEARS` int(10) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_app_user` */

insert  into `sys_app_user`(`USER_ID`,`USERNAME`,`PASSWORD`,`NAME`,`RIGHTS`,`ROLE_ID`,`LAST_LOGIN`,`IP`,`STATUS`,`BZ`,`PHONE`,`SFID`,`START_TIME`,`END_TIME`,`YEARS`,`NUMBER`,`EMAIL`) values ('1e89e6504be349a68c025976b3ecc1d1','a1','698d51a19d8a121ce581499d7b701668','会员甲','','115b386ff04f4352b060dffcd2b5d1da','','','1','121','1212','1212','2015-12-02','2015-12-25',2,'111','313596790@qq.com'),('ead1f56708e4409c8d071e0a699e5633','a2','bcbe3365e6ac95ea2c0343a2395834dd','会员乙','','1b67fc82ce89457a8347ae53e43a347e','','','0','','','','2015-12-01','2015-12-24',1,'121','978336446@qq.com');

/*Table structure for table `sys_createcode` */

DROP TABLE IF EXISTS `sys_createcode`;

CREATE TABLE `sys_createcode` (
  `CREATECODE_ID` varchar(100) NOT NULL,
  `PACKAGENAME` varchar(50) DEFAULT NULL COMMENT '包名',
  `OBJECTNAME` varchar(50) DEFAULT NULL COMMENT '类名',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `FIELDLIST` varchar(5000) DEFAULT NULL COMMENT '属性集',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`CREATECODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_createcode` */

insert  into `sys_createcode`(`CREATECODE_ID`,`PACKAGENAME`,`OBJECTNAME`,`TABLENAME`,`FIELDLIST`,`CREATETIME`,`TITLE`) values ('002ea762e3e242a7a10ea5ca633701d8','system','Buttonrights','sys_,fh,BUTTONRIGHTS','NAME,fh,String,fh,名称,fh,是,fh,无,fh,255Q313596790','2016-01-16 23:20:36','按钮权限'),('3d4405e29ec44e5da7954e96802c8721','makermanager','Dynamics','TB_,fh,DYNAMICS','TYPE,fh,Integer,fh,类型,fh,是,fh,无,fh,11Q313596790IMAGES,fh,String,fh,图片集合,fh,是,fh,无,fh,255Q313596790TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255Q313596790TEXT,fh,String,fh,正文,fh,是,fh,无,fh,255Q313596790PURE_TEXT,fh,String,fh,纯文本,fh,是,fh,无,fh,255Q313596790ORIGIN,fh,String,fh,来源,fh,是,fh,无,fh,255Q313596790ADD_USER,fh,String,fh,添加人,fh,是,fh,无,fh,255Q313596790ADD_DATE,fh,Date,fh,添加时间,fh,是,fh,无,fh,32Q313596790SORT,fh,Integer,fh,排序数,fh,是,fh,无,fh,11Q313596790','2017-03-14 18:22:43','动态管理'),('49d985e081ed44e6b34ba1b8c5466e39','fhdb','TimingBackUp','DB_,fh,TIMINGBACKUP','JOBNAME,fh,String,fh,任务名称,fh,否,fh,无,fh,50Q313596790CREATE_TIME,fh,Date,fh,创建时间,fh,否,fh,无,fh,32Q313596790TABLENAME,fh,String,fh,表名,fh,是,fh,无,fh,50Q313596790TYPE,fh,Integer,fh,类型,fh,否,fh,无,fh,1Q313596790FHTIME,fh,String,fh,时间规则,fh,是,fh,无,fh,30Q313596790TIMEEXPLAIN,fh,String,fh,规则说明,fh,是,fh,无,fh,100Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255Q313596790','2016-04-09 11:53:38','定时备份'),('4eac5049cddc4826a99b9109446205af','maker','Dynamics','TB_,fh,DYNAMICS','TYPE,fh,Integer,fh,类型,fh,是,fh,无,fh,11Q313596790IMAGES,fh,String,fh,图片集合,fh,是,fh,无,fh,255Q313596790TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255Q313596790TEXT,fh,String,fh,正文,fh,是,fh,无,fh,255Q313596790PURE_TEXT,fh,String,fh,纯文本,fh,是,fh,无,fh,255Q313596790ORIGIN,fh,String,fh,来源,fh,是,fh,无,fh,255Q313596790ADD_USER,fh,String,fh,添加人,fh,是,fh,无,fh,255Q313596790ADD_DATE,fh,Date,fh,添加时间,fh,是,fh,无,fh,32Q313596790SORT,fh,Integer,fh,用于排序,fh,是,fh,无,fh,11Q313596790','2017-03-12 15:36:16','动态管理'),('bf35ab8b2d064bf7928a04bba5e5a6dd','system','Fhsms','SYS_,fh,FHSMS','CONTENT,fh,String,fh,内容,fh,是,fh,无,fh,1000Q313596790TYPE,fh,String,fh,类型,fh,否,fh,无,fh,5Q313596790TO_USERNAME,fh,String,fh,收信人,fh,是,fh,无,fh,255Q313596790FROM_USERNAME,fh,String,fh,发信人,fh,是,fh,无,fh,255Q313596790SEND_TIME,fh,String,fh,发信时间,fh,是,fh,无,fh,100Q313596790STATUS,fh,String,fh,状态,fh,否,fh,无,fh,5Q313596790SANME_ID,fh,String,fh,共同ID,fh,是,fh,无,fh,100Q313596790','2016-03-27 21:39:45','站内信'),('c7586f931fd44c61beccd3248774c68c','system','Department','SYS_,fh,DEPARTMENT','NAME,fh,String,fh,名称,fh,是,fh,无,fh,30Q313596790NAME_EN,fh,String,fh,英文,fh,是,fh,无,fh,50Q313596790BIANMA,fh,String,fh,编码,fh,是,fh,无,fh,50Q313596790PARENT_ID,fh,String,fh,上级ID,fh,否,fh,无,fh,100Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255Q313596790HEADMAN,fh,String,fh,负责人,fh,是,fh,无,fh,30Q313596790TEL,fh,String,fh,电话,fh,是,fh,无,fh,50Q313596790FUNCTIONS,fh,String,fh,部门职能,fh,是,fh,无,fh,255Q313596790ADDRESS,fh,String,fh,地址,fh,是,fh,无,fh,255Q313596790','2015-12-20 01:49:25','组织机构'),('c937e21208914e5b8fb1202c685bbf2f','fhdb','Fhdb','DB_,fh,FHDB','USERNAME,fh,String,fh,操作用户,fh,否,fh,无,fh,50Q313596790BACKUP_TIME,fh,Date,fh,备份时间,fh,否,fh,无,fh,32Q313596790TABLENAME,fh,String,fh,表名,fh,是,fh,无,fh,50Q313596790SQLPATH,fh,String,fh,存储位置,fh,否,fh,无,fh,300Q313596790TYPE,fh,Integer,fh,类型,fh,是,fh,无,fh,1Q313596790DBSIZE,fh,String,fh,文件大小,fh,否,fh,无,fh,10Q313596790BZ,fh,String,fh,备注,fh,否,fh,无,fh,255Q313596790','2016-03-30 13:46:54','数据库管理'),('d514dbd2474d4b6c8b6ab9904cc9cc7c','new','News','TB_,fh,NEWS','TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255Q313596790','2016-01-25 16:38:14','新闻管理'),('dbd7b8330d774dcabd184eca8668a295','system','Fhsms','SYS_,fh,FHSMS','CONTENT,fh,String,fh,内容,fh,是,fh,无,fh,1000Q313596790TYPE,fh,String,fh,类型,fh,否,fh,无,fh,5Q313596790TO_USERNAME,fh,String,fh,收信人,fh,是,fh,无,fh,255Q313596790FROM_USERNAME,fh,String,fh,发信人,fh,是,fh,无,fh,255Q313596790SEND_TIME,fh,String,fh,发信时间,fh,是,fh,无,fh,100Q313596790STATUS,fh,String,fh,状态,fh,否,fh,无,fh,5Q313596790SANME_ID,fh,String,fh,共同ID,fh,是,fh,无,fh,100Q313596790','2016-01-23 01:44:15','站内信'),('fe239f8742194481a5b56f90cad71520','system','Fhbutton','SYS_,fh,FHBUTTON','NAME,fh,String,fh,名称,fh,是,fh,无,fh,30Q313596790QX_NAME,fh,String,fh,权限标识,fh,是,fh,无,fh,50Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255Q313596790','2016-01-15 18:38:40','按钮管理');

/*Table structure for table `sys_dictionaries` */

DROP TABLE IF EXISTS `sys_dictionaries`;

CREATE TABLE `sys_dictionaries` (
  `DICTIONARIES_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT '编码',
  `ORDER_BY` int(11) NOT NULL COMMENT '排序',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT '上级ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `TBSNAME` varchar(100) DEFAULT NULL COMMENT '排查表',
  PRIMARY KEY (`DICTIONARIES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_dictionaries` */

insert  into `sys_dictionaries`(`DICTIONARIES_ID`,`NAME`,`NAME_EN`,`BIANMA`,`ORDER_BY`,`PARENT_ID`,`BZ`,`TBSNAME`) values ('096e4ec8986149d994b09e604504e38d','黄浦区','huangpu','0030201',1,'f1ea30ddef1340609c35c88fb2919bee','黄埔',''),('12a62a3e5bed44bba0412b7e6b733c93','北京','beijing','00301',1,'be4a8c5182c744d28282a5345783a77f','北京',''),('507fa87a49104c7c8cdb52fdb297da12','宣武区','xuanwuqu','0030101',1,'12a62a3e5bed44bba0412b7e6b733c93','宣武区',''),('8994f5995f474e2dba6cfbcdfe5ea07a','语文','yuwen','00201',1,'fce20eb06d7b4b4d8f200eda623f725c','语文',''),('8ea7c44af25f48b993a14f791c8d689f','分类','fenlei','001',1,'0','分类',''),('be4a8c5182c744d28282a5345783a77f','地区','diqu','003',3,'0','地区',''),('d428594b0494476aa7338d9061e23ae3','红色','red','00101',1,'8ea7c44af25f48b993a14f791c8d689f','红色',''),('de9afadfbed0428fa343704d6acce2c4','绿色','green','00102',2,'8ea7c44af25f48b993a14f791c8d689f','绿色',''),('f1ea30ddef1340609c35c88fb2919bee','上海','shanghai','00302',2,'be4a8c5182c744d28282a5345783a77f','上海',''),('fce20eb06d7b4b4d8f200eda623f725c','课程','kecheng','002',2,'0','课程','');

/*Table structure for table `sys_fhbutton` */

DROP TABLE IF EXISTS `sys_fhbutton`;

CREATE TABLE `sys_fhbutton` (
  `FHBUTTON_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `QX_NAME` varchar(50) DEFAULT NULL COMMENT '权限标识',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FHBUTTON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_fhbutton` */

insert  into `sys_fhbutton`(`FHBUTTON_ID`,`NAME`,`QX_NAME`,`BZ`) values ('3542adfbda73410c976e185ffe50ad06','导出EXCEL','toExcel','导出EXCEL'),('46992ea280ba4b72b29dedb0d4bc0106','发邮件','email','发送电子邮件'),('4efa162fce8340f0bd2dcd3b11d327ec','导入EXCEL','FromExcel','导入EXCEL到系统用户'),('cc51b694d5344d28a9aa13c84b7166cd','发短信','sms','发送短信'),('da7fd386de0b49ce809984f5919022b8','站内信','FHSMS','发送站内信');

/*Table structure for table `sys_fhsms` */

DROP TABLE IF EXISTS `sys_fhsms`;

CREATE TABLE `sys_fhsms` (
  `FHSMS_ID` varchar(100) NOT NULL,
  `CONTENT` varchar(1000) DEFAULT NULL COMMENT '内容',
  `TYPE` varchar(5) DEFAULT NULL COMMENT '类型',
  `TO_USERNAME` varchar(255) DEFAULT NULL COMMENT '收信人',
  `FROM_USERNAME` varchar(255) DEFAULT NULL COMMENT '发信人',
  `SEND_TIME` varchar(100) DEFAULT NULL COMMENT '发信时间',
  `STATUS` varchar(5) DEFAULT NULL COMMENT '状态',
  `SANME_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FHSMS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_fhsms` */

insert  into `sys_fhsms`(`FHSMS_ID`,`CONTENT`,`TYPE`,`TO_USERNAME`,`FROM_USERNAME`,`SEND_TIME`,`STATUS`,`SANME_ID`) values ('05879f5868824f35932ee9f2062adc03','你好','2','admin','san','2016-01-25 14:05:31','1','b311e893228f42d5a05dbe16917fd16f'),('2635dd035c6f4bb5a091abdd784bd899','你好','2','san','admin','2016-01-25 14:05:02','2','1b7637306683460f89174c2b025862b5'),('52378ccd4e2d4fe08994d1652af87c68','你好','1','admin','san','2016-01-25 16:26:44','1','920b20dafdfb4c09b560884eb277c51d'),('77ed13f9c49a4c4bb460c41b8580dd36','gggg','2','admin','san','2016-01-24 21:22:43','2','dd9ee339576e48c5b046b94fa1901d00'),('98a6869f942042a1a037d9d9f01cb50f','你好','1','admin','san','2016-01-25 14:05:02','2','1b7637306683460f89174c2b025862b5'),('9e00295529014b6e8a27019cbccb3da1','柔柔弱弱','1','admin','san','2016-01-24 21:22:57','1','a29603d613ea4e54b5678033c1bf70a6'),('d3aedeb430f640359bff86cd657a8f59','你好','1','admin','san','2016-01-24 21:22:12','1','f022fbdce3d845aba927edb698beb90b'),('e5376b1bd54b489cb7f2203632bd74ec','管理员好','2','admin','san','2016-01-25 14:06:13','2','b347b2034faf43c79b54be4627f3bd2b'),('e613ac0fcc454f32895a70b747bf4fb5','你也好','2','admin','san','2016-01-25 16:27:54','2','ce8dc3b15afb40f28090f8b8e13f078d'),('f25e00cfafe741a3a05e3839b66dc7aa','你好','2','san','admin','2016-01-25 16:26:44','1','920b20dafdfb4c09b560884eb277c51d');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `MENU_ID` int(11) NOT NULL,
  `MENU_NAME` varchar(255) DEFAULT NULL,
  `MENU_URL` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `MENU_ORDER` varchar(100) DEFAULT NULL,
  `MENU_ICON` varchar(60) DEFAULT NULL,
  `MENU_TYPE` varchar(10) DEFAULT NULL,
  `MENU_STATE` int(1) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (1,'系统管理','#','0','1','menu-icon fa fa-desktop blue','2',1),(2,'权限管理','#','1','1','menu-icon fa fa-lock black','1',1),(6,'信息管理','#','0','5','menu-icon fa fa-credit-card green','2',1),(7,'图片管理','#','6','1','menu-icon fa fa-folder-o pink','2',1),(8,'性能监控','druid/index.html','9','8','menu-icon fa fa-tachometer red','1',1),(9,'系统工具','#','0','3','menu-icon fa fa-cog black','2',1),(20,'在线管理','onlinemanager/list.do','1','5','menu-icon fa fa-laptop green','1',1),(36,'角色(基础权限)','role.do','2','1','menu-icon fa fa-key orange','1',1),(37,'按钮权限','buttonrights/list.do','2','2','menu-icon fa fa-key green','1',1),(38,'菜单管理','menu/listAllMenu.do','1','3','menu-icon fa fa-folder-open-o brown','1',1),(39,'按钮管理','fhbutton/list.do','1','2','menu-icon fa fa-download orange','1',1),(40,'用户管理','#','0','2','menu-icon fa fa-users blue','2',1),(41,'系统用户','user/listUsers.do','40','1','menu-icon fa fa-users green','1',1),(42,'会员管理','happuser/listUsers.do','40','2','menu-icon fa fa-users orange','1',1),(44,'代码生成器','createCode/list.do','9','0','menu-icon fa fa-cogs brown','1',1),(51,'图片列表','pictures/list.do','7','1','menu-icon fa fa-folder-open-o green','1',1),(52,'图片爬虫','pictures/goImageCrawler.do','7','2','menu-icon fa fa-cloud-download green','1',1),(53,'表单构建器','tool/goFormbuilder.do','9','1','menu-icon fa fa-leaf black','1',1),(62,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(63,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(64,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(65,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(66,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(67,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(68,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(69,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(70,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(71,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(72,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(73,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(74,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(75,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(76,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(77,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(78,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(79,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(80,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(81,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(82,'校园APP','#','0','10','menu-icon fa fa-leaf black','2',1),(83,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(84,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(85,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(86,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(87,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(88,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(89,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(90,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(91,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(92,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(93,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(94,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(95,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(96,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(97,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(98,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(99,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(100,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(101,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(102,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(103,'动态管理','#','82','1','menu-icon fa fa-leaf black','1',1),(104,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(105,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(106,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(107,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(108,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(109,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(110,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(111,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(112,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(113,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(114,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(115,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(116,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(117,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(118,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(119,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(120,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(121,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(122,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(123,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(124,'捐赠动态管理','MakerDonationDynamics/list.do','103','2','menu-icon fa fa-leaf black','1',1),(125,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(126,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(127,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(128,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(129,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(130,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(131,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(132,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(133,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(134,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(135,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(136,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(137,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(138,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(139,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(140,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(141,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(142,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(143,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(144,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(145,'校园动态管理','MakerSchoolDynamics/list.do','103','1','menu-icon fa fa-leaf black','1',1),(146,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(147,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(148,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(149,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(150,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(151,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(152,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(153,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(154,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(155,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(156,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(157,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(158,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(159,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(160,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(161,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(162,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(163,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(164,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(165,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(166,'捐赠物品管理','WebDonation/list.do','82','2','menu-icon fa fa-leaf black','1',1),(167,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(168,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(169,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(170,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(171,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(172,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(173,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(174,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(175,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(176,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(177,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(178,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(179,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(180,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(181,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(182,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(183,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(184,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(185,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(186,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(187,'众筹动态','MakerCrowdfundingDynamics/list.do','103','3','menu-icon fa fa-leaf black','1',1),(188,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(189,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(190,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(191,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(192,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(193,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(194,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(195,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(196,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(197,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(198,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(199,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(200,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(201,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(202,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(203,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(204,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(205,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(206,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(207,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(208,'众筹管理','#','82','3','menu-icon fa fa-leaf black','1',1),(209,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(210,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(211,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(212,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(213,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(214,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(215,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(216,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(217,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(218,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(219,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(220,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(221,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(222,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(223,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(224,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(225,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(226,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(227,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(228,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(229,'创意众筹','MakerOriginalityCrowdfunding/list.do','208','1','menu-icon fa fa-leaf black','1',1),(230,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(231,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(232,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(233,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(234,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(235,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(236,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(237,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(238,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(239,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(240,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(241,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(242,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(243,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(244,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(245,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(246,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(247,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(248,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(249,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(250,'爱心众筹','MakerBenevolenceCrowdfunding/list.do','208','2','menu-icon fa fa-leaf black','1',1),(251,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(252,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(253,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(254,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(255,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(256,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(257,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(258,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(259,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(260,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(261,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(262,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(263,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(264,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(265,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(266,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(267,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(268,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(269,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL),(270,NULL,NULL,NULL,NULL,'menu-icon fa fa-leaf black',NULL,NULL);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `ROLE_ID` varchar(100) NOT NULL,
  `ROLE_NAME` varchar(100) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `ADD_QX` varchar(255) DEFAULT NULL,
  `DEL_QX` varchar(255) DEFAULT NULL,
  `EDIT_QX` varchar(255) DEFAULT NULL,
  `CHA_QX` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role` */

insert  into `sys_role`(`ROLE_ID`,`ROLE_NAME`,`RIGHTS`,`PARENT_ID`,`ADD_QX`,`DEL_QX`,`EDIT_QX`,`CHA_QX`) values ('1','系统管理组','1809252257051770278649259894382753251690484308246621250658700075120269984710','0','1','1','1','1'),('115b386ff04f4352b060dffcd2b5d1da','中级会员','498','2','0','0','0','0'),('1b67fc82ce89457a8347ae53e43a347e','初级会员','498','2','0','0','0','0'),('2','会员组','498','0','0','0','0','1'),('3264c8e83d0248bb9e3ea6195b4c0216','一级管理员','1809252257051770278649259894382753251690484308246621250658700075120269984710','1','1809252257051770278649259894382753251690484308246621250658684304824992793542','1809252257051770278649259894382753251690484308246621250658684304824992793542','1809252257051770278649259894382753251690484308246621250658684312521574187974','1809252257051770278649259894382753251690484308246621250658684304824992793542'),('46294b31a71c4600801724a6eb06bb26','职位组','','0','0','0','0','0'),('5466347ac07044cb8d82990ec7f3a90e','主管','','46294b31a71c4600801724a6eb06bb26','0','0','0','0'),('68f8e4a39efe47c7bb869e9d15ab925d','二级管理员','1809252257051770278649259894382753251690484308246621250658700075120269984710','1','0','0','2251798773489606','0'),('856849f422774ad390a4e564054d8cc8','经理','','46294b31a71c4600801724a6eb06bb26','0','0','0','0'),('8b70a7e67f2841e7aaba8a4d92e5ff6f','高级会员','498','2','0','0','0','0'),('c21cecf84048434b93383182b1d98cba','组长','','46294b31a71c4600801724a6eb06bb26','0','0','0','0'),('d449195cd8e7491080688c58e11452eb','总监','','46294b31a71c4600801724a6eb06bb26','0','0','0','0'),('de9de2f006e145a29d52dfadda295353','三级管理员','1809252257051770278649259894382753251690484308246621250658700075120269984710','1','0','0','0','0');

/*Table structure for table `sys_role_fhbutton` */

DROP TABLE IF EXISTS `sys_role_fhbutton`;

CREATE TABLE `sys_role_fhbutton` (
  `RB_ID` varchar(100) NOT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `BUTTON_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RB_ID`),
  KEY `角色表外键` (`ROLE_ID`) USING BTREE,
  KEY `fbutton` (`BUTTON_ID`),
  CONSTRAINT `fbutton` FOREIGN KEY (`BUTTON_ID`) REFERENCES `sys_fhbutton` (`FHBUTTON_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `frole` FOREIGN KEY (`ROLE_ID`) REFERENCES `sys_role` (`ROLE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role_fhbutton` */

insert  into `sys_role_fhbutton`(`RB_ID`,`ROLE_ID`,`BUTTON_ID`) values ('14b5c28ea6ae4508b57d2d272ab3d5f1','3264c8e83d0248bb9e3ea6195b4c0216','46992ea280ba4b72b29dedb0d4bc0106'),('1743733f366240c693c4295b527d1b0e','de9de2f006e145a29d52dfadda295353','4efa162fce8340f0bd2dcd3b11d327ec'),('3768e60edd1c4b5c9f1dd861188ae2f9','3264c8e83d0248bb9e3ea6195b4c0216','cc51b694d5344d28a9aa13c84b7166cd'),('8231c216fb514b4188e4162e629c6237','3264c8e83d0248bb9e3ea6195b4c0216','4efa162fce8340f0bd2dcd3b11d327ec'),('9412d1d05162464c83658c7f89ab03f0','68f8e4a39efe47c7bb869e9d15ab925d','3542adfbda73410c976e185ffe50ad06'),('96567633dd3548c9b75d28f430adf5a3','3264c8e83d0248bb9e3ea6195b4c0216','da7fd386de0b49ce809984f5919022b8'),('a1478f27c852459fa9cad04b642f4fb7','de9de2f006e145a29d52dfadda295353','3542adfbda73410c976e185ffe50ad06'),('ba6696b8761044618e44c7e02c9ba89e','68f8e4a39efe47c7bb869e9d15ab925d','cc51b694d5344d28a9aa13c84b7166cd'),('f0329033d0914faf8ea6e9ff252cc5e6','68f8e4a39efe47c7bb869e9d15ab925d','46992ea280ba4b72b29dedb0d4bc0106'),('f627982cc9d4479dbc03af726dc6ac58','de9de2f006e145a29d52dfadda295353','cc51b694d5344d28a9aa13c84b7166cd');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `USER_ID` varchar(100) NOT NULL COMMENT '用户id',
  `USERNAME` varchar(255) DEFAULT NULL COMMENT '用户名',
  `PASSWORD` varchar(255) DEFAULT NULL COMMENT '登录密码',
  `NAME` varchar(255) DEFAULT NULL COMMENT '姓名',
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `SKIN` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL COMMENT '编号',
  `PHONE` varchar(32) DEFAULT NULL,
  `PIC` varchar(255) DEFAULT NULL,
  `my_role` int(11) DEFAULT NULL COMMENT '角色:1.餐厅管理员；2.后厨人员；3.点餐服务员',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`USER_ID`,`USERNAME`,`PASSWORD`,`NAME`,`RIGHTS`,`ROLE_ID`,`LAST_LOGIN`,`IP`,`STATUS`,`BZ`,`SKIN`,`EMAIL`,`NUMBER`,`PHONE`,`PIC`,`my_role`) values ('1','admin','de41b7fb99201d8334c23c014db35ecd92df81bc','FH','1133671055321055258374707980945218933803269864762743594642571294','1','2017-03-22 13:49:20','0:0:0:0:0:0:0:1','0','admin','default','QQ313596790@main.com','001','18788888888',NULL,NULL),('5a2528f8d5c548728fe54305e06d0cbc','test','ee89026a6c5603c51b4504d218ac60f6874b7750','test','','68f8e4a39efe47c7bb869e9d15ab925d','','','0','test','default','4546@qq.com','234245','12345678912',NULL,NULL);

/*Table structure for table `t_attachment` */

DROP TABLE IF EXISTS `t_attachment`;

CREATE TABLE `t_attachment` (
  `attachment_id` varchar(50) NOT NULL COMMENT '附件表',
  `content_id` varchar(50) DEFAULT NULL,
  `file_path` varchar(200) DEFAULT NULL COMMENT '文件路径',
  `narrow_image_path` varchar(200) DEFAULT NULL COMMENT '压缩图路径',
  `file_type` varchar(11) DEFAULT NULL COMMENT '文件类型: 头像:0；商品图片:1;捐赠物品图片:2;首页轮播图:3',
  PRIMARY KEY (`attachment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_attachment` */

insert  into `t_attachment`(`attachment_id`,`content_id`,`file_path`,`narrow_image_path`,`file_type`) values ('0047ec9ddb474d708b6b75c87dbd4814','f83f0abf13c64326b124f73ee5adccb1','static/attachment/22ec663decf045198cce5f0fc2f42e81.jpg','static/attachment/_22ec663decf045198cce5f0fc2f42e81.jpg','5'),('085d606a34274a44a032bef472ab89d6','9a39e9af02be44038f854ab5b9dbd7a1','static/attachment/73aa1a6ad41c451783682d09fc0ad74c.jpg','static/attachment/_73aa1a6ad41c451783682d09fc0ad74c.jpg','5'),('08f497bd5cd547fc9cde22af56b190c9','3dd093d1729e474190928db8b811f094','static/attachment/7f902437a5b0469394699002bb7fe367.jpg','static/attachment/_7f902437a5b0469394699002bb7fe367.jpg','5'),('0a6e82dcab35437ba226977c27d4741a','51c960b6f2124371b3fdb21d957b8030','static/attachment/67dce3ab80064f6783b7ae131855afa9.jpg','static/attachment/_67dce3ab80064f6783b7ae131855afa9.jpg','5'),('0d930485df3b4b88b3bd8db9c42e92c5','58c3a83e1a8c4856a16031c3fad16de2','static/attachment/c9ded2eb6cc041bab323b561b5f44414.jpg','static/attachment/_c9ded2eb6cc041bab323b561b5f44414.jpg','4'),('12a9daa80abc48f0a9775c292253226b','52e242ed86454f6899d4df3e231ea4cf','static/attachment/23b1d24be61e4f33a9d208095aa3565b.jpg','static/attachment/_23b1d24be61e4f33a9d208095aa3565b.jpg','5'),('142a03707ab74cbeb18a859e755fa945','ba3ee29aaaea4316ac26501ee1fd7a4b','static/attachment/a4af312b336d44bd827c370a39cc44c2.jpg','static/attachment/_a4af312b336d44bd827c370a39cc44c2.jpg','5'),('17b2348efa1d442c82308f0fa4a5c7d9','1b545ba2388042639ef5ec511b5df66e','static/attachment/01d2c3cd6c474f94ac4f9c572dc1b95a.jpg','static/attachment/_01d2c3cd6c474f94ac4f9c572dc1b95a.jpg','4'),('1dfdd64e140842e89a7287cd41dad5c9','8c185b9f16b749ef8696304b0ce06fcb','static/attachment/91640143d122408d9b9102848687ce9b.jpg','static/attachment/_91640143d122408d9b9102848687ce9b.jpg','5'),('1e53bb374d0b4991a59d3b90d6273c45','a0ea82295180417db9bce9bfb66dcb47','static/attachment/0d8af58405ff49b69ac1c9a4d99ea284.jpg','static/attachment/_0d8af58405ff49b69ac1c9a4d99ea284.jpg','5'),('22eaaa591f41449488b2b3d06f3f7e19','d7321e5a4b314eddbc35cd8e56d41f47','static/attachment/463bed8995c943eb9572c777f6fd4390.jpg','static/attachment/_463bed8995c943eb9572c777f6fd4390.jpg','3'),('22f5c696532a44efa5db7f9e58f93d3e','a889a6fecb39417da33e4f5783104e82','static/attachment/3faf2db49bab484dad819c785128776c.jpg','static/attachment/_3faf2db49bab484dad819c785128776c.jpg','5'),('2428fd9d081d484e9132d262c15e91cb','f83f0abf13c64326b124f73ee5adccb1','static/attachment/e42cc981bd534d248ae75d3f8fd5cb97.jpg','static/attachment/_e42cc981bd534d248ae75d3f8fd5cb97.jpg','5'),('2501d2cf0bb246bf89ad4b3e9d66826a','2c8a3db572dc49a1a938a3360231b7ab','static/attachment/7100d4b674b240bc8cae059bffdc179b.jpg','static/attachment/_7100d4b674b240bc8cae059bffdc179b.jpg','3'),('29a8ad81897b4e88aadd10d2468cb00a','a7600631221b4386bf75b80fb40f8c51','static/attachment/d0e589b59ad14a42a309f7b02ed27d07.jpg','static/attachment/_d0e589b59ad14a42a309f7b02ed27d07.jpg','5'),('2ec240b2ccd545819dd25c78aef1e636','39568a6190d54586bedfac44582a7873','static/attachment/06460cf5e6264c25875e3c30d636f6f6.jpg','static/attachment/_06460cf5e6264c25875e3c30d636f6f6.jpg','5'),('32034cf49308485e85920aa11a7a2c2f','8c185b9f16b749ef8696304b0ce06fcb','static/attachment/4c92f8ad05dc4e4baac76e707998a205.jpg','static/attachment/_4c92f8ad05dc4e4baac76e707998a205.jpg','5'),('322930e6703545ca9dc8260154b83419','8fae8646a4d64c94ba23543390805bab','static/attachment/46f897e88e714640a4d9a56ad215db02.jpg','static/attachment/_46f897e88e714640a4d9a56ad215db02.jpg','5'),('3290a043d75d463b9678f3d61435b04f','266bd881ec2b4911a85a41e98c81e90f','static/attachment/5bc1ee756bab4e4f903a9e4162651c29.jpg','static/attachment/_5bc1ee756bab4e4f903a9e4162651c29.jpg','5'),('349ce7afab87434ead62280aeec1e196','9a39e9af02be44038f854ab5b9dbd7a1','static/attachment/9cd9eb0d55724e9eaf493caf4b34aadb.jpg','static/attachment/_9cd9eb0d55724e9eaf493caf4b34aadb.jpg','5'),('3605e683dc6f4d98af160b0187a9f7bc','2b4f31e161364db29c7a7bf0ddf73e4d','static/attachment/0467940716064822847d5e90978cedac.jpg','static/attachment/_0467940716064822847d5e90978cedac.jpg','5'),('38006d67940e45c3bfe08dc70638948a','0dfc383e8c414799837bb9bd78c69ad0','static/attachment/be76e0ade3a040c591e2f1c48eb4f5c9.jpg','static/attachment/_be76e0ade3a040c591e2f1c48eb4f5c9.jpg','4'),('38afad71aea14029bef8644f00ca8e8f','cb8e8afb6fdd44e397a0f318c55a0c2a','static/attachment/a030eaa0b3a746c9b968263b23f10b40.jpg','static/attachment/_a030eaa0b3a746c9b968263b23f10b40.jpg','5'),('39a0b5afa3c2469a8ae5453373ec4b31','d5ac129750d04ba7b994e9d9f188e21d','static/attachment/ecf3311cf3d4471580c279b9f3c990fe.jpg','static/attachment/_ecf3311cf3d4471580c279b9f3c990fe.jpg','5'),('3a6381024cd74170bb4e233cf00cff59','9a39e9af02be44038f854ab5b9dbd7a1','static/attachment/4bddb3ed38664d1ab63d0b84a5762636.jpg','static/attachment/_4bddb3ed38664d1ab63d0b84a5762636.jpg','5'),('3c0fe691fbe1414fb078d4f470f90e09','0823f29c137e49e1871ba5422ad6e291','static/attachment/431de3eb52e3452489f93c7eb385ea13.jpg','static/attachment/_431de3eb52e3452489f93c7eb385ea13.jpg','5'),('3e9e7f1e2ca14bd4a4841d6c2470b88b','ed85639fb0e247c7af5e1e8c1653bfaf','static/attachment/24a4e221dc4f4d71ab8f6ab511a071b5.jpg','static/attachment/_24a4e221dc4f4d71ab8f6ab511a071b5.jpg','5'),('3f79387d60d548a090f5fac970a26eda','cb8e8afb6fdd44e397a0f318c55a0c2a','static/attachment/d0b65f1cf28841e7a98c31178eb8c6a8.jpg','static/attachment/_d0b65f1cf28841e7a98c31178eb8c6a8.jpg','5'),('45ea2b81f54649c79ff292b05a9975cf','9a39e9af02be44038f854ab5b9dbd7a1','static/attachment/b4572f837dc44e28abde7ff1d7adb006.jpg','static/attachment/_b4572f837dc44e28abde7ff1d7adb006.jpg','5'),('46331b47556d4608a7089589bc04be62','152c289309aa45039c3f289022dc19c6','static/attachment/06944278dc9b4305a6508b24196cc9f6.jpg','static/attachment/_06944278dc9b4305a6508b24196cc9f6.jpg','5'),('532bb1f29bd24162a2bf90ff203484e5','0823f29c137e49e1871ba5422ad6e291','static/attachment/984ba142f620445e88d710100f3d4c75.jpg','static/attachment/_984ba142f620445e88d710100f3d4c75.jpg','5'),('552e771c54104b45a7ebe8e0966b2ce7','d5ac129750d04ba7b994e9d9f188e21d','static/attachment/5e684532aee2406da9f1d1b70adff2c3.jpg','static/attachment/_5e684532aee2406da9f1d1b70adff2c3.jpg','5'),('56c31a29893e49e2bc44900aa5eb52e0','ac0372225e814fe8bdb96c87af68f9fb','static/attachment/3f742c19ec1a4176817a100557fc4c99.jpg','static/attachment/_3f742c19ec1a4176817a100557fc4c99.jpg','5'),('580e2b6056b044c29a580383a98bc13e','ac0372225e814fe8bdb96c87af68f9fb','static/attachment/a56ca32895044a0db61c48ed6f5579e8.jpg','static/attachment/_a56ca32895044a0db61c48ed6f5579e8.jpg','5'),('597d00f5d3974c10b021b87269d6e79b','2b4f31e161364db29c7a7bf0ddf73e4d','static/attachment/932c013bab844bae84bec27773e6d962.jpg','static/attachment/_932c013bab844bae84bec27773e6d962.jpg','5'),('5b3785375752450285be85eb1d89dc62','a7600631221b4386bf75b80fb40f8c51','static/attachment/9b5321ff988d4de58f6ded5bd2d87b2e.jpg','static/attachment/_9b5321ff988d4de58f6ded5bd2d87b2e.jpg','5'),('672c70bfe950448594cb577bd0bb72c8','d5ac129750d04ba7b994e9d9f188e21d','static/attachment/952fd0bb27524a018f263b6ecf11a8d1.jpg','static/attachment/_952fd0bb27524a018f263b6ecf11a8d1.jpg','5'),('676f3607f7774a8496fe283853a34b23','9a39e9af02be44038f854ab5b9dbd7a1','static/attachment/f81236cf46224d44bad0ba5e6a40c4c1.jpg','static/attachment/_f81236cf46224d44bad0ba5e6a40c4c1.jpg','5'),('67fd5ca3e19d40da9ffac8e925e98b64','7ce75302843c4f3588ca89a620e960b0','static/attachment/cf0666d146bf46cdb8efe78c5bde4fa7.jpg','static/attachment/_cf0666d146bf46cdb8efe78c5bde4fa7.jpg','4'),('6c38a132b7164a3d82392df298acb8cb','9a39e9af02be44038f854ab5b9dbd7a1','static/attachment/842220792b574659bed39b3885334151.jpg','static/attachment/_842220792b574659bed39b3885334151.jpg','5'),('6c6d7860ae5943e4888f778e70473ef1','3dd093d1729e474190928db8b811f094','static/attachment/ad3916cda9a74d14a1c5df2a5ad09ecb.jpg','static/attachment/_ad3916cda9a74d14a1c5df2a5ad09ecb.jpg','5'),('6d11de49f0a04f83a4d0a9cbe4427764','5094ac5eca6f4f479d0e1dbbd3265771','static/attachment/d5e8664ef31040948ad98488b82a8502.jpg','static/attachment/_d5e8664ef31040948ad98488b82a8502.jpg','0'),('70c611a05b52481998d8f9ede47cf025','c293161e97234c44927b4d00419f7e75','static/attachment/c01bdc58c6a244c580faea8ea6c0371b.jpg','static/attachment/_c01bdc58c6a244c580faea8ea6c0371b.jpg','4'),('70c95d8ccc2e473485029153f8c63b1e','152c289309aa45039c3f289022dc19c6','static/attachment/7b331d273d1342f7a3e2efe4354eac03','static/attachment/_7b331d273d1342f7a3e2efe4354eac03','5'),('7168fc83725644e0a9ac9ee9659ea14d','a0ea82295180417db9bce9bfb66dcb47','static/attachment/1173ee3cbad84cf28af09e5ec6aeca35.jpg','static/attachment/_1173ee3cbad84cf28af09e5ec6aeca35.jpg','5'),('7830c8024ab344e7a8408d760bdd1669','bf9f7daa76284e28b145241e5a67e793','static/attachment/a3fb6af6206c4df7bb832415486d00ec.jpg','static/attachment/_a3fb6af6206c4df7bb832415486d00ec.jpg','4'),('78383a112fc646ed83c1c9b5ef456509','63527940f7a7467bab140f87ed061151','static/attachment/dcf69065debe4e01a80a4061c136b85e.jpg','static/attachment/_dcf69065debe4e01a80a4061c136b85e.jpg','5'),('7c8e7535f3d14acab5b9d94968133b7f','a07c6d9929674a029593ccf733fc36fb','static/attachment/37733f507d1841f98b8400856434c9e0.jpg','static/attachment/_37733f507d1841f98b8400856434c9e0.jpg','4'),('7edb31a1baba4e6e9a9d5ea7e7e8cad6','869af3fd94f1423aa048e4e89dade809','static/attachment/0cab1238331b46aab8b08f8871eb04d6.jpg','static/attachment/_0cab1238331b46aab8b08f8871eb04d6.jpg','5'),('7f66b97791f2468cb8ca9e3ffdd075cb','abd2e0b3c6d34bd0b0b29538790260bd','static/attachment/1436560da3c24bcd875cea3230ce840d.jpg','static/attachment/_1436560da3c24bcd875cea3230ce840d.jpg','3'),('81053519a9e34667889f7e064e55949b','52e242ed86454f6899d4df3e231ea4cf','static/attachment/d1de3ab7b8b248abb196d8a96ef13dd1.jpg','static/attachment/_d1de3ab7b8b248abb196d8a96ef13dd1.jpg','5'),('8273996af34e4f68b4ad523071965755','647ade502f6042fe8cd5776d166f40d6','static/attachment/077b65d0bb98472684754c508e1a46c1.jpg','static/attachment/_077b65d0bb98472684754c508e1a46c1.jpg','4'),('88ab6f0e2c754975aebc3ed534fdfa88','337ca56fa1994921a9b10295cc862197','static/attachment/033845c8c8894258b3ae5df31ef815f2.jpg','static/attachment/_033845c8c8894258b3ae5df31ef815f2.jpg','4'),('88c39e4c0927484c9c932307ab1efb2d','9a39e9af02be44038f854ab5b9dbd7a1','static/attachment/ec559d5b31e84d73b3231c242b7e2e21.jpg','static/attachment/_ec559d5b31e84d73b3231c242b7e2e21.jpg','5'),('88f06837f91a4378b5c8570d4af1fa4e','869af3fd94f1423aa048e4e89dade809','static/attachment/9680070802d9428c90bd09e69534ffcb.jpg','static/attachment/_9680070802d9428c90bd09e69534ffcb.jpg','5'),('8af725d478a24d4596299bf6aeb7b74c','f0a37d9a6e43482abf8a92f3995590c2','static/attachment/558041301f5d4c7696fda5a27ee2f229.jpg','static/attachment/_558041301f5d4c7696fda5a27ee2f229.jpg','5'),('8c5145835f774a4d82762d25d10cb5a5','4b66967d67c548c39faf0a5e6935950c','static/attachment/d25ed02f14d343b3a67b8edddff17e9b.jpg','static/attachment/_d25ed02f14d343b3a67b8edddff17e9b.jpg','4'),('8ce35022cf0641509e3da0cc3e2dfdfa','a889a6fecb39417da33e4f5783104e82','static/attachment/677ec68b669b4395b1567c6fa2ed6927.jpg','static/attachment/_677ec68b669b4395b1567c6fa2ed6927.jpg','5'),('9235d5d1f85c44f688328d8ce7a0fc92','9a39e9af02be44038f854ab5b9dbd7a1','static/attachment/5b321cf005764552b7fb975ae89c5ac5.jpg','static/attachment/_5b321cf005764552b7fb975ae89c5ac5.jpg','5'),('959042422f4e4801a0a4f5235f09405e','f0a37d9a6e43482abf8a92f3995590c2','static/attachment/9c2986d5526a4662bf90df890d52ddd3.jpg','static/attachment/_9c2986d5526a4662bf90df890d52ddd3.jpg','5'),('974121ef38ab40288b8361244d04345d','8c185b9f16b749ef8696304b0ce06fcb','static/attachment/884ca44bb1384b4dbbb3f23d2621ec2c.jpg','static/attachment/_884ca44bb1384b4dbbb3f23d2621ec2c.jpg','5'),('97d7a927f87c4bae8e00cee2ca50385b','f0a37d9a6e43482abf8a92f3995590c2','static/attachment/9a8a28adedf546b5a2d08afc678ccf0f','static/attachment/_9a8a28adedf546b5a2d08afc678ccf0f','5'),('9cdbcd1f8a954905a5022de7414f9146','a0ea82295180417db9bce9bfb66dcb47','static/attachment/cd5ab6dab3234e77ab4410ea60bfe6fc.jpg','static/attachment/_cd5ab6dab3234e77ab4410ea60bfe6fc.jpg','5'),('9da74126005e4475beca95bdd5a82d90','9a39e9af02be44038f854ab5b9dbd7a1','static/attachment/277b8d551b004977b13f17d6677b7c3c.jpg','static/attachment/_277b8d551b004977b13f17d6677b7c3c.jpg','5'),('a096527400814c11a5d26c425df85954','a889a6fecb39417da33e4f5783104e82','static/attachment/745e0ae7ed124cb5a55c90c210ffc8cf.jpg','static/attachment/_745e0ae7ed124cb5a55c90c210ffc8cf.jpg','5'),('a7d9788e65104cd3b1d41b224d3215c1','cb8e8afb6fdd44e397a0f318c55a0c2a','static/attachment/c61d553c5a6e435e9787cc4683e8068d.jpg','static/attachment/_c61d553c5a6e435e9787cc4683e8068d.jpg','5'),('a8ade95474db4ab68a1abc333aac3499','266bd881ec2b4911a85a41e98c81e90f','static/attachment/3cb4302c25d849c6a0130406eae0d989.jpg','static/attachment/_3cb4302c25d849c6a0130406eae0d989.jpg','5'),('a9aa9712fe2a4fd48d2fd6f3c2de5c9f','2b4f31e161364db29c7a7bf0ddf73e4d','static/attachment/59296bf3cb3f48e0b7a83f68c6bdb86e.jpg','static/attachment/_59296bf3cb3f48e0b7a83f68c6bdb86e.jpg','5'),('a9f14c10ae4743e69c0e2616c1d12e2b','152c289309aa45039c3f289022dc19c6','static/attachment/8bef6ad720b54ee58e1053f6c79fe38b.jpg','static/attachment/_8bef6ad720b54ee58e1053f6c79fe38b.jpg','5'),('aa0c6dcccb204fda97d652da4de2df75','9a39e9af02be44038f854ab5b9dbd7a1','static/attachment/51095b04d27040169a7a481e5ad7c886.jpg','static/attachment/_51095b04d27040169a7a481e5ad7c886.jpg','5'),('ab33f155891246a8b23b30941f0c4930','8fae8646a4d64c94ba23543390805bab','static/attachment/a71fd1c75982412cb14624235e5352d2.jpg','static/attachment/_a71fd1c75982412cb14624235e5352d2.jpg','5'),('b11fa8bde8544a61a81dd2485c4263ee','a7600631221b4386bf75b80fb40f8c51','static/attachment/e563968c050b4449a50e788cbe1bec24.jpg','static/attachment/_e563968c050b4449a50e788cbe1bec24.jpg','5'),('b3c44a00d38842e78f4bc2dd8902c1d6','743c77af564845c9a85006028dda4a5e','static/attachment/b0bfa7b81cc24c23b66222299e6c0b8e.jpg','static/attachment/_b0bfa7b81cc24c23b66222299e6c0b8e.jpg','4'),('b3efa010ed514f1a96cee2402d7ab55d','869af3fd94f1423aa048e4e89dade809','static/attachment/7acf86e1c90d40ba85e1f0459d840a84.jpg','static/attachment/_7acf86e1c90d40ba85e1f0459d840a84.jpg','5'),('b54a63b2f30e4d88945938684173eb07','9a39e9af02be44038f854ab5b9dbd7a1','static/attachment/84eb0bddd09d4e94a2c7c399033ddcd3.jpg','static/attachment/_84eb0bddd09d4e94a2c7c399033ddcd3.jpg','5'),('ba548021403f40b186445c90b9a42175','ed85639fb0e247c7af5e1e8c1653bfaf','static/attachment/0428ccfcb37f4ef5978773a6a2787caa.jpg','static/attachment/_0428ccfcb37f4ef5978773a6a2787caa.jpg','5'),('bc842ba858614b63afc0eb10f57aac81','266bd881ec2b4911a85a41e98c81e90f','static/attachment/aa7aa0e2e3414b14af66d0ab1e13b536.jpg','static/attachment/_aa7aa0e2e3414b14af66d0ab1e13b536.jpg','5'),('bd6c0d6dfe74411c890adb6f28d3e0ce','578212b008cb47fba2874ccb9e0b96d2','static/attachment/bcdf6ad60c594fbf9a47816d559edc8c.jpg','static/attachment/_bcdf6ad60c594fbf9a47816d559edc8c.jpg','5'),('be11df99893741c1952feb5a08aabe3f','63527940f7a7467bab140f87ed061151','static/attachment/8d99068a702c4823b5f978760c6f262c.jpg','static/attachment/_8d99068a702c4823b5f978760c6f262c.jpg','5'),('bec89f1121d04212933775f59cf7cf84','3dd093d1729e474190928db8b811f094','static/attachment/5d2e1ba5fdbe40ac8e5427bc949d8756.jpg','static/attachment/_5d2e1ba5fdbe40ac8e5427bc949d8756.jpg','5'),('bfbf2f65664f4f26bdf2b790f6a3ce26','52e242ed86454f6899d4df3e231ea4cf','static/attachment/d87672618746401d8af824f5e232ec2e.jpg','static/attachment/_d87672618746401d8af824f5e232ec2e.jpg','5'),('c4ac3c888389487884c5bc83d4e14f3c','aee848625e4c4053a459981268e12933','static/attachment/7164e96807bc40a1be1bc8c9968190e2.jpg','static/attachment/_7164e96807bc40a1be1bc8c9968190e2.jpg','5'),('c6393d25f0a4463883dea3034b81f994','0a125d479b664a5e98088dcb8b5ca354','static/attachment/efe8caa767024814bd2741332afbc970.jpg','static/attachment/_efe8caa767024814bd2741332afbc970.jpg','5'),('c7d52d14d22c4a3882cd6370c3363828','8fae8646a4d64c94ba23543390805bab','static/attachment/ffa0aca7b95a44cfad5806a8a07addbb.jpg','static/attachment/_ffa0aca7b95a44cfad5806a8a07addbb.jpg','5'),('c916ea194e074ee1ab5f4483a63b95a3','0823f29c137e49e1871ba5422ad6e291','static/attachment/8d95e8394aa148d3809b08cc3e47a828.jpg','static/attachment/_8d95e8394aa148d3809b08cc3e47a828.jpg','5'),('cf142e44580f4c47bc0c84137f0c73f4','aee848625e4c4053a459981268e12933','static/attachment/5713ae8f17164ff3845caec3e1c23d87.jpg','static/attachment/_5713ae8f17164ff3845caec3e1c23d87.jpg','5'),('d2fcff99ac044bd8bd1f63733affe4ea','f83f0abf13c64326b124f73ee5adccb1','static/attachment/39e969d506eb43acbc0bb21ae1788656.jpg','static/attachment/_39e969d506eb43acbc0bb21ae1788656.jpg','5'),('d326961a3f1c428db12c2233128dab3f','4edd616764c24138b9d8e17784c06ad9','static/attachment/d2419fde87e44732b01d461d0392ea33.jpg','static/attachment/_d2419fde87e44732b01d461d0392ea33.jpg','4'),('d341ddc314044afc9b09882b2f27f78d','9a39e9af02be44038f854ab5b9dbd7a1','static/attachment/02b02604f65d4dc6a2b0b592511ec19c.jpg','static/attachment/_02b02604f65d4dc6a2b0b592511ec19c.jpg','5'),('d67cbf792bff472792e9b21832654844','ac0372225e814fe8bdb96c87af68f9fb','static/attachment/d647f785814d40e39a9f688b33335c60.jpg','static/attachment/_d647f785814d40e39a9f688b33335c60.jpg','5'),('dbe52717c79048f1862a0ca06ada0c24','e3939a267b914b648eabfde2dd822654','static/attachment/042c0914b74c456a905fcbc7224dfc0a.jpg','static/attachment/_042c0914b74c456a905fcbc7224dfc0a.jpg','5'),('e0a39dd16ee24aaca86abf0c2e5d3958','44335b1982d44d35a88d0ba6d8ab0aad','static/attachment/4103e5d1e2224316bc8187849371ba06.jpg','static/attachment/_4103e5d1e2224316bc8187849371ba06.jpg','4'),('e3b82f70b6be48d8affefc9508164295','224b3e13ee78419fb83292b42a767757','static/attachment/2892c674cd87405e82d278b9300d66e7.jpg','static/attachment/_2892c674cd87405e82d278b9300d66e7.jpg','4'),('e59f10d6066d405d83a2cbf29303337d','63527940f7a7467bab140f87ed061151','static/attachment/e448f78a46ed420191f2dce0aea52df8.jpg','static/attachment/_e448f78a46ed420191f2dce0aea52df8.jpg','5'),('e82c1ef3715848a0b4563ed53a2fc402','aee848625e4c4053a459981268e12933','static/attachment/561e4bf5f1804fee819c3acbdcd320f8.jpg','static/attachment/_561e4bf5f1804fee819c3acbdcd320f8.jpg','5'),('e9a645eaaea345f8b2d298fda7dc40a3','578212b008cb47fba2874ccb9e0b96d2','static/attachment/4e174ef4cd4941599afc7c609ebe15ab.jpg','static/attachment/_4e174ef4cd4941599afc7c609ebe15ab.jpg','5'),('ed985aba097a43859459106c5a9e0f39','e3939a267b914b648eabfde2dd822654','static/attachment/6cd7d205427b4832b77d8191eaaace2b.jpg','static/attachment/_6cd7d205427b4832b77d8191eaaace2b.jpg','5'),('f1e88213b4794d809cb2d39347045d20','578212b008cb47fba2874ccb9e0b96d2','static/attachment/d2df4cecb75d4b7aaf80107987225b2a.jpg','static/attachment/_d2df4cecb75d4b7aaf80107987225b2a.jpg','5'),('f25daaf99ed04d029a63b12cc74257d4','b94d0c54dc5c47cf889d80ba87049908','static/attachment/e0001ed79553418bbf207a6a4226a5fc.jpg','static/attachment/_e0001ed79553418bbf207a6a4226a5fc.jpg','4'),('f53ab9ad667b4bd8810675153a6c805c','98d3477d81ed4018ac9709ac7ead3159','static/attachment/e3f812c284dc406fa11b408117a84dcd.jpg','static/attachment/_e3f812c284dc406fa11b408117a84dcd.jpg','3'),('fa73236cebd64527bdd861685e25d285','ed85639fb0e247c7af5e1e8c1653bfaf','static/attachment/61c58bb0651d4c0b84e3dd80ba6fabfb.jpg','static/attachment/_61c58bb0651d4c0b84e3dd80ba6fabfb.jpg','5'),('fda1b9ea027d4743a5d0659fd2e8179d','e3939a267b914b648eabfde2dd822654','static/attachment/51312baf1ec54f70a4083b4bdb8d462a.jpg','static/attachment/_51312baf1ec54f70a4083b4bdb8d462a.jpg','5'),('ff05576dc2924c5b8acd1dd4159d6667','51831aaba5e340f59489177b401c7288','static/attachment/754dd5314f3441b2a9041e9cfccebe8b.jpg','static/attachment/_754dd5314f3441b2a9041e9cfccebe8b.jpg','5');

/*Table structure for table `t_carousel` */

DROP TABLE IF EXISTS `t_carousel`;

CREATE TABLE `t_carousel` (
  `carousel_id` varchar(50) NOT NULL COMMENT '轮播图id',
  `title` varchar(20) DEFAULT NULL COMMENT '轮播图标题',
  `add_user_id` varchar(50) DEFAULT NULL COMMENT '添加人',
  `add_date` datetime DEFAULT NULL COMMENT '添加时间',
  `sort` int(11) DEFAULT NULL COMMENT '位置',
  PRIMARY KEY (`carousel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_carousel` */

insert  into `t_carousel`(`carousel_id`,`title`,`add_user_id`,`add_date`,`sort`) values ('2c8a3db572dc49a1a938a3360231b7ab','测试1','test','2016-12-04 14:20:29',0),('d7321e5a4b314eddbc35cd8e56d41f47','测试1','test','2016-12-04 14:19:40',0);

/*Table structure for table `t_collection` */

DROP TABLE IF EXISTS `t_collection`;

CREATE TABLE `t_collection` (
  `collection_id` varchar(50) NOT NULL COMMENT '收藏表',
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户id',
  `commodity_id` varchar(50) DEFAULT NULL COMMENT '商品id',
  PRIMARY KEY (`collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_collection` */

/*Table structure for table `t_comment` */

DROP TABLE IF EXISTS `t_comment`;

CREATE TABLE `t_comment` (
  `comment_id` varchar(50) NOT NULL COMMENT '留言表',
  `user_id` varchar(50) DEFAULT NULL COMMENT '添加人外键',
  `commodity_id` varchar(50) DEFAULT NULL COMMENT '商品外键',
  `crowdfunding_id` varchar(50) DEFAULT NULL COMMENT '众筹外键',
  `comment_text` text COMMENT '评论内容',
  `comment_date` datetime DEFAULT NULL COMMENT '添加时间',
  `comment_location` varchar(50) DEFAULT NULL COMMENT '定位',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_comment` */

/*Table structure for table `t_commodity` */

DROP TABLE IF EXISTS `t_commodity`;

CREATE TABLE `t_commodity` (
  `commodity_id` varchar(50) NOT NULL COMMENT '商品表',
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户id',
  `store_id` varchar(50) DEFAULT NULL COMMENT '商店id',
  `commodity_name` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `category` varchar(50) DEFAULT NULL COMMENT '分类',
  `price` double DEFAULT NULL COMMENT '价格',
  `amount` int(11) DEFAULT NULL COMMENT '数量',
  `location` text COMMENT '定位',
  `description` text COMMENT '描述',
  `prefer_num` int(11) DEFAULT NULL COMMENT '收藏人数',
  `launch_date` datetime DEFAULT NULL COMMENT '上架时间',
  `sales_volume` int(11) DEFAULT NULL COMMENT '销售量',
  `status` int(11) DEFAULT NULL COMMENT '销售状态：0.在售；1.交易中；2.已售出',
  PRIMARY KEY (`commodity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_commodity` */

/*Table structure for table `t_commodity_category` */

DROP TABLE IF EXISTS `t_commodity_category`;

CREATE TABLE `t_commodity_category` (
  `title` varchar(20) DEFAULT NULL COMMENT '分类名称',
  `commodity_category_id` varchar(50) NOT NULL COMMENT '分类id',
  `type` int(11) DEFAULT NULL COMMENT '1：二手分类；2：二手专题；',
  `attachment_id` varchar(50) DEFAULT NULL COMMENT '图片id',
  `add_user_id` varchar(50) DEFAULT NULL COMMENT '添加人',
  `add_date` datetime DEFAULT NULL COMMENT '添加时间',
  `sort` int(11) DEFAULT NULL COMMENT '位置',
  PRIMARY KEY (`commodity_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_commodity_category` */

insert  into `t_commodity_category`(`title`,`commodity_category_id`,`type`,`attachment_id`,`add_user_id`,`add_date`,`sort`) values ('电玩','0074ce34adbb4ea89990cea1e636ea33',1,'d62e2b0f777d4228ad6f4c2cf8075253','9240ee5e31014f019413fd780298ec2e','2016-11-28 14:30:36',1),('首饰','02cbfd8c937c458392e4a67eb6ec59a6',1,'6e1403f4142c47cab17f28efe76a9cc1','9240ee5e31014f019413fd780298ec2e','2016-11-28 14:29:56',1),('1','079da959359d4cec9edde44610b45ed4',2,'3a42cac7b3684ef2ad64170e510d5712','9240ee5e31014f019413fd780298ec2e','2016-11-29 13:45:22',1),('技能服务','12d48e4769054f1aabdff3272032a573',1,'3ff16a27469c42e1b2a256f44dd773db','9240ee5e31014f019413fd780298ec2e','2016-11-28 14:31:47',1),('鞋子','46aeceee941042d2b15d3170f597d56d',1,'72a43c9134634ad5b30fbf9d1fb27356','9240ee5e31014f019413fd780298ec2e','2016-11-28 14:33:05',1),('工具','50ede4d076b8406fb4eda238dddffcdb',1,'7bb593bf59db4ad7aea7f41be8b86c61','9240ee5e31014f019413fd780298ec2e','2016-11-28 14:32:05',1),('杂物','5bd36b9814e74a42a18ab70dd61470e4',1,'a9606878bc8f42bea36c1fe3dd31670b','9240ee5e31014f019413fd780298ec2e','2016-11-28 14:34:28',1),('电器','5f29ed59889b4ce69f5b32d0f4151ab2',1,'ea3587952ff64c219fa18ca2918bf5ed','9240ee5e31014f019413fd780298ec2e','2016-11-28 14:33:36',1),('门票','6d08206f1a6e4408ae9699ea089494ea',1,'9fbe9456026e49c4ad35236882756e39','9240ee5e31014f019413fd780298ec2e','2016-11-28 14:33:25',1),('1','8657921994b1424fb1b09bb4c602cc6d',1,'1b2f52272eee4541a56b10306c393146',NULL,'2016-11-30 13:04:04',1),('测试1','98d3477d81ed4018ac9709ac7ead3159',1,'f53ab9ad667b4bd8810675153a6c805c',NULL,'2016-12-04 14:24:50',2),('生活用品','a3578107e4c24611b48e30f21dfb3075',1,'1883dda7f0d24ff788fe1bbf59b6729a','9240ee5e31014f019413fd780298ec2e','2016-11-28 14:30:51',1),('电脑','a4331d5e53244bdc97080a51fca2ec3b',1,'bbaa93cc120a4735bda7f645eec1abef','9240ee5e31014f019413fd780298ec2e','2016-11-28 14:29:35',1),('测试1','abd2e0b3c6d34bd0b0b29538790260bd',1,'7f66b97791f2468cb8ca9e3ffdd075cb',NULL,'2016-12-04 14:24:28',2),('2','b2ff99a417ad49919a1975f16895eb34',2,'36145e9b98374af9b2b25816d4da5cce',NULL,'2016-11-30 13:04:11',2),('123','b93142a1c29c48d682938aef38a47693',2,'db61921e17774952bed72735cfcb6e6f','9240ee5e31014f019413fd780298ec2e','2016-11-29 17:18:32',123),('交通工具','cab77228c0c94e01a2ceac4f302dacd2',1,'1fdd3327fcad4280833d1cd9355b7505','9240ee5e31014f019413fd780298ec2e','2016-11-28 14:31:29',1),('文具','cc0fb830b26c438ebab7b1cc68364aae',1,'ac439e42c86e44ac9a93a927d522fda6','9240ee5e31014f019413fd780298ec2e','2016-11-28 14:31:19',1),('音乐','dddfd74c94a649bb987d63eaecbbb6fd',1,'22901fcbf0534ca9b5b39c5f037e4200',NULL,'2016-11-28 14:35:09',1),('手机','e00b6ceed0064690b22b80b7e0e6f329',1,'4efc236cd06943c0b09c1e03c721ff72',NULL,'2016-11-28 14:29:43',1),('宠物','e0f65f29e9b64aefb85ca923f623947f',1,'a901f49cd93b45d382a4e48df447e143',NULL,'2016-11-28 14:29:17',1),('房屋租赁','ea07cb953edb4d12bcde31e745f454da',1,'03eeb09b06b04f26bee190d83dbfaba3',NULL,'2016-11-28 14:30:14',1),('化妆品','f8763bdcb6644fc1b6ef9797c8d2fbbb',1,'fe5832a1a7cd45d8906f81e399ab9b07',NULL,'2016-11-28 14:31:05',1);

/*Table structure for table `t_crowdfunding` */

DROP TABLE IF EXISTS `t_crowdfunding`;

CREATE TABLE `t_crowdfunding` (
  `crowdfunding_id` varchar(50) NOT NULL COMMENT '众筹表',
  `crowdfunding_type` int(11) DEFAULT NULL COMMENT '类别(1.创意众筹 2.爱心众筹)',
  `images` text COMMENT '图片url',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `description` text COMMENT '描述',
  `origin` varchar(50) DEFAULT NULL COMMENT '来源',
  `target_amount` double DEFAULT NULL COMMENT '目标金额',
  `now_amount` double DEFAULT NULL COMMENT '已筹金额',
  `support_num` int(11) DEFAULT NULL COMMENT '支持人数',
  `add_user` varchar(50) DEFAULT NULL COMMENT '添加人',
  `add_date` datetime DEFAULT NULL COMMENT '添加时间',
  `has_dynamics` int(11) DEFAULT '0' COMMENT '是否有动态：2，没有；1有',
  `dynamics_id` varchar(50) DEFAULT NULL COMMENT '动态id',
  PRIMARY KEY (`crowdfunding_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_crowdfunding` */

insert  into `t_crowdfunding`(`crowdfunding_id`,`crowdfunding_type`,`images`,`title`,`description`,`origin`,`target_amount`,`now_amount`,`support_num`,`add_user`,`add_date`,`has_dynamics`,`dynamics_id`) values ('a08d4c14edc54af8a234ff93a3a8e537',1,NULL,'3','3','3',3,3,3,'admin','2017-03-22 12:36:53',2,''),('e353bae5264142bfb49a6eb79b90f3fa',1,NULL,'2','2','2',2,22,2,'admin','2017-03-22 12:23:59',2,''),('e8fc109f3f844fdea06c01f2afa3b967',2,NULL,'爱心众筹','爱心众筹','爱心众筹',1111321,4564654,12313,'admin','2017-03-22 13:40:51',1,'ed85639fb0e247c7af5e1e8c1653bfaf');

/*Table structure for table `t_donation` */

DROP TABLE IF EXISTS `t_donation`;

CREATE TABLE `t_donation` (
  `donation_id` varchar(50) NOT NULL COMMENT '捐赠物品Id',
  `user_id` varchar(50) DEFAULT NULL COMMENT '捐赠者的用户Id',
  `donation_name` varchar(100) DEFAULT NULL COMMENT '捐赠物品名称',
  `category` varchar(50) DEFAULT NULL COMMENT '分类',
  `amount` int(11) DEFAULT NULL COMMENT '数量',
  `location` varchar(200) DEFAULT NULL COMMENT '定位',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `donation_date` datetime DEFAULT NULL COMMENT '发布该捐赠的日期',
  `status` int(11) DEFAULT NULL COMMENT '状态：0.未收取；1.已收取；；2.已送出；3.已下架',
  `phone` varchar(50) DEFAULT NULL COMMENT '捐赠者联系电话',
  PRIMARY KEY (`donation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_donation` */

insert  into `t_donation`(`donation_id`,`user_id`,`donation_name`,`category`,`amount`,`location`,`description`,`donation_date`,`status`,`phone`) values ('2279f9ed60974273a9f5bb4a97b1a62f','bbbf4ce3e08e4255822e8ae372196642','3','2',2,'2','2','2017-03-18 00:00:00',0,'2'),('fb874fddf6304aaabce7070645050b8e','d37d07c01a72463bbae52822a569881e','1','1',1,'1','1','2016-11-30 17:13:09',1,'1');

/*Table structure for table `t_dynamics` */

DROP TABLE IF EXISTS `t_dynamics`;

CREATE TABLE `t_dynamics` (
  `dynamics_id` varchar(50) NOT NULL COMMENT '动态表',
  `type` int(11) DEFAULT NULL COMMENT '类别(1.校园动态 2.捐赠动态 3.众筹动态)',
  `images` text COMMENT '图片url',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `text` text COMMENT '正文',
  `pure_text` text COMMENT '纯文本',
  `origin` varchar(50) DEFAULT NULL COMMENT '来源',
  `add_user` varchar(50) DEFAULT NULL COMMENT '添加人',
  `add_date` datetime DEFAULT NULL COMMENT '添加时间',
  `sort` int(11) DEFAULT NULL COMMENT '用于排序',
  PRIMARY KEY (`dynamics_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_dynamics` */

insert  into `t_dynamics`(`dynamics_id`,`type`,`images`,`title`,`text`,`pure_text`,`origin`,`add_user`,`add_date`,`sort`) values ('266bd881ec2b4911a85a41e98c81e90f',2,NULL,'北京的初雪','<h1 class=\"h_title\" style=\"font-size: 18px; margin: 0px; padding: 40px 0px 0px 9px; text-align: center; width: 680px; color: rgb(51, 51, 51); font-family: 微软雅黑, Arial; white-space: normal; background-color: rgb(247, 247, 247);\">北京的初雪</h1><p><br/></p>','北京的初雪','北京的初雪','admin','2017-03-21 15:22:01',NULL),('39568a6190d54586bedfac44582a7873',1,NULL,'22','<p>22</p>','22','22','admin','2017-03-21 17:55:44',NULL),('3dd093d1729e474190928db8b811f094',3,NULL,'北京的初雪','<p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; font-size: 14px; padding: 0px; letter-spacing: 1px; word-wrap: break-word; color: rgb(51, 51, 51); font-family: 微软雅黑, Arial; background-color: rgb(247, 247, 247);\">初雪，急匆匆地驾着西风赶来，轻轻落入大地怀抱。秋色慢慢褪去，冬的号角在田野上奏响，雪花行色匆匆，漫天飞舞，弥漫天空，有些急不可耐，在将谢幕的秋景里，尽情飘洒。收获过的原野，在酣畅的西风里，轻哼一首快乐的歌，欢迎这初雪的将临。肥沃田地早已露出厚实的胸膛，迎接等待一年的恋人，雪花轻舞着美丽的舞蹈，像无数小小的天鹅，静静地拥入大地的怀抱，纯净洁白雪花，深情感天动地，大地感动的泪流满面，天空感动的喜泪点点，树林感动的拱手致敬。人们闻听初雪而至，快步跑出大门，在雪里尽情跳舞歌唱，喜迎这久违的美丽w天使。</p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; font-size: 14px; padding: 0px; letter-spacing: 1px; word-wrap: break-word; color: rgb(51, 51, 51); font-family: 微软雅黑, Arial; background-color: rgb(247, 247, 247);\">　　小城，静静等候，这冬的使者，像似在等远方恋人。雪花在小城的街上，楼上，人工湖里，随风飘舞。把个小城打扮的洁白晶莹，纯洁美丽。小城美美的陶醉了，任雪花抚摸自己的全身，轻吻自己的脸。雪花轻盈在街道上洒下一层厚厚的情，在公园的松树上留下许多美丽的倩影，在小湖边轻闻恋人们的嬉笑，在游嬉广场见证了恋人们双双足迹。小城拥着初雪在夕阳的余辉里，红妆素裹，像恋人似的情深意切，静静相守，白头到老。</p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; font-size: 14px; padding: 0px; letter-spacing: 1px; word-wrap: break-word; color: rgb(51, 51, 51); font-family: 微软雅黑, Arial; background-color: rgb(247, 247, 247);\">　　雪花默默地落满我的窗台，像似在等待什么。也许它们知道，我已经等它们一年了，就像等我离去多年的恋人。初雪飘飘，如鹅毛朵朵，煞是好看！它，曾经无数次在我梦中，演绎那段刻骨铭心的爱情。洁白茫茫的雪野，古朴的小屋，清晰的两行脚印，飘扬的红色围巾，在我记忆天空里，如云朵般美丽，每次，思念在雪花飞舞里，会疯长成一棵参天大树，然而，失望却在一次次的等待中，如石子落满心田。注定海枯石烂的誓言，总会被时间风化成尘埃。唯有初雪会如期赶来，一次一次的安慰我受伤的心。雪花飘飘，窈窕多姿，犹如那温柔的恋人，在我周围絮语轻轻，温情脉脉，感化心中郁闷哀伤，留下一个清纯静美的世界。</p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; font-size: 14px; padding: 0px; letter-spacing: 1px; word-wrap: break-word; color: rgb(51, 51, 51); font-family: 微软雅黑, Arial; background-color: rgb(247, 247, 247);\">　　每次分别，我都恋恋不舍，一个人静静地站雪地里，看着雪儿悄悄的融化。自己常常是泪水涟涟，我知道初雪来这个世界很短暂。然而，这清纯的雪花，在心里已经割舍不了，像爱恋深深的情人，永远住在我心里。雪儿是有情的，你看落在我掌心的雪花，留下清泪粒粒，这不是它对我的爱恋吗？</p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; font-size: 14px; padding: 0px; letter-spacing: 1px; word-wrap: break-word; color: rgb(51, 51, 51); font-family: 微软雅黑, Arial; background-color: rgb(247, 247, 247);\">　　我要感谢初雪，柔情似花，温馨着我的爱情，我要感谢初雪，柔情似火，温暖着我的世界，我要感谢初雪，柔情似水，滋润着我的心田。</p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; font-size: 14px; padding: 0px; letter-spacing: 1px; word-wrap: break-word; color: rgb(51, 51, 51); font-family: 微软雅黑, Arial; background-color: rgb(247, 247, 247);\">　　初雪轻轻地走了。给大地带来深深的情，给小城带来浓浓的爱，给我带来苦苦的恋。</p>','初雪，急匆匆地驾着西风赶来，轻轻落入大地怀抱。秋色慢慢褪去，冬的号角在田野上奏响，雪花行色匆匆，漫天飞舞，弥漫天空，有些急不可耐，在将谢幕的秋景里，尽情飘洒。收获过的原野，在酣畅的西风里，轻哼一首快乐的歌，欢迎这初雪的将临。肥沃田地早已露出厚实的胸膛，迎接等待一年的恋人，雪花轻舞着美丽的舞蹈，像无数小小的天鹅，静静地拥入大地的怀抱，纯净洁白雪花，深情感天动地，大地感动的泪流满面，天空感动的喜泪点点，树林感动的拱手致敬。人们闻听初雪而至，快步跑出大门，在雪里尽情跳舞歌唱，喜迎这久违的美丽w天使。　　小城，静静等候，这冬的使者，像似在等远方恋人。雪花在小城的街上，楼上，人工湖里，随风飘舞。把个小城打扮的洁白晶莹，纯洁美丽。小城美美的陶醉了，任雪花抚摸自己的全身，轻吻自己的脸。雪花轻盈在街道上洒下一层厚厚的情，在公园的松树上留下许多美丽的倩影，在小湖边轻闻恋人们的嬉笑，在游嬉广场见证了恋人们双双足迹。小城拥着初雪在夕阳的余辉里，红妆素裹，像恋人似的情深意切，静静相守，白头到老。　　雪花默默地落满我的窗台，像似在等待什么。也许它们知道，我已经等它们一年了，就像等我离去多年的恋人。初雪飘飘，如鹅毛朵朵，煞是好看！它，曾经无数次在我梦中，演绎那段刻骨铭心的爱情。洁白茫茫的雪野，古朴的小屋，清晰的两行脚印，飘扬的红色围巾，在我记忆天空里，如云朵般美丽，每次，思念在雪花飞舞里，会疯长成一棵参天大树，然而，失望却在一次次的等待中，如石子落满心田。注定海枯石烂的誓言，总会被时间风化成尘埃。唯有初雪会如期赶来，一次一次的安慰我受伤的心。雪花飘飘，窈窕多姿，犹如那温柔的恋人，在我周围絮语轻轻，温情脉脉，感化心中郁闷哀伤，留下一个清纯静美的世界。　　每次分别，我都恋恋不舍，一个人静静地站雪地里，看着雪儿悄悄的融化。自己常常是泪水涟涟，我知道初雪来这个世界很短暂。然而，这清纯的雪花，在心里已经割舍不了，像爱恋深深的情人，永远住在我心里。雪儿是有情的，你看落在我掌心的雪花，留下清泪粒粒，这不是它对我的爱恋吗？　　我要感谢初雪，柔情似花，温馨着我的爱情，我要感谢初雪，柔情似火，温暖着我的世界，我要感谢初雪，柔情似水，滋润着我的心田。　　初雪轻轻地走了。给大地带来深深的情，给小城带来浓浓的爱，给我带来苦苦的恋。','lw','admin','2017-03-21 17:52:20',NULL),('52e242ed86454f6899d4df3e231ea4cf',3,NULL,'1','<p>1</p>','1','1','admin','2017-03-21 16:49:28',NULL),('63527940f7a7467bab140f87ed061151',3,NULL,'众筹动态','<p>众筹动态</p>','众筹动态','众筹动态','admin','2017-03-21 21:43:53',NULL),('9a39e9af02be44038f854ab5b9dbd7a1',3,NULL,'123','<p>123</p>','123','123','admin','2017-03-21 22:04:13',NULL),('a7600631221b4386bf75b80fb40f8c51',2,NULL,'众筹动态','<p>啊发士大夫asfsda</p>','啊发士大夫asfsda','阿斯弗','admin',NULL,NULL),('aee848625e4c4053a459981268e12933',3,NULL,'4','<p>4</p>','4','4','admin','2017-03-21 22:18:58',NULL),('ba3ee29aaaea4316ac26501ee1fd7a4b',1,NULL,'北京的初雪','<p style=\"font-size: 14px; margin-top: 0px; margin-bottom: 0px; padding: 0px; letter-spacing: 1px; word-wrap: break-word;\">初雪，急匆匆地驾着西风赶来，轻轻落入大地怀抱。秋色慢慢褪去，冬的号角在田野上奏响，雪花行色匆匆，漫天飞舞，弥漫天空，有些急不可耐，在将谢幕的秋景里，尽情飘洒。收获过的原野，在酣畅的西风里，轻哼一首快乐的歌，欢迎这初雪的将临。肥沃田地早已露出厚实的胸膛，迎接等待一年的恋人，雪花轻舞着美丽的舞蹈，像无数小小的天鹅，静静地拥入大地的怀抱，纯净洁白雪花，深情感天动地，大地感动的泪流满面，天空感动的喜泪点点，树林感动的拱手致敬。人们闻听初雪而至，快步跑出大门，在雪里尽情跳舞歌唱，喜迎这久违的美丽天使。</p><p style=\"font-size: 14px; margin-top: 0px; margin-bottom: 0px; padding: 0px; letter-spacing: 1px; word-wrap: break-word;\">　　小城，静静等候，这冬的使者，像似在等远方恋人。雪花在小城的街上，楼上，人工湖里，随风飘舞。把个小城打扮的洁白晶莹，纯洁美丽。小城美美的陶醉了，任雪花抚摸自己的全身，轻吻自己的脸。雪花轻盈在街道上洒下一层厚厚的情，在公园的松树上留下许多美丽的倩影，在小湖边轻闻恋人们的嬉笑，在游嬉广场见证了恋人们双双足迹。小城拥着初雪在夕阳的余辉里，红妆素裹，像恋人似的情深意切，静静相守，白头到老。</p><p style=\"font-size: 14px; margin-top: 0px; margin-bottom: 0px; padding: 0px; letter-spacing: 1px; word-wrap: break-word;\">　　雪花默默地落满我的窗台，像似在等待什么。也许它们知道，我已经等它们一年了，就像等我离去多年的恋人。初雪飘飘，如鹅毛朵朵，煞是好看！它，曾经无数次在我梦中，演绎那段刻骨铭心的爱情。洁白茫茫的雪野，古朴的小屋，清晰的两行脚印，飘扬的红色围巾，在我记忆天空里，如云朵般美丽，每次，思念在雪花飞舞里，会疯长成一棵参天大树，然而，失望却在一次次的等待中，如石子落满心田。注定海枯石烂的誓言，总会被时间风化成尘埃。唯有初雪会如期赶来，一次一次的安慰我受伤的心。雪花飘飘，窈窕多姿，犹如那温柔的恋人，在我周围絮语轻轻，温情脉脉，感化心中郁闷哀伤，留下一个清纯静美的世界。</p><p style=\"font-size: 14px; margin-top: 0px; margin-bottom: 0px; padding: 0px; letter-spacing: 1px; word-wrap: break-word;\">　　每次分别，我都恋恋不舍，一个人静静地站雪地里，看着雪儿悄悄的融化。自己常常是泪水涟涟，我知道初雪来这个世界很短暂。然而，这清纯的雪花，在心里已经割舍不了，像爱恋深深的情人，永远住在我心里。雪儿是有情的，你看落在我掌心的雪花，留下清泪粒粒，这不是它对我的爱恋吗？</p><p style=\"font-size: 14px; margin-top: 0px; margin-bottom: 0px; padding: 0px; letter-spacing: 1px; word-wrap: break-word;\">　　我要感谢初雪，柔情似花，温馨着我的爱情，我要感谢初雪，柔情似火，温暖着我的世界，我要感谢初雪，柔情似水，滋润着我的心田。</p><p style=\"font-size: 14px; margin-top: 0px; margin-bottom: 0px; padding: 0px; letter-spacing: 1px; word-wrap: break-word;\">　　初雪轻轻地走了。给大地带来深深的情，给小城带来浓浓的爱，给我带来苦苦的恋。</p><p><br/></p><p><br/></p>','初雪，急匆匆地驾着西风赶来，轻轻落入大地怀抱。秋色慢慢褪去，冬的号角在田野上奏响，雪花行色匆匆，漫天飞舞，弥漫天空，有些急不可耐，在将谢幕的秋景里，尽情飘洒。收获过的原野，在酣畅的西风里，轻哼一首快乐的歌，欢迎这初雪的将临。肥沃田地早已露出厚实的胸膛，迎接等待一年的恋人，雪花轻舞着美丽的舞蹈，像无数小小的天鹅，静静地拥入大地的怀抱，纯净洁白雪花，深情感天动地，大地感动的泪流满面，天空感动的喜泪点点，树林感动的拱手致敬。人们闻听初雪而至，快步跑出大门，在雪里尽情跳舞歌唱，喜迎这久违的美丽天使。　　小城，静静等候，这冬的使者，像似在等远方恋人。雪花在小城的街上，楼上，人工湖里，随风飘舞。把个小城打扮的洁白晶莹，纯洁美丽。小城美美的陶醉了，任雪花抚摸自己的全身，轻吻自己的脸。雪花轻盈在街道上洒下一层厚厚的情，在公园的松树上留下许多美丽的倩影，在小湖边轻闻恋人们的嬉笑，在游嬉广场见证了恋人们双双足迹。小城拥着初雪在夕阳的余辉里，红妆素裹，像恋人似的情深意切，静静相守，白头到老。　　雪花默默地落满我的窗台，像似在等待什么。也许它们知道，我已经等它们一年了，就像等我离去多年的恋人。初雪飘飘，如鹅毛朵朵，煞是好看！它，曾经无数次在我梦中，演绎那段刻骨铭心的爱情。洁白茫茫的雪野，古朴的小屋，清晰的两行脚印，飘扬的红色围巾，在我记忆天空里，如云朵般美丽，每次，思念在雪花飞舞里，会疯长成一棵参天大树，然而，失望却在一次次的等待中，如石子落满心田。注定海枯石烂的誓言，总会被时间风化成尘埃。唯有初雪会如期赶来，一次一次的安慰我受伤的心。雪花飘飘，窈窕多姿，犹如那温柔的恋人，在我周围絮语轻轻，温情脉脉，感化心中郁闷哀伤，留下一个清纯静美的世界。　　每次分别，我都恋恋不舍，一个人静静地站雪地里，看着雪儿悄悄的融化。自己常常是泪水涟涟，我知道初雪来这个世界很短暂。然而，这清纯的雪花，在心里已经割舍不了，像爱恋深深的情人，永远住在我心里。雪儿是有情的，你看落在我掌心的雪花，留下清泪粒粒，这不是它对我的爱恋吗？　　我要感谢初雪，柔情似花，温馨着我的爱情，我要感谢初雪，柔情似火，温暖着我的世界，我要感谢初雪，柔情似水，滋润着我的心田。　　初雪轻轻地走了。给大地带来深深的情，给小城带来浓浓的爱，给我带来苦苦的恋。','北京 中考满分作文 900字作文','admin','2017-03-21 15:30:24',NULL),('d5ac129750d04ba7b994e9d9f188e21d',2,NULL,'3','<ol style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p class=\"sample-source\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 22px;\"><span class=\"\">They&nbsp;</span><span class=\"\">presented&nbsp;</span>their&nbsp;draft&nbsp;to&nbsp;the&nbsp;president,&nbsp;who&nbsp;looked&nbsp;it&nbsp;<span class=\"high-light\" style=\"color: rgb(245, 117, 39);\">over</span>,&nbsp;nodded&nbsp;and&nbsp;signed&nbsp;<span class=\"\">it</span>&nbsp;<a class=\"operate-btn op-sound\" style=\"color: rgb(102, 102, 102); display: inline-block; margin-right: 18px; width: 28px; height: 22px; bottom: 13px; background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACYAAAAiCAYAAAAzrKu4AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDY3IDc5LjE1Nzc0NywgMjAxNS8wMy8zMC0yMzo0MDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NEY0RDZEN0NENDdGMTFFNkFDNTNDODhBMDQ3QjQxNjkiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NEY0RDZEN0RENDdGMTFFNkFDNTNDODhBMDQ3QjQxNjkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0RjRENkQ3QUQ0N0YxMUU2QUM1M0M4OEEwNDdCNDE2OSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0RjRENkQ3QkQ0N0YxMUU2QUM1M0M4OEEwNDdCNDE2OSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PtzEV+UAAAI0SURBVFjDzZhLKERRGMfHIyXMCIVYTBGllIVHKQvZ2GBlPdnchWKrxJ6sLGVjyQJJGK+8I8xyNiaUVwlFRt6u79T/6BTnzr137j1m8duc73xnfvfOd84953g0TfM4QDoxSZwQDbxd13XbOCGVR+wQOjiKJWZm3HilSiDChE4FuX8VqyWuIRIiCmyIbRHrhNcpsRYiCol5IhPtVsUO0T9IpMQr1kl8YMBRIlWIWRUrJs6R02tXLJkYwCBfRP8ffezUWD0e9IWosCpWSezhR1+JgKSf3eIfEv7SH7Fy4lgY1IgzotHgAeyKseK/RW4dF1swIfRODAtFblrMQqn0IHeci72hIcuBxVYmtkaECb9Bbi7q7Jm9wV+DuSQWRHsEArL8WfRrUSWWIUyeqRhLEeszqEqMUUQ8Ii6bQNWIr6kU82DtY/EJSb4P8XPVYn7ErwzGYMX/pFosRfhyyMa4Z31UixUifmswBlsyoqrF2hFfkeR7+RdGtdgi4l2S/CrEt1WKNSPGaihbkt+BPiOqxPKJS8S6DfLH0CegSiyEdvZXJkly04g74pNNEj4LdIPX64TYPj5JPoPcVuRu8N3Fksm92GqM3UG82x7uoXGxUgsbRfaqm1wQq0HeDQ7PprfWOcSMS1trVnObyOuzcxhJcukwwpeIC2yPEuL4VkY8IKfNiQNvq3DgnYvjwBsWHtCVK4IDm1cE7CS+jDXMtUuVk0S5VBGvoXYFqUiiiPGLu2lcRTlycfcNhrcJLBkhs9QAAAAASUVORK5CYII=&quot;); background-size: 19px 17px; background-repeat: no-repeat; background-position: 7px 1px; border: 0px none; padding: 0px; vertical-align: middle;\"></a></p><p class=\"sample-target\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 22px;\"><span class=\"\">他们</span>把草案<span class=\"\">提交</span>给了总统，总统翻了一遍，点了点头，然后<span class=\"\">就</span>签了字。</p><p class=\"sample-resource\" style=\"margin-top: 2px; margin-bottom: 0px; padding: 0px;\"><span style=\"color: rgb(204, 204, 204); font-stretch: normal; font-size: 12px; line-height: normal; font-family: arial;\">《柯林斯高阶英汉双解学习词典》</span></p></li><li><p>2</p><p class=\"sample-source\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 22px;\">He&nbsp;<span class=\"\">could&nbsp;</span>have&nbsp;looked&nbsp;<span class=\"high-light\" style=\"color: rgb(245, 117, 39);\">over&nbsp;</span>the&nbsp;papers&nbsp;in&nbsp;less&nbsp;than&nbsp;<span class=\"\">ten&nbsp;</span>minutes.&nbsp;<a class=\"operate-btn op-sound\" style=\"color: rgb(102, 102, 102); display: inline-block; margin-right: 18px; width: 28px; height: 22px; bottom: 13px; background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACYAAAAiCAYAAAAzrKu4AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDY3IDc5LjE1Nzc0NywgMjAxNS8wMy8zMC0yMzo0MDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NEY0RDZEN0NENDdGMTFFNkFDNTNDODhBMDQ3QjQxNjkiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NEY0RDZEN0RENDdGMTFFNkFDNTNDODhBMDQ3QjQxNjkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0RjRENkQ3QUQ0N0YxMUU2QUM1M0M4OEEwNDdCNDE2OSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0RjRENkQ3QkQ0N0YxMUU2QUM1M0M4OEEwNDdCNDE2OSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PtzEV+UAAAI0SURBVFjDzZhLKERRGMfHIyXMCIVYTBGllIVHKQvZ2GBlPdnchWKrxJ6sLGVjyQJJGK+8I8xyNiaUVwlFRt6u79T/6BTnzr137j1m8duc73xnfvfOd84953g0TfM4QDoxSZwQDbxd13XbOCGVR+wQOjiKJWZm3HilSiDChE4FuX8VqyWuIRIiCmyIbRHrhNcpsRYiCol5IhPtVsUO0T9IpMQr1kl8YMBRIlWIWRUrJs6R02tXLJkYwCBfRP8ffezUWD0e9IWosCpWSezhR1+JgKSf3eIfEv7SH7Fy4lgY1IgzotHgAeyKseK/RW4dF1swIfRODAtFblrMQqn0IHeci72hIcuBxVYmtkaECb9Bbi7q7Jm9wV+DuSQWRHsEArL8WfRrUSWWIUyeqRhLEeszqEqMUUQ8Ii6bQNWIr6kU82DtY/EJSb4P8XPVYn7ErwzGYMX/pFosRfhyyMa4Z31UixUifmswBlsyoqrF2hFfkeR7+RdGtdgi4l2S/CrEt1WKNSPGaihbkt+BPiOqxPKJS8S6DfLH0CegSiyEdvZXJkly04g74pNNEj4LdIPX64TYPj5JPoPcVuRu8N3Fksm92GqM3UG82x7uoXGxUgsbRfaqm1wQq0HeDQ7PprfWOcSMS1trVnObyOuzcxhJcukwwpeIC2yPEuL4VkY8IKfNiQNvq3DgnYvjwBsWHtCVK4IDm1cE7CS+jDXMtUuVk0S5VBGvoXYFqUiiiPGLu2lcRTlycfcNhrcJLBkhs9QAAAAASUVORK5CYII=&quot;); background-size: 19px 17px; background-repeat: no-repeat; background-position: 7px 1px; border: 0px none; padding: 0px; vertical-align: middle;\"></a></p><p class=\"sample-target\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 22px;\">他本<span class=\"\">可</span>在<span class=\"\">10</span>分钟内把文件翻看一遍的。</p><p class=\"sample-resource\" style=\"margin-top: 2px; margin-bottom: 0px; padding: 0px;\"><span style=\"color: rgb(204, 204, 204); font-stretch: normal; font-size: 12px; line-height: normal; font-family: arial;\">《柯林斯高阶英汉双解学习词典》</span></p></li><li><p>3</p><p class=\"sample-source\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 22px;\">When&nbsp;I&nbsp;<span class=\"high-light\" style=\"color: rgb(245, 117, 39);\">look&nbsp;</span><span class=\"high-light\" style=\"color: rgb(245, 117, 39);\">over&nbsp;</span>and&nbsp;<span class=\"\">see&nbsp;</span>Terry&nbsp;I&nbsp;tingle&nbsp;all&nbsp;over.&nbsp;<a class=\"operate-btn op-sound\" style=\"color: rgb(102, 102, 102); display: inline-block; margin-right: 18px; width: 28px; height: 22px; bottom: 13px; background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACYAAAAiCAYAAAAzrKu4AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDY3IDc5LjE1Nzc0NywgMjAxNS8wMy8zMC0yMzo0MDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NEY0RDZEN0NENDdGMTFFNkFDNTNDODhBMDQ3QjQxNjkiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NEY0RDZEN0RENDdGMTFFNkFDNTNDODhBMDQ3QjQxNjkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0RjRENkQ3QUQ0N0YxMUU2QUM1M0M4OEEwNDdCNDE2OSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0RjRENkQ3QkQ0N0YxMUU2QUM1M0M4OEEwNDdCNDE2OSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PtzEV+UAAAI0SURBVFjDzZhLKERRGMfHIyXMCIVYTBGllIVHKQvZ2GBlPdnchWKrxJ6sLGVjyQJJGK+8I8xyNiaUVwlFRt6u79T/6BTnzr137j1m8duc73xnfvfOd84953g0TfM4QDoxSZwQDbxd13XbOCGVR+wQOjiKJWZm3HilSiDChE4FuX8VqyWuIRIiCmyIbRHrhNcpsRYiCol5IhPtVsUO0T9IpMQr1kl8YMBRIlWIWRUrJs6R02tXLJkYwCBfRP8ffezUWD0e9IWosCpWSezhR1+JgKSf3eIfEv7SH7Fy4lgY1IgzotHgAeyKseK/RW4dF1swIfRODAtFblrMQqn0IHeci72hIcuBxVYmtkaECb9Bbi7q7Jm9wV+DuSQWRHsEArL8WfRrUSWWIUyeqRhLEeszqEqMUUQ8Ii6bQNWIr6kU82DtY/EJSb4P8XPVYn7ErwzGYMX/pFosRfhyyMa4Z31UixUifmswBlsyoqrF2hFfkeR7+RdGtdgi4l2S/CrEt1WKNSPGaihbkt+BPiOqxPKJS8S6DfLH0CegSiyEdvZXJkly04g74pNNEj4LdIPX64TYPj5JPoPcVuRu8N3Fksm92GqM3UG82x7uoXGxUgsbRfaqm1wQq0HeDQ7PprfWOcSMS1trVnObyOuzcxhJcukwwpeIC2yPEuL4VkY8IKfNiQNvq3DgnYvjwBsWHtCVK4IDm1cE7CS+jDXMtUuVk0S5VBGvoXYFqUiiiPGLu2lcRTlycfcNhrcJLBkhs9QAAAAASUVORK5CYII=&quot;); background-size: 19px 17px; background-repeat: no-repeat; background-position: 7px 1px; border: 0px none; padding: 0px; vertical-align: middle;\"></a></p><p class=\"sample-target\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 22px;\">当我<span class=\"\">放眼</span><span class=\"\">望</span><span class=\"\">去</span><span class=\"\">见到</span>特里时，我整个人兴奋不已。</p><p class=\"sample-resource\" style=\"margin-top: 2px; margin-bottom: 0px; padding: 0px;\"><span style=\"color: rgb(204, 204, 204); font-stretch: normal; font-size: 12px; line-height: normal; font-family: arial;\">《柯林斯高阶英汉双解学习词典》</span></p></li><li><p>4</p><p class=\"sample-source\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 22px;\">Here&#39;s&nbsp;the&nbsp;essay&nbsp;<span class=\"\">for&nbsp;</span>you&nbsp;to&nbsp;<span class=\"high-light\" style=\"color: rgb(245, 117, 39);\">look&nbsp;</span><span class=\"high-light\" style=\"color: rgb(245, 117, 39);\">over</span>.&nbsp;<a class=\"operate-btn op-sound\" style=\"color: rgb(102, 102, 102); display: inline-block; margin-right: 18px; width: 28px; height: 22px; bottom: 13px; background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACYAAAAiCAYAAAAzrKu4AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDY3IDc5LjE1Nzc0NywgMjAxNS8wMy8zMC0yMzo0MDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NEY0RDZEN0NENDdGMTFFNkFDNTNDODhBMDQ3QjQxNjkiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NEY0RDZEN0RENDdGMTFFNkFDNTNDODhBMDQ3QjQxNjkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0RjRENkQ3QUQ0N0YxMUU2QUM1M0M4OEEwNDdCNDE2OSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0RjRENkQ3QkQ0N0YxMUU2QUM1M0M4OEEwNDdCNDE2OSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PtzEV+UAAAI0SURBVFjDzZhLKERRGMfHIyXMCIVYTBGllIVHKQvZ2GBlPdnchWKrxJ6sLGVjyQJJGK+8I8xyNiaUVwlFRt6u79T/6BTnzr137j1m8duc73xnfvfOd84953g0TfM4QDoxSZwQDbxd13XbOCGVR+wQOjiKJWZm3HilSiDChE4FuX8VqyWuIRIiCmyIbRHrhNcpsRYiCol5IhPtVsUO0T9IpMQr1kl8YMBRIlWIWRUrJs6R02tXLJkYwCBfRP8ffezUWD0e9IWosCpWSezhR1+JgKSf3eIfEv7SH7Fy4lgY1IgzotHgAeyKseK/RW4dF1swIfRODAtFblrMQqn0IHeci72hIcuBxVYmtkaECb9Bbi7q7Jm9wV+DuSQWRHsEArL8WfRrUSWWIUyeqRhLEeszqEqMUUQ8Ii6bQNWIr6kU82DtY/EJSb4P8XPVYn7ErwzGYMX/pFosRfhyyMa4Z31UixUifmswBlsyoqrF2hFfkeR7+RdGtdgi4l2S/CrEt1WKNSPGaihbkt+BPiOqxPKJS8S6DfLH0CegSiyEdvZXJkly04g74pNNEj4LdIPX64TYPj5JPoPcVuRu8N3Fksm92GqM3UG82x7uoXGxUgsbRfaqm1wQq0HeDQ7PprfWOcSMS1trVnObyOuzcxhJcukwwpeIC2yPEuL4VkY8IKfNiQNvq3DgnYvjwBsWHtCVK4IDm1cE7CS+jDXMtUuVk0S5VBGvoXYFqUiiiPGLu2lcRTlycfcNhrcJLBkhs9QAAAAASUVORK5CYII=&quot;); background-size: 19px 17px; background-repeat: no-repeat; background-position: 7px 1px; border: 0px none; padding: 0px; vertical-align: middle;\"></a></p><p class=\"sample-target\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 22px;\">这篇文章请你过目[过一下目]。</p><p class=\"sample-resource\" style=\"margin-top: 2px; margin-bottom: 0px; padding: 0px;\"><span style=\"color: rgb(204, 204, 204); font-stretch: normal; font-size: 12px; line-height: normal; font-family: arial;\">《汉英大词典》</span></p></li><li><p>5</p><p class=\"sample-source\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 22px;\">It&nbsp;can&nbsp;help&nbsp;to&nbsp;have&nbsp;an&nbsp;impartial&nbsp;third&nbsp;party&nbsp;<span class=\"high-light\" style=\"color: rgb(245, 117, 39);\">look&nbsp;</span><span class=\"high-light\" style=\"color: rgb(245, 117, 39);\">over&nbsp;</span>your&nbsp;work&nbsp;<a class=\"operate-btn op-sound\" style=\"color: rgb(102, 102, 102); display: inline-block; margin-right: 18px; width: 28px; height: 22px; bottom: 13px; background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACYAAAAiCAYAAAAzrKu4AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDY3IDc5LjE1Nzc0NywgMjAxNS8wMy8zMC0yMzo0MDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NEY0RDZEN0NENDdGMTFFNkFDNTNDODhBMDQ3QjQxNjkiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NEY0RDZEN0RENDdGMTFFNkFDNTNDODhBMDQ3QjQxNjkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0RjRENkQ3QUQ0N0YxMUU2QUM1M0M4OEEwNDdCNDE2OSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0RjRENkQ3QkQ0N0YxMUU2QUM1M0M4OEEwNDdCNDE2OSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PtzEV+UAAAI0SURBVFjDzZhLKERRGMfHIyXMCIVYTBGllIVHKQvZ2GBlPdnchWKrxJ6sLGVjyQJJGK+8I8xyNiaUVwlFRt6u79T/6BTnzr137j1m8duc73xnfvfOd84953g0TfM4QDoxSZwQDbxd13XbOCGVR+wQOjiKJWZm3HilSiDChE4FuX8VqyWuIRIiCmyIbRHrhNcpsRYiCol5IhPtVsUO0T9IpMQr1kl8YMBRIlWIWRUrJs6R02tXLJkYwCBfRP8ffezUWD0e9IWosCpWSezhR1+JgKSf3eIfEv7SH7Fy4lgY1IgzotHgAeyKseK/RW4dF1swIfRODAtFblrMQqn0IHeci72hIcuBxVYmtkaECb9Bbi7q7Jm9wV+DuSQWRHsEArL8WfRrUSWWIUyeqRhLEeszqEqMUUQ8Ii6bQNWIr6kU82DtY/EJSb4P8XPVYn7ErwzGYMX/pFosRfhyyMa4Z31UixUifmswBlsyoqrF2hFfkeR7+RdGtdgi4l2S/CrEt1WKNSPGaihbkt+BPiOqxPKJS8S6DfLH0CegSiyEdvZXJkly04g74pNNEj4LdIPX64TYPj5JPoPcVuRu8N3Fksm92GqM3UG82x7uoXGxUgsbRfaqm1wQq0HeDQ7PprfWOcSMS1trVnObyOuzcxhJcukwwpeIC2yPEuL4VkY8IKfNiQNvq3DgnYvjwBsWHtCVK4IDm1cE7CS+jDXMtUuVk0S5VBGvoXYFqUiiiPGLu2lcRTlycfcNhrcJLBkhs9QAAAAASUVORK5CYII=&quot;); background-size: 19px 17px; background-repeat: no-repeat; background-position: 7px 1px; border: 0px none; padding: 0px; vertical-align: middle;\"></a></p><p class=\"sample-target\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 22px;\">让客观公正的第三方看一下你的成果会有助益。</p><p class=\"sample-resource\" style=\"margin-top: 2px; margin-bottom: 0px; padding: 0px;\"><span style=\"color: rgb(204, 204, 204); font-stretch: normal; font-size: 12px; line-height: normal; font-family: arial;\">《柯林斯高阶英汉双解学习词典》</span></p></li><li><p>6</p><p class=\"sample-source\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 22px;\"><span class=\"high-light\" style=\"color: rgb(245, 117, 39);\">Look&nbsp;</span><span class=\"high-light\" style=\"color: rgb(245, 117, 39);\">over&nbsp;</span>exercises&nbsp;before&nbsp;handing&nbsp;them&nbsp;in.&nbsp;<a class=\"operate-btn op-sound\" style=\"color: rgb(102, 102, 102); display: inline-block; margin-right: 18px; width: 28px; height: 22px; bottom: 13px; background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACYAAAAiCAYAAAAzrKu4AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDY3IDc5LjE1Nzc0NywgMjAxNS8wMy8zMC0yMzo0MDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NEY0RDZEN0NENDdGMTFFNkFDNTNDODhBMDQ3QjQxNjkiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NEY0RDZEN0RENDdGMTFFNkFDNTNDODhBMDQ3QjQxNjkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0RjRENkQ3QUQ0N0YxMUU2QUM1M0M4OEEwNDdCNDE2OSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0RjRENkQ3QkQ0N0YxMUU2QUM1M0M4OEEwNDdCNDE2OSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PtzEV+UAAAI0SURBVFjDzZhLKERRGMfHIyXMCIVYTBGllIVHKQvZ2GBlPdnchWKrxJ6sLGVjyQJJGK+8I8xyNiaUVwlFRt6u79T/6BTnzr137j1m8duc73xnfvfOd84953g0TfM4QDoxSZwQDbxd13XbOCGVR+wQOjiKJWZm3HilSiDChE4FuX8VqyWuIRIiCmyIbRHrhNcpsRYiCol5IhPtVsUO0T9IpMQr1kl8YMBRIlWIWRUrJs6R02tXLJkYwCBfRP8ffezUWD0e9IWosCpWSezhR1+JgKSf3eIfEv7SH7Fy4lgY1IgzotHgAeyKseK/RW4dF1swIfRODAtFblrMQqn0IHeci72hIcuBxVYmtkaECb9Bbi7q7Jm9wV+DuSQWRHsEArL8WfRrUSWWIUyeqRhLEeszqEqMUUQ8Ii6bQNWIr6kU82DtY/EJSb4P8XPVYn7ErwzGYMX/pFosRfhyyMa4Z31UixUifmswBlsyoqrF2hFfkeR7+RdGtdgi4l2S/CrEt1WKNSPGaihbkt+BPiOqxPKJS8S6DfLH0CegSiyEdvZXJkly04g74pNNEj4LdIPX64TYPj5JPoPcVuRu8N3Fksm92GqM3UG82x7uoXGxUgsbRfaqm1wQq0HeDQ7PprfWOcSMS1trVnObyOuzcxhJcukwwpeIC2yPEuL4VkY8IKfNiQNvq3DgnYvjwBsWHtCVK4IDm1cE7CS+jDXMtUuVk0S5VBGvoXYFqUiiiPGLu2lcRTlycfcNhrcJLBkhs9QAAAAASUVORK5CYII=&quot;); background-size: 19px 17px; background-repeat: no-repeat; background-position: 7px 1px; border: 0px none; padding: 0px; vertical-align: middle;\"></a></p><p class=\"sample-target\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 22px;\">把练习检查一遍再交。</p><p class=\"sample-resource\" style=\"margin-top: 2px; margin-bottom: 0px; padding: 0px;\"><span style=\"color: rgb(204, 204, 204); font-stretch: normal; font-size: 12px; line-height: normal; font-family: arial;\">《汉英大词典》</span></p></li><li><p>7</p><p class=\"sample-source\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 22px;\">Will&nbsp;you&nbsp;<span class=\"high-light\" style=\"color: rgb(245, 117, 39);\">look&nbsp;</span><span class=\"high-light\" style=\"color: rgb(245, 117, 39);\">over&nbsp;</span>his&nbsp;album?&nbsp;<a class=\"operate-btn op-sound\" style=\"color: rgb(102, 102, 102); display: inline-block; margin-right: 18px; width: 28px; height: 22px; bottom: 13px; background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACYAAAAiCAYAAAAzrKu4AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDY3IDc5LjE1Nzc0NywgMjAxNS8wMy8zMC0yMzo0MDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NEY0RDZEN0NENDdGMTFFNkFDNTNDODhBMDQ3QjQxNjkiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NEY0RDZEN0RENDdGMTFFNkFDNTNDODhBMDQ3QjQxNjkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0RjRENkQ3QUQ0N0YxMUU2QUM1M0M4OEEwNDdCNDE2OSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0RjRENkQ3QkQ0N0YxMUU2QUM1M0M4OEEwNDdCNDE2OSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PtzEV+UAAAI0SURBVFjDzZhLKERRGMfHIyXMCIVYTBGllIVHKQvZ2GBlPdnchWKrxJ6sLGVjyQJJGK+8I8xyNiaUVwlFRt6u79T/6BTnzr137j1m8duc73xnfvfOd84953g0TfM4QDoxSZwQDbxd13XbOCGVR+wQOjiKJWZm3HilSiDChE4FuX8VqyWuIRIiCmyIbRHrhNcpsRYiCol5IhPtVsUO0T9IpMQr1kl8YMBRIlWIWRUrJs6R02tXLJkYwCBfRP8ffezUWD0e9IWosCpWSezhR1+JgKSf3eIfEv7SH7Fy4lgY1IgzotHgAeyKseK/RW4dF1swIfRODAtFblrMQqn0IHeci72hIcuBxVYmtkaECb9Bbi7q7Jm9wV+DuSQWRHsEArL8WfRrUSWWIUyeqRhLEeszqEqMUUQ8Ii6bQNWIr6kU82DtY/EJSb4P8XPVYn7ErwzGYMX/pFosRfhyyMa4Z31UixUifmswBlsyoqrF2hFfkeR7+RdGtdgi4l2S/CrEt1WKNSPGaihbkt+BPiOqxPKJS8S6DfLH0CegSiyEdvZXJkly04g74pNNEj4LdIPX64TYPj5JPoPcVuRu8N3Fksm92GqM3UG82x7uoXGxUgsbRfaqm1wQq0HeDQ7PprfWOcSMS1trVnObyOuzcxhJcukwwpeIC2yPEuL4VkY8IKfNiQNvq3DgnYvjwBsWHtCVK4IDm1cE7CS+jDXMtUuVk0S5VBGvoXYFqUiiiPGLu2lcRTlycfcNhrcJLBkhs9QAAAAASUVORK5CYII=&quot;); background-size: 19px 17px; background-repeat: no-repeat; background-position: 7px 1px; border: 0px none; padding: 0px; vertical-align: middle;\"></a></p><p class=\"sample-target\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 22px;\">你要不要去看看他的唱片？</p><p class=\"sample-resource\" style=\"margin-top: 2px; margin-bottom: 0px; padding: 0px;\"><span style=\"color: rgb(204, 204, 204); font-stretch: normal; font-size: 12px; line-height: normal; font-family: arial;\">百度翻译例句库</span></p></li><li><p class=\"tips-text\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px 5px; display: inline-block; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">以下例句来源于网络，仅供参考</p><p>8</p><p class=\"sample-source\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 22px;\">Could&nbsp;you&nbsp;please&nbsp;<span class=\"high-light\" style=\"color: rgb(245, 117, 39);\">look&nbsp;</span><span class=\"high-light\" style=\"color: rgb(245, 117, 39);\">over&nbsp;</span>these&nbsp;resumes?&nbsp;They&#39;ve&nbsp;just&nbsp;come&nbsp;in.&nbsp;<a class=\"operate-btn op-sound\" style=\"color: rgb(102, 102, 102); display: inline-block; margin-right: 18px; width: 28px; height: 22px; bottom: 13px; background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACYAAAAiCAYAAAAzrKu4AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDY3IDc5LjE1Nzc0NywgMjAxNS8wMy8zMC0yMzo0MDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NEY0RDZEN0NENDdGMTFFNkFDNTNDODhBMDQ3QjQxNjkiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NEY0RDZEN0RENDdGMTFFNkFDNTNDODhBMDQ3QjQxNjkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0RjRENkQ3QUQ0N0YxMUU2QUM1M0M4OEEwNDdCNDE2OSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0RjRENkQ3QkQ0N0YxMUU2QUM1M0M4OEEwNDdCNDE2OSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PtzEV+UAAAI0SURBVFjDzZhLKERRGMfHIyXMCIVYTBGllIVHKQvZ2GBlPdnchWKrxJ6sLGVjyQJJGK+8I8xyNiaUVwlFRt6u79T/6BTnzr137j1m8duc73xnfvfOd84953g0TfM4QDoxSZwQDbxd13XbOCGVR+wQOjiKJWZm3HilSiDChE4FuX8VqyWuIRIiCmyIbRHrhNcpsRYiCol5IhPtVsUO0T9IpMQr1kl8YMBRIlWIWRUrJs6R02tXLJkYwCBfRP8ffezUWD0e9IWosCpWSezhR1+JgKSf3eIfEv7SH7Fy4lgY1IgzotHgAeyKseK/RW4dF1swIfRODAtFblrMQqn0IHeci72hIcuBxVYmtkaECb9Bbi7q7Jm9wV+DuSQWRHsEArL8WfRrUSWWIUyeqRhLEeszqEqMUUQ8Ii6bQNWIr6kU82DtY/EJSb4P8XPVYn7ErwzGYMX/pFosRfhyyMa4Z31UixUifmswBlsyoqrF2hFfkeR7+RdGtdgi4l2S/CrEt1WKNSPGaihbkt+BPiOqxPKJS8S6DfLH0CegSiyEdvZXJkly04g74pNNEj4LdIPX64TYPj5JPoPcVuRu8N3Fksm92GqM3UG82x7uoXGxUgsbRfaqm1wQq0HeDQ7PprfWOcSMS1trVnObyOuzcxhJcukwwpeIC2yPEuL4VkY8IKfNiQNvq3DgnYvjwBsWHtCVK4IDm1cE7CS+jDXMtUuVk0S5VBGvoXYFqUiiiPGLu2lcRTlycfcNhrcJLBkhs9QAAAAASUVORK5CYII=&quot;); background-size: 19px 17px; background-repeat: no-repeat; background-position: 7px 1px; border: 0px none; padding: 0px; vertical-align: middle;\"></a></p><p class=\"sample-target\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 22px;\">你可以帮我看看我的简历。这是我来的目的。</p><p class=\"sample-resource\" style=\"margin-top: 2px; margin-bottom: 0px; padding: 0px;\"><span style=\"color: rgb(204, 204, 204); font-stretch: normal; font-size: 12px; line-height: normal; font-family: arial;\">bbs.24en.com</span></p></li><li><p>9</p><p class=\"sample-source\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 22px;\">Example:&nbsp;You&nbsp;should&nbsp;not&nbsp;<span class=\"high-light\" style=\"color: rgb(245, 117, 39);\">look&nbsp;</span><span class=\"high-light\" style=\"color: rgb(245, 117, 39);\">over&nbsp;</span>my&nbsp;shoulder,&nbsp;I&nbsp;have&nbsp;my&nbsp;own&nbsp;right.&nbsp;<a class=\"operate-btn op-sound\" style=\"color: rgb(102, 102, 102); display: inline-block; margin-right: 18px; width: 28px; height: 22px; bottom: 13px; background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACYAAAAiCAYAAAAzrKu4AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDY3IDc5LjE1Nzc0NywgMjAxNS8wMy8zMC0yMzo0MDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NEY0RDZEN0NENDdGMTFFNkFDNTNDODhBMDQ3QjQxNjkiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NEY0RDZEN0RENDdGMTFFNkFDNTNDODhBMDQ3QjQxNjkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0RjRENkQ3QUQ0N0YxMUU2QUM1M0M4OEEwNDdCNDE2OSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0RjRENkQ3QkQ0N0YxMUU2QUM1M0M4OEEwNDdCNDE2OSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PtzEV+UAAAI0SURBVFjDzZhLKERRGMfHIyXMCIVYTBGllIVHKQvZ2GBlPdnchWKrxJ6sLGVjyQJJGK+8I8xyNiaUVwlFRt6u79T/6BTnzr137j1m8duc73xnfvfOd84953g0TfM4QDoxSZwQDbxd13XbOCGVR+wQOjiKJWZm3HilSiDChE4FuX8VqyWuIRIiCmyIbRHrhNcpsRYiCol5IhPtVsUO0T9IpMQr1kl8YMBRIlWIWRUrJs6R02tXLJkYwCBfRP8ffezUWD0e9IWosCpWSezhR1+JgKSf3eIfEv7SH7Fy4lgY1IgzotHgAeyKseK/RW4dF1swIfRODAtFblrMQqn0IHeci72hIcuBxVYmtkaECb9Bbi7q7Jm9wV+DuSQWRHsEArL8WfRrUSWWIUyeqRhLEeszqEqMUUQ8Ii6bQNWIr6kU82DtY/EJSb4P8XPVYn7ErwzGYMX/pFosRfhyyMa4Z31UixUifmswBlsyoqrF2hFfkeR7+RdGtdgi4l2S/CrEt1WKNSPGaihbkt+BPiOqxPKJS8S6DfLH0CegSiyEdvZXJkly04g74pNNEj4LdIPX64TYPj5JPoPcVuRu8N3Fksm92GqM3UG82x7uoXGxUgsbRfaqm1wQq0HeDQ7PprfWOcSMS1trVnObyOuzcxhJcukwwpeIC2yPEuL4VkY8IKfNiQNvq3DgnYvjwBsWHtCVK4IDm1cE7CS+jDXMtUuVk0S5VBGvoXYFqUiiiPGLu2lcRTlycfcNhrcJLBkhs9QAAAAASUVORK5CYII=&quot;); background-size: 19px 17px; background-repeat: no-repeat; background-position: 7px 1px; border: 0px none; padding: 0px; vertical-align: middle;\"></a></p><p class=\"sample-target\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 22px;\">你不该监视我，我有我自己的权利。</p><p class=\"sample-resource\" style=\"margin-top: 2px; margin-bottom: 0px; padding: 0px;\"><span style=\"color: rgb(204, 204, 204); font-stretch: normal; font-size: 12px; line-height: normal; font-family: arial;\">bulo.hjenglish.com</span></p></li><li><p>10</p><p class=\"sample-source\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 22px;\">I&nbsp;<span class=\"high-light\" style=\"color: rgb(245, 117, 39);\">look&nbsp;</span><span class=\"high-light\" style=\"color: rgb(245, 117, 39);\">over&nbsp;</span>the&nbsp;document.&nbsp;<a class=\"operate-btn op-sound\" style=\"color: rgb(102, 102, 102); display: inline-block; margin-right: 18px; width: 28px; height: 22px; bottom: 13px; background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACYAAAAiCAYAAAAzrKu4AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDY3IDc5LjE1Nzc0NywgMjAxNS8wMy8zMC0yMzo0MDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NEY0RDZEN0NENDdGMTFFNkFDNTNDODhBMDQ3QjQxNjkiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NEY0RDZEN0RENDdGMTFFNkFDNTNDODhBMDQ3QjQxNjkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0RjRENkQ3QUQ0N0YxMUU2QUM1M0M4OEEwNDdCNDE2OSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0RjRENkQ3QkQ0N0YxMUU2QUM1M0M4OEEwNDdCNDE2OSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PtzEV+UAAAI0SURBVFjDzZhLKERRGMfHIyXMCIVYTBGllIVHKQvZ2GBlPdnchWKrxJ6sLGVjyQJJGK+8I8xyNiaUVwlFRt6u79T/6BTnzr137j1m8duc73xnfvfOd84953g0TfM4QDoxSZwQDbxd13XbOCGVR+wQOjiKJWZm3HilSiDChE4FuX8VqyWuIRIiCmyIbRHrhNcpsRYiCol5IhPtVsUO0T9IpMQr1kl8YMBRIlWIWRUrJs6R02tXLJkYwCBfRP8ffezUWD0e9IWosCpWSezhR1+JgKSf3eIfEv7SH7Fy4lgY1IgzotHgAeyKseK/RW4dF1swIfRODAtFblrMQqn0IHeci72hIcuBxVYmtkaECb9Bbi7q7Jm9wV+DuSQWRHsEArL8WfRrUSWWIUyeqRhLEeszqEqMUUQ8Ii6bQNWIr6kU82DtY/EJSb4P8XPVYn7ErwzGYMX/pFosRfhyyMa4Z31UixUifmswBlsyoqrF2hFfkeR7+RdGtdgi4l2S/CrEt1WKNSPGaihbkt+BPiOqxPKJS8S6DfLH0CegSiyEdvZXJkly04g74pNNEj4LdIPX64TYPj5JPoPcVuRu8N3Fksm92GqM3UG82x7uoXGxUgsbRfaqm1wQq0HeDQ7PprfWOcSMS1trVnObyOuzcxhJcukwwpeIC2yPEuL4VkY8IKfNiQNvq3DgnYvjwBsWHtCVK4IDm1cE7CS+jDXMtUuVk0S5VBGvoXYFqUiiiPGLu2lcRTlycfcNhrcJLBkhs9QAAAAASUVORK5CYII=&quot;); background-size: 19px 17px; background-repeat: no-repeat; background-position: 7px 1px; border: 0px none; padding: 0px; vertical-align: middle;\"></a></p><p class=\"sample-target\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 22px;\">我将文件过目一下。</p><p class=\"sample-resource\" style=\"margin-top: 2px; margin-bottom: 0px; padding: 0px;\"><span style=\"color: rgb(204, 204, 204); font-stretch: normal; font-size: 12px; line-height: normal; font-family: arial;\">dj.iciba.com</span></p></li><li><p>11</p><p class=\"sample-source\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 22px;\">If&nbsp;you&nbsp;do&nbsp;harm&nbsp;to&nbsp;me&nbsp;I&nbsp;shall&nbsp;not&nbsp;<span class=\"high-light\" style=\"color: rgb(245, 117, 39);\">look&nbsp;</span><span class=\"high-light\" style=\"color: rgb(245, 117, 39);\">over&nbsp;</span>you.&nbsp;<a class=\"operate-btn op-sound\" style=\"color: rgb(102, 102, 102); display: inline-block; margin-right: 18px; width: 28px; height: 22px; bottom: 13px; background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACYAAAAiCAYAAAAzrKu4AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDY3IDc5LjE1Nzc0NywgMjAxNS8wMy8zMC0yMzo0MDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NEY0RDZEN0NENDdGMTFFNkFDNTNDODhBMDQ3QjQxNjkiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NEY0RDZEN0RENDdGMTFFNkFDNTNDODhBMDQ3QjQxNjkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0RjRENkQ3QUQ0N0YxMUU2QUM1M0M4OEEwNDdCNDE2OSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0RjRENkQ3QkQ0N0YxMUU2QUM1M0M4OEEwNDdCNDE2OSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PtzEV+UAAAI0SURBVFjDzZhLKERRGMfHIyXMCIVYTBGllIVHKQvZ2GBlPdnchWKrxJ6sLGVjyQJJGK+8I8xyNiaUVwlFRt6u79T/6BTnzr137j1m8duc73xnfvfOd84953g0TfM4QDoxSZwQDbxd13XbOCGVR+wQOjiKJWZm3HilSiDChE4FuX8VqyWuIRIiCmyIbRHrhNcpsRYiCol5IhPtVsUO0T9IpMQr1kl8YMBRIlWIWRUrJs6R02tXLJkYwCBfRP8ffezUWD0e9IWosCpWSezhR1+JgKSf3eIfEv7SH7Fy4lgY1IgzotHgAeyKseK/RW4dF1swIfRODAtFblrMQqn0IHeci72hIcuBxVYmtkaECb9Bbi7q7Jm9wV+DuSQWRHsEArL8WfRrUSWWIUyeqRhLEeszqEqMUUQ8Ii6bQNWIr6kU82DtY/EJSb4P8XPVYn7ErwzGYMX/pFosRfhyyMa4Z31UixUifmswBlsyoqrF2hFfkeR7+RdGtdgi4l2S/CrEt1WKNSPGaihbkt+BPiOqxPKJS8S6DfLH0CegSiyEdvZXJkly04g74pNNEj4LdIPX64TYPj5JPoPcVuRu8N3Fksm92GqM3UG82x7uoXGxUgsbRfaqm1wQq0HeDQ7PprfWOcSMS1trVnObyOuzcxhJcukwwpeIC2yPEuL4VkY8IKfNiQNvq3DgnYvjwBsWHtCVK4IDm1cE7CS+jDXMtUuVk0S5VBGvoXYFqUiiiPGLu2lcRTlycfcNhrcJLBkhs9QAAAAASUVORK5CYII=&quot;); background-size: 19px 17px; background-repeat: no-repeat; background-position: 7px 1px; border: 0px none; padding: 0px; vertical-align: middle;\"></a></p><p class=\"sample-target\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 22px;\">如你对我使坏，我可不饶恕你。</p><p class=\"sample-resource\" style=\"margin-top: 2px; margin-bottom: 0px; padding: 0px;\"><span style=\"color: rgb(204, 204, 204); font-stretch: normal; font-size: 12px; line-height: normal; font-family: arial;\">www.dictall.com</span></p></li><li><p>12</p><p class=\"sample-source\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 22px;\">You&nbsp;can&nbsp;then&nbsp;<span class=\"high-light\" style=\"color: rgb(245, 117, 39);\">look&nbsp;</span><span class=\"high-light\" style=\"color: rgb(245, 117, 39);\">over&nbsp;</span>your&nbsp;credit&nbsp;rating&nbsp;and&nbsp;contact&nbsp;them&nbsp;if&nbsp;you&nbsp;discover&nbsp;something&nbsp;that&nbsp;is&nbsp;incorrect.&nbsp;<a class=\"operate-btn op-sound\" style=\"color: rgb(102, 102, 102); display: inline-block; margin-right: 18px; width: 28px; height: 22px; bottom: 13px; background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACYAAAAiCAYAAAAzrKu4AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDY3IDc5LjE1Nzc0NywgMjAxNS8wMy8zMC0yMzo0MDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NEY0RDZEN0NENDdGMTFFNkFDNTNDODhBMDQ3QjQxNjkiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NEY0RDZEN0RENDdGMTFFNkFDNTNDODhBMDQ3QjQxNjkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0RjRENkQ3QUQ0N0YxMUU2QUM1M0M4OEEwNDdCNDE2OSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0RjRENkQ3QkQ0N0YxMUU2QUM1M0M4OEEwNDdCNDE2OSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PtzEV+UAAAI0SURBVFjDzZhLKERRGMfHIyXMCIVYTBGllIVHKQvZ2GBlPdnchWKrxJ6sLGVjyQJJGK+8I8xyNiaUVwlFRt6u79T/6BTnzr137j1m8duc73xnfvfOd84953g0TfM4QDoxSZwQDbxd13XbOCGVR+wQOjiKJWZm3HilSiDChE4FuX8VqyWuIRIiCmyIbRHrhNcpsRYiCol5IhPtVsUO0T9IpMQr1kl8YMBRIlWIWRUrJs6R02tXLJkYwCBfRP8ffezUWD0e9IWosCpWSezhR1+JgKSf3eIfEv7SH7Fy4lgY1IgzotHgAeyKseK/RW4dF1swIfRODAtFblrMQqn0IHeci72hIcuBxVYmtkaECb9Bbi7q7Jm9wV+DuSQWRHsEArL8WfRrUSWWIUyeqRhLEeszqEqMUUQ8Ii6bQNWIr6kU82DtY/EJSb4P8XPVYn7ErwzGYMX/pFosRfhyyMa4Z31UixUifmswBlsyoqrF2hFfkeR7+RdGtdgi4l2S/CrEt1WKNSPGaihbkt+BPiOqxPKJS8S6DfLH0CegSiyEdvZXJkly04g74pNNEj4LdIPX64TYPj5JPoPcVuRu8N3Fksm92GqM3UG82x7uoXGxUgsbRfaqm1wQq0HeDQ7PprfWOcSMS1trVnObyOuzcxhJcukwwpeIC2yPEuL4VkY8IKfNiQNvq3DgnYvjwBsWHtCVK4IDm1cE7CS+jDXMtUuVk0S5VBGvoXYFqUiiiPGLu2lcRTlycfcNhrcJLBkhs9QAAAAASUVORK5CYII=&quot;); background-size: 19px 17px; background-repeat: no-repeat; background-position: 7px 1px; border: 0px none; padding: 0px; vertical-align: middle;\"></a></p><p class=\"sample-target\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 22px;\">然后你可以看看你的信用评级和他们接触一下，如果你发现的东西就是不正确。</p><p class=\"sample-resource\" style=\"margin-top: 2px; margin-bottom: 0px; padding: 0px;\"><span style=\"color: rgb(204, 204, 204); font-stretch: normal; font-size: 12px; line-height: normal; font-family: arial;\">danci.911cha.com</span></p></li><li><p>13</p><p class=\"sample-source\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 22px;\">Do&nbsp;you&nbsp;have&nbsp;a&nbsp;few&nbsp;minutes&nbsp;to&nbsp;<span class=\"high-light\" style=\"color: rgb(245, 117, 39);\">look&nbsp;</span><span class=\"high-light\" style=\"color: rgb(245, 117, 39);\">over&nbsp;</span>this&nbsp;outline&nbsp;for&nbsp;next&nbsp;week&#39;s&nbsp;debate&nbsp;with&nbsp;me?&nbsp;<a class=\"operate-btn op-sound\" style=\"color: rgb(102, 102, 102); display: inline-block; margin-right: 18px; width: 28px; height: 22px; bottom: 13px; background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACYAAAAiCAYAAAAzrKu4AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDY3IDc5LjE1Nzc0NywgMjAxNS8wMy8zMC0yMzo0MDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NEY0RDZEN0NENDdGMTFFNkFDNTNDODhBMDQ3QjQxNjkiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NEY0RDZEN0RENDdGMTFFNkFDNTNDODhBMDQ3QjQxNjkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0RjRENkQ3QUQ0N0YxMUU2QUM1M0M4OEEwNDdCNDE2OSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0RjRENkQ3QkQ0N0YxMUU2QUM1M0M4OEEwNDdCNDE2OSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PtzEV+UAAAI0SURBVFjDzZhLKERRGMfHIyXMCIVYTBGllIVHKQvZ2GBlPdnchWKrxJ6sLGVjyQJJGK+8I8xyNiaUVwlFRt6u79T/6BTnzr137j1m8duc73xnfvfOd84953g0TfM4QDoxSZwQDbxd13XbOCGVR+wQOjiKJWZm3HilSiDChE4FuX8VqyWuIRIiCmyIbRHrhNcpsRYiCol5IhPtVsUO0T9IpMQr1kl8YMBRIlWIWRUrJs6R02tXLJkYwCBfRP8ffezUWD0e9IWosCpWSezhR1+JgKSf3eIfEv7SH7Fy4lgY1IgzotHgAeyKseK/RW4dF1swIfRODAtFblrMQqn0IHeci72hIcuBxVYmtkaECb9Bbi7q7Jm9wV+DuSQWRHsEArL8WfRrUSWWIUyeqRhLEeszqEqMUUQ8Ii6bQNWIr6kU82DtY/EJSb4P8XPVYn7ErwzGYMX/pFosRfhyyMa4Z31UixUifmswBlsyoqrF2hFfkeR7+RdGtdgi4l2S/CrEt1WKNSPGaihbkt+BPiOqxPKJS8S6DfLH0CegSiyEdvZXJkly04g74pNNEj4LdIPX64TYPj5JPoPcVuRu8N3Fksm92GqM3UG82x7uoXGxUgsbRfaqm1wQq0HeDQ7PprfWOcSMS1trVnObyOuzcxhJcukwwpeIC2yPEuL4VkY8IKfNiQNvq3DgnYvjwBsWHtCVK4IDm1cE7CS+jDXMtUuVk0S5VBGvoXYFqUiiiPGLu2lcRTlycfcNhrcJLBkhs9QAAAAASUVORK5CYII=&quot;); background-size: 19px 17px; background-repeat: no-repeat; background-position: 7px 1px; border: 0px none; padding: 0px; vertical-align: middle;\"></a></p><p class=\"sample-target\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 22px;\">你有时间跟我看看下周辩论的大纲吗？</p><p class=\"sample-resource\" style=\"margin-top: 2px; margin-bottom: 0px; padding: 0px;\"><span style=\"color: rgb(204, 204, 204); font-stretch: normal; font-size: 12px; line-height: normal; font-family: arial;\">10305103.blog.163.com</span></p></li><li><p>14</p><p class=\"sample-source\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 22px;\">I&nbsp;<span class=\"high-light\" style=\"color: rgb(245, 117, 39);\">look&nbsp;</span><span class=\"high-light\" style=\"color: rgb(245, 117, 39);\">over&nbsp;</span>the&nbsp;various&nbsp;parts&nbsp;of&nbsp;my&nbsp;character&nbsp;with&nbsp;perplexity.&nbsp;<a class=\"operate-btn op-sound\" style=\"color: rgb(102, 102, 102); display: inline-block; margin-right: 18px; width: 28px; height: 22px; bottom: 13px; background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACYAAAAiCAYAAAAzrKu4AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDY3IDc5LjE1Nzc0NywgMjAxNS8wMy8zMC0yMzo0MDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NEY0RDZEN0NENDdGMTFFNkFDNTNDODhBMDQ3QjQxNjkiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NEY0RDZEN0RENDdGMTFFNkFDNTNDODhBMDQ3QjQxNjkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0RjRENkQ3QUQ0N0YxMUU2QUM1M0M4OEEwNDdCNDE2OSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0RjRENkQ3QkQ0N0YxMUU2QUM1M0M4OEEwNDdCNDE2OSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PtzEV+UAAAI0SURBVFjDzZhLKERRGMfHIyXMCIVYTBGllIVHKQvZ2GBlPdnchWKrxJ6sLGVjyQJJGK+8I8xyNiaUVwlFRt6u79T/6BTnzr137j1m8duc73xnfvfOd84953g0TfM4QDoxSZwQDbxd13XbOCGVR+wQOjiKJWZm3HilSiDChE4FuX8VqyWuIRIiCmyIbRHrhNcpsRYiCol5IhPtVsUO0T9IpMQr1kl8YMBRIlWIWRUrJs6R02tXLJkYwCBfRP8ffezUWD0e9IWosCpWSezhR1+JgKSf3eIfEv7SH7Fy4lgY1IgzotHgAeyKseK/RW4dF1swIfRODAtFblrMQqn0IHeci72hIcuBxVYmtkaECb9Bbi7q7Jm9wV+DuSQWRHsEArL8WfRrUSWWIUyeqRhLEeszqEqMUUQ8Ii6bQNWIr6kU82DtY/EJSb4P8XPVYn7ErwzGYMX/pFosRfhyyMa4Z31UixUifmswBlsyoqrF2hFfkeR7+RdGtdgi4l2S/CrEt1WKNSPGaihbkt+BPiOqxPKJS8S6DfLH0CegSiyEdvZXJkly04g74pNNEj4LdIPX64TYPj5JPoPcVuRu8N3Fksm92GqM3UG82x7uoXGxUgsbRfaqm1wQq0HeDQ7PprfWOcSMS1trVnObyOuzcxhJcukwwpeIC2yPEuL4VkY8IKfNiQNvq3DgnYvjwBsWHtCVK4IDm1cE7CS+jDXMtUuVk0S5VBGvoXYFqUiiiPGLu2lcRTlycfcNhrcJLBkhs9QAAAAASUVORK5CYII=&quot;); background-size: 19px 17px; background-repeat: no-repeat; background-position: 7px 1px; border: 0px none; padding: 0px; vertical-align: middle;\"></a></p><p class=\"sample-target\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 22px;\">我困惑地检查我性格的各个方面。</p><p class=\"sample-resource\" style=\"margin-top: 2px; margin-bottom: 0px; padding: 0px;\"><span style=\"color: rgb(204, 204, 204); font-stretch: normal; font-size: 12px; line-height: normal; font-family: arial;\">provided by jukuu</span></p></li><li><p>15</p><p class=\"sample-source\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 22px;\">It&nbsp;took&nbsp;us&nbsp;two&nbsp;hours&nbsp;to&nbsp;<span class=\"high-light\" style=\"color: rgb(245, 117, 39);\">look&nbsp;</span><span class=\"high-light\" style=\"color: rgb(245, 117, 39);\">over&nbsp;</span>the&nbsp;new&nbsp;plant&nbsp;at&nbsp;Minhang.&nbsp;<a class=\"operate-btn op-sound\" style=\"color: rgb(102, 102, 102); display: inline-block; margin-right: 18px; width: 28px; height: 22px; bottom: 13px; background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACYAAAAiCAYAAAAzrKu4AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDY3IDc5LjE1Nzc0NywgMjAxNS8wMy8zMC0yMzo0MDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NEY0RDZEN0NENDdGMTFFNkFDNTNDODhBMDQ3QjQxNjkiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NEY0RDZEN0RENDdGMTFFNkFDNTNDODhBMDQ3QjQxNjkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0RjRENkQ3QUQ0N0YxMUU2QUM1M0M4OEEwNDdCNDE2OSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0RjRENkQ3QkQ0N0YxMUU2QUM1M0M4OEEwNDdCNDE2OSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PtzEV+UAAAI0SURBVFjDzZhLKERRGMfHIyXMCIVYTBGllIVHKQvZ2GBlPdnchWKrxJ6sLGVjyQJJGK+8I8xyNiaUVwlFRt6u79T/6BTnzr137j1m8duc73xnfvfOd84953g0TfM4QDoxSZwQDbxd13XbOCGVR+wQOjiKJWZm3HilSiDChE4FuX8VqyWuIRIiCmyIbRHrhNcpsRYiCol5IhPtVsUO0T9IpMQr1kl8YMBRIlWIWRUrJs6R02tXLJkYwCBfRP8ffezUWD0e9IWosCpWSezhR1+JgKSf3eIfEv7SH7Fy4lgY1IgzotHgAeyKseK/RW4dF1swIfRODAtFblrMQqn0IHeci72hIcuBxVYmtkaECb9Bbi7q7Jm9wV+DuSQWRHsEArL8WfRrUSWWIUyeqRhLEeszqEqMUUQ8Ii6bQNWIr6kU82DtY/EJSb4P8XPVYn7ErwzGYMX/pFosRfhyyMa4Z31UixUifmswBlsyoqrF2hFfkeR7+RdGtdgi4l2S/CrEt1WKNSPGaihbkt+BPiOqxPKJS8S6DfLH0CegSiyEdvZXJkly04g74pNNEj4LdIPX64TYPj5JPoPcVuRu8N3Fksm92GqM3UG82x7uoXGxUgsbRfaqm1wQq0HeDQ7PprfWOcSMS1trVnObyOuzcxhJcukwwpeIC2yPEuL4VkY8IKfNiQNvq3DgnYvjwBsWHtCVK4IDm1cE7CS+jDXMtUuVk0S5VBGvoXYFqUiiiPGLu2lcRTlycfcNhrcJLBkhs9QAAAAASUVORK5CYII=&quot;); background-size: 19px 17px; background-repeat: no-repeat; background-position: 7px 1px; border: 0px none; padding: 0px; vertical-align: middle;\"></a></p><p class=\"sample-target\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 22px;\">我们花了两个钟点时间参观了闵行那家新工厂。</p><p class=\"sample-resource\" style=\"margin-top: 2px; margin-bottom: 0px; padding: 0px;\"><span style=\"color: rgb(204, 204, 204); font-stretch: normal; font-size: 12px; line-height: normal; font-family: arial;\">www.hotdic.com</span></p></li><li><p>16</p><p class=\"sample-source\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 22px;\">He&nbsp;walked&nbsp;on&nbsp;a&nbsp;few&nbsp;paces,&nbsp;and&nbsp;went&nbsp;off&nbsp;to&nbsp;<span class=\"high-light\" style=\"color: rgb(245, 117, 39);\">look&nbsp;</span><span class=\"high-light\" style=\"color: rgb(245, 117, 39);\">over&nbsp;</span>the&nbsp;tops&nbsp;of&nbsp;the&nbsp;hedges.<a class=\"operate-btn op-sound\" style=\"color: rgb(102, 102, 102); display: inline-block; margin-right: 18px; width: 28px; height: 22px; bottom: 13px; background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACYAAAAiCAYAAAAzrKu4AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDY3IDc5LjE1Nzc0NywgMjAxNS8wMy8zMC0yMzo0MDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NEY0RDZEN0NENDdGMTFFNkFDNTNDODhBMDQ3QjQxNjkiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NEY0RDZEN0RENDdGMTFFNkFDNTNDODhBMDQ3QjQxNjkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0RjRENkQ3QUQ0N0YxMUU2QUM1M0M4OEEwNDdCNDE2OSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0RjRENkQ3QkQ0N0YxMUU2QUM1M0M4OEEwNDdCNDE2OSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PtzEV+UAAAI0SURBVFjDzZhLKERRGMfHIyXMCIVYTBGllIVHKQvZ2GBlPdnchWKrxJ6sLGVjyQJJGK+8I8xyNiaUVwlFRt6u79T/6BTnzr137j1m8duc73xnfvfOd84953g0TfM4QDoxSZwQDbxd13XbOCGVR+wQOjiKJWZm3HilSiDChE4FuX8VqyWuIRIiCmyIbRHrhNcpsRYiCol5IhPtVsUO0T9IpMQr1kl8YMBRIlWIWRUrJs6R02tXLJkYwCBfRP8ffezUWD0e9IWosCpWSezhR1+JgKSf3eIfEv7SH7Fy4lgY1IgzotHgAeyKseK/RW4dF1swIfRODAtFblrMQqn0IHeci72hIcuBxVYmtkaECb9Bbi7q7Jm9wV+DuSQWRHsEArL8WfRrUSWWIUyeqRhLEeszqEqMUUQ8Ii6bQNWIr6kU82DtY/EJSb4P8XPVYn7ErwzGYMX/pFosRfhyyMa4Z31UixUifmswBlsyoqrF2hFfkeR7+RdGtdgi4l2S/CrEt1WKNSPGaihbkt+BPiOqxPKJS8S6DfLH0CegSiyEdvZXJkly04g74pNNEj4LdIPX64TYPj5JPoPcVuRu8N3Fksm92GqM3UG82x7uoXGxUgsbRfaqm1wQq0HeDQ7PprfWOcSMS1trVnObyOuzcxhJcukwwpeIC2yPEuL4VkY8IKfNiQNvq3DgnYvjwBsWHtCVK4IDm1cE7CS+jDXMtUuVk0S5VBGvoXYFqUiiiPGLu2lcRTlycfcNhrcJLBkhs9QAAAAASUVORK5CYII=&quot;); background-size: 19px 17px; background-repeat: no-repeat; background-position: 7px 1px; border: 0px none; padding: 0px; vertical-align: middle;\"></a></p><p class=\"sample-target\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 22px;\">他走了几步，从篱笆上面望去。</p><p class=\"sample-resource\" style=\"margin-top: 2px; margin-bottom: 0px; padding: 0px;\"><br/></p></li><li><p class=\"sample-resource\" style=\"margin-top: 2px; margin-bottom: 0px; padding: 0px;\"><br/></p></li></ol>','They presented their draft to the president, who looked it over, nodded and signed it 他们把草案提交给了总统，总统翻了一遍，点了点头，然后就签了字。《柯林斯高阶英汉双解学习词典》2He could have looked over the papers in less than ten minutes. 他本可在10分钟内把文件翻看一遍的。《柯林斯高阶英汉双解学习词典》3When I look over and see Terry I tingle all over. 当我放眼望去见到特里时，我整个人兴奋不已。《柯林斯高阶英汉双解学习词典》4Here\'s the essay for you to look over. 这篇文章请你过目[过一下目]。《汉英大词典》5It can help to have an impartial third party look over your work 让客观公正的第三方看一下你的成果会有助益。《柯林斯高阶英汉双解学习词典》6Look over exercises before handing them in. 把练习检查一遍再交。《汉英大词典》7Will you look over his album? 你要不要去看看他的唱片？百度翻译例句库以下例句来源于网络，仅供参考8Could you please look over these resumes? They\'ve just come in. 你可以帮我看看我的简历。这是我来的目的。bbs.24en.com9Example: You should not look over my shoulder, I have my own right. 你不该监视我，我有我自己的权利。bulo.hjenglish.com10I look over the document. 我将文件过目一下。dj.iciba.com11If you do harm to me I shall not look over you. 如你对我使坏，我可不饶恕你。www.dictall.com12You can then look over your credit rating and contact them if you discover something that is incorrect. 然后你可以看看你的信用评级和他们接触一下，如果你发现的东西就是不正确。danci.911cha.com13Do you have a few minutes to look over this outline for next week\'s debate with me? 你有时间跟我看看下周辩论的大纲吗？10305103.blog.163.com14I look over the various parts of my character with perplexity. 我困惑地检查我性格的各个方面。provided by jukuu15It took us two hours to look over the new plant at Minhang. 我们花了两个钟点时间参观了闵行那家新工厂。www.hotdic.com16He walked on a few paces, and went off to look over the tops of the hedges.他走了几步，从篱笆上面望去。','3','admin','2017-03-16 04:10:39',NULL),('e3939a267b914b648eabfde2dd822654',3,NULL,'DESC','<pre style=\"background-color:#2b2b2b;color:#a9b7c6;font-family:&#39;Source Code Pro&#39;;font-size:12.0pt;\">DESC</pre><p><br/></p>','DESC','DESC','admin','2017-03-21 21:48:33',NULL),('ed85639fb0e247c7af5e1e8c1653bfaf',3,NULL,'爱爱爱','<p>爱爱爱爱爱爱爱爱爱爱爱爱爱爱爱爱爱爱爱爱爱</p>','爱爱爱爱爱爱爱爱爱爱爱爱爱爱爱爱爱爱爱爱爱','爱爱爱','admin','2017-03-22 13:45:21',NULL),('f83f0abf13c64326b124f73ee5adccb1',2,NULL,'asdfdas','<p>asdfsafsa</p>','asdfsafsa','sdafsa','admin','2017-03-16 01:23:57',NULL);

/*Table structure for table `t_homepage_picture` */

DROP TABLE IF EXISTS `t_homepage_picture`;

CREATE TABLE `t_homepage_picture` (
  `homePage_picturet_id` varchar(50) NOT NULL COMMENT '轮播图id',
  `attachment_id` varchar(50) DEFAULT NULL COMMENT '图片id',
  `title` varchar(20) DEFAULT NULL COMMENT '轮播图标题',
  `add_user_id` varchar(50) DEFAULT NULL COMMENT '添加人',
  `add_date` datetime DEFAULT NULL COMMENT '添加时间',
  `sort` int(11) DEFAULT NULL COMMENT '位置',
  PRIMARY KEY (`homePage_picturet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_homepage_picture` */

/*Table structure for table `t_order_detail` */

DROP TABLE IF EXISTS `t_order_detail`;

CREATE TABLE `t_order_detail` (
  `order_detail_id` varchar(50) NOT NULL COMMENT '订单详情表',
  `buyer_id` varchar(50) DEFAULT NULL COMMENT '买方的user_id',
  `seller_id` varchar(50) DEFAULT NULL COMMENT '卖方的user_id',
  `commodity_id` varchar(50) DEFAULT NULL COMMENT '商品外键',
  `finish_date` datetime DEFAULT NULL COMMENT '完成时间',
  `status` int(11) DEFAULT NULL COMMENT '交易情况(1.进行中; 2.成功; 3.失败;)',
  PRIMARY KEY (`order_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_order_detail` */

/*Table structure for table `t_role` */

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `role_id` varchar(50) NOT NULL COMMENT '角色id',
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色名称（英文）',
  `role_real_name` varchar(50) DEFAULT NULL COMMENT '角色真实名称（中文）',
  `status` varchar(11) DEFAULT NULL COMMENT '0:停用；1：启用',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_role` */

insert  into `t_role`(`role_id`,`role_name`,`role_real_name`,`status`) values ('6a9dab1dd86e459c8c6f4dab8915eea3','111','111,1',NULL),('974b68e0591b4d3bb532954ebfdd00bf','appuser','app用户','1');

/*Table structure for table `t_sentence` */

DROP TABLE IF EXISTS `t_sentence`;

CREATE TABLE `t_sentence` (
  `sentence_id` varchar(50) NOT NULL COMMENT '单文字表',
  `text` varchar(50) DEFAULT NULL COMMENT '文字字段',
  `type` int(11) DEFAULT NULL COMMENT '类型（1：跑马条；2：推荐）',
  `add_user` varchar(50) DEFAULT NULL COMMENT '添加人',
  `add_date` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`sentence_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_sentence` */

/*Table structure for table `t_store` */

DROP TABLE IF EXISTS `t_store`;

CREATE TABLE `t_store` (
  `store_id` varchar(50) NOT NULL COMMENT '店铺表',
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户id',
  `description` text COMMENT '描述',
  `images` text COMMENT '图片',
  `prefer_num` int(11) DEFAULT NULL COMMENT '收藏人数',
  `sales_volume` int(11) DEFAULT NULL COMMENT '销售量',
  `registration_date` datetime DEFAULT NULL COMMENT '注册日期',
  `store_name` varchar(50) DEFAULT NULL COMMENT '店铺名称',
  `add_user` varchar(50) DEFAULT NULL COMMENT '添加人',
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_store` */

/*Table structure for table `t_subject_head` */

DROP TABLE IF EXISTS `t_subject_head`;

CREATE TABLE `t_subject_head` (
  `subject_head_id` varchar(50) NOT NULL COMMENT '主键',
  `title` varchar(50) DEFAULT NULL COMMENT '推荐标题',
  `more_des` varchar(50) DEFAULT NULL COMMENT '“更多”文字描述',
  `type` int(50) DEFAULT NULL COMMENT '类型',
  `add_user` varchar(50) DEFAULT NULL COMMENT '添加人',
  `add_date` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`subject_head_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_subject_head` */

/*Table structure for table `t_user_info` */

DROP TABLE IF EXISTS `t_user_info`;

CREATE TABLE `t_user_info` (
  `user_id` varchar(50) NOT NULL COMMENT '用户信息表',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `phone` varchar(50) DEFAULT NULL COMMENT '手机',
  `sex` int(11) DEFAULT NULL COMMENT '1：男；0：女',
  `attachment_id` varchar(50) DEFAULT NULL COMMENT '附件表Id(外键)',
  `year_of_birth` varchar(50) DEFAULT NULL COMMENT '出生年',
  `ID_num` varchar(50) DEFAULT NULL COMMENT '身份证号码',
  `real_name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `registration_date` datetime DEFAULT NULL COMMENT '注册时间',
  `school` varchar(50) DEFAULT NULL COMMENT '所属学校',
  `shipping_address` varchar(50) DEFAULT NULL COMMENT '收获地址',
  `constellation` varchar(50) DEFAULT NULL COMMENT '星座',
  `blood_type` varchar(50) DEFAULT NULL COMMENT '血型',
  `head_portrait` varchar(200) DEFAULT NULL COMMENT '头像',
  `signature` varchar(200) DEFAULT NULL COMMENT '个性签名',
  `role_id` varchar(50) DEFAULT NULL COMMENT '角色Id',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_user_info` */

/*Table structure for table `tb_menu` */

DROP TABLE IF EXISTS `tb_menu`;

CREATE TABLE `tb_menu` (
  `dishes_id` varchar(50) NOT NULL COMMENT '菜品id',
  `dishes_name` varchar(50) DEFAULT NULL COMMENT '菜品编号',
  `dishes_synopsis` varchar(100) DEFAULT NULL COMMENT '菜品简介',
  `dishes_details` varchar(200) DEFAULT NULL COMMENT '菜单详情',
  `is_recommend` int(1) DEFAULT NULL COMMENT '是否推荐菜品:1.是;2.否;',
  `dishes_price` double DEFAULT NULL COMMENT '菜品价格',
  `add_user_id` varchar(50) DEFAULT NULL COMMENT '添加人id',
  PRIMARY KEY (`dishes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_menu` */

insert  into `tb_menu`(`dishes_id`,`dishes_name`,`dishes_synopsis`,`dishes_details`,`is_recommend`,`dishes_price`,`add_user_id`) values ('',NULL,NULL,NULL,10,NULL,NULL);

/*Table structure for table `tb_menu_details` */

DROP TABLE IF EXISTS `tb_menu_details`;

CREATE TABLE `tb_menu_details` (
  `menu_details_id` varchar(50) DEFAULT NULL COMMENT '菜单列表详情id',
  `order_id` varchar(50) DEFAULT NULL COMMENT '订单id',
  `dishes_id` varchar(50) DEFAULT NULL COMMENT '菜品id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_menu_details` */

/*Table structure for table `tb_order` */

DROP TABLE IF EXISTS `tb_order`;

CREATE TABLE `tb_order` (
  `order_id` varchar(50) NOT NULL COMMENT '订单id',
  `order_num` varchar(50) DEFAULT NULL COMMENT '订单编号',
  `table_id` varchar(50) DEFAULT NULL COMMENT '餐桌id',
  `menu_details_id` varchar(50) DEFAULT NULL COMMENT '菜单列表详情id',
  `order_status` int(11) DEFAULT NULL COMMENT '订单状态：1.已完成；0：未完成；',
  `person_num` int(11) DEFAULT NULL COMMENT '用餐人数',
  `waiter_id` varchar(50) DEFAULT NULL COMMENT '服务员id',
  `discount` double DEFAULT NULL COMMENT '折扣',
  `order_price` double DEFAULT NULL COMMENT '订单原价',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_order` */

/*Table structure for table `tb_picture_used_details` */

DROP TABLE IF EXISTS `tb_picture_used_details`;

CREATE TABLE `tb_picture_used_details` (
  `picture_used_details_id` varchar(50) NOT NULL COMMENT '图片使用详情',
  `content_id` varchar(50) DEFAULT NULL COMMENT '外键',
  `picture_id` varchar(50) DEFAULT NULL COMMENT '图片id',
  PRIMARY KEY (`picture_used_details_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_picture_used_details` */

insert  into `tb_picture_used_details`(`picture_used_details_id`,`content_id`,`picture_id`) values ('0bcdee5705184a6a9c81da75ecb7a1fa','e8fc109f3f844fdea06c01f2afa3b967','25bb39a2bc1a4de585d68edabc311a54'),('19980ae07e4d4bd3b770c18f27e52e1a','e353bae5264142bfb49a6eb79b90f3fa','0dbfda27cf094c02aca58ae635f2b888'),('22fad07b3fe44ed1a3011ef5a32cf087','e8fc109f3f844fdea06c01f2afa3b967','b05c835e0d264a949c7c3e52ad6292f2'),('25d30f6a0b184483bc8c0a87cac565c4','a08d4c14edc54af8a234ff93a3a8e537','97d98c0f12c148239ef0b098f8c7b088'),('3067385b97cd4c0ca70f2ce24dcf36db','401d011ff9734bdbb0122e5d4e20444c','c6f030c98b5d40c9ae133b7e6ecb51d3'),('4520993fd024497989e363569a174805','401d011ff9734bdbb0122e5d4e20444c','19113110f66b444b92ba3e2771159a56'),('4a4e30643919475f9337d19ea7d91705','e353bae5264142bfb49a6eb79b90f3fa','605d74a7d30c4f8e897c7e01bed36528'),('4e96d29c70e944ae97485f225cc7bcfd','a08d4c14edc54af8a234ff93a3a8e537','9794bd0aacd148488330b505d80ea7a8'),('4fd98b676161410fb87b97d6b8a0765a','d3c65ea42d594b6fb50e52a7589324e8','9a881152ae9942d0942d83d00d11ae55'),('885c7ac4538b4e11bcadcfc7543fd149','401d011ff9734bdbb0122e5d4e20444c','cd135b9745be49bf9f240cdab1590f4c'),('9c776a62506b47f7b7da44c2c6a82ec4','a08d4c14edc54af8a234ff93a3a8e537','e5a60fbf826b470095d3de5621973aa9'),('abbb51b39d074256bffb9712bc1cb8be','401d011ff9734bdbb0122e5d4e20444c','7634605b8a5c48818ba07572b4f84610'),('b34d6bf6c0094d47a46c7b4a7c8e82ac','e353bae5264142bfb49a6eb79b90f3fa','48574a34ffbf4c2f9e0cc48696939964'),('c0bd718168fa40b5bb20262b7d4347c8','e8fc109f3f844fdea06c01f2afa3b967','3c94b5b902a648d180c624c5f8ce599d'),('d1f9660ebae04e9b8323098d415e0ce3','d3c65ea42d594b6fb50e52a7589324e8','41199841bcb843d89f1f4e2c9f1f2fcd'),('eb64ddd544df474287b12e02b0637970','e8fc109f3f844fdea06c01f2afa3b967','7ad30e573772461aae121a47b5fa8bd2');

/*Table structure for table `tb_pictures` */

DROP TABLE IF EXISTS `tb_pictures`;

CREATE TABLE `tb_pictures` (
  `PICTURES_ID` varchar(100) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `NAME` varchar(255) DEFAULT NULL COMMENT '文件名',
  `PATH` varchar(255) DEFAULT NULL COMMENT '路径',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `MASTER_ID` varchar(255) DEFAULT NULL COMMENT '属于',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`PICTURES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_pictures` */

insert  into `tb_pictures`(`PICTURES_ID`,`TITLE`,`NAME`,`PATH`,`CREATETIME`,`MASTER_ID`,`BZ`) values ('0dbfda27cf094c02aca58ae635f2b888','图片','3a351ce0a4674ca4830fa4e94bef7363.jpg','20170322/3a351ce0a4674ca4830fa4e94bef7363.jpg','2017-03-22 12:23:50','1','图片管理处上传'),('25bb39a2bc1a4de585d68edabc311a54','图片','d38cb3d31b62498dab608f279fa5939d.jpg','20170322/d38cb3d31b62498dab608f279fa5939d.jpg','2017-03-22 13:40:27','1','图片管理处上传'),('3c94b5b902a648d180c624c5f8ce599d','图片','3dc456cbf37549319856f064f6051c8b.jpg','20170322/3dc456cbf37549319856f064f6051c8b.jpg','2017-03-22 13:40:28','1','图片管理处上传'),('48574a34ffbf4c2f9e0cc48696939964','图片','f3ab24268a9f4117856030449eba014e.jpg','20170322/f3ab24268a9f4117856030449eba014e.jpg','2017-03-22 12:39:43','1','图片管理处上传'),('605d74a7d30c4f8e897c7e01bed36528','图片','61b7378e906b4ece97bc246f5971ae35.jpg','20170322/61b7378e906b4ece97bc246f5971ae35.jpg','2017-03-22 12:33:30','1','图片管理处上传'),('9794bd0aacd148488330b505d80ea7a8','图片','84929faba8be44438f808f07ca303b38.jpg','20170322/84929faba8be44438f808f07ca303b38.jpg','2017-03-22 12:36:43','1','图片管理处上传'),('97d98c0f12c148239ef0b098f8c7b088','图片','a027be3b553f4d6faf6abe9d12992222.jpg','20170322/a027be3b553f4d6faf6abe9d12992222.jpg','2017-03-22 12:36:42','1','图片管理处上传'),('a433edb24d6b4995af5a426aef2510cb','图片','1763b33825cd4a269253e3179aee7df0.jpg','20161117/1763b33825cd4a269253e3179aee7df0.jpg','2016-11-17 23:00:42','1','图片管理处上传'),('b05c835e0d264a949c7c3e52ad6292f2','图片','35284645b0b3435284c78932a8ba8073.jpg','20170322/35284645b0b3435284c78932a8ba8073.jpg','2017-03-22 13:40:28','1','图片管理处上传'),('c60bc8e708bb46499cc0cb80a3f7a0c5','图片','e1a543a66bdb44c28d6b1fd7ec4c9af0.jpg','20170322/e1a543a66bdb44c28d6b1fd7ec4c9af0.jpg','2017-03-22 12:21:28','1','图片管理处上传'),('cd135b9745be49bf9f240cdab1590f4c','图片','1fbd140878aa4d96ab0c055fcd16b2f9.jpg','20170322/1fbd140878aa4d96ab0c055fcd16b2f9.jpg','2017-03-22 12:02:22','1','图片管理处上传'),('e5a60fbf826b470095d3de5621973aa9','图片','0e2521a23d03466380f71a6fefbdd3bb.jpg','20170322/0e2521a23d03466380f71a6fefbdd3bb.jpg','2017-03-22 12:36:43','1','图片管理处上传');

/*Table structure for table `tb_table` */

DROP TABLE IF EXISTS `tb_table`;

CREATE TABLE `tb_table` (
  `table_id` varchar(50) NOT NULL COMMENT '餐桌id',
  `table_num` varchar(50) DEFAULT NULL COMMENT '餐桌编号',
  `table_volume` int(11) DEFAULT NULL COMMENT '餐桌座位个数',
  `table_status` int(11) DEFAULT NULL COMMENT '餐桌状态',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_table` */

/*Table structure for table `weixin_command` */

DROP TABLE IF EXISTS `weixin_command`;

CREATE TABLE `weixin_command` (
  `COMMAND_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `COMMANDCODE` varchar(255) DEFAULT NULL COMMENT '应用路径',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(1) NOT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`COMMAND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `weixin_command` */

insert  into `weixin_command`(`COMMAND_ID`,`KEYWORD`,`COMMANDCODE`,`CREATETIME`,`STATUS`,`BZ`) values ('2636750f6978451b8330874c9be042c2','锁定服务器','rundll32.exe user32.dll,LockWorkStation','2015-05-10 21:25:06',1,'锁定计算机'),('46217c6d44354010823241ef484f7214','打开浏览器','C:/Program Files/Internet Explorer/iexplore.exe','2015-05-09 02:43:02',1,'打开浏览器操作'),('576adcecce504bf3bb34c6b4da79a177','关闭浏览器','taskkill /f /im iexplore.exe','2015-05-09 02:36:48',2,'关闭浏览器操作'),('854a157c6d99499493f4cc303674c01f','关闭QQ','taskkill /f /im qq.exe','2015-05-10 21:25:46',1,'关闭QQ'),('ab3a8c6310ca4dc8b803ecc547e55ae7','打开QQ','D:/SOFT/QQ/QQ/Bin/qq.exe','2015-05-10 21:25:25',1,'打开QQ');

/*Table structure for table `weixin_imgmsg` */

DROP TABLE IF EXISTS `weixin_imgmsg`;

CREATE TABLE `weixin_imgmsg` (
  `IMGMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(11) NOT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `TITLE1` varchar(255) DEFAULT NULL COMMENT '标题1',
  `DESCRIPTION1` varchar(255) DEFAULT NULL COMMENT '描述1',
  `IMGURL1` varchar(255) DEFAULT NULL COMMENT '图片地址1',
  `TOURL1` varchar(255) DEFAULT NULL COMMENT '超链接1',
  `TITLE2` varchar(255) DEFAULT NULL COMMENT '标题2',
  `DESCRIPTION2` varchar(255) DEFAULT NULL COMMENT '描述2',
  `IMGURL2` varchar(255) DEFAULT NULL COMMENT '图片地址2',
  `TOURL2` varchar(255) DEFAULT NULL COMMENT '超链接2',
  `TITLE3` varchar(255) DEFAULT NULL COMMENT '标题3',
  `DESCRIPTION3` varchar(255) DEFAULT NULL COMMENT '描述3',
  `IMGURL3` varchar(255) DEFAULT NULL COMMENT '图片地址3',
  `TOURL3` varchar(255) DEFAULT NULL COMMENT '超链接3',
  `TITLE4` varchar(255) DEFAULT NULL COMMENT '标题4',
  `DESCRIPTION4` varchar(255) DEFAULT NULL COMMENT '描述4',
  `IMGURL4` varchar(255) DEFAULT NULL COMMENT '图片地址4',
  `TOURL4` varchar(255) DEFAULT NULL COMMENT '超链接4',
  `TITLE5` varchar(255) DEFAULT NULL COMMENT '标题5',
  `DESCRIPTION5` varchar(255) DEFAULT NULL COMMENT '描述5',
  `IMGURL5` varchar(255) DEFAULT NULL COMMENT '图片地址5',
  `TOURL5` varchar(255) DEFAULT NULL COMMENT '超链接5',
  `TITLE6` varchar(255) DEFAULT NULL COMMENT '标题6',
  `DESCRIPTION6` varchar(255) DEFAULT NULL COMMENT '描述6',
  `IMGURL6` varchar(255) DEFAULT NULL COMMENT '图片地址6',
  `TOURL6` varchar(255) DEFAULT NULL COMMENT '超链接6',
  `TITLE7` varchar(255) DEFAULT NULL COMMENT '标题7',
  `DESCRIPTION7` varchar(255) DEFAULT NULL COMMENT '描述7',
  `IMGURL7` varchar(255) DEFAULT NULL COMMENT '图片地址7',
  `TOURL7` varchar(255) DEFAULT NULL COMMENT '超链接7',
  `TITLE8` varchar(255) DEFAULT NULL COMMENT '标题8',
  `DESCRIPTION8` varchar(255) DEFAULT NULL COMMENT '描述8',
  `IMGURL8` varchar(255) DEFAULT NULL COMMENT '图片地址8',
  `TOURL8` varchar(255) DEFAULT NULL COMMENT '超链接8',
  PRIMARY KEY (`IMGMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `weixin_imgmsg` */

insert  into `weixin_imgmsg`(`IMGMSG_ID`,`KEYWORD`,`CREATETIME`,`STATUS`,`BZ`,`TITLE1`,`DESCRIPTION1`,`IMGURL1`,`TOURL1`,`TITLE2`,`DESCRIPTION2`,`IMGURL2`,`TOURL2`,`TITLE3`,`DESCRIPTION3`,`IMGURL3`,`TOURL3`,`TITLE4`,`DESCRIPTION4`,`IMGURL4`,`TOURL4`,`TITLE5`,`DESCRIPTION5`,`IMGURL5`,`TOURL5`,`TITLE6`,`DESCRIPTION6`,`IMGURL6`,`TOURL6`,`TITLE7`,`DESCRIPTION7`,`IMGURL7`,`TOURL7`,`TITLE8`,`DESCRIPTION8`,`IMGURL8`,`TOURL8`) values ('380b2cb1f4954315b0e20618f7b5bd8f','首页','2015-05-10 20:51:09',1,'图文回复','图文回复标题','图文回复描述','http://a.hiphotos.baidu.com/image/h%3D360/sign=c6c7e73ebc389b5027ffe654b535e5f1/a686c9177f3e6709392bb8df3ec79f3df8dc55e3.jpg','www.baidu.com','','','','','','','','','','','','','','','','','','','','','','','','','','','','');

/*Table structure for table `weixin_textmsg` */

DROP TABLE IF EXISTS `weixin_textmsg`;

CREATE TABLE `weixin_textmsg` (
  `TEXTMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '内容',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(2) DEFAULT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TEXTMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `weixin_textmsg` */

insert  into `weixin_textmsg`(`TEXTMSG_ID`,`KEYWORD`,`CONTENT`,`CREATETIME`,`STATUS`,`BZ`) values ('695cd74779734231928a253107ab0eeb','吃饭','吃了噢噢噢噢','2015-05-10 22:52:27',1,'文本回复'),('d4738af7aea74a6ca1a5fb25a98f9acb','关注','这里是关注后回复的内容','2015-05-11 02:12:36',1,'关注回复');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
