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
	<link href="css/login.css" rel="stylesheet" >
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
  	<meta name="google-signin-client_id" content="995871649659-18p4c7ugrnpp51eediarpqbbugaqj2am.apps.googleusercontent.com">
</head>
	
<body>    

<div class="w500">
	<div class="panel panel-info">
		<div class="panel-heading txt">
			<b>Please Sign In</b>
		</div>
		<div class="panel-body">
			<form action="login" method="post">
				<fieldset>					
					<div class="form-group input-group">
						<label class="input-group-addon" for="id">&nbsp;&nbsp;ID :</label>
						<input class="form-control" type="text" onkeyup="chkRemember()"
						id="id" name="u_id" placeholder="User id"/>
					</div>
					<div class="form-group input-group">
						<label class="input-group-addon" for="pw">PW :</label>
						<input class="form-control" type="password" 
						id="pw" name="u_pwd" placeholder="User Password"/>
					</div>					
					 <div class="checkbox">
             			 <label>
                 			 <input type="checkbox" id="remember" value="remember-me"/>
                				  Remember ID
               			 </label>
              		</div>
              		<br/>
              		               
              		<button type="button" class="btn btn-info btn-lg btn-block" onclick="confirm(this.form)">Login</button>	              	            				
									
					<div class="panel-body">                          
                            <a class="btn btn-block btn-social btn-facebook" href="naverlogin">
                                <i class="fa fa-facebook"></i> Sign in with Naver
                         	</a>
                            <a class="btn btn-block btn-social btn-google-plus g-signin2" data-onsuccess="onSignIn">
                            		<!-- <div class="g-signin2" data-onsuccess="onSignIn"></div> -->
                                <i class="fa fa-google-plus"></i> Sign in with Google
                            </a>
                            <a class="btn btn-block btn-social btn-instagram">
                                <i class="fa fa-instagram"></i> Sign in with Instagram
                            </a>                         
					</div>
													
					<div>
						<a href="searchID_PW" id="a1">아이디 찾기 / 비밀번호 찾기</a>					
					</div>
						<br/>
						<button type="button" class="btn btn-info btn-lg btn-block" onclick="location.href='signup'">Sign Up</button>
						<button type="button" class="btn btn-info btn-lg btn-block" onclick="location.href='index'">홈으로</button>			
				</fieldset>
			</form>
		</div>
	</div>
</div>	

<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>

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
	
    function onSignIn(googleUser) {
      var profile = googleUser.getBasicProfile();
      console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
      console.log('Name: ' + profile.getName());
      console.log('Image URL: ' + profile.getImageUrl());
      console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
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
				alert("로그인 성공!");
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