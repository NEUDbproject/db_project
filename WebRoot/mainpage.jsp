<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="model.*" %>
<%@ page import="library.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!-- 新 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css">
	
	<!-- 可选的Bootstrap主题文件（一般不用引入） -->
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
	
	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
	
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

  </head>
<body>


<div class="container" style="width:1200px !important"> 
 
<!--编辑推荐--> 

	<div class="row">
		<div class="text-primary col-xs-2">
			<h2>
				<em><strong>编辑推荐：</strong></em>
			</h2>
		</div>
	</div>


<!--第一图片行--> 
	<div class="row">
	
	        <% 
	       String meta ="";
	      SqlRecommend sql = new SqlRecommend();
	      meta =sql.findMetaByValue("pp");  
          Json Coursera = new Json();
          CourseraAbstract[] courses = Coursera.getApiInfo("https://api.coursera.org/api/catalog.v1/courses?fields=photo&ids="+meta);
          CourseraAbstract course_0 = courses[0];
          CourseraAbstract course_1 = courses[1];
          CourseraAbstract course_2 = courses[2];
          CourseraAbstract course_3 = courses[3];
          
          %>
		 <div class="col-xs-3 ">
			<img alt="140x140" src="<%=course_0.getPhoto() %>"  height=250 width=250/>
             <div class="clearfix" style="margin-bottom: 10px;"></div><!-- 清除浮动 -->
            <h3 class="text-left"><a href="GetCourse?cid=<%=course_0.getId()%>"><%=course_0.getName() %></a></h3>
            <div class="row">
  				<div class="col-xs-8">
  					<h4 class="text-left text-success">10000人关注</h4>
                    </div>
  			<div class="col-xs-4">
            <h4 class="text-left text-warning">评分:9.0</h4></div>
			</div>
		</div>
		 <div class="col-xs-3 ">
			<img alt="140x140" src="<%=course_1.getPhoto() %>"  height=250 width=250/>
            <div class="clearfix" style="margin-bottom: 10px;"></div><!-- 清除浮动 -->
            <h3><a href="GetCourse?cid=<%=course_1.getId()%>"><%=course_1.getName() %></a></h3>
            <div class="row">
  				<div class="col-xs-8">
  					<h4 class="text-left text-success">5045人关注</h4>
                   </div>
  			<div class="col-xs-4">
            <h4 class="text-center text-warning">评分:8.0</h4></div>
			</div>
		</div>
		<div class="col-xs-3">
			<img alt="140x140" src="<%=course_2.getPhoto() %>"  height=250 width=250/>
            <div class="clearfix" style="margin-bottom: 10px;"></div><!-- 清除浮动 -->
            <h3><a href="GetCourse?cid=<%=course_2.getId()%>"><%=course_2.getName() %></a></h3>
                        <div class="row">
  				<div class="col-xs-8">
  					<h4 class="text-left text-success">5045人关注</h4>
                   </div>
  			<div class="col-xs-4">
            <h4 class="text-center text-warning">评分:8.0</h4></div>
			</div>
		</div>
		
        
        <div class="col-xs-3">
			<img alt="140x140" src="<%=course_3.getPhoto() %>"  height=250 width=250/>
            <div class="clearfix" style="margin-bottom: 10px;"></div><!-- 清除浮动 -->
            <h3><a href="GetCourse?cid=<%=course_3.getId()%>"><%=course_3.getName() %></a></h3>
                        <div class="row">
  				<div class="col-xs-8">
  					<h4 class="text-left text-success">5045人关注</h4>
                   </div>
  			<div class="col-xs-4">
            <h4 class="text-center text-warning">评分:8.0</h4>
            </div>
			</div>
		</div>
</div>
          <div class="clearfix" style="margin-bottom: 10px;"></div><!-- 清除浮动 -->
<!--热门课程-->
 	<div class="row">
		<div class="text-primary col-xs-2">
			<h2>
				<em><strong>热门课程：</strong></em>
			</h2>
		</div>
	</div>
	<div class="row">
		 <div class="col-xs-3 ">
			<img alt="140x140" src="./testtest_files/uther.jpg"  height=250 width=250/>
             <div class="clearfix" style="margin-bottom: 10px;"></div><!-- 清除浮动 -->
            <h3 class="text-left"><a href="http://baidu.com#">Physicis</a></h3>
            <div class="row">
  				<div class="col-xs-8">
  					<h4 class="text-left text-success">10000人关注</h4>
                    </div>
  			<div class="col-xs-4">
            <h4 class="text-left text-warning">评分:9.0</h4></div>
			</div>
		</div>
		 <div class="col-xs-3 ">
			<img alt="140x140" src="./testtest_files/jiana.jpg"  height=250 width=250/>
            <div class="clearfix" style="margin-bottom: 10px;"></div><!-- 清除浮动 -->
            <h3><a href="http://baidu.com#">Music</a></h3>
            <div class="row">
  				<div class="col-xs-8">
  					<h4 class="text-left text-success">5045人关注</h4>
                   </div>
  			<div class="col-xs-4">
            <h4 class="text-center text-warning">评分:8.0</h4></div>
			</div>
		</div>
		<div class="col-xs-3">
			<img alt="140x140" src="./testtest_files/zhanshi.jpg"  height=250 width=250/>
            <div class="clearfix" style="margin-bottom: 10px;"></div><!-- 清除浮动 -->
            <h3><a href="http://baidu.com#">Math</a></h3>
                        <div class="row">
  				<div class="col-xs-8">
  					<h4 class="text-left text-success">5045人关注</h4>
                   </div>
  			<div class="col-xs-4">
            <h4 class="text-center text-warning">评分:8.0</h4></div>
			</div>
		</div>
		
        
        <div class="col-xs-3">
			<img alt="140x140" src="./testtest_files/druid.jpg"  height=250 width=250/>
            <div class="clearfix" style="margin-bottom: 10px;"></div><!-- 清除浮动 -->
            <h3><a href="http://baidu.com#">Chemistry</a></h3>
                        <div class="row">
  				<div class="col-xs-8">
  					<h4 class="text-left text-success">5045人关注</h4>
                   </div>
  			<div class="col-xs-4">
            <h4 class="text-center text-warning">评分:8.0</h4>
            </div>
			</div>
		</div>
</div>
          <div class="clearfix" style="margin-bottom: 10px;"></div><!-- 清除浮动 -->
 
     <!-- 专题推荐 -->
		<div class="row">
		<div class="text-primary col-xs-2">
			<h2>
				<em><strong>专题推荐：</strong></em>
			</h2>
		</div>
	</div>
	<div class="row">
		 <div class="col-xs-3 ">
			<img alt="140x140" src="./testtest_files/uther.jpg"  height=250 width=250/>
             <div class="clearfix" style="margin-bottom: 10px;"></div><!-- 清除浮动 -->
            <h3 class="text-left"><a href="http://baidu.com#">Physicis</a></h3>
            <div class="row">
  				<div class="col-xs-8">
  					<h4 class="text-left text-success">10000人关注</h4>
                    </div>
  			<div class="col-xs-4">
            <h4 class="text-left text-warning">评分:9.0</h4></div>
			</div>
		</div>
		 <div class="col-xs-3 ">
			<img alt="140x140" src="./testtest_files/jiana.jpg"  height=250 width=250/>
            <div class="clearfix" style="margin-bottom: 10px;"></div><!-- 清除浮动 -->
            <h3><a href="http://baidu.com#">Music</a></h3>
            <div class="row">
  				<div class="col-xs-8">
  					<h4 class="text-left text-success">5045人关注</h4>
                   </div>
  			<div class="col-xs-4">
            <h4 class="text-center text-warning">评分:8.0</h4></div>
			</div>
		</div>
		<div class="col-xs-3">
			<img alt="140x140" src="./testtest_files/zhanshi.jpg"  height=250 width=250/>
            <div class="clearfix" style="margin-bottom: 10px;"></div><!-- 清除浮动 -->
            <h3><a href="http://baidu.com#">Math</a></h3>
                        <div class="row">
  				<div class="col-xs-8">
  					<h4 class="text-left text-success">5045人关注</h4>
                   </div>
  			<div class="col-xs-4">
            <h4 class="text-center text-warning">评分:8.0</h4></div>
			</div>
		</div>
		
        
        <div class="col-xs-3">
			<img alt="140x140" src="./testtest_files/druid.jpg"  height=250 width=250/>
            <div class="clearfix" style="margin-bottom: 10px;"></div><!-- 清除浮动 -->
            <h3><a href="http://baidu.com#">Chemistry</a></h3>
                        <div class="row">
  				<div class="col-xs-8">
  					<h4 class="text-left text-success">5045人关注</h4>
                   </div>
  			<div class="col-xs-4">
            <h4 class="text-center text-warning">评分:8.0</h4>
            </div>
			</div>
		</div>
</div>

</div>

</body>
</html>