<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Reservation List</title>

    <!-- Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link href="<%=request.getContextPath()%>/css/carousel.css" rel="stylesheet">
  </head>
<body>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading text-center">
            <h2>Your Reservations</h2>
        </div>
		<div class="panel-body">
            <table class="table table-hover">
                <thead>
                <tr> 
                    <th>Student ID</th>
                    <th>Reserve Time</th>
                    <th>Book ID</th> 
                    <th>Title</th>
                    <th>Book Description</th>
                    <th>Reserve Number</th>  
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${appointList}" var="sk">
                    <tr>
                    	<td>${sk.studentId}</td> 
                        <td>${sk.appointTime}</td>
                        <td>${sk.bookId}</td>
                        <td>${sk.book.getName()}</td>
                        <td>${sk.book.getIntro()}</td> 
                        <td>1</td> 
                    </tr>
                </c:forEach>
                </tbody>
            </table> 
        </div> 
    </div>
</div> 
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</body>
</html>