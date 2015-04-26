<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="model.*" %>
<%@ page import="controller.*" %>
<%@ page import="library.*" %>

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
  
  
     

  
  
<body>
  	<%
  		
 		if(session.getAttribute("userId")==null)
 				
  		{
  			%><body style="text-align:center;">&nbsp; 
	  			 Please login first&nbsp;&nbsp;<span id="time">5</span>seconds，redirect to the login page。  <br>
		  	  <script type="text/javascript">  
				delayURL("login.jsp"); 
			  </script>
			<%
  	}
  		else{
  		  String type = request.getSession().getAttribute("type").toString();


	  		 if(type.equals("Admin")){
	  				 
		  	 %>








 <!-- 以下为用户，课程管理功能 -->
<div class="container" style="width:1350px !important"> 
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
    <li role="presentation"><a href="#course" aria-controls="course" role="tab" data-toggle="tab">Course Management</a></li>
    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Post Management</a></li>
    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Notes</a></li>
    <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Course Rank</a></li>
     <li role="presentation"><a href="#inputs" aria-controls="inputs" role="tab" data-toggle="tab">Course Recommendation</a></li>
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


    </div>
 
       <!-- 下面是Course Management的内容 -->
    <div role="tabpanel" class="tab-pane" id="course">
              <div class="table-responsive">
           <table class="table table-striped" style="table-layout:fixed">
            
      
                       <% CourseManager coursemanager = new CourseManager();  
              coursemanager.doGet(request, response);          
          %>
          <%  List<Course> courseList=(List<Course>)request.getSession().getAttribute("courselist");
          Json Coursera = new Json();
          CourseraAbstract[] courses = Coursera.getApiInfo("https://api.coursera.org/api/catalog.v1/courses");
          
          
          %>
          
              <thead>
                <tr>
                  <th width="100px">Course Id</th>
                  <th width="100px">Course APP Id</th>
                  <th width="100px">Provider</th>
                  <th width="250px" class="text-center">Header</th>
                  <th width="100px" class="text-center">Option</th>
                </tr>
              </thead>
              <tbody>
               <%
    		for(int i=0;i<courses.length;i++){
    			
    			CourseraAbstract course = courses[i];
    		
    			Course newCourse = new Course();
    			newCourse = courseList.get(i);
    			%><tr><%
    			 
    			%><td style="white-space:nowrap; overflow:hidden; text-overflow:ellipsis"><%=newCourse.getCourseId() 
    			%></td><% 

				%><td style="white-space:nowrap; overflow:hidden; text-overflow:ellipsis"><%=newCourse.getCourseAPPId() 
    			%></td><% 	
    			
    			%>
                  <td style="white-space:nowrap; overflow:hidden; text-overflow:ellipsis"><%=newCourse.getProvider() 
    			%></td>
                  
                  <% 	
    			
    			%>
                  <td style="white-space:nowrap; overflow:hidden; text-overflow:ellipsis"><%=course.getName()
    			%></td>
                  
                  <% 	
    			
    			%>
                  
                  
                  <td style="white-space:nowrap; overflow:hidden; text-overflow:ellipsis">
                  <div class="col-xs-offset-4">
         			<!-- Button trigger modal -->
                 <form method="get" action="DeleteCourse">
		    		
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

<div class="span12">
<form action="CourseRefresh" method="POST">
	<button class="btn btn-info" type="submit">Refresh Course Database</button>
</form>
</div>
    </div>  <!-- CourseManager End here -->
    
    
    
    <!-- 下面是Post Management的内容 -->
    
    <div role="tabpanel" class="tab-pane" id="profile">
              <div class="table-responsive">
              
             <% PostManager postmanager = new PostManager();  
                postmanager.doGet(request, response);
          %>
              
        <%  List<Post> PostList=(List<Post>)request.getSession().getAttribute("postlist");%>
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>User Id</th>
                  <th>User Name</th>
                  <th>Target Course Id</th>
                  <th>Post Content</th>
                  
                  <th class=" text-center">Action</th>
                </tr>
              </thead>
              <tbody>
               <%
    		for(int i=0;i<PostList.size();i++){
    		
    			Post newPost = new Post();
    			newPost = PostList.get(i);
    			%><tr><%
    			 
    			%><td><%=newPost.getUserId() 
    			%></td><% 

				%>
			       <td><%=newPost.getEmail()
    			%></td>
                  
                  <% 	
    			%>
				<td><%=newPost.getCourseId() 
    			%></td><% 	
    			
    			%>
                  <td><%=newPost.getPostContent() 
    			%></td>
                  
                  <% 	
    			
    			%>
    	          
                  
                  <td>
                  
            <div class="col-xs-offset-4">
         			<!-- Button trigger modal -->
           
		        <form method="get" action="DeletePost">
		    		
		    	<button class="btn btn-primary btn-xs" type="submit" name="deleteid" value="<%=newPost.getCommentListId() %>" >delete</button>
		    		
		       </form>  
		 			
			</div>
			
            </td>
                </tr>


 		     <% 
    			} %>
    			
               
              </tbody>
            </table>
          </div>


    </div>
    <!-- 下面是Notes的内容 -->
    <div role="tabpanel" class="tab-pane" id="messages">   
               <div class="table-responsive">
              
             <% NoteManager notemanager = new NoteManager();  
                notemanager.doGet(request, response);
          %>
              
        <%  List<Note> NoteList=(List<Note>)request.getSession().getAttribute("notelist");%>
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>User Id</th>
                  <th>User Name</th>
                  <th>Target Course Id</th>
                  <th>Note URL</th>
                  
                  <th class=" text-center">Action</th>
                </tr>
              </thead>
              <tbody>
               <%
    		for(int i=0;i<NoteList.size();i++){
    		
    			Note newNote = new Note();
    			newNote = NoteList.get(i);
    			%><tr><%
    			 
    			%><td><%=newNote.getUserId() 
    			%></td><% 

				%>
			       <td><%=newNote.getEmail()
    			%></td>
                  
                  <% 	
    			%>
				<td><%=newNote.getCourseId() 
    			%></td><% 	
    			
    			%>
                  <td><%=newNote.getNoteURL() 
    			%></td>
                  
                  <% 	
    			
    			%>
    	          
                  
                  <td>
                  
            <div class="col-xs-offset-4">
         			<!-- Button trigger modal -->
           
		        <form method="get" action="DeleteNote">
		    		
		    	<button class="btn btn-primary btn-xs" type="submit" name="deletenoteid" value="<%=newNote.getCommentListId() %>" >delete</button>
		    		
		       </form>  
		 			
			</div>
			
            </td>
                </tr>


 		     <% 
    			} %>
    			
               
              </tbody>
            </table>
          </div>

 
    
    </div>
    <!--  
    <!-- 下面是Course Rank的内容 -->    
       <div role="tabpanel" class="tab-pane" id="settings">
              <div class="table-responsive">
              
             <% RankManager rankmanager = new RankManager();  
                rankmanager.doGet(request, response);
          %>
              
        <%  List<Rank> RankList=(List<Rank>)request.getSession().getAttribute("ranklist");%>
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>User Id</th>
                  <th>User Name</th>
                  <th>Target Course Id</th>
                  <th>Rank</th>
                  
                </tr>
              </thead>
              <tbody>
               <%
    		for(int i=0;i<RankList.size();i++){
    		
    			Rank newRank = new Rank();
    			newRank = RankList.get(i);
    			%><tr><%
    			 
    			%><td><%=newRank.getUserId() 
    			%></td><% 

				%>
			       <td><%=newRank.getEmail()
    			%></td>
                  
                  <% 	
    			%>
				<td><%=newRank.getCourseId() 
    			%></td><% 	
    			
    			%>
                  <td><%=newRank.getRank() 
    			%></td>
                  
                  <% 	
    			
    			%>
    	
                  
                  
                  <td>
                  
            <div class="col-xs-offset-4">
         			<!-- Button trigger modal -->	
			</div>
			
            </td>
                </tr>


 		     <% 
    			} %>
    			
               
              </tbody>
            </table>
          </div>
 

    </div>

            <!-- 下面是Course Recommendation的内容 -->    
       <div role="tabpanel" class="tab-pane" id="inputs">
  
    <div class ="row">
     <div class = "col-xs-12">
      <h2 class="sub-header text-primary"><em>Recommendation Manage</em></h2>
      </div>
      <div class="clearfix" style="margin-bottom: 20px;"></div><!-- 清除浮动 -->
       <div class = "col-xs-12">
   			<p>
				Please input four recommendation course Id into meta box and divid each one by ",". For example 1,2,3,4. Please input recommendation tag into value box. 
			</p>
			 </div>
			 <div class="clearfix" style="margin-bottom: 20px;"></div><!-- 清除浮动 -->
		<form class="form-horizontal" action="AddRecommend" method="POST">	 
			  <div class = "col-xs-12">
    <div class="form-group col-xs-4">
          <input type="text" class="form-control" placeholder="Meta" name="Meta">
          
        </div>
       
     
          </div>
      <div class = "col-xs-12">
    <div class="form-group col-xs-4">
          <input type="text" class="form-control" placeholder="Value" name="Value">
        </div>
         <div class = "col-xs-12">
             <button type="submit" class="btn btn-default btn-lg btn-warning">Submit</button>
         </div>
          </div>
          </form>
      </div>

 

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
		  		}  		}%>

</html>