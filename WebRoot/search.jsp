<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="model.*" %>
<%
  	String kwd = request.getSession().getAttribute("kwd").toString();	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>"<%=kwd %>" Search Result|OCE</title>
    
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
    	<!--下面是要用的部分。共有3个contanier-fluid. 一个大的包含2个小的。一个小的用来放搜索栏。一个小的用来放3个按钮-->
   <div class="container" style="width:1200px !important"> 
       <div class="row">
       <div class="clearfix" style="margin-bottom: 30px;"></div><!-- 清除浮动 -->
       <form  action="SearchCourse" method="POST">
        <div class="col-xs-10 input-group input-group-lg pull-left">
          <span class="input-group-addon input-group-xs" id="sizing-addon1">Please Input Key Word</span>
          <input type="text"class="form-control" aria-describedby="sizing-addon1" placeholder="Search" name="querykwd">
        </div>
        <div class=" col-xs-2 pull-left">
        <button class="btn btn-lg btn-primary" type="submit">Search</button>
         </div>
         </form>
         
       </div>
       
        <div class="clearfix" style="margin-bottom: 30px;"></div><!-- 清除浮动 -->
        
       		<div>
         <button class="btn btn-primary btn-xs" type="button">Order By Time</button>
         <button class="btn btn-primary btn-xs" type="button">Order By Rank</button>
         <button class="btn btn-primary btn-xs" type="button">Order BY Mark</button>
			</div>
      
      <div class="clearfix" style="margin-bottom: 30px;"></div><!-- 清除浮动 -->
  
  <h2 class="text-left text-danger"><strong>Recommend Courses</strong></h2>


	<div class="row">
		<div class="col-xs-3">
        <h3 class="text-left"><a href="http://baidu.com#"><u>Computer Science</u></h3>
		</div>
		<div class="col-xs-3">
        <h3 class="text-left text-primary"><a href="http://baidu.com#"><small>DataBase Management</small></a></h3>
		</div>
		<div class="col-xs-3">
        <h3 class="text-left text-primary"><a href="http://baidu.com#"><small>MySQL WorkBench</small></a></h3>
		</div>
		<div class="col-xs-3">
        <h3 class="text-left text-primary"><a href="http://baidu.com#"><small>MyEclipse Development</small></a></h3>
		</div>
	</div>

	<div class="row">
		<div class="col-xs-3">
        <h3 class="text-left"><a href="http://baidu.com#"><u>Art and History</u></h3>
		</div>
		<div class="col-xs-3">
        <h3 class="text-left text-primary"><a href="http://baidu.com#"><small>Ancient Music</small></a></h3>
		</div>
		<div class="col-xs-3">
        <h3 class="text-left text-primary"><a href="http://baidu.com#"><small>Modern Portrait</small></a></h3>
		</div>
		<div class="col-xs-3">
        <h3 class="text-left text-primary"><a href="http://baidu.com#"><small>Middle Artists</small></a></h3>
		</div>
	</div>

	<div class="row">
		<div class="col-xs-3">
        <h3 class="text-left"><a href="http://baidu.com#"><u>Physics</u></h3>
		</div>
		<div class="col-xs-3">
        <h3 class="text-left text-primary"><a href="http://baidu.com#"><small>Basketbal Training</small></a></h3>
		</div>
		<div class="col-xs-3">
        <h3 class="text-left text-primary"><a href="http://baidu.com#"><small>How To Play Hearthstone</small></a></h3>
		</div>
		<div class="col-xs-3">
        <h3 class="text-left text-primary"><a href="http://baidu.com#"><small>Road To 5K MMR</small></a></h3>
		</div>
	</div>
   
   <%
   		CourseraAbstract[] courses = (CourseraAbstract[])request.getSession().getAttribute("queryRes");	
   		if(courses != null){
   			%>
   			<h2 class="text-left text-danger"><strong>Search Results</strong> Keyword "<%=kwd %>"</h2>
   			<%
   		for(int i=0;i<courses.length;i++){
   			CourseraAbstract course = courses[i];
   			if(i%4==0){
   				%>
   					<div class="clearfix" style="margin-bottom: 10px;"></div><!-- 清除浮动 -->
					<div class="row">
   				<%
   			}
   			%>
   				<div class="col-xs-3">
				<img alt="140x140" src="<%=course.getPhoto() %>"  height=250 width=250/>
	             <div class="clearfix" style="margin-bottom: 10px;"></div><!-- 清除浮动 -->
	            <h3 class="text-left"><a href="GetCourse?cid=<%=course.getId()%>"><%=course.getName() %></a></h3>
	            <div class="row">
	  				<div class="col-xs-7">
	                    </div>
	  			<div class="col-xs-5">
	            <h4 class="text-left text-warning">Rate:<%=course.getRate() %></h4></div>
				</div>
				</div>
   			<%
   			if((i+1)%4==0){
   				%>
   				</div>
   				<% 
   			}
   		}
   		}
   		else{
   			%>
   			 <h2 class="text-left text-danger"><strong>No Search Results For</strong> Keyword "<%=kwd %>"</h2>
   			<%
   		}
  %>

 
      			</div> 
</body>
</html>
