<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<link href="css/bootstrap.min2.css" rel="stylesheet">    
    <link href="css/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">       
	<link href="css/jquery-ui.min.css" rel="stylesheet"> 
	<link href="css/signup2.css" rel="stylesheet">   

</head>
<body>	
	<div class="w600">
		<div class="panel txt">
			<div class="panel-heading">
				<b> Sign Up</b>
			</div>
			<div class="panel-body">
				<form action="signup" method="post">
					<fieldset>		
						<div class="form-group input-group">
							<label class="input-group-addon " for="name">이름<span style="color: red; font-size: 20px;">*</span>:</label>
							<input class="form-control blur" type="text" id="name" name="u_name"/>														
						</div>							
						
					<div class="form-group input-group">
						<label class="input-group-addon" for="id">ID<span style="color: red; font-size: 20px;">*</span>:</label>
						<input class="form-control blur" type="text"	id="id" name="u_id" placeholder="User id">	
						<button type="button" class="btn btn-info btn-block cbtn" id="checkid">중복확인</button>																							
					</div>								

						<div class="form-group input-group">
							<label class="input-group-addon" for="pw">PW<span style="color: red; font-size: 20px;">*</span>:</label>
							<input class="form-control blur" type="password" 
							id="pw" name="u_pwd" placeholder="User password"/>
						</div>						
						
						<div class="form-group input-group">
							<label class="input-group-addon" for="c_pw">PW check<span style="color: red; font-size: 20px;">*</span>:</label>
							<input class="form-control blur" type="password" 
							id="c_pw" name="c_pw" placeholder="check password"/>
						</div>		
						
						<div class="form-group input-group">
							<label class="input-group-addon" for="e_mail">E-mail<span style="color: red; font-size: 20px;">*</span></label>
							<input class="form-control blur" type="text" 
							id="email" name="u_email" placeholder="User e-mail"/>						
						</div>				
					
						<div class="form-group input-group">
							<label class="input-group-addon" for="b_day">
								생년월일
							</label>
							<input class="form-control blur" type="text" 
							id="b_day" name="u_bday" placeholder="(예시 :19870525)"/>						
						</div>
						
					    <div class="form-group input-group">
							<label class="input-group-addon" for="phone">
								휴대폰번호
							</label>
							<input class="form-control blur" type="text" 
							id="phone" name="u_phone" placeholder="(예시 :01037617105)"/>						
						</div>
						
							<p><span style="color: red; font-size: 20px;">*</span>필수 입력항목입니다.</p>	
									
						<div class="form-group txtR">
							<button type="button" class="btn btn-info cbtn" id="finish_btn" onclick="chkValue(this.form)">
								가입완료
							</button>
							<button type="button" class="btn btn-info cbtn" id="cancel_btn" onclick="location.href='login'">
								취소
							</button>
						</div>						
						
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
	
	<script>
	
		$(function(){			
			$("#checkid").click(function(){
				var id = $("#id").val();
				
				if(id.trim().length < 1){
					alert("아이디를 입력해 주세요");
					$("#name").focus();
					return;
				}				
				$.ajax({
					type : 'POST',
					data : "u_id="+encodeURIComponent(id),
					url : "signUp",
					dataType : "json"
				}).done(function(data){
					if ( data.cnt > 0 ){
						alert("아이디가 존재합니다.");				
		                $("#id").focus();						
					}else{
						alert("사용가능한 아이디입니다.");					
		                $("#pw").focus();			
					}						
				}).fail(function(err){
					alert("err :" + err);
				});				
			});				
			
		});	
			
		function chkValue(frm) {
			var name = $("#name").val();
			var id = $("#id").val();
			var pw = $("#pw").val();
			var addr = $("#addr").val();
			var email = $("#email").val();
			var phone = $("#phone").val();
			var c_pw = $("#c_pw").val();
			
			if ( email.trim().length < 1 ){
				alert("이메일을 입력해 주세요");
				$("#email").focus();
				return;
			}		
			if(name.trim().length < 1){
				alert("이름을 입력해 주세요");
				$("#name").focus();
				return;
			}
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
			if ( c_pw.trim().length < 1 ){
				alert("비밀번호확인을 해주세요");
				$("#c_pw").focus();
				return;
			}			
			if ( pw == c_pw ) {		
				
				$.ajax({
					type : 'POST',
					data : "u_id="+encodeURIComponent(id),
					url : "signUp",
					dataType : "json"
				}).done(function(data){
					if ( data.cnt > 0 ){
						alert("아이디 중복확인을 다시 하십시오.");				
		                $("#id").focus();						
					}else{
						
						$.ajax({
							type : 'POST',
							data : "u_email="+encodeURIComponent(email),
							url : "check_email",
							dataType : "json"
						}).done(function(data){
							if ( data.count > 0 ){
								alert("이미 사용중인 이메일입니다.");				
				                $("#email").focus();						
							}else{																
								alert("회원가입을 축하합니다.");	
								frm.submit();	
							}						
						}).fail(function(err){
							alert("err :" + err);
						});								
					}						
				}).fail(function(err){
					alert("err :" + err);
				});							
				
			}else{
				alert("비밀번호가 일치하지 않습니다.")
				return;
			}					
		}

	</script>		
</body>
</html>