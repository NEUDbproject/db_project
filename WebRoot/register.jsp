<%@ page language="java" import="java.util.*" pageEncoding="US-ASCII"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register.jsp' starting page</title>
    
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
    <title>Register</title>

  </head>

  <body>

    <div class="container">

     <form class="form-horizontal" action="Register" method="POST">
  <div class="form-group">
  <h1 class="form-signin-heading text-success text-left" style="margin-left:200px">
  <span class="glyphicon glyphicon-cloud" aria-hidden="true"></span>
  Register</h1>
  <div class="form-group">
   <label for="inputEmail3" class="col-sm-2 control-label text-success">Email</label>
   <div class="col-sm-4 form-group has-success">    
  		<input type="text" class="form-control" id="inputEmail1"  placeholder="Email" name="email">
    </div>
  </div>
  
  <div class="clearfix" style="margin-bottom: 10px;"></div>   
    <label for="inputFirstName3" class="col-sm-2 control-label text-success">FirstName</label>
    <div class="col-sm-4 form-group has-success">    
  <input type="text" class="form-control" id="inputFirstName1"  placeholder="FirstName" name="fname">
    </div>
  </div>
  <div class="form-group">
    <label for="inputLastName3" class="col-sm-2 control-label text-success">LastName</label>
    <div class="col-sm-4 form-group has-success">    
  <input type="text" class="form-control" id="inputLastName1"  placeholder="LastName" name="lname">
    </div>
  </div>
      <div class="form-group">
    <label for="inputPassWord3" class="col-sm-2 control-label text-success">PassWord</label>
    <div class="col-sm-4 form-group has-success">    
  		<input type="text" class="form-control" id="inputPassWord1"  placeholder="PassWord" name="pwd">
    </div>

  </div>
      <div class="form-group">
    <label for="inputPassWord3" class="col-sm-2 control-label text-success">Password</label>
   <div class="col-sm-4 form-group has-success">    
  		<input type="text" class="form-control" id="inputAttribute1"  placeholder="Confirm Password" name="cpwd">
    </div>
 </div>  
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-4">
      <div class="checkbox">
        <label>
          <input type="checkbox"> Agree to Private Policy
        </label>
      </div>
    </div>
  </div>
   <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-lg btn-success">Sign in</button>
    </div>
  </div>
</form>
</div> <!-- /container -->

</body>
</html>