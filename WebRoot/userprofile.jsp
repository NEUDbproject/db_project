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
    

    
<jsp:include page="title.jsp" />
    <title>Management page</title>

<div class="container col-xs-offset" style="width:1300px !important"> 



  	 
  	 
<div class="row">

<%User user=(User)request.getSession().getAttribute("userprofile"); %>

<div class="col-xs-12">

    <div class="clearfix" style="margin-bottom: 20px;"></div><!-- 清除浮动 -->
   <form class="form-horizontal" action="UserProfile" method="post" name="submitform">
   
	<div class="row">
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
    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Rank</a></li>
    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Comment</a></li>
    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Notes</a></li>
  </ul>

  <div class="tab-content">
   <!-- 下面是User Course Information -->
    <div role="tabpanel" class="tab-pane active" id="home">
              <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>Course ID</th>
                  <th>Course Name</th>
                  <th>Rank</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>909</td>
                  <td></td>
                  <td>4</td>
				<td>
         <button class="btn btn-primary btn-xs" type="submit">Delete</button>
         <button class="btn btn-primary btn-xs" type="submit">Edit</button>
            </td>
              </tr> 
              </tbody>
            </table>
          </div>


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
				 <th>Course Name</th>
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