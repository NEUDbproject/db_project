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
	<link rel="stylesheet" type="text/css" href="bootstrap.min.css">
	<script type="text/javascript" href="bootstrap.min.js"></script>
  </head>
  
  <body>
  	<div class="container">
	<div class="row">
		<div class="span12">
			<h3 class="text-center">
				Management Page
			</h3>
			<div class="tabbable" id="tabs-884475">
				<ul class="nav nav-tabs">
					<li class="active">
						<a href="#panel-91107" data-toggle="tab">User</a>
					</li>
					<li>
						<a href="#panel-685660" data-toggle="tab">Course</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="panel-91107">
						<p>
							<%
    	List<User> userList=(List<User>)request.getSession().getAttribute("ListUser");
    	if(userList.size()==0){
    		%>
    			<div class="alert alert-error">
				 <button type="button" class="close" data-dismiss="alert">×</button>
				<h4>
					Notification!
				</h4> <strong>Alert!</strong> There is no user in our system.
				</div>
    		<%
    	}
    	else{%>
    		<table id="userTable" border="1">
		    <tr>
		    <th>User Id</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Password</th>
			<th>Email</th>
			<th>Type</th>
			<th>Operation</th>
			</tr>
    	<%
    		for(int i=0;i<userList.size();i++){
    		
    			User newUser = new User();
    			newUser = userList.get(i);
    			%><tr><%
    			 
    			%><td><%=newUser.getUserId() 
    			%></td><% 

				%><td><%=newUser.getFirstName() 
    			%></td><% 
    			
    			%><td><%=newUser.getLastName() 
    			%></td><% 
    			
    			%><td><%=newUser.getPassWord() 
    			%></td><% 
    			
    			%><td><%=newUser.getEmail() 
    			%></td><%     			
    			
    			%><td><%=newUser.getType()
    			%></td><% 	
    			
    			%><td>
    				 <button class="btn" type="button">Add</button>
    				 <button class="btn" type="button">Delete</button>
    				 <button class="btn" type="button">Edit</button>
    			</td></tr><% 
    			}
    		}
    	 %>
    	 </table>
							
						</p>
					</div>
					<div class="tab-pane" id="panel-685660">
						<p>
							Course
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
