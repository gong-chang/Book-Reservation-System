var bookappointment={
		//封装相关ajax的url
		URL:{
			appoint:function(bookId,studentId){
				return '/'+bookId+'/appoint?studentId='+studentId;
			},
			verify:function(){
				return '/verify';
			}
		},
		
		//验证学号和密码
		validateStudent:function(studentId,password){
			console.log("studentId"+studentId);
			if(!studentId||!password){
				return "nothing";
			}else if(studentId.length!=10 ||isNaN(studentId)||password.length!=6 ||isNaN(password)){
				return "typerror";
			}else {
				if(bookappointment.verifyWithDatabase(studentId, password,1)){
					console.log("验证成功！");
					return "success";
				}else{
					console.log("验证失败！");
					return "mismatch";
				}
			} 
		},
		validateAdmin:function(adminId,password){
			console.log("AdminId"+adminId);
			if(!adminId||!password){
				return "nothing";
			}else if(adminId.length!=5 ||isNaN(adminId)||password.length!=5 ||isNaN(password)){
				return "typerror";
			}else {
				if(bookappointment.verifyWithDatabase(adminId, password,0)){
					console.log("验证成功！");
					return "success";
				}else{
					console.log("验证失败！");
					return "mismatch";
				}
			} 
		},
		//将学号和用户名与数据库匹配
		verifyWithDatabase:function(studentId,password,flag){//flag1--student..flag0--admin
			var result=false;
			var params={};
			params.studentId=studentId;
			params.password=password;
			params.flag=flag;
			console.log("params.password:"+params.password);
			var verifyUrl=bookappointment.URL.verify();
			$.ajax({
				type:'post',
				url:verifyUrl,
				data:params,
				datatype:'josn', 
				async:false,                       //同步调用，保证先执行result=true,后再执行return result;
				success:function(data){
					if(data.result=='SUCCESS'){
						window.location.reload();
						//弹出登录成功！
						alert("Login Success!");
						result=true;
					}else{
						result=false;
					}
				}
			});
			console.log("我是验证结果："+result);
			return result;
			
		},
		
		//预定图书逻辑
		detail:{
			//预定也初始化
			init:function(params){
				var bookId=params;
				console.log("我是js文件！");
				console.log("bookId" + bookId);
				var studentId=$.cookie('studentId');
				var password=$.cookie('password');
				if(!studentId||!password){
					//设置弹出层属性
					var  IdAndPasswordModal=$('#varifyModal');
					IdAndPasswordModal.modal({
						show: true,//显示弹出层
	                    backdrop: 'static',//禁止位置关闭
	                    keyboard: false//关闭键盘事件
					});
					$('#studentBtn').click(function (){
						studentId=$('#studentIdKey').val();
							console.log("studentId:"+studentId);
						password=$('#passwordKey').val();
							console.log("password:"+password);
						//调用validateStudent函数验证用户id和密码。
						var temp=bookappointment.validateStudent(studentId,password);
						console.log(temp);
						if(temp=="nothing"){
							$('#studentMessage').hide().html('<label class="label label-danger">Student id or password should not be empty!</label>').show(300);
						}else if(temp=="typerror"){
							$('#studentMessage').hide().html('<label class="label label-danger">Incorrect format!</label>').show(300);
						}else if(temp=="mismatch"){
							console.log("已经调用验证函数！");
							$('#studentMessage').hide().html('<label class="label label-danger">Id and password does not match!</label>').show(300);
						}else if(temp=="success"){
							 //学号与密码匹配正确，将学号密码保存在cookie中。不设置cookie过期时间，这样即为session模式，关闭浏览器就不保存密码了。
							$.cookie('studentId', studentId); 
							$.cookie('password', password); 
							// 跳转到预约逻辑 
							var appointbox=$('#appoint-box');
							bookappointment.appointment(bookId,studentId,appointbox);
						}
					}); 
				}else{
					var appointbox=$('#appoint-box');
					bookappointment.appointment(bookId,studentId,appointbox);
				} 
			}	
		},
		appointment:function(bookId,studentId, node){
			console.log("我执行预约的方法!" );
			node.html('<button class="btn btn-primary btn-lg" id="appointmentBtn">Reserve</button>');
			  
			var appointmentUrl = bookappointment.URL.appoint(bookId,studentId);
			console.log("appointmentUrl:"+appointmentUrl);
			//绑定一次点击事件
			$('#appointmentBtn').one('click', function () {
				//执行预约请求
				//1、先禁用请求
				console.log("已经点击！！");
				$(this).addClass('disabled');
				//2、发送预约请求执行预约
				$.post(appointmentUrl,{},function(result){   //Ajax强大之处，向Controller方法提出请求和返回结果在一处!
					if(result && result['success']){         //同时还可以连续取对象的子对象！
						var appointResult=result['data'];
							console.log("appointResult"+appointResult);
						var state=appointResult['state'];
							console.log("state"+state);
						var stateInfo=appointResult['stateInfo'];
							console.log("stateInfo"+stateInfo);
						//显示预约结果                                                          把结果显示给页面，完成了jsp的工作
							 
						node.html('<span class="label label-success">'+stateInfo+'</span>');
					}       //因为公用一个node所以，用来显示“stateInfo”时就不会显示上面的“预约”
					console.log('result'+result);
				});
			 });
			
			
		},

		listLogin:function(){
			console.log("arrive js file");
			var studentId=$.cookie('studentId');
			var adminId=$.cookie('adminId');
			var password=$.cookie('password');
			if(studentId && password){
				$('#tryloginBtn').addClass('hide');
				$('#userInfo').hide().html('<label class="label label-danger">'+'Student:'+studentId+'</label>').show(300);
				
			}
			if(adminId && password){
				$('#userInfo').hide().html('<label class="label label-danger">'+'Admin:'+adminId+'</label>').show(300);//这里要post
				document.getElementById("tryloginBtn").innerHTML="Admin Page";
				$('#tryloginBtn').click(function (){
					window.location.href="/admin/booksPage";
				});
				return;
			}
			$('#tryloginBtn').click(function (){
				console.log("login has been clicked");
				var studentId=$.cookie('studentId');
				var password=$.cookie('password');
				if (!password || (!studentId && !adminId)){
				//设置弹出层属性
					var  IdAndPasswordModal=$('#varifyModal');
					IdAndPasswordModal.modal({
						show: true,//显示弹出层
						backdrop: 'static',//禁止位置关闭
						keyboard: false//关闭键盘事件
					});
				} else {
					$('#tryloginBtn').addClass('hide');
					if(admintId && password){
						$('#tryloginBtn').addClass('hide');
						$('#userInfo').hide().html('<label class="label label-danger">'+'Admin:'+adminId+'</label>').show(300);//这里要post
						window.location.href="/admin/booksPage";
					} else {
						$('#userInfo').hide().html('<label class="label label-danger">'+'Student:'+studentId+'</label>').show(300);
					}
				}
				$('#listloginBtn').click(function (){
						studentId=$('#studentIdKey').val();
							console.log("studentId:"+studentId);
						password=$('#passwordKey').val();
							console.log("password:"+password);
						//调用validateStudent函数验证用户id和密码。
						var temp=bookappointment.validateStudent(studentId,password);
						console.log(temp);
						if(temp=="nothing"){
							$('#studentMessage').hide().html('<label class="label label-danger">Student id or password should not be empty!</label>').show(300);
						}else if(temp=="typerror"){
							$('#studentMessage').hide().html('<label class="label label-danger">Incorrect format!</label>').show(300);
						}else if(temp=="mismatch"){
							console.log("已经调用验证函数！");
							$('#studentMessage').hide().html('<label class="label label-danger">Id and password does not match!</label>').show(300);
						}else if(temp=="success"){
							 //学号与密码匹配正确，将学号密码保存在cookie中。不设置cookie过期时间，这样即为session模式，关闭浏览器就不保存密码了。
							$.cookie('studentId', studentId); 
							$.cookie('password', password); 
							// 跳转到预约逻辑 
							$.post('/listBooks');
						}
					});
				$('#adminloginBtn').click(function (){
						studentId=$('#studentIdKey').val();
							console.log("studentId:"+studentId);
						password=$('#passwordKey').val();
							console.log("password:"+password);
						//调用validateStudent函数验证用户id和密码。
						var temp=bookappointment.validateAdmin(studentId,password);
						console.log(temp);
						if(temp=="nothing"){
							$('#studentMessage').hide().html('<label class="label label-danger">Admin id or password should not be empty!</label>').show(300);
						}else if(temp=="typerror"){
							$('#studentMessage').hide().html('<label class="label label-danger">Incorrect format!</label>').show(300);
						}else if(temp=="mismatch"){
							console.log("已经调用验证函数！");
							$('#studentMessage').hide().html('<label class="label label-danger">Id and password does not match!</label>').show(300);
						}else if(temp=="success"){
							 //学号与密码匹配正确，将学号密码保存在cookie中。不设置cookie过期时间，这样即为session模式，关闭浏览器就不保存密码了。
							$.cookie('adminId', studentId); 
							$.cookie('password', password); 
							// 跳转到预约逻辑 
							window.location.href="/admin/booksPage";
						}
					});
		});
	}
}