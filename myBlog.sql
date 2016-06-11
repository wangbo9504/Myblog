/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.6.26 : Database - myblog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`myblog` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `myblog`;

/*Table structure for table `blog` */

DROP TABLE IF EXISTS `blog`;

CREATE TABLE `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `summary` varchar(400) DEFAULT NULL,
  `releaseDate` datetime DEFAULT NULL,
  `content` text,
  `typeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `typeId` (`typeId`),
  CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`typeId`) REFERENCES `blogtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `blog` */

insert  into `blog`(`id`,`title`,`summary`,`releaseDate`,`content`,`typeId`) values (1,'Java面向对象面试指导','Java 的核心是面向对象编程，所有的java程序都是面向对象的。需要看清Java的本质，从复杂的表象中寻找普遍的规律，并深刻理解Java的核心思想.','2016-03-01 14:49:13','    一般的类是不能用private修饰，类的可见性最少是包可见的，也就是默认的，不加任何修饰。\r\n但是有一种特殊的情况请你一定要记住，内部类是可以用private修饰的！不让类以外的其他类访问！\r\n\r\n    java变量分为成员变量和局部变量.\r\n\r\n    成员变量指类中隔离在方法之外的，存储在堆中，它在类中的各个部分都可以访问到.而成员变量又分为实例变量和类变量(静态变量).实例变量指没有用static修饰的成员变量，他的生命周期跟创建它的对象一样.而类变量指被static修饰的成员变量，它的最本质特点是：它是类的域，不属于任何一个类的具体对象实例,生命周期与类本身一样，是最长的.\r\n\r\n     局部变量指在方法和程序块中创建的，存储在栈中，它的作用域只在创建它的方法体重，在方法调用完毕后就会销毁.所以也不存在访问控制符,不能声明为静态变量，但可以声明为final变量.\r\n\r\n    this变量用在一个方法内部，指向当前对象，当前对象指的是调用当前正在执行的方法的那个对象.super直接指向父类的构造方法，用来引用父类种的变量和方法.\r\n\r\n    java中如果要引用一个包中的多个类，可以用*号代替，使用*号只能表示本层次的所有类，而不包括子层次下的类，经常需要两条语句来引入两个层次的类:\r\nimport java.awt.*;\r\nimport java.awt.event.*;\r\n\r\n    关于访问修饰符:\r\n类中限定为public的成员可以被所有的类访问.\r\n类中限定为private的成员只能被这个类本身访问.\r\n类中限定为protected的成员可以被这个类本身，它的子类以及同一个包下的其他类访问.\r\n类中限定为private protected修饰的成员可以被该类本身以及它的子类访问到.\r\n默认访问控制符规定只能被同一个包中的类访问和引用，不能被其他包的类访问.\r\n\r\n    abstract类中不能有private修饰的域和方法，abstract类只能被继承而不能被实例化.\r\n\r\n    在java中，一个类获取某一接口定义的功能不是通过直接继承这个接口的属性和方法来实现的，因为接口中的属性都是常量，接口的方法都是没有方法体的抽象方法，没有具体定义操作.\r\n通俗的讲，你认为是要变化的东西，就放在你自己的实现中，不能放在接口中去，接口只是对一类事物的属性和行为更高层次的抽象.对修改关闭，对扩展（不同的实现implements）开放,接口是对开闭原则的一种体现。\r\n\r\n    java接口与抽象类的区别：\r\n1.Java接口和Java抽象类最大的区别就在于Java抽象类可以提供某些方法的部分实现,也可以有没有具体实现的抽象方法，而java接口只能提供方法签名(返回类型及参数列表).如果像一个抽象类里加入一个新的具体方法，那么它所有的子类都一下子得到了这个新的方法，而Java接口做不到这点，如果像Java接口添加一个新的方法，那它的所有实现类就不能通过编译了，因为你必须让每一个实现类都实现了这个方法才行，这也是借口的缺点.\r\n2.一个抽象类的实现只能由这个抽象类的子类给出，由于Java的单继承性，使得抽象类作为类型定义工具的效果大打折扣.在这一点上，接口的优势就出来了，任何一个实现了一个Java接口所规定方法的类都可以具有这个接口的类型，而一个类可以实现多个接口，从而这个类就有了多个类型，所以Java接口是定义混合类型的理想工具\r\n\r\n    用自己的语言描述面向对象的特征：\r\n1.抽象 抽象就是忽略一个主题中与当前目标无关的方面，以便更充分的注意到与当前目标有关的方面.抽象并不打算了解全部问题，而只是选择其中的一部分，暂时不用部分细节.抽象包括两个方面，第一是过程抽象，第二是数据抽象.\r\n\r\n2.继承 继承是一种连接类的层次模型，并支持和鼓励类的重用，它提供了一个明确的表述性方法，对象的一个新类可以从现有的类中派生.新类继承了原始类的特征，叫做原始类的派生类，而原始类叫做基类，子类可以从基类哪里继承方法和实力变量，并且可以修改和增加新的方法，使其更适合特殊的需要.\r\n\r\n3.封装 封装是把过程和数据包围起来，对数据的访问只能通过已定义的接口，面向对象计算始于这个基本概念，即现实世界可以被描绘为一系列完全自制、封装的对象，这些对象通过一个受保护的接口访问其他对象.\r\n\r\n4.多态 多态是指允许不同类的对象对同一消息做出响应，多态性包括参数化多态性和包含多态性，多态性语言具有灵活，抽象，行为共享，代码共享的优势，很好的解决了应用程序函数同名的问题.\r\n\r\nOverload和Override的区别\r\n	方法的重载Overload与重写Override是Java多态性的不同表现.重载Overload是一个类中多态性的一种表现，而重写Override是父类与子类之间多态性的一种表现.如果在子类中定义某方法与父类的某方法有相同的名称和参数，则称该方法被重写，子类的对象在调用这个方法时将使用子类的定义，对它而言，父类的定义如同被屏蔽了.而如果在一个类中定义了多个同名的方法，他们有不同的参数(个数或类型),则称为方法的重载.\r\n\r\n\r\n   当一个对象被当作参数传递到一个方法后，此方法可以改变这个对象的属性，并可返回变化后的结果，那么这里是值传递还是引用传递\r\n\r\n答：是值传递.Java中只有值传递参数，当一个对象实例作为一个参数被传递到方法中时，参数的值就是该对象的引用副本.指向同一个对象，对象的内容可以在被调用的方法中改变，但对象的引用是永远不会变的，如果在方法中将传递过来的引用赋给新创建的对象，引用就会失效.\r\n    Java中参数传递的都是值,对应基本类型,传递的是原值的拷贝;对于类类型,传递的是引用即地址的拷贝.对于函数对参数的改变是否会影响原值的问题:值类型自然不会影响到原值.而对于类类型要看改变的是参数的地址还是值,如果是前者,参数和原引用指向了不同的地址,它们自然脱离了关系;如果是后者,修改的实例就是原引用指向的实例,这当然对原值进行了修改	详见:http://blog.csdn.net/jackson__qi/article/details/7982762\r\n\r\n    父类中是静态方法，子类中不能覆盖为非静态方法.\r\n\r\n    native用来声明本地方法,由于Java无法直接访问到操作系统底层(如系统硬件等),为此Java使用native方法来扩展,该方法的实现由非java语言来实现，例如C/C++.native一般不可以与abstract连用.\r\nsynchronized用于防止多线程同时调用一个对象的方法，所以使用该方法的前提是可以被直接调用，显然也能不与abstract连用\r\n\r\n   接口是否可继承接口?抽象类是否可以实现接口?抽象类是否可以继承实体类?\r\n答:接口可以继承接口，抽象类也可以实现接口，抽象类也可以继承实体类，但前提是实体类必须有明确的构造函数.\r\n',1),(2,'Mysql初级面试指导','以下的文章主要是对MySQL数据库的一些基础知识的简单介绍,随着MySQL数据库的广泛应用,其相关的知识也随着受到重视.具体分为Mysql初级必会知识点、JDBC必会知识点、Mysql与JDBC知识点精华、Mysql与JDBC面试案例','2016-04-01 14:51:10','一、Mysql初级必会知识点\r\n   \r\n   Mysql数据库的安装、配置和使用\r\n\r\n   Mysql账号的管理\r\n\r\n   创建、删除、修改数据表\r\n\r\n   数据表的索引\r\n	普通索引 添加index\r\n	alter table 表名 add index index_name (\'column\')\r\n	主键索引 添加primary key\r\n	alter table 表名 add primary key (\'column\')\r\n	唯一索引 添加unique\r\n	alter table 表名 add unique (\'column\')\r\n	全文索引 添加fulltext\r\n	alter table 表名 add fulltext (\'column\')\r\n	添加多列索引\r\n	alter table 表名 add index index_name(`column1`,`column2`,`column3`)\r\n\r\n   SQL语句的基本使用\r\n	(SQL的增删改查基本操作)\r\n	(SQL的条件查询)\r\n	(查询中的Order by)\r\n	(查询中的group by和having子句)\r\n	(子查询)\r\n\r\n   Mysql常用内置函数\r\n   \r\n\r\n二、JDBC必会知识点\r\n\r\n   JDBC的主要API\r\n	(Driver)负责与数据库建立连接\r\n	(DriverManage)负责管理驱动程序\r\n	(Connection)负责创建与数据库间的会话，不管执行什么操作都必须先建立连接\r\n	(Statement)用于执行SQL语句\r\n	(PrepareStatement)用于执行可以预置的SQL语句\r\n	(ResultSet)表示查询的结果集合\r\n	(DataSource)它是数据源，用于获取数据连接池的连接\r\n   \r\n   JDBC连接数据库的过程\r\n\r\n   JDBC结果集的操作\r\n\r\n   JDBC的批处理\r\n\r\n   JDBC的事务\r\n\r\n三、Mysql与JDBC知识点精华\r\n\r\n管理数据库命令:\r\n    1、查看数据库\r\n  	show databases;\r\n    2、创建数据库\r\n  	create database 数据库名 (default character set utf8);\r\n    3、使用数据库\r\n        use 数据库名;\r\n    4、删除数据库\r\n	drop database 数据库名;\r\n数据表管理命令\r\n    1、创建表\r\n	create table <表名> (<字段名1> <类型1> [,..<字段名n> <类型n>]);\r\n    2、修改，添加，删除字段，字段改名，修改字段排序，更改表名.\r\n	alter table 表名 modify 需要修改的字段 修改的类型;\r\n	alter table 表名 add 需要添加的新字段名 字段类型;\r\n	alter table 表名 drop 需要删除的字段名;\r\n	alter table 表名 change 原来的字段名 新的字段名 新的字段名类型;\r\n	alter table 表名 modify|add|字段名 字段类型 first|after 字段名;\r\n	alter table 原数据表名 rename 新数据表明;\r\n    	所以凡是以修改表信息相关的命令，都是以alter table开头\r\n    3、创建有索引的表\r\n	create index 索引名 on 表名(列表); 或者 create table 表名 (index index1(id,name));\r\n    4、插入数据\r\n	insert into 表名 (列表名) values(要插入的数据);或者insert into 表名 set 列表1=数据，列表2=数据;\r\n    5、更新数据\r\n	update 表名 set 列表1=数据1,列表2=数据2,...[where clause];\r\n    6、删除数据\r\n	delete from 表名 [where clause];\r\n    7、查询数据\r\n	select 要查询的列名 form 表名 [where clause];\r\n    9、为已经添加好的数据表添加外键:\r\n	alter table 表名 add constraint 外键名 foreign key(你的外键字段名) references 外表表名(外表的主键字段名)\r\n    10、删除外键\r\n	alter table 表名 drop foreign key 外键名\r\n\r\nJDBC连接数据库的基本过程\r\n    1、加载驱动对象\r\n    2、创建连接对象\r\n    3、创建语句对象\r\n    4、编写SQL语句\r\n    5、使用语句对象执行SQL语句\r\n    6、如果有结果集对结果集进行处理\r\n    7、关闭结果集对象(如果有)，关闭语句对象，关闭连接对象.\r\n\r\nJDBC事务相关的知识点\r\n    事务是访问并可能更新数据库中各种数据项的一个程序执行单元\r\n    事务的四要素:\r\n    1、原子性:事务在完成时，必须使所有的数据都保持一致状态，而且在相关的数据中，所有规则都应该应用于事务的修改，以保持所有数据的完整性。事务结束时，所有的内部数据结构都应该是正确的.\r\n    2、一致性:将事务中所做的操作捆绑成一个原子单元，即对于事务所进行的数据修改等操作，要么全部执行，要么全部不执行.\r\n    3、隔离性:由并发事务所做的修改必须与其他事务所做的修改相隔离.事务查看数据时数据所处的状态，要么是被另一并发事务修改之前的状态，要么是被另一并发事务修改之后的状态，即事务不会查看由另一个并发事务正在修改的数据。这种隔离方式也叫可串行性.\r\n    4、持久性意味着当前系统或介质发生故障时，确保已提交事务的更新不能丢失.即一旦一个事务提交，DBMS保证它对数据库中数据的改变应该是永久性的，耐得住任何系统故障。持久性通过数据库备份和恢复来保证.\r\n数据库事务相关的命令:\r\n    1、start transaction开启事务\r\n    2、rollback回滚事务\r\n    3、Commit提交事务\r\n\r\n创建JDBC事务的步骤\r\n    1、设置事务的提交方式为非自动提交：conn.setAutoCommit(false);\r\n    2、将需要添加事务的代码放入try,catch块中.\r\n    3、在try块中添加事务的提交操作，表示操作无异常，提交事务:coon.commit();\r\n    4、在catch块内添加回滚事务，表示操作出现异常，撤销事务:coon.rollback();\r\n    5、在finally块中释放资源，断开连接:coon.close();\r\n\r\n四、Mysql与JDBC面试案例\r\n    1、在MySQL数据库中记录货币用什么字段好?\r\n答:使用NUMERIC和DECIMAL类型.这两种类型可以被用于保存对准确性和精度要求比较高的值，例如与货币有关的数据.当时用这两种类型声明一个数据表字段是，可以指定数据的精度和规模.例如:\r\n	salary DECIMAL(9,2)---->整数9位，小数2位\r\n	DECIMAL和NUMERIC的值是作为字符串存储的，而不是二进制的浮点数，这样做的好处是可以保存精度比较高的小数部分.DECIMAL和DECIMAL值得最大范围和double一样.\r\n    \r\n    2、请简述项目中优化SQL语句执行效率的方法.\r\n答:<1>.尽量选择较小的列\r\n   <2>.将where中用的比较频繁的字段建立索引\r\n   <3>.select子句中避免使用*\r\n   <4>.避免在索引列上使用计算,not,in和<、>等操作\r\n   <5>.当只需要一行数据的时候使用limit 1\r\n   <6>.保证表单数据不超过200w，适时分割表\r\n    \r\n    3、事务是什么(上面有提到过)\r\n    \r\n    4、在Java中如何创建一个JDBC连接？\r\n答:创建JDBCl连接很简单，只需要两步:\r\n   <1>.注册并加载驱动:使用Class.forName(),驱动类就会注册到DriverManager里面并加载到内存里.\r\n   <2>.用DriverManager获取连接对象:调用DriverManager.getConnection()方法并传入数据库连接的URL,用户名以及密码,就能获取到连接对象.\r\n\r\n    5、Result的特点以及有哪些不同的ResultSet?\r\n答:<1>.ResultSer表示数据库结果集的数据表，通常通过执行查询数据库的语句生成.ResultSet对象具有指向其当前数据行的光标.最初,光标被置于第一行之前.next 方法将光标移动到下一行;因为该方法在 ResultSet对象没有下一行时返回 false,所以可以在 while 循环中使用它来迭代结果集.\r\n   <2>.一共有三种ResultSet对象.\r\n	ResultSet.TYPE_FORWARD_ONLY:这是默认的类型,该常量指示光标只能向前移动的 ResultSet 对象的类型\r\n	ResultSet.TYPE_SCROLL_INSENSITIVE:该常量指示可滚动但通常不受 ResultSet 底层数据更改影响的 ResultSet 对象的类型.\r\n	ResultSet.TYPE_SCROLL_SENSITIVE:该常量指示可滚动并且通常受 ResultSet 底层数据更改影响的 ResultSet 对象的类型.\r\n	更改ResultSet对象类型(同时至少要更改并发性(只读类型和可写类型))的操作在createStatement(int resultType,int resultSetConcurrency)中进行.\r\n\r\n   6、常见的JDBC异常有哪些?\r\n答:有以下这些:\r\n   <1>.java.sql.SQLException:这是JDBC异常的基类\r\n   <2>.java.sql.BatchUpdateException:当批处理操作执行失败的时候可能会抛出这个异常.\r\n   <3>.java.sql.SQLWarning:SQL操作出现的警告信息.\r\n   <4>.java.sql.DataTruncation:字段值由于某些非正常原因被截断了\r\n\r\n\r\n加:单纯的JDBC开发过程\r\n	//数据库连接\r\n	Connection connection = null;\r\n	//预编译的Statement，可以提高数据库性能(查询后放入缓存)\r\n	PrepareStatement prepareStatement = null;\r\n	//结果集\r\n	ResultSet resultSet = null;\r\n	try {\r\n		//加载数据库驱动\r\n		Class.forName(\"com.mysql.jdbc.Driver\");\r\n		//通过驱动管理类获取连接\r\n		connection = DriverManage.getConnection(\"url\",\"username\",\"password\");\r\n		//编写Sql语句\r\n		String sql = \"select * from user where username = ?\";\r\n		//将Sql语句放入预编译Statement中\r\n		prepareStatement = connection.prepareStatement(sql);\r\n		//填入占位符处的参数\r\n		prepareStatement.setString(1,\"王五\");\r\n		//执行Sql语句获取结果集\r\n		resultSet = prepareStatement .excute();\r\n		//遍历结果集\r\n		while(resultSet.next()) {\r\n			String id = resultSet.getString(\"id\");\r\n			String username = resultSet.getString(\"username\");\r\n			System.out.println(\"id :\"+id+\" \"+\"username :\"+username);\r\n		}\r\n	}catch (Exception e) {\r\n		e.printStackTrace();\r\n	}finally {\r\n		//释放资源(倒着释放)\r\n		if(resultSet!=null) {\r\n			try{\r\n				resultSet.close();\r\n			} catch(SQLException e) {\r\n				e.printStackTrace();\r\n			}\r\n		}\r\n		if(prprepareStatement!=null) {\r\n			try{\r\n				prprepareStatement.close();\r\n			} catch(SQLException e) {\r\n				e.printStackTrace();\r\n			}\r\n		}\r\n		if(connection=null) {\r\n			try{\r\n				connection.close();\r\n			} catch(SQLException e) {\r\n				e.printStackTrace();\r\n			}\r\n		}\r\n	}\r\n\r\n\r\n原生态JDBC程序中问题总结:\r\n	1、数据库连接，使用时就创建，不使用立即释放，对数据库进行频繁的连接开启和关闭，造成数据库资源浪费，影响数据库性能。\r\n	设想:使用数据库连接池管理数据库连接\r\n\r\n	2、将Sql语句硬编码到java代码中，如果要修改Sql语句，需要重新编译java代码，不利于系统维护\r\n	设想:将Sql语句配置在xml配置文件中，即使Sql语句产生变化，也不需要进行重新编译	\r\n\r\n	3、在向Statement中设置参数时，对占位符的位置和设置参数值，硬编码在java代码中，不利于系统维护\r\n	设想:将Sql语句及占位符和参数全部配置在xml中.\r\n\r\n	4、从resultSet中遍历结果集数据时，存在硬编码，将获取表的字段进行硬编码，不利于系统维护\r\n	设想:将查询的结果集自动映射成java对象',2),(3,'Servlet与Jsp面试指导','Servlet 是 Server Applet 的缩写，也称为服务端小程序。Servlet 技术一直处于不断的发展及进步之中，现在已经成为很多框架的技术基础，比如 Spring、Struts2 等，这里罗列了一些基础的Servlet知识点','2016-05-01 15:47:50','一、JSP与Servlet必会知识点\r\n   JSP知识点:JSP是一种Java服务器端技术，它用于在网页上显示动态内容.\r\n   \r\n   	Tomcat相关知识(基本配置、目录结构)\r\n   \r\n   	JSP的执行过程\r\n\r\n   	JSP的页面构成元素(静态Html元素、指令、表达式、声明、动作、注释等)\r\n\r\n   	JSP的注释\r\n\r\n   	静态和动态include\r\n\r\n   	JSP标准标签库\r\n\r\n   	JSP的九大内置对象:\r\n		jsp内置对象,是指可以不加声明和创建就可以在JSP页面脚本(Java程序片和Java表达式)中使用的成员变量.\r\n	\r\n		Out:一个缓冲的输出流,向客户端输出内容\r\n		Page:当前JSP页面本身,有点像类中的this指针,它是java.lang.Obejct类的实例\r\n		request:提取浏览器提交的信息\r\n		response:服务器对客户的请求做出响应，向客户端发送数据\r\n		session:会话对象，指客户端与服务器的一次会话\r\n		application:实现了用户间数据的共享，可存放全局变量,它开始于服务器的启动，直到服务器的关闭.\r\n		PageContext:JSP页面的上下文对象，提供了对JSP页面内所有对象及名字空间的访问\r\n		config:该对象是在一个Servlet初始化时，JSP引擎向它传递信息用的,此信息包括Servlet初始化时所要用到的参数(通过属性名和属性值构成)以及服务器的有关信息(通过传递一个ServletContext对象).\r\n		exception:是Throwable的实例,表示的是JSP的异常信息\r\n   \r\n   Servlet知识点:Servlet是基于Http的，运行在Web服务器端的小程序，用来接受来自网络的请求并作出相应\r\n\r\n	EL表达式\r\n	\r\n	JavaBean\r\n\r\n	Servlet生命周期\r\n\r\n	Javax.servlet.jsp.tagext包中的类\r\n\r\n	Session与Cookie\r\n\r\n	XML的基本概念与使用方法\r\n\r\n	MVC的处理过程\r\n		首先控制器(C)接收用户的请求，并绝对该用哪个模型(M)进行处理\r\n		调用模型来处理用户的请求，并返回相应的数据\r\n		控制器用相应的视图显示模型返回的数据，并通过浏览器呈现给用户\r\n\r\n二、JSP与Servlet知识点精华\r\n   GET与POST请求的区别\r\n	从安全性上看GET弱于POST(因为GET提交的数据会在浏览器地址栏显示)\r\n	\r\n	从提交内容大小看GET弱于POST(GET提交的数据不能大于2KB，而POST在理论上没有限制(但在实际编程中建议不要大于64K))\r\n\r\n	从请求的速度上看GET强于POST(GET要求服务器立刻处理请求，POST可能会形成一个队列请求)\r\n\r\n	GET调用doGet方法，POST调用doPost方法\r\n\r\n   Session与Cookie的区别\r\n	Session将信息保存在服务器上，而Cookie保存在客户端上\r\n	\r\n	Session比Cookie更安全，但Session比Cookie更占资源\r\n\r\n	Session使用了Cookie的机制，当Cookie被禁用时，则Session也无法使用，因为客户端的SessionID以Cookie形式保存在客户端的内存中，这时我们可以通过URL的重写来保证Session的有效性,即写超链接的时侯，总是用response.encodeURL(url)，连接就会变成*.jsp?sessionID=......，完成了原来用cookie完成的功能.\r\n\r\n	Session是存在服务器端，通过SessionID把数据保存在客户端\r\n\r\n	Session用Cooike保存客户端数据，所以Session是依赖于Cookie的\r\n\r\n	Cookie只能存String类型的数据，而Session可以存Object类型和简单数据类型的数据\r\n   \r\n   Servlet的生命周期\r\n	Servlet声明全过程依次为:\r\n		加载\r\n		实例化\r\n		初始化\r\n		处理请求\r\n		退出服务\r\n	当客户端第一次像Web服务器发送一个Servlet请求时，Web服务器将会创建一个getServlet的实例，并且调用Servlet的init方法，如果服务器已经存在了一个Servlet实例，那么将会直接使用这个实例，然后调用service方法，service方法将会根据客户端的请求方式来决定掉用对应的do..方法，当Servlet从Web服务器删除的时候，Web服务器将调用destroy方法.\r\n\r\n   Servlet上下文对象(ServletContext)\r\n	它是一个公共区域，可以被所有的客户端共享\r\n	setAttribute():向公共区域里放入数据\r\n	getAttribute():从公共区域里取得数据\r\n\r\n三、JSP与Servlet面试案例\r\n\r\n   1、JSP有哪些内置对象?作用分别是什么?(上面有提到)   \r\n\r\n   2、JSP有哪些动作?作用分别是什么?\r\n	<1>jsp有六种基本动作\r\n		jsp:include  在页面被请求的时候引入一个动态或静态的页面(静态页面则直接包含，动态页面则先处理各自资源，之后再将处理过的结果包含在一起)\r\n		jsp:useBean  寻找或者实例化一个JavaBean.\r\n		jsp:setProperty  设置JavaBean的属性\r\n		jsp:getProperty  输出某个JavaBean的属性\r\n		jsp:forward  把请求转到一个新的页面\r\n		jsp:plugin  根据浏览器类型为Java插件生成Object或Embed标记\r\n\r\n   3、JSP中动态include与静态include的区别?\r\n	<1>动态include用jsp:include动作实现，它总是会检查所包含文件中的变化，适合用户包含动态页面，并且可以带参数.例如：\r\n		<jsp:include page=\"include.jsp\" flush=\"true\" />\r\n	<2>静态include用include伪码实现，不会检查所含文件的变化，用于包含静态页面.例如:\r\n		<%@ include=\"included.htm\" %>\r\n   \r\n   4、include指令与include动作的区别?\r\n	答:include指令是编译时语法，也就是在编译的时候，把指令所指向的目标文件的内容拷贝到指令所在的位置，替换指令，最终形成一个文件，在运行的时候只有一个文件.	\r\n        而include动作是运行时语法，包含<jsp:include>动作的文件在执行到这个标签的时候，会转向执行标签所指向的目标文件，执行完目标文件后，再接着执行标签后的内容，在运行的时候，涉及到两个文件，就像方法调用一样.\r\n	当一段代码确定会执行的时候用<%@ include%>，当一段代码可能会执行的时候，使用<jsp:include>.\r\n\r\n   5、Servlet与JSP有什么区别?\r\n	答:<1>jsp经过编译后就是Servlet，也可以说jsp等于Servlet.\r\n	<2>jsp更擅长页面表现，servlet更擅长逻辑编辑(最核心区别)\r\n	<3>在实际应用中采用Servlet来控制业务流程，而采用jsp来生成动态页面.在Struts框架中，Jsp位于MVC设计模式的视图层，而servlet位于控制层.',3),(4,'Mybatis原理及常见易混淆知识点','Mybatis是什么?Mybatis是一个持久层框架，是apache下的顶级项目，目前托管在了github上,Mybatis让程序将主要精力放在sql上，通过mybatis提供的映射方式，自由灵活的生成(半自动化)满足需求的sql语句','2016-06-11 16:47:44','Mybatis原理:\r\n1、Mybatis是什么?\r\n	Mybatis是一个持久层框架，是apache下的顶级项目，目前托管在了github上\r\n	Mybatis让程序将主要精力放在sql上，通过mybatis提供的映射方式，自由灵活的生成(半自动化)满足需求的sql语句\r\n	Mybatis可以将向prepareStatement中的输入参数自动进行输入映射，将查询结果集灵活映射成java对象(输出映射)\r\n\r\n\r\n2、Mybatis框架\r\n	SqlMapConfig.xml(是mybatis的全局配置文件)，配置了数据源、事务等mybatis运行环境,配置映射文件(配置sql语句)mapper.xml(映射文件)、mapper.xml、mapper.xml...\r\n							\r\n						       ↓\r\n\r\n	SqlSessionFactory(会话工厂)，可以通过读取全局配置文件来生成一个会话工厂，作用是创建一个SqlSession.\r\n							\r\n						       ↓\r\n\r\n	SqlSession(会话)，是一个面向用户的接口，作用是操作数据库(发出sql增、删、改、查)，它是线程不安全的，因为在其实现类中除了有接口中的方法(操作数据库的方法)，还有数据域属性.sqlSession的最佳应用场合在方法体内(线程不安全的对象只能放在方法体内，定义为局部变量)\r\n\r\n						       ↓\r\n\r\n	Executor(执行器)，也是一个接口(基本执行器，缓存执行器)，作用:sqlSession内部通过执行器来操作数据库	\r\n							\r\n						       ↓\r\n\r\n输入参数  →→  mapped statement(底层封装对象)，作用:对操作数据库存储封装，包括sql语句，输入参数，输出结果类型  →→  输出结果类型\r\n					\r\n						       ↓										\r\n						   mysql数据库	\r\n	\r\n	\r\n3、mybatis和hibernate本质区别和应用场景\r\n	hibernate:是一个标准的ORM(对象关系映射)框架，入门门槛较高，不需要程序写sql，sql语句自动生成了，对sql语句进行优化、修改比较困难\r\n	应用场景:\r\n		适用于需求变化不多的中小型项目，比如:后台管理系统，erp、orm、oa...\r\n\r\n	mybatis:专注是sql本身，需要程序员自己编写sql语句，sql修改，优化比较方便.mybatis是一个不完全的ORM框架，虽然程序员自己来写sql，但是mybatis也可以实现映射(输入映射、输出映射)	\r\n	应用场景:\r\n		适用于需求变化较多的项目，比如:互联网项目\r\n\r\n企业进行技术选型，以低成本、高回报作为技术选型的原则，根据项目组的技术力量进行选择\r\n\r\n\r\n4、Mybatis将按照下面的顺序来加载属性\r\n	在properties元素体内定义的属性首先被读取\r\n	然后会读取properties中resource或url加载的属性，它会覆盖已读取的同名属性(<properties resource=\"jdbc.properties\" />)\r\n	最后读取parameterType传递的属性，它会覆盖已读取的同名属性\r\n因此，通过parameterType传递的属性具有最高优先级，resource或url加载的属性次之，最低优先级的是properties元素体内定义的属性,所以建议不要在properties元素体内添加任何属性值，只将属性值定义在properties文件中，在properties文件中定义属性名要有一定特殊性.\r\n\r\n\r\n5、typeAliases(别名)\r\n	在mapper.xml中，定义很多的statement,statement需要parameterType指定输入参数的类型，需要resultType指定输出结果的映射类型\r\n	如果在指定类型时输入类型全路径，不方便进行开发，可以针对parameterType或resultType指定的类型定义一些别名，在mapper.xml中通过别名定义，方便开发.Mybatis有很多默认的别名(都是基本类型)\r\n	<typeAliases>\r\n		//单个别名定义\r\n		<typeAlias type=\"类路径\",alias=\"别名\" />\r\n		//批量别名定义,指定包名，mybatis自动扫描pojo类，自动定义别名，别名就是pojo类的类名(首字母大小写都行)\r\n		<package name=\"com.mybatis.pojo\" />\r\n	</typeAliases>\r\n\r\n\r\n6、typeHandlers(类型处理器)\r\n	mybatis中通过typeHandler完成jdbc类型到java类型的转换\r\n	通常情况下mybaits提供的类型处理器满足日常需要，不需要自定义\r\n\r\n\r\n7、mappers(映射配置)\r\n	1、通过resource加载单个映射文件\r\n	<mapper resource=\"映射文件路径\" />\r\n	2、通过mapper接口加载映射文件\r\n		遵循一些规范:需要将mapper接口类名和mapper.xml映射文件名称保持一致，且在一个目录(前提是使用mapper代理)\r\n	<mapper class=\"\" />\r\n	3、批量加载mapper,指定mapper接口的包名，mybatis自动扫描包下所有mapper接口进行加载(推荐使用)\r\n		遵循一些规范:需要将mapper接口类名和mapper.xml映射文件名称保持一致，且在一个目录(前提是使用mapper代理)\r\n	<package name=\"com.mybatis.mapper\" />\r\n\r\n8、动态Sql\r\n	1、什么是动态sql\r\n		mybatis核心对sql语句进行灵活操作，通过表达式进行判断，对sql进行灵活拼接、组装\r\n	2、定义sql片段\r\n		<sql id=\"\"></sql>\r\n		经验:是基于单表来定义sql片段，这样的话这个sql片段可重用性才高，并且在sql片段中不要包含where\r\n		然后用<include refid=\"sql_id\" />(如果指定的id不在本mapper文件中，则前面需要加namespace.)来引用\r\n	3、foreach标签\r\n		向sql传递数组或List，mybatis使用foreach解析\r\n		<!-- 使用foreach遍历传入ids \r\n		     collecton:指定输入对象中集合属性\r\n		     item:每个遍历生成对象\r\n		     open:开始遍历时拼接的串\r\n		     close:结束遍历时拼接的串\r\n		     separator:遍历的两个对象中需要拼接的串\r\n		-- >\r\n			<!-- 实现 \"AND (id=1 OR id=10 OR id=16)\" 拼接 -->\r\n			<foreach collection=\"ids\" item=\"user_id\" open=\"AND (\" close=\")\" separator=\"or\">\r\n				id=#{user_id}\r\n			</foreach>\r\n			<!-- 实现 \"AND id IN(1,10,16)\" 拼接 -->\r\n			<foreach collection=\"ids\" item=\"user_id\" open=\"AND id IN(\" close=\")\" separator=\",\">\r\n				#{user_id}\r\n			</foreach>\r\n\r\n\r\n易混淆知识:\r\n1、ResultMap和ResultType的区别:\r\n	MyBatis中在查询进行select映射的时候，返回类型可以用resultType，也可以用resultMap，resultType是直接表示返回类型的(对应着我们的model对象中的实体)，而resultMap则是对外部ResultMap的引用(提前定义了db和model之间的隐射key-->value关系)，但是resultType跟resultMap不能同时存在.\r\n	在MyBatis进行查询映射时，其实查询出来的每一个属性都是放在一个对应的Map里面的，其中键是属性名，值则是其对应的值.\r\n		<1>、当提供的返回类型属性是resultType时，MyBatis会将Map里面的键值对取出赋给resultType所指定的对象对应的属性。所以其实MyBatis的每一个查询映射的返回类型都是ResultMap，只是当提供的返回类型属性是resultType的时候，MyBatis对自动的给把对应的值赋给resultType所指定对象的属性(不区分大小写).但是当resultType是Map等类时，也就是把表中检索的值放入Map,这时需要区分大小写.\r\n		<2>、当提供的返回类型是resultMap时，因为Map不能很好表示领域模型，就需要自己再进一步的把它转化为对应的对象，这常常在复杂查询中很有作用.比如在设置各个属性与数据库的对应关系时，可以用typeHandler标签进行类型转换.\r\n\r\n	使用resultType进行输出查询时，只有查询出来的列名和pojo中的属性名一致，该列才可以映射成功.(例如如果为表的列起了别名，则会返回空值)\r\n如果查询出来的列名和pojo中的属性名全部不一致，没有创建pojo对象\r\n只要查询出来的列名和pojo属性有一个一致，就会创建pojo对象\r\n\r\n	使用resultMap进行查询时，如果查询出来的列名和pojo的属性名不一致(如为查询表的列名起别名)，通过定义一个resultMap对列名和pojo属性名之间做一个映射关系.(1、定义resultMap.2、使用resultMap作为statement的输出映射类型)\r\n	<!-- 定义resultMap(type:resultMap最终映射的java类型，可以使用别名、id:resultMap的唯一标识) -->\r\n	<resultMap type=\"user\" id=\"userResultMap\">\r\n		<!-- id表示查询结果集中唯一标识、column表示查询出来的列名，property表示type指定的pojo类型中的属性名 -->\r\n		<id column=\"id_\" property=\"id\" />\r\n		<!-- result表示对普通结果集的映射定义 -->\r\n		<result column=\"username_\" property=\"username\" />\r\n	</resultMap>	\r\n\r\n\r\n2、parameterMap和parameterType的区别:\r\n	parameterMap主要是用来设置参数与数据库列的具体对应关系.\r\n	parameterType:在映射文件中指定输入参数的类型\r\n\r\n\r\n3、#{}  与  ${}\r\n	在sql语句中设置为#{}时，mybatis会将#{}解析为?号，相当于prepareStatement可以执行预编译.\r\n	而设置为${}时，mybatis会直接将${}解析为参数，所以一般还要加上\'\',不能进行预编译.\r\n	所以一般情况下使用#{},但是当sql语句中不需要设置类似?的参数时，例如排序:order by 后面不能加?，这时我们就需要用\'${}\'了.\r\n\r\n\r\n4、selectOne和selectList\r\n	selectOne表示查询出一条记录进行映射，如果使用selectOne可以实现，则使用selectList也能实现(list中只有一条)\r\n	selectList表示查询出一个列表(多条记录)进行映射\r\n\r\n\r\n5、	<1>、获取自增主键值:当我们使用insert标签时，要获取新增数据的主键值可以在<insert>标签中用useGeneratedKeys=\"true\" keyProperty=\"id\"(类中对应的主键属性名) parameterType=\"类名\"	这样当java代码传入xml时，id属性是没有值得，而当sqlSession调用配置文件中sql执行语句后，id中就有了新增属性的主键值.\r\n	<2>、找不到namespace.id的异常效果:忘记将映射文件引入配置文件中或调用的语句有误\r\n	<3>、利用log4j来排查sql语句的错误.\r\n	<4>、不要过度使用${}',4),(5,'Maven常用指令','Maven项目对象模型(POM)，可以通过一小段描述信息来管理项目的构建，报告和文档的软件项目管理工具.Maven 除了以程序构建能力为特色之外，还提供高级项目管理工具。由于 Maven 的缺省构建规则有较高的可重用性，所以常常用两三行 Maven 构建脚本就可以构建简单的项目.','2016-06-11 17:49:26','maven常用指令\r\nmaven 	-v		查看maven版本\r\n      	compile		编译\r\n      	test		测试\r\n      	package		打包\r\n	\r\n	clean		删除target\r\n	install		安装jar包到本地仓库中\r\n\r\n	archetype:generate -DarchetypeCatalog=internal	自动配置maven目录(需要根据提示配置pom.xml文件)\r\n	archetype:generate -DarchetypeCatalog=internal -DgroupId=组织名,公司网址的反写+项目名 -DartifactId=项目名-模块名 -Dversion=版本号 -Dpackage=代码所存在的包(一次性建立好)\r\n\r\n	坐标	构件 groupId、artifactId、version构成了最基本的坐标\r\n\r\n	仓库	分为本地仓库和远程仓库\r\n		maven的远程仓库中有个默认的全球中央仓库地址https://repo.maven.apache.org/maven2，写在lib下的maven-model-builder-3.3.9.jar文件中的pom.xml文件中,其中包含了大部分项目中需要的开源框架,我们自己创建的pom都会继承这个基础的pom\r\n		镜像仓库，有时访问外网资源会连接不上，这是可以更改conf下的setting文件的mirrors标签，将中央仓库的地址改为中国的镜像仓库地址\r\n	更改仓库位置	maven从远程仓库下载构件默认存放在当前用户目录中(C:\\Users\\Administrator\\.m2\\repository\\com).更改仓库的位置可以修改setting文件，然后将<localRepository>标签复制出来，改写仓库地址即可\r\n\r\n	在eclipse中安装maven插件(例:MyEclipse中将java环境改成jdk环境，因为eclipse是运行在jre上的，但是maven是运行在jdk上的，它需要tools.jar文件，然后配置一个-D...的参数，再修改maven的文件地址和setting配置文件的地址后就能搭建maven项目)\r\n\r\n	maven的声明周期及插件:\r\n		一个完整的项目构建过程包括:清理、编译、测试、打包、集成测试、验证、部署(执行某个阶段，其前面阶段的过程也会自动执行).\r\n		maven的生命周期:clean清理项目(pre-clean执行清理前的工作、clean清理上一次构件生成的所有文件、post-clean执行清理后的文件)、default构件项目(最核心、包括compile、test、package、install)、site生成项目站点(pre-site在生成项目站点前要完成的工作、site生成项目的站点文档、post-site在生成项目站点后要完成的工作、site-deploy发布生成的站点到服务器上)\r\n\r\n\r\npom.xml常用元素介绍\r\n	<groupId>反写的公司网址+项目名</groupId>\r\n	<artifactId>项目名+模块名</artifactId>\r\n	<version>标签中第一个0表示大版本号，第二个0表示分支版本号，第三个0表示小版本号 如0.0.1\r\n	后面的后缀snapshot表示快照、alpha是内部测试、beta是公测、Release是稳定、GA表示正式发布\r\n	<packaging>默认是jar、可以改为war、zip、pom\r\n	<name>是项目描述名、\r\n	<url>是项目地址\r\n	<description>是项目描述\r\n	<developers>是开发人员信息\r\n	<licenses>是许可证信息\r\n	<organization>是组织信息\r\n\r\n	<depedencies>是依赖列表，其下可以包含多个依赖项<dependency>,并用<groupId>、<artifactId>、<version>、<type>、<scope>(依赖范围，例如test表示只在测试范围内有用)、<optional>用来设置依赖是否可选，默认为false、<exclusions>用来排除依赖传递列表\r\n	<dependencyManagement>依赖的管理,其下可以声明<dependencies>并进行管理\r\n	<build>用来对构建的行为提供相应的支持，如<plugins>插件列表，其下包含多个<plugin>(<groupId>、<artifactId>、<version>)\r\n	<parent>用于子模块对父模块pom的继承\r\n	<modules>用来聚合运行多个maven项目\r\n\r\n依赖范围\r\n	<scope>有6种属性值:\r\n		compile:默认的范围，编译测试运行都有效\r\n		provided:在编译和测试时有效\r\n		runtime:在编译和运行时有效，如jdbc驱动的实现\r\n		test:只在测试范围有效，如JUnit\r\n		system:编译和测试时有效，与本机系统相关联，可移植性差\r\n		import:导入的范围，它只使用在dependencyManagement中，表示从其他的pom中导入dependency的配置\r\n\r\n依赖传递	\r\n	例如陈浩南依赖了B哥，而山鸡依赖了陈浩南，则山鸡也会自动的依赖B哥,如果想消除这种依赖传递，则在陈浩南的依赖下添加<exclusions>来消除依赖\r\n\r\n依赖冲突\r\n	依赖原则：1、短路优先.	  如:B哥依赖2.4，南哥依赖2.0，由于山鸡离南哥近，所以他依赖2.0\r\n		  2、若路径相同，则先声明先优先.     如:取消南哥对B哥的依赖，山鸡先声明对B哥的依赖，再声明对南哥德依赖，则山鸡会依赖B哥的2.4\r\n\r\n聚合和继承\r\n	',1);

/*Table structure for table `blogger` */

DROP TABLE IF EXISTS `blogger`;

CREATE TABLE `blogger` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `blogger` */

insert  into `blogger`(`id`,`userName`,`password`) values (1,'iwangbo','fb9ace46fd0a64d88d87f85e80855342');

/*Table structure for table `blogtype` */

DROP TABLE IF EXISTS `blogtype`;

CREATE TABLE `blogtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `blogtype` */

insert  into `blogtype`(`id`,`typeName`) values (1,'Java'),(2,'Mysql'),(3,'Servlet'),(4,'Mybatis'),(5,'Spring');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;