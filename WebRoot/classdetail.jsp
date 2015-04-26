<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	Coursera course = (Coursera)request.getSession().getAttribute("courseRes");
	CourseraSession csession = (CourseraSession)request.getSession().getAttribute("sessionRes");
%>
<%@ include file="title.jsp" %>
<!-- 以下为课程标题 以及点赞功能 -->
<div class="container" style="width:1300px !important"> 
<div class="row" style="margin-left:100px">
<div class="col-xs-9">
 <!--以下为左上角标签及按钮-->
	<div class="row">
		<div class="col-xs-12">
			<h3 class="text-middle">
				<%=course.getName() %>
			</h3>
			<dl>
		
			</dl>
		</div>
	</div>
    
    <div class="clearfix" style="margin-bottom: 20px;"></div><!-- 清除浮动 -->
    
    <!--以下为课程图片以及介绍  -->
    
	<div class="row">
		<div class="col-xs-4">
		<%
			if(course.getVideoId()!=null){
		%>
        <iframe width="300" height="180" src="https://www.youtube.com/embed/<%=course.getVideoId() %>" frameborder="0" allowfullscreen></iframe>
        <%
			}else{
				%><img src="<%=course.getPhoto() %>" alt="<%=course.getShortName() %>" height="180" width="300"><%
			}
        %>
 </div>
 <div class="clearfix visible-xs-block"></div>
 <div class ="col-xs-8">
  		<div class="col-xs-3">
  					<h4 class="text-left text-success">Average:<%=request.getSession().getAttribute("courseAve") %></h4>
                   </div>
  			<div class="col-xs-3">
  			<form action="RateCourse" method="POST" style="display:<%=request.getSession().getAttribute("hasRated").toString()%>">
            	<select name="score" class="form-control"> 
				  <option value="1" >1.0--Bad</option>
				  <option value="2" >2.0--Not Good</option>
				  <option value="3" >3.0--So So</option>
				  <option value="4" >4.0--Good</option>
				  <option value="5" >5.0--Perfect</option>
				</select>
            </div>
            <div class="col-xs-3 col-xs-offset-1">
            	<input type="hidden" value="<%=course.getId()%>" name="courseAppId">
            	<input type="hidden" value="<%=request.getSession().getAttribute("userId").toString()%>" name="userId">
            	<%
            		String disable="";
            		if(request.getSession().getAttribute("hasRated").toString()=="none"){
            			disable = "block";
            		}else{
            			disable = "none";
            		}
            	%>
				<button type="submit" class="btn btn-warning glyphicon glyphicon-star" style="display:<%=request.getSession().getAttribute("hasRated").toString()%>">Rate</button>
				<button type="submit" class="btn btn-success glyphicon glyphicon-star" disabled="disabled" style="display:<%=disable%>">Rated</button> 
			</form>
            </div>
            </div>
        <div class ="col-xs-8">
  		<div class="col-xs-7">
  		<h5 class="text-left">Professor Name: <%=course.getInstructor() %></h5>    </div>
            <div class="col-xs-4">
            <h5 class="text-left">Last:<%=course.getEstimatedClassWorkload() %></h5>
            </div>
            </div>
            <div class ="col-xs-8">    
  		<div class="col-xs-4">
              </div>
 <div class ="col-xs-4 col-xs-offset-3">
   
   <button id = "btn" class="btn btn-primary" type="submit">Go To Class</button> 
    	   <a href="https://www.coursera.org/course/<%=course.getShortName() %>" id="link"></a>
           <script>
           document.getElementById("btn").onclick=function(){
            document.getElementById("link").click();
}
</script>
     
      </div>
          </div>
          </div>
        
    <div class="clearfix" style="margin-bottom: 20px;"></div><!-- 清除浮动 -->
    
    
    <!-- 下面是标签页 -->
    <div class="row">
		<div class="col-xs-12">
        <div role="tabpanel">

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Class Description</a></li>
    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Comment</a></li>
    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Notes</a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
  
   <!-- 下面是Class Description的内容 -->
    <div role="tabpanel" class="tab-pane active" id="home">

	<div class="row">
		<div class="col-xs-12">
        <div class="clearfix" style="margin-bottom: 20px;"></div><!-- 清除浮动 -->
			<p>
				<%=course.getAboutTheCourse() %>
			</p>
		</div>
	</div>

    </div>
    <!-- 下面是Comment的内容 -->
    
    <div role="tabpanel" class="tab-pane" id="profile">
   
	<div class="row">

	</div>

	<div class="row">
		<div class="col-xs-12 text-primary bg-success lead">
			<h1>
				User Comment
			</h1>
		</div>
	</div>

	<div class="row">
		<div class="col-xs-9 text-primary text-justify">
			<h2>
				Newest Comment
			</h2>
		</div>
        	<div class="col-xs-3 text-primary text-center">
			<!-- Button trigger modal -->
			
	<form action="AddPost" method="POST" >		
	<input type="hidden" value="<%=course.getId()%>" name="courseAppId">
    <input type="hidden" value="<%=request.getSession().getAttribute("userId").toString()%>" name="userId">	
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  Post New Comment
</button>

<!-- Modal -->

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">


  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title" id="myModalLabel">Post Comment</h3>
      </div>
       <div class="form-group"> 
      <div class="modal-body" style="height:250px;">
 
             <div class="col-xs-12 input-group input-group-lg pull-left">
          <span class="input-group-addon input-group-xs" id="sizing-addon1">Comment Input</span>
          <textarea class="form-control" rows="3" cols="30" name="NoteURL" style="height:250px"></textarea>
        </div>
   </div>     
            
      </div>
       <div class="form-group">  
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
       
        <button type="submit" class="btn btn-primary">Submit</button>
        </div>
        
      </div>
    </div>
  </div>
</div>
</form>







		</div>
		
		
		</div>

		    <div>
 

          <%  List<Post> postList=(List<Post>)request.getSession().getAttribute("postlist");%>
  <%
    		for(int i=0;i<postList.size();i++){
    				
    			Post newPost = new Post();
    			newPost = postList.get(i);
    			%> 	
		<div class="col-xs-2">
			</div>
		<div class="col-xs-10">
			<h3 class="text-left"><%=newPost.getEmail() %></h3>
			<p>
				<%=newPost.getPostContent() %>
			</p>
		</div>
      <div class="clearfix" style="margin-bottom: 20px;"></div><!-- 清除浮动 -->
      <% 
			} %>
			  
</div>





    </div>
  <!-- 下面是Notes的内容 -->  
    <div role="tabpanel" class="tab-pane" id="messages">
	<div class="row">
		<div class="col-xs-9">
			<h2 class="text-success">
				Course Notes
			</h2>
		</div>
	  <div class="col-xs-3">	
	<form action="AddNote" method="POST" >		
	<input type="hidden" value="<%=course.getId()%>" name="courseAppId">
    <input type="hidden" value="<%=request.getSession().getAttribute("userId").toString()%>" name="userId">	
	<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModaltwo">
Post New Note
</button>
		
<div class="modal fade" id="myModaltwo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">


  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title" id="myModalLabel">Post Note</h3>
      </div>
       <div class="form-group"> 
      <div class="modal-body" style="height:150px;">
             <div class="col-xs-12 input-group input-group-lg pull-left">
          <span class="input-group-addon input-group-xs" id="sizing-addon1">Url Input</span>
          <textarea class="form-control" rows="3" cols="30" name="NoteURL" style="height:150px"></textarea>
        </div>
   </div>     
            
      </div>
       <div class="form-group">  
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
       
        <button type="submit" class="btn btn-primary">Submit</button>
        </div>
        
      </div>
    </div>
  </div>
</div>
		
		
		
		
		
		
	</form>	
	</div>
	
	
	
	</div>
		    <div>
 

          <%  List<Note> noteList=(List<Note>)request.getSession().getAttribute("notelist");%>
  <%
    		for(int i=0;i<noteList.size();i++){
    				
    			Note newNote = new Note();
    			newNote = noteList.get(i);
    			%> 	
		<div class="col-xs-2">
			</div>
		<div class="col-xs-10">
			<h3 class="text-left"><%=newNote.getEmail() %></h3>
			<p>
				<%=newNote.getNoteURL() %>
			</p>
		</div>
      <div class="clearfix" style="margin-bottom: 20px;"></div><!-- 清除浮动 -->
      <% 
			} %>
			  
</div>
 
    
    </div>
  <!-- 下面是Discussions的内容 -->      
    <div role="tabpanel" class="tab-pane" id="settings">
	<div class="row">
		<div class="col-xs-10 text-primary text-justify">
			<h2>
				Newest Discussion
			</h2>
		</div>
        	<div class="col-xs-2 text-primary text-center">
			<!-- Button trigger modal -->
            <div class="clearfix" style="margin-bottom: 15px;"></div><!-- 清除浮动 -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModaltwo">
  Post New Discussion
</button>

<!-- Modal -->
<div class="modal fade" id="myModaltwo" tabindex="-1" role="dialog" aria-labelledby="myModaltwoLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title" id="myModaltwoLabel">Post Subject</h3>
      </div>
      <div class="modal-body" style="height:250px;">
             <div class="col-xs-12 input-group input-group-lg pull-left">
          <span class="input-group-addon input-group-xs" id="sizing-addon1">Subject</span>
          <textarea class="form-control" rows="3" cols="30" style="height:50px" style="margin-left:10px"></textarea>
        </div>
             <div class="clearfix" style="margin-bottom: 20px;"></div><!-- 清除浮动 -->
             <div class="col-xs-12 input-group input-group-lg pull-left">
          <span class="input-group-addon input-group-xs" id="sizing-addon1">Content</span>
          <textarea class="form-control" rows="3" cols="30" style="height:250px"></textarea>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Submit</button>
      </div>
    </div>
  </div>
</div>
		</div>
		</div>
	<div class="row">
		<div class="col-xs-8">
			<h3 class="text-primary">This is discussion subject</h3>
		</div>
		<div class="col-xs-4">
			<h3 class="text-right"><a href="http://baidu.com#">Zhang San</a></h3>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<p>
				Few people on Capitol Hill are more important to the White House now than Senator Bob Corker, the Republican behind a bill to force President Obama to send any deal with Iran to Congress for approval.
			</p>
		</div>
	</div>


	<div class="row">
		<div class="col-xs-8">
			<h3 class="text-primary">Another subject posted</h3>
		</div>
		<div class="col-xs-4">
			<h3 class="text-right"><a href="http://baidu.com#">Wang Wu</a></h3>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<p>
				Few people on Capitol Hill are more important to the White House now than Senator Bob Corker, the Republican behind a bill to force President Obama to send any deal with Iran to Congress for approval.
			</p>
		</div>
	</div>

	<div class="row">
		<div class="col-xs-8">
			<h3 class="text-primary">Tripple Kill!</h3>
		</div>
		<div class="col-xs-4">
			<h3 class="text-right"><a href="http://baidu.com#">Wang Shushu</a></h3>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<p>
				Few people on Capitol Hill are more important to the White House now than Senator Bob Corker, the Republican behind a bill to force President Obama to send any deal with Iran to Congress for approval.
			</p>
		</div>
	  </div>
    </div>
  
      </div>

    </div>
   </div>
  </div>
    </div>
 <!-- 这是右边的模块-->
      
      </div>
     </div>
</body>
</html>