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
        <div id="navbar" class="navbar-collapse collapse">
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
          <h1 class="sub-header">Edit the Book</h1>
          <div class="table-responsive">
			<form class="form-horizontal col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2" action="<%= request.getContextPath()%>/admin/editbook2"  method="post">
			  <div class="form-group">
			    <label class="control-label col-sm-2 col-md-3" for="ID">ID:</label>
			    <div class="col-sm-7 col-md-7">
			      <input type="text" class="form-control" name="ID" value="${ID}" readonly>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="control-label col-sm-2 col-md-3" for="Title">Title:</label>
			    <div class="col-sm-7 col-md-7"> 
			      <input type="text" class="form-control" name="Title" value="${Title}">
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="control-label col-sm-2 col-md-3" for="Stock">Stock:</label>
			    <div class="col-sm-7 col-md-7"> 
			      <input type="text" class="form-control" name="Stock" value="${Stock}">
			    </div>
			  </div>
			  <div class="form-group">
				<label class="control-label col-sm-2 col-md-3" for="intro">Description(Optional):</label>
				<div class="col-sm-7 col-md-7"> 
			      <textarea class="form-control" rows="5" name="intro">${Description}</textarea>
			    </div>
			  </div>
			  <div class="form-group"> 
			    <div class="col-sm-offset-2 col-sm-7">
			      <button type="submit" class="btn btn-primary" onclick="return checkNull()">Submit</button>&emsp;
			      <a href="<%= request.getContextPath()%>/admin/booksPage" class="btn btn-danger" role="button">Cancel</a>
			    </div>
			  </div>
			</form>
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
    <script type="text/javascript">
		function checkNull()
		{
		     var num=0;
		     var str="";
		     $("input[type$='text']").each(function(n){
		          if($(this).val()=="")
		          {	
		               num++;
		               str+=" "+ $(this).attr("name")+" shouldn't be empty!\r\n";
		          }
		     });
		     if(num>0)
		     {
		          alert(str);
		          return false;
		     }
		     else
		     {
		          return true;
		     }
		}
</script>

  </body>
</html>