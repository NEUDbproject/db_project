<%@ page language="java" import="java.util.*" pageEncoding="US-ASCII"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'course.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- ������3���meta������*������*���������������������������������������*������*��������������� -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="http://v3.bootcss.com/favicon.ico">
	    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
	
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <title>Add Course Page</title>

  </head>
<body>
<div class="container-fluid col-md-offset-3">

     <form class="form-horizontal" action="AddCourse" method="Post">
  <div class="form-group">
  <h1 class="form-signin-heading text-warning" style="margin-left:350px"><strong>
   <span class="glyphicon glyphicon-align-left" aria-hidden="true"></span>Add Course</strong></h1>
    </div>
<div class="form-group">  
  <label for="inputCourseId3" class="col-sm-2 control-label text-primary"><h3><u>CourseId</u></h3></label>
      <div class="col-sm-4">
      <input type="text" class="form-control" id="inputCourseId1"  aria-describedby="sizing-addon2" placeholder="CourseId" name="CID">
    </div>
    </div>
 <div class="form-group">
    <label for="inputCourseAppId3" class="col-sm-2 control-label text-primary"><u>CourseAppId</u></label>
    <div class="col-sm-4">
		<div class="input-group">
  			<span class="input-group-addon" id="sizing-addon2">@</span>
  	<input type="text" class="form-control" id="inputCourseAppId1" placeholder="CourseAppId" aria-describedby="sizing-addon2" name="CAPPID">
		</div>
    </div>
    </div>
  <div class="form-group">
    <label for="inputProvider3" class="col-sm-2 control-label text-primary"><u>Provider</u></label>
    <div class="col-sm-4">
      		<div class="input-group">
  			<span class="input-group-addon" id="sizing-addon2">@</span>
  				<input type="text" class="form-control" id="inputProvider1" placeholder="Provider" aria-describedby="sizing-addon2" name="Per">
			</div>
    </div>
  </div>

  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-4">
      <div class="checkbox">
        <label>
          <input type="checkbox">Add This Course
        </label>
      </div>
    </div>
  </div>
   <div class="form-group">
    <div class="col-sm-offset-5 col-sm-10" style="margin-left:550px">
      <button type="submit" class="btn btn-default btn-lg btn-primary">
  <span class="glyphicon glyphicon-star" aria-hidden="true"></span> Add This Course
</button>
    </div>
  </div>
</form>
</div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="./Signin Template for Bootstrap_files/ie10-viewport-bug-workaround.js"></script>
  

</body></html>
