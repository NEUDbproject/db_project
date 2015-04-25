<%@ page language="java" import="java.util.*" pageEncoding="US-ASCII"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="http://v3.bootcss.com/favicon.ico">
	    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
	
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <title>Add User</title>

  </head>

  <body>

    
    <div class="container-fluid col-md-offset-3">

  <form class="form-horizontal" action="AddUser" method="POST">
  <div class="form-group">
  	<h1 class="form-signin-heading text-warning" style="margin-left:150px"><strong>
   	<span class="glyphicon glyphicon-align-left" aria-hidden="true"></span>Add User</strong></h1>
  </div>
  <div class="form-group has-warning">  
  <label for="inputUserId3" class="col-sm-2 control-label text-primary"></label>
      <div class="col-sm-4">
      </div>
  </div>
 <div class="form-group has-warning">
    <label for="inputFirstName3" class="col-sm-2 control-label text-primary"><u>FirstName</u></label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="inputFirstName1" placeholder="FirstName" name="fname">
    </div>
    </div>
  <div class="form-group has-warning">
    <label for="inputLastName3" class="col-sm-2 control-label text-primary"><u>LastName</u></label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="inputLastName1" placeholder="LastName" name="lname">
    </div>
  </div>
        <div class="form-group has-warning">
    <label for="inputEmail3" class="col-sm-2 control-label text-primary"><u>Email</u></label>
    <div class="col-sm-4">  
  <input type="text" class="form-control" placeholder="Email" id="inputEmail" aria-describedby="basic-addon2" name="email">
    </div>
  </div>
     <div class="form-group has-warning">
    <label for="inputPassWord3" class="col-sm-2 control-label text-primary"><u>PassWord</u></label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="inputPassWord1" placeholder="PassWord" name="pwd">
    </div>
  </div>
  
  <div class="form-group has-warning">
    <div class="col-sm-offset-2 col-sm-4">
      <div class="checkbox">
        <label>
          <input type="checkbox">Confirm Add
        </label>
      </div>
    </div>
  </div>
   <div class="form-group has-warning">
    <div class="col-sm-offset-5 col-sm-10" style="margin-left:550px">
      <button type="submit" class="btn btn-default btn-lg btn-warning">
  <span class="glyphicon glyphicon-star" aria-hidden="true"></span> Add This User
</button>
    </div>
  </div>
</form>
</div> <!-- /container -->

</body>
</html>