<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="model.*" %>
<%@ page import="controller.*" %>
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
    
      <script language="JavaScript1.2" type="text/javascript">
		function delayURL(url) {
			var delay = document.getElementById("time").innerHTML;
			if(delay > 0) {
			   delay--;
			   document.getElementById("time").innerHTML = delay;
			} else {
			   window.location.href = url;
			    }
			    setTimeout("delayURL('" + url + "')", 1000);
		}
	</script>
    
  </head>
  
  
     
  	<%
  		
  		if(session.getAttribute("userId")==null)
  		{
  			%><body style="text-align:center;">&nbsp; 
	  			 您尚未登录。页面<span id="time">5</span>秒后，自动返回登录界面。  <br>
		  	  <script type="text/javascript">  
				delayURL("login.jsp"); 
			  </script>
			<%
  		}
  		else{
  			String type = request.getSession().getAttribute("type").toString();


	  		 if(type.equals("Admin")){
		  	 %>
  
  
<body>



 <!-- 以下为用户，课程管理功能 -->
<div class="container" style="width:1200px !important"> 
<div class="row">
<div class="col-xs-11 col-xs-offset-1">
	

      <h2 class="sub-header col-xs-offset-4 text-primary"><em>Management Page</em></h2>
    
	
        
    <div class="clearfix" style="margin-bottom: 20px;"></div><!-- 清除浮动 -->
    
    
    <!-- 下面是标签页 -->
    <div class="row">
		<div class="col-xs-12">
        <div role="tabpanel">

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">User Management</a></li>
    <li role="presentation"><a href="#course" aria-controls="course" role="tab" data-toggle="tab">Course</a></li>
    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Comment</a></li>
    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Notes</a></li>
    <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Disscusstion</a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
  
   <!-- 下面是User Management的内容 -->
    <div role="tabpanel" class="tab-pane active" id="home">
              <div class="table">
            <table class="table table-striped">
          <% UserManager usermanager = new UserManager();  
              usermanager.doGet(request, response);          
          %>
          <%  List<User> userList=(List<User>)request.getSession().getAttribute("userlist");%>
              <thead>
                <tr>
                  <th>User Id#</th>
                  <th>FirstName</th>
                  <th>LastName</th>
                  <th class="text-center">PassWord</th>
                  <th>Email</th>
                  <th>Type</th>
                  <th class="text-center">Opertion</th>
                </tr>
              </thead>
              <tbody>
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
    			
    			%>
    			
                  <td>
                  <div class="col-xs-offset-2">
         			<!-- Button trigger modal -->
         

                 <form class="btn btn-primary btn-xs" method="get" action="DeleteUser">
		    		
		    			<button class="btn btn-primary btn-xs" type="submit" name="deleteid" value="<%=newUser.getUserId()%>" >delete</button>
		    		
		 			</form>  
                
                  <form class="btn btn-primary btn-xs" method="get" action="EditUser">
		    		
		    			<button class="btn btn-primary btn-xs" type="submit" name="userid" value="<%=newUser.getUserId()%>" >edit</button>
		    		
		 			</form>  
			</div>
            </td>
                </tr>
                <% 
    			} %>
    			
    	  <tr>
    	  
    	  <!-- the blank TD below is used to let button pull to the right -->
    	  <td> </td> <td> </td> <td> </td> <td> </td> <td> </td>  <td> </td> 
    	  <!-- the blank TD above is used to let button pull to the right -->
    	  
    	  <td> 
    	  <div class="col-xs-offset-2">
    	   <button id = "btn" class="btn btn-success" type="submit">Add New User</button> 
    	   <a href="adduser.jsp" id="link"></a>
           <script>
           document.getElementById("btn").onclick=function(){
            document.getElementById("link").click();
}
</script>
    	   </div>
    	  </td>
   
    	  </tr>

           
   
         </tbody>
    	


            </table>
          </div>
<nav>
  <ul class="pagination">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>

    </div>
 
       <!-- 下面是Course Management的内容 -->
    <div role="tabpanel" class="tab-pane" id="course">
              <div class="table-responsive">
            <table class="table table-striped">
            
                       <% CourseManager coursemanager = new CourseManager();  
              coursemanager.doGet(request, response);          
          %>
          <%  List<Course> courseList=(List<Course>)request.getSession().getAttribute("courselist");%>
          
              <thead>
                <tr>
                  <th>Course Id#</th>
                  <th>Course APP Id</th>
                  <th>Provider</th>
                  <th class="text-center">Header</th>
                </tr>
              </thead>
              <tbody>
               <%
    		for(int i=0;i<courseList.size();i++){
    		
    			Course newCourse = new Course();
    			newCourse = courseList.get(i);
    			%><tr><%
    			 
    			%><td><%=newCourse.getCourseId() 
    			%></td><% 

				%><td><%=newCourse.getCourseAPPId() 
    			%></td><% 	
    			
    			%>
                  <td><%=newCourse.getProvider() 
    			%></td>
                  
                  <% 	
    			
    			%>
                  
                  
                  <td>
                  <div class="col-xs-offset-4">
         			<!-- Button trigger modal -->
                 <form class="btn btn-primary btn-xs" method="get" action="DeleteCourse">
		    		
		    			<button class="btn btn-primary btn-xs" type="submit" name="deleteid" value="<%=newCourse.getCourseId()%>" >delete</button>
		    		
		 			</form>  
			</div>
            </td>
                </tr>


 		     <% 
    			} %>
    			
               
              </tbody>
            </table>
          </div>
<nav>
  <ul class="pagination">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
<div class="span12">
<form action="CourseRefresh" method="POST">
	<button class="btn btn-info" type="submit">Refresh Course Database</button>
</form>
</div>
    </div>  <!-- CourseManager End here -->
    
    
    
    <!-- 下面是Comment的内容 -->
    
    <div role="tabpanel" class="tab-pane" id="profile">
            <div class="table-responsive">
            <table class="table table-striped">
  
              <thead>
                <tr>
                  <th>User Id</th>
                  <th>CommentListId</th>
                  <th>Content</th>
                  <th>TargetId</th>
                  <th class=" text-center">Header</th>
                </tr>
              </thead>
              <tbody>
  
                  <td>
                  <div class="col-xs-offset-4">
         			<!-- Button trigger modal -->
		 <button class="btn btn-primary btn-xs" type="submit">Add</button>
         <button class="btn btn-primary btn-xs" type="submit">Delete</button>
         <button class="btn btn-primary btn-xs" type="submit">Edit</button>
			</div>
			
			
	
            </td>
                </tr>
 

 

               
              </tbody>
            </table>
          </div>
<nav>
  <ul class="pagination">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>

    </div>
    <!-- 下面是Notes的内容 -->
    <div role="tabpanel" class="tab-pane" id="messages">   
  	 <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>User Id#</th>
                  <th>CommentListId</th>
                  <th>NoteTitle</th>
                  <th>NoteContent</th>
                  <th class=" text-center">Header</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1001</td>
                  <td>Lorem</td>
                  <td>ipsum</td>
                  <td>dolor</td>
                  <td>
                  <div class="col-xs-offset-3">
         			<!-- Button trigger modal -->
		 <button class="btn btn-primary btn-xs" type="submit">Add</button>
         <button class="btn btn-primary btn-xs" type="submit">Delete</button>
         <button class="btn btn-primary btn-xs" type="submit">Edit</button>
			</div>
            </td>
                </tr>
 




               
              </tbody>
            </table>
          </div>
<nav>
  <ul class="pagination">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
 
    
    </div>
    <!-- 下面是Discussion的内容 -->    
       <div role="tabpanel" class="tab-pane" id="settings">
              <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>User Id</th>
                  <th>CommentListId</th>
                  <th>Subject</th>
                  <th>Contents</th>
                  <th class=" text-center">Action</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1,001</td>
                  <td>Lorem</td>
                  <td>ipsum</td>
                  <td>Iranian</td>
                  
                  
                  <td>
                  <div class="col-xs-offset-4">
         			<!-- Button trigger modal -->
		 <button class="btn btn-primary btn-xs" type="submit">Add</button>
         <button class="btn btn-primary btn-xs" type="submit">Delete</button>
         <button class="btn btn-primary btn-xs" type="submit">Edit</button>
			</div>
            </td>
                </tr>

  

               
              </tbody>
            </table>
          </div>
 
<nav>
  <ul class="pagination">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
    </div>
  			</div>
		   </div>   
		  </div>
	     </div>
        </div>
       </div>
     </div>
   
</body>
<%  } 
	  		   else
		  		{
		  			%>
	            <body style="text-align:center;">
	  			 普通用户无权进入管理员界面。页面<span id="time">5</span>秒后，自动返回个人界面。  <br>
		  	  <script type="text/javascript">  
				delayURL("title.jsp"); 
			  </script>
		  			<%
		  		}
	  		}%>
</html>