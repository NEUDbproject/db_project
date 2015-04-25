<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="model.*" %>
<%@ page import="controller.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
	
	<!-- Latest compiled and minified JavaScript -->
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="bootstrap.min.css">
	<title><%
		String title="";
		if(session.getAttribute("title")==null){
			title = "OCE|DBproject";
		}
		else{
			title= request.getSession().getAttribute("title").toString();
		}
	 %></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
<body>
<nav class="navbar navbar-default">
 <div class="container">

    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Null</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">OCE</a>
       
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
      
      <!--Modified by Junwei Zheng. Completed  -->
      
        <li><a href="http://localhost:8080/db_project/">Home</a></li>
        <li><a href="#">About</a></li>
        
      </ul> <!-- 左边的部分 -->
 
      <ul class="nav navbar-nav navbar-right ">
      <div class="row">
           <form class="navbar-form navbar-left" role="search" action="SearchCourse" method="POST">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search" name="querykwd">
        </div>
        
        <button class="btn btn-xs btn-primary" type="submit">Submit</button>
      </form>
      <%
      	if(session.getAttribute("userId")==null){
      %>
      	<li><a href="register.jsp">Register</a></li>
        <li><a href="login.jsp">Sign in</a></li>
        
      <%
      	}else{
      		
	      	String userEmail = request.getSession().getAttribute("userEmail").toString();
		  	String userId = request.getSession().getAttribute("userId").toString();
		  	System.out.println(userEmail);
	  		System.out.println(userId);
	  	//	User user =new User();
	  	//	SqlManager sql = new SqlManager();
	  	//	user = sql.getUserById(userId);
	  %>
		
			<div class="col-xs-2"><%=userEmail %></div>
		 
			<div class="col-xs-2"><form method="get" action="UserProfile">
                 <input type="hidden" name="userid" value="<%=userId%>"/>						
			<button class="btn btn-primary btn-xs" type="submit" name="userid">My Profile</button>
		      	</form> 	</div>

	<div class="col-xs-2"> <a href="logoff.jsp"><h5>Log Off</h5></a></div>
		</div>
	<%
	  }
     %>
     </ul>	 <!-- 右边的部分 -->
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>