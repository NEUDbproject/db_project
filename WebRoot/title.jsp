<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
  <div class="center-block">
    </div> 
 

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
      
        <li><a href="#">Home</a></li>
        <li><a href="#">Link</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
        
      </ul>
 
      <ul class="nav navbar-nav navbar-right ">
           <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
         <button class="btn btn-large btn-primary" type="button">Submit</button>
      </form>
      <%
      	if(session.getAttribute("userId")==null){
      %>
      	<li><a href="register.jsp">Register</a></li>
        <li><a href="login.jsp">Sign in</a></li>
        </ul>
      <%
      	}else{
	      	String userEmail = request.getSession().getAttribute("userEmail").toString();
		  	String userId = request.getSession().getAttribute("userId").toString();
		  	System.out.println(userEmail);
	  		System.out.println(userId);
	  %>
		<div class="btn-group">
						 <button class="btn"><%=userEmail %></button> <button data-toggle="dropdown" class="btn dropdown-toggle"><span class="caret"></span></button>
						<ul class="dropdown-menu">
							<li>
								<a href="#">操作</a>
							</li>
							<li>
								<a href="#">设置栏目</a>
							</li>
							<li>
								<a href="#">更多设置</a>
							</li>
							<li class="divider">
							</li>
						</ul>
					</div>
		<a href="logoff.jsp">Log Off</a>		
	<%
	  }
     %>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>