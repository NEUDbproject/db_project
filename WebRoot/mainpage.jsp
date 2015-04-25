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
				<em><strong>Recommend Course:</strong></em>
			</h2>
		</div>
	</div>


<!--第一图片行--> 
	<div class="row">
	
	        <% 
	       String meta ="";
	      SqlRecommend sql = new SqlRecommend();
	      SqlCourse csql = new SqlCourse();
	      meta =sql.findMetaByValue("pp");  
          Json Coursera = new Json();
          CourseraAbstract[] courses = Coursera.getApiInfo("https://api.coursera.org/api/catalog.v1/courses?fields=photo&ids="+meta);
          for(int i =0;i<courses.length;i++){
			String appid = courses[i].getId();
			String cid = csql.getCourseIdByAppId(appid);
			courses[i].setRate(csql.aveScore(cid));
			%>
			<div class="col-xs-3 ">
			<img alt="140x140" src="<%=courses[i].getPhoto() %>"  height=250 width=250/>
             <div class="clearfix" style="margin-bottom: 10px;"></div><!-- 清除浮动 -->
            <h3 class="text-left"><a href="GetCourse?cid=<%=courses[i].getId()%>"><%=courses[i].getName() %></a></h3>
            <div class="row">
  				<div class="col-xs-8">
                    </div>
  			<div class="col-xs-4">
            <h4 class="text-left text-warning">Rate:<%=courses[i].getRate() %></h4></div>
			</div>
		</div>
			
			
			<%
		  }
          %>
		 
</div>
          <div class="clearfix" style="margin-bottom: 10px;"></div><!-- 清除浮动 -->
<!--热门课程-->
 	<div class="row">
		<div class="text-primary col-xs-2">
			<h2>
				<em><strong>Hot Course:</strong></em>
			</h2>
		</div>
	</div>
		<%
			meta = "2832,2856,781,56";
        	CourseraAbstract[] courses1 = Coursera.getApiInfo("https://api.coursera.org/api/catalog.v1/courses?fields=photo&ids="+meta);
        	for(int i =0;i<courses1.length;i++){
    			String appid = courses1[i].getId();
    			String cid = csql.getCourseIdByAppId(appid);
    			courses1[i].setRate(csql.aveScore(cid));
    			%>
    			<div class="col-xs-3 ">
    			<img alt="140x140" src="<%=courses1[i].getPhoto() %>"  height=250 width=250/>
                 <div class="clearfix" style="margin-bottom: 10px;"></div><!-- 清除浮动 -->
                <h3 class="text-left"><a href="GetCourse?cid=<%=courses1[i].getId()%>"><%=courses1[i].getName() %></a></h3>
                <div class="row">
      				<div class="col-xs-8">
                        </div>
      			<div class="col-xs-4">
                <h4 class="text-left text-warning">Rate:<%=courses1[i].getRate() %></h4></div>
    			</div>
    		</div>
    			
    			
    			<%
    		  }
              %>
		

          <div class="clearfix" style="margin-bottom: 10px;"></div><!-- 清除浮动 -->

</div>

</div>

</body>
</html>