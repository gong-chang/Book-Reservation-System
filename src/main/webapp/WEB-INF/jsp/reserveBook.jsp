<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path ;
%>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link href="<%= basePath %>/css/carousel.css" rel="stylesheet">
    <title>Book Reservation</title>
  </head>
<body>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading text-center">
     	   	<h2>Book Reservation Centre</h2>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>Book ID</th>
                    <th>Title</th> 
                    <th>Book Description</th>
                    <th>Stock</th>
                    <th>Reservation</th>
                </tr>
                </thead>
                <tbody>
                	<tr>
                		<td>${book.bookId}</td>
                		<td>${book.name}</td>
                		<td>${book.intro}</td> 
                		<td>${book.number }</td>
                		<td>1</td>
                	</tr>  
                </tbody>
             </table> 
           </div>  
           <div class="panel-body text-center">
            	<h2 class="text-danger">  
            		<!--用来展示预约控件-->
            		<span class="glyphicon" id="appoint-box"></span> <!--在js里面调用这个id还可以动态显示一些其他东西，例如动态时间等（需要插件）-->
            		 
            		<span class="glyphicon"><a class="btn btn-primary btn-lg" href="/BookAppointment/appoint?studentId=${cookie['studentId'].value}" target="_blank">Check My Reservations</a></span>
            	</h2>           <!--如何获取该页面弹出层输入的学生ID， 传给上面的url-->
        	</div>
    </div>	 	
            		  
</div>
   <!--  登录弹出层 输入电话   -->
<div id="varifyModal" class="modal fade"> <!-- modal fade是一个可被触发的弹出窗，根据它的id -->
    <div class="modal-dialog"> 
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title text-center">
                    <span class="glyphicon glyphicon-studentId"> </span>Please Login Frist:
                </h3>
            </div>

            <div class="modal-body">
                <div class="row">
                    <div class="col-xs-8 col-xs-offset-2">
                        <input type="text" name="studentId" id="studentIdKey"
                               placeholder="Student/Admin ID" class="form-control">
                    </div>
                    <div class="col-xs-8 col-xs-offset-2">
                        <input type="password" name="password" id="passwordKey"
                               placeholder="Password" class="form-control">
                    </div>
                </div>
            </div>

            <div class="modal-footer" >
               		<!--  验证信息 -->
                <span id="studentMessage" class="glyphicon"> </span>
                <!-- <button type="button" id="adminloginBtn" class="btn btn-info">
                <span class="glyphicon glyphicon-student">Admin</span>
                </button> -->
                <button type="button" id="studentBtn" class="btn btn-success">
                <span class="glyphicon glyphicon-student">Student</span>
                </button>
            </div>
            <div style="text-align:center">
            <strong>Sample Users</strong>
            <table style="width: 100%;" id="sampleLoginTable">
                <tr>
                    <td><a
                            onclick="fillLoginFields('3211200801','346543')"
                            href="javascript:void(0)">Student1</a></td>
                    <td><a
                            onclick="fillLoginFields('3211200802','754323')"
                            href="javascript:void(0)">Student2</a></td>
                    <td><a
                            onclick="fillLoginFields('10000','10000')"
                            href="javascript:void(0)">Admin1</a></td>
                </tr>
            </table>
            </div>
        </div>
    </div> 
</div>  

</body>
<%--jQery文件,务必在bootstrap.min.js之前引入--%>
<script src="https://cdn.bootcss.com/jquery/2.0.0/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%--使用CDN 获取公共js http://www.bootcdn.cn/--%>
<%--jQuery Cookie操作插件--%>
<script src="https://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<%--jQuery countDown倒计时插件--%>
<script src="https://cdn.bootcss.com/jquery.countdown/2.1.0/jquery.countdown.min.js"></script>

<script src="<%=request.getContextPath()%>/script/bookappointment.js" type="text/javascript"></script>

<script type="text/javascript">
	$(document).ready(function () {
        bookappointment.detail.init(${book.bookId});
        
    }) 
    
</script>
  <script>
    function fillLoginFields(u, p) {
        document.getElementById("studentIdKey").value = u;
        document.getElementById("passwordKey").value = p;
    }
</script>
</html> 