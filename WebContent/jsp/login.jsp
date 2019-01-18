<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Login</title>
	<link href="css/bootstrap.min2.css" rel="stylesheet">   
    <link href="css/font-awesome/css/font-awesome.min.css" rel="stylesheet">             
    <link href="css/jquery-ui.min.css" rel="stylesheet">
    <link href="css/bootstrap-social.css" rel="stylesheet"> 

	<style type="text/css">
		body{
		    background-image: url("images/portfolio-4.jpg"); background-repeat: no-repeat; background-size: cover;
		}
		
		.txt{
		    text-align: center;
		    background-color: rgba(0,0,0,0.2);
			margin-top: 12%;
		}
		.txtR{
		    text-align: right; 
		}
		.w500{
		   width: 500px;
		   margin: auto;
		   padding: 30px;	
		}
		.line{
		   display: inline;
		}
		
		.input-group-addon{background-color:  rgba(229, 224, 227, 0.8); }
		
		.blur{background: transparent; border: none; background-color: rgba(255,255,255,0.4); font-weight: bold; font-size: 17px; }
		
		.cbtn{background-color: rgba(97, 96, 96, 0.6); }
	</style>
</head>
	
<body>    

<div class="w500">
	<div class="panel txt">
		<div class="panel-heading">
			<b>Sign In</b>
		</div>
		<div class="panel-body">
			<form action="login" method="post">
				<fieldset>					
					<div class="form-group input-group">
						<label class="input-group-addon" for="id">&nbsp;&nbsp;ID :</label>
						<input class="form-control blur" type="text" onkeyup="chkRemember()"
						id="id" name="u_id" placeholder="User id"/>
					</div>
					<div class="form-group input-group">
						<label class="input-group-addon" for="pw">PW :</label>
						<input class="form-control blur" type="password" 
						id="pw" name="u_pwd" placeholder="User Password"/>
					</div>					
					 <div class="checkbox">
             			 <label>
                 			 <input type="checkbox" id="remember" value="remember-me"/>
                				  Remember ID
               			 </label>
              		</div>
              		<br/>
              		               
              		<button type="button" class="btn btn-info btn-lg btn-block cbtn" onclick="confirm(this.form)">Login</button>	              	            				
													
					<div >
						<a href="searchID_PW" id="a1">아이디 찾기 / 비밀번호 찾기</a>					
					</div>
					</br>
					<div class="form-group txtR">
						<button type="button" class="btn btn-info btn-lg btn-block cbtn" onclick="location.href='signup'">Sign Up</button>
						<button type="button" class="btn btn-info btn-lg btn-block cbtn" onclick="location.href='index'">홈으로</button>			
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</div>	

<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>

<script>

	$(function(){
		if(localStorage.getItem('user')!= null){
			$("#remember").attr("checked", true);
			$("#id").val(localStorage.getItem('user'));
		}
	});
	
	function chkRemember(){
		var foo = $("#id").val();
		
		if(foo.trim().length >= 4 && $("#remember").is(":checked")){
			localStorage.setItem('user', foo);
		}			
	}

	function confirm(frm) {
		var id = $("#id").val();
		var pw = $("#pw").val();
		
		if(id.trim().length < 1){
			alert("아이디를 입력해 주세요");
			$("#id").focus();
			return;
		}
		if(pw.trim().length < 1){
			alert("비밀번호를 입력해 주세요");
			$("#pw").focus();
			return;
		}			
		$.ajax({
			type : 'POST',
			data : "u_id="+encodeURIComponent(id)+"&u_pwd="+encodeURIComponent(pw),
			url : "login",
			dataType : "json"
		}).done(function(data){				
			
			if ( data.msg == '0'){ 
				alert("반갑습니다, "+data.name+"님");
				location.href="index";			
			}else
				alert("아이디 또는 비밀번호를 확인하세요!");		
				
		}).fail(function(err){
			alert("err :"+err);
		});				
	}
</script>

</body>
</html>