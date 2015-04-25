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
  </head>
  
  
  
<body>


<div class="container col-xs-offset-2" style="width:1300px !important"> 



  	 
  	 
<div class="row">

<%User user=(User)request.getSession().getAttribute("userprofile"); %>

<div class="col-xs-12">

    <div class="clearfix" style="margin-bottom: 20px;"></div><!-- 清除浮动 -->
   <form class="form-horizontal" action="UserProfile" method="post" name="submitform">
   
	<div class="row">
	<div class="col-xs-3">
        <img src="./testtest_files/touxiang.jpg"  alt="Responsive image" height=180 width=200>
    </div>
 <div class="col-xs-9">
       <div class ="col-xs-8">
  			<h2 class="text-left text-primary"><strong><%=user.getFirstName() %> <%=user.getLastName() %></strong></h2>
       </div>
       <div class ="col-xs-8">
         <div class="col-xs-2">
  		    <h4 class="text-left text-primary">User ID:</h4>
         </div>
         <div class="col-xs-6">
         <h4 class="text-left text-primary"><%=user.getUserId() %></h4>
            </div> 
            </div>
      <div class ="col-xs-8">
       <div class="col-xs-2">
  		 <h4 class="text-left text-primary">Email:</h4>
         </div>
         <div class="col-xs-6">
         <h4 class="text-left text-primary"><%=user.getEmail() %></h4>
            </div> 
            </div> 
      <div class ="col-xs-8">
       <div class="col-xs-2">
  		 <h4 class="text-left text-primary">Type:</h4>
         </div>
         <div class="col-xs-6">
         <h4 class="text-left text-primary">Student</h4>
            </div> 
            </div>
            </div>
          </div>
    </form>  <!--  This part is used to show the current user information -->
     <div class="clearfix" style="margin-bottom: 50px;"></div><!-- 清除浮动 -->
  
    <div class="row">
		<div class="col-xs-12">
        <div role="tabpanel">

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Course</a></li>
    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Comment</a></li>
    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Notes</a></li>
    <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Disscusstion</a></li>
  </ul>

  <div class="tab-content">
   <!-- 下面是User Course Information -->
    <div role="tabpanel" class="tab-pane active" id="home">
              <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>Course ID#</th>
                  <th>CourseAPP ID</th>
                  <th>Provider</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1,001</td>
                  <td>Lorem</td>
                  <td>ipsum</td>
				<td>
         <button class="btn btn-primary btn-xs" type="submit">Delete</button>
         <button class="btn btn-primary btn-xs" type="submit">Edit</button>
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
 
    <!-- 下面是User Comment Information -->
    
    
       
           <% PostManager postmanager = new PostManager();  
              postmanager.doGet(request, response);          
          %>
      <%  List<Post> postList=(List<Post>)request.getSession().getAttribute("userpost");%>
    <div role="tabpanel" class="tab-pane" id="profile">
            <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>Target CourseId</th>
                  <th>Post Content</th>

                </tr>
              </thead>

              <tbody>
               <%
    		for(int i=0;i<postList.size();i++){
    		
    			Post newPost = new Post();
    			newPost = postList.get(i);
    			%><tr><%
    			 
    			%><td><%=newPost.getCourseId() 
    			%></td><% 

				%><td><%=newPost.getPostContent()
    			%></td><% 	
    			
    			%>
                  

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

    </div>
    
    
    
    <!-- 下面是User Note Information -->
    <div role="tabpanel" class="tab-pane" id="messages">   
  	 <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>CommentListId</th>
                  <th>NoteTitle</th>
                  <th>NoteContent</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1,001</td>
                  <td>Lorem</td>
                  <td>ipsum</td>
				<td>
         <button class="btn btn-primary btn-xs" type="submit">Delete</button>
         <button class="btn btn-primary btn-xs" type="submit">Edit</button>
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
    <!-- 下面是User Discussion Information -->    
       <div role="tabpanel" class="tab-pane" id="settings">
              <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>CommentListId</th>
                  <th>Subject</th>
                  <th>Contents</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1,001</td>
                  <td>Lorem</td>
                  <td>ipsum</td>
				<td>
         <button class="btn btn-primary btn-xs" type="submit">Delete</button>
         <button class="btn btn-primary btn-xs" type="submit">Edit</button>
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
    <div class="clearfix" style="margin-bottom: 20px;"></div><!-- 清除浮动 -->
    </div>
    </div>
    </div>

</body>
</html>