<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Book Reservation System</title>

    <!-- Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link href="<%=request.getContextPath()%>/css/carousel.css" rel="stylesheet">
  </head>
  <body>
  <div id=top class="navbar-wrapper">
      <div class="container">
        <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="<%= request.getContextPath()%>/listBooks">Book Reservation System</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">

			<ul class="nav navbar-nav">
                <li class="active"><a href="#bookslist">Book List</a></li>
				<li><a href="#about" onclick="return about()">About</a></li>
                <li><a href="#contact" onclick="return contact()">Contact</a></li>
                <!-- <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li role="separator" class="divider"></li>
                    <li class="dropdown-header">Nav header</li>
                    <li><a href="#">Separated link</a></li>
                    <li><a href="#">One more separated link</a></li>
                  </ul>
                </li> -->
              </ul>

          <div class="navbar-form navbar-right" >
           	<span id="userInfo" class="glyphicon"> </span>
            <button type="submit" id= "tryloginBtn" class="btn btn-success">Sign in</button>
          </div>
        </div><!--/.navbar-collapse -->
      </div>
    </nav>

      </div>
    </div>


    <!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img class="first-slide" src="<%=request.getContextPath()%>/images/first.jpg" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>A reader lives a thousand lives before he dies. The man who never reads lives only one.</h1>
              <p><a class="btn btn-lg btn-primary" href="#bookslist" role="button">Start reading today</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="second-slide" src="<%=request.getContextPath()%>/images/second.jpg" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Books are a uniquely portable magic.</h1>
              <p><a class="btn btn-lg btn-primary" href="#bookslist" role="button">Start reading today</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="third-slide" src="<%=request.getContextPath()%>/images/third.jpg" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Some books should be tasted, some devoured, but only a few should be chewed and digested thoroughly.</h1>
              <p><a class="btn btn-lg btn-primary" href="#bookslist" role="button">Start reading today</a></p>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div><!-- /.carousel -->


    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container marketing">

      <div class="row">
        <div class="col-lg-4">
          <img class="img-circle" src="<%=request.getContextPath()%>/images/below1.jpg" alt="This Project" width="140" height="140">
          <h2>This Project</h2>
          <p>This is a personal virtual web project which doesn't provide any real services. :D</p>
        </div>
        <div class="col-lg-4">
          <img class="img-circle" src="<%=request.getContextPath()%>/images/below2.jpg" alt="About Me" width="140" height="140">
          <h2>About Me</h2>
          <p>I'm Chang Gong, you may find my nickname is Neil. I'm an undergraduate student at UVic. I am enthusiastic in Web development and enjoy learning cutting-edge technology to solve challenging problems.</p>
        </div>
        <div class="col-lg-4">
          <img class="img-circle" src="<%=request.getContextPath()%>/images/below3.jpg" alt="Contact Information" width="140" height="140">
          <h2>Contact</h2>
          <p>If you have any issues about this project, please contact me at via <a href="mailto:gongchangas@gmail.com">Email</a>.</p>
        </div>
      </div>
	</div> 

      <!-- START LIST -->

 <hr class="featurette-divider">
 	<div class="container">
		<div class="panel panel-default">
		        <div id = bookslist class="panel-heading text-center">
		            <h2>Details</h2>
		        </div>
		        <form name="firstForm" action="<%= request.getContextPath()%>/search?start=0#bookslist" method="post">
		        	<div class="panel-heading ">
		        	    <table class="table table-bookName">
		        	       <thead>
		        	       		<tr> 
		        					<th width="90" align="lift">Book Title:</th>
		        					<th width="150" align="lift">
		        						<input type="text" name="searchName" class="allInput" value="${searchName}" placeholder="Title" />
		        					</th>
		        					<th> 
		        						<button type="submit" id= tabsub class="btn btn-default btn-sm">Search</button>
		        					</th> 
		        				</tr> 
		        	       </thead> 
		        	    </table> 
		         	</div>
		        </form>
		      <div class="row featurette">
		        <div class="col-md-7 col-md-push-5">
		          <h2 class="featurette-heading">${book.name}</h2> <br>
		          <p class="lead">Introduction: ${book.intro}</p>
		          <p><em>Author : Unknown</em></p>
		          <p><em>Publisher : Unknown</em></p>
		          <p><em>ISBN : Unknown</em></p>
		          <a class="btn btn-success" href="reserveBook?bookId=${book.bookId}" role="button">Make Reservation</a>
		         <%--  <form action="reserveBook?bookId=${book.bookId}" method = "post">
		            <button type="submit" class="btn btn-success">Make Reservation</button>
		          </form> --%>
		        </div>
		        <div class="col-md-5 col-md-pull-7">
		          <img class="featurette-image img-responsive center-block" src="<%=request.getContextPath()%>/images/${book.bookId}.jpg" alt="Book Cover">
		        </div>
		      </div>		
		
			   <hr class="featurette-divider"> 
			   </div>
		      <!-- FOOTER -->
		      <footer>
		        <p class="pull-right"><a href="#top">Back to top</a></p>
		        <p>&copy; Chang Gong Personal Project. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
		      </footer>
					        
		
		</div>
		<div id="varifyModal" class="modal fade"> <!-- modal fade是一个可被触发的弹出窗，根据它的id -->
    <div class="modal-dialog"> 
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title text-center">
                    <span class="glyphicon glyphicon-studentId"> </span>Login
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
                <button type="button" id="adminloginBtn" class="btn btn-info">
                <span class="glyphicon glyphicon-student">Admin</span>
                </button>
                <button type="button" id="listloginBtn" class="btn btn-success">
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
 	
 

      <!-- /END LIST -->

    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </body>
    <script src="http://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

  <script src="http://cdn.bootcss.com/jquery.countdown/2.1.0/jquery.countdown.min.js"></script>
  <script src="<%=request.getContextPath()%>/script/bookappointment.js" type="text/javascript"></script>

<script type="text/javascript">
	$(document).ready(function () {
		console.log("ready to start listLogin()");
        bookappointment.listLogin();
    })
</script>
  <script>
    function fillLoginFields(u, p) {
        document.getElementById("studentIdKey").value = u;
        document.getElementById("passwordKey").value = p;
    }
</script>
<script type="text/javascript">
		function about() {
			var msg = "Hey there, I'm Chang Gong, \nThis is a personal web project which doesn't provide any real services.\n\n Have fun ~";
			if (confirm(msg)==true){
				return true;
			}else{
				return false;
			}
		}
</script>
<script type="text/javascript">
		function contact() {
			var msg = "If you have any issues about this project, \nplease contact me at via gongchangas@gmail.com.";
			if (confirm(msg)==true){
				return true;
			}else{
				return false;
			}
		}
</script>
</html>