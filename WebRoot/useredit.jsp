<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Management page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Below is Bootstrap related data  -->


<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<script src="./Blog Template for Bootstrap_files/ie-emulation-modes-warning.js"></script>

    <!-- Above is Bootstrap related data  -->
  </head>
  
  
  
<body>


    <div class="container-fluid col-md-offset-3">
    	<%
  		User editUser=(User)request.getSession().getAttribute("editUser");
  		String select="selected";
  	 %>
     <form class="form-horizontal" action="UpdateUser" method="post" name="submitform">
   
  <div class="form-group">
  <h1 class="form-signin-heading text-danger" style="margin-left:350px"><strong>
   <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>Edit User</strong></h1>
    </div>
<div class="form-group">  
  <label for="inputUserId3" class="col-sm-2 control-label text-primary"><h3><u>UserId</u></h3></label>
      <div class="col-sm-4">
     <label for="inputUserId3" class="control-label text-primary"><h3><%=editUser.getUserId() %></h3></label>
    </div>
    </div>
    
    
<div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label text-primary"><h3><u>Email</u></h3></label>
    <div class="col-sm-4">
      <div class="input-group">
  <label for="inputEmail3" class="control-label text-primary"><h2><%=editUser.getEmail() %></h2></label>
  
</div>
</div>
</div>  
    
    
 <div class="form-group">
    <label for="inputFirstName3" class="col-sm-2 control-label text-primary"><u>FirstName</u></label>
    <div class="col-sm-4">
		<div class="input-group">
  			<span class="input-group-addon" id="sizing-addon2">@</span>
  	<input type="text" class="form-control" placeholder="FirstName" aria-describedby="sizing-addon2" name="FirstName" value="<%=editUser.getFirstName() %>">
		</div>
    </div>
    </div>
  <div class="form-group">
    <label for="inputLastName3" class="col-sm-2 control-label text-primary"><u>LastName</u></label>
    <div class="col-sm-4">
      		<div class="input-group">
  			<span class="input-group-addon" id="sizing-addon2">@</span>
  				<input type="text" class="form-control" placeholder="LastName" aria-describedby="sizing-addon2" name="LastName" value="<%=editUser.getLastName() %>">
			</div>
    </div>
  </div>


      <div class="form-group">
    <label for="inputPassWord3" class="col-sm-2 control-label text-primary"><u>Attribute</u></label>
 <div class="col-sm-4">
  <select  class="form-control">
  <option>Student</option>
  <option>Professor</option>
  <option>Manager</option>
  <option>Warrior</option>
  <option>Rogue</option>
</select>
  </div>
 </div>

  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-4">
      <div class="checkbox">
        <label>
          <input type="checkbox"><strong>Confirm Edit</strong>
        </label>
      </div>
    </div>
  </div>
   <div class="form-group">
    <div class="col-sm-offset-5 col-sm-10" style="margin-left:550px">
    
      <input type="hidden" name="userid" value="<%=editUser.getUserId()%>"/>
       <button type="submit" class="btn btn-default btn-lg btn-primary">
  <span class="glyphicon glyphicon-wrench" aria-hidden="true"></span> Edit This User
</button>
  

    </div>
  </div>
</form>
</div> <!-- /container -->


</body>
</html>