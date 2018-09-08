<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Book Reservation System</title>

    <!-- Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">


    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath()%>/css/dashboard.css" rel="stylesheet">


  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="<%= request.getContextPath()%>/admin/booksPage">Book Reservation System</a>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="<%= request.getContextPath()%>/admin/booksPage">Books Management<span class="sr-only">(current)</span></a></li>
            <li><a href="<%= request.getContextPath()%>/admin/studentsPage">Students Management</a></li>
            <li><a href="<%= request.getContextPath()%>/admin/reservationsPage">Reservations</a></li>
            <li><a href="<%= request.getContextPath()%>/admin/bookPreparePage">Reserved Books</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="sub-header">Books <a href="<%= request.getContextPath()%>/admin/addbook" class="btn btn-primary btn-lg" role="button" style="float:right">Add Book</a></h1>
          
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Title</th>
                  <th>Description</th>
                  <th>Stock</th>
                  <th>Edit / Delete</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${booklist}" var="b" varStatus="st">
        			<tr>
			            <td>${b.bookId}</td>
			            <td style="width: 200px;"><a href="<%= request.getContextPath()%>/detail?bookId=${b.bookId}#bookslist">${b.name}</a></td>
			            <td>${b.intro}</td>
			            <td>${b.number}</td>
			            <td><a href="<%= request.getContextPath()%>/admin/editbook?bookId=${b.bookId}" class="btn btn-info btn-sm" role="button">Edit</a>
			            &ensp;
			            <a href="<%= request.getContextPath()%>/admin/deletebook?bookId=${b.bookId}" class="btn btn-danger btn-sm" role="button" onclick= "return del(${b.name})">Delete</a>
			            </td>  
        			</tr>
   				 </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </body>
   <script type="text/javascript">
		function del(book) {
			var msg = "Do you want to delete Book\n\n"+book+"\n\nPlease Confirm.";
			if (confirm(msg)==true){
				return true;
			}else{
				return false;
			}
		}
</script>
</html>