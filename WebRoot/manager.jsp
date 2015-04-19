<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>   
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
    
<!-- Start -->    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    
    <title>Manager|OCE</title>
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
    
<!-- æ° Bootstrap æ ¸å¿ CSS æä»¶ -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- å¯éçBootstrapä¸»é¢æä»¶ï¼ä¸è¬ä¸ç¨å¼å¥ï¼ -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<!-- jQueryæä»¶ãå¡å¿å¨bootstrap.min.js ä¹åå¼å¥ -->
<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>

<!-- ææ°ç Bootstrap æ ¸å¿ JavaScript æä»¶ -->
<script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<script src="./Blog Template for Bootstrap_files/ie-emulation-modes-warning.js"></script>

</head>






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
              <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>User Id#</th>
                  <th>FirstName</th>
                  <th>LastName</th>
                  <th>PassWord</th>
                  <th>Email</th>
                  <th>Birth</th>
                  <th>Type</th>
                  <th class="text-center">Header</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach items="${userlist}" var="user">
                <tr>
                <td>${user.id}</td>  
                <td>${user.firstname}</td>  
                <td>${user.lastname}</td>  
                <td>${user.email}</td>  
                  <td>
                  <div class="col-xs-offset-3">
         			<!-- Button trigger modal -->
<button class="btn btn-primary btn-xs" type="submit" data-toggle="modal" data-target="#myModal">Add</button>
<!-- Modal -->
          <button class="btn btn-primary btn-xs" type="submit">Add</button>
         <button class="btn btn-primary btn-xs" type="submit">Delete</button>
         <button class="btn btn-primary btn-xs" type="submit">Edit</button>
			</div>
            </td>
                </tr>
           </c:forEach>  
               
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
              <thead>
                <tr>
                  <th>Course Id#</th>
                  <th>Course APP Id</th>
                  <th>Provider</th>
                  <th class="text-center">Header</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1,001</td>
                  <td>Lorem</td>
                  <td>ipsum</td>
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
                <tr>
                  <td>1,001</td>
                  <td>Lorem</td>
                  <td>ipsum</td>
                  <td>dolor</td>
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


</html>