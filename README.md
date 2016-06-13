# 我的个人博客系统

学习J2EE也有一段时间了，一直想租个服务器搞一个个人的博客站点，一方面将自己所学的知识进行整合，一方面也是想装个*，哈哈

看了网上很多人的评论，觉得SSM这套框架是目前比较流行的架构，Struts2也只有很多老系统在用了，现在越来越多的人青睐于springmvc，一方面是它轻便好用，一方面也是和spring的整合更好.然后Mybatis呢相比hibernate学起来要容易一点，更容易理解，并且它的分层也比较清晰，所以这次准备参照小峰哥(java1234)的SSM博客系统来从头到尾自己搞一遍，添加一些自己的元素进去

项目用maven来进行管理，博客的前台页面用bootstrap来编写，后台用jQuery的easyUI(比较容易学习的一种UI框架，内部有很多组件可供使用),数据库用Mysql,数据库连接池采用阿里巴巴地druid(也是比较新的技术，据说比较牛逼)，账号登录与权限控制(权限好像用不上..)等安全框架采用shiro(相比spring security更容易学习，也是java官方推荐的安全框架),然后博客里还带有评论系统，全文检索(lucene等),差不多就是这样

#Day1 2016/6/9
第一天来把项目结构搭建好,然后用Shiro实现了简单的登录验证功能，数据库里暂时只存一张博主信息的表.

#Day2 2016/6/11
这两天把前台和后端登陆的静态模板页面做好了，简单的将博客按照日志类别和发布时间进行了分类，下一步就是实现点击链接进行跳转和后台easyUI界面的搭建啦~....

#Day3 2016/6/12
今天把前台页面的根据日期、类别跳转显示的功能实现了，下一步准备先把评论系统做出来，等评论系统做好就去搭建后台系统

#Day4 2016/6/13
评论系统已经完成，用Ajax异步提交数据到后台，再从后台将数据封装到Json中传回前台,其实不用ajax的话直接提交表单刷新全部页面也是可以的......下一步准备将首页的博客信息列表进行分页，先考虑考虑是用Mybatis的插件还是自己写一个分页方法用Mybatis的拦截器调用.......