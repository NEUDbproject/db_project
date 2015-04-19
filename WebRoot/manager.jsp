<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
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
	
    
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
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
                <tr>
                  <td>1,001</td>
                  <td>Lorem</td>
                  <td>ipsum</td>
                  <td>dolor</td>
                  <td>dolor</td>
                  <td>dolor</td>
                  <td>dolor</td>
                  <td>
                  <div class="col-xs-offset-3">
         			<!-- Button trigger modal -->
<button class="btn btn-primary btn-xs" type="submit" data-toggle="modal" data-target="#myModal">Add</button>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h2 class="modal-title text-primary" id="myModalLabel">Add User</h2>
      </div>
      <div class="modal-body" style="height:300px; width:450px;">

     <form class="form-horizontal">
  <div class="form-group">
      <label for="inputFirstName3" class="col-sm-2 control-label text-danger">UserId</label>
    <div class="col-sm-4">
      <label for="inputFirstName3" class="control-label text-left text-primary">001</label>
    </div>
    <label for="inputFirstName3" class="col-sm-2 control-label text-danger">FirstName</label>
    <div class="col-sm-4">
      <label for="inputFirstName3" class="control-label text-left text-primary">Zhang</label>
    </div>
  </div>
  <div class="form-group">
    <label for="inputLastName3" class="col-sm-2 control-label text-primary">LastName</label>
    <div class="col-sm-4">
      <label for="inputFirstName3" class=" control-label  text-primary">Sanfeng</label>
    </div>
  </div>
    <div class="form-group">
    <label for="inputBirthDay3" class="col-sm-2 control-label text-info">Birth</label>
    <div class="col-sm-4">
      <label for="inputFirstName3" class=" control-label  text-primary">1900-23-34</label>
    </div>
  </div>
      <div class="form-group">
    <label for="inputPassWord3" class="col-sm-2 control-label text-success">PassWord</label>
    <div class="col-sm-4">
      <label for="inputFirstName3" class=" control-label  text-primary">123456</label>
    </div>
  </div>
      <div class="form-group">
    <label for="inputPassWord3" class="col-sm-2 control-label text-warning">Attribute</label>
 <div class="col-sm-4">
<label for="inputFirstName3" class=" control-label  text-primary">Student</label>
  </div>
 </div>
        <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
    <div class="col-sm-4">
      <label for="inputFirstName3" class=" control-label  text-primary">1231@qq.com</label>
    </div>
  </div>

</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Confirm Add</button>
      </div>
    </div>
  </div>
</div><!--zhzushi-->
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
     </div>  <!-- Container -->


</body>


</html>