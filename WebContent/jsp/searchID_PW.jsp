<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<link href="css/bootstrap.min2.css" rel="stylesheet">    
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/jquery-ui.min.css" rel="stylesheet">
 <style type="text/css">
 body{
		background-image: url("images/login_signup_image.jpg");
		background-position: cover;
	}
 .txt{
 	text-align: center;
 }
 .txtR{
 	text-align: right;
 }
 .w400{
	width: 400px;
	margin: auto;
	padding: 30px;	
}
.fz16{font-size: 16px;}
 </style>    
</head>
<body>	
	<div class="w400">
		<div class="panel panel-info txt">
			<div class="panel-heading">
				<b class="fz16">Search ID</b>
			</div>
			<div class="panel-body">
				<form action="searchid" method="post">
					<fieldset>		
						<div class="form-group input-group">
							<label class="input-group-addon" for="name">이름:</label>
							<input class="form-control " type="text" id="name" name="u_name"/>
						</div>							
						
						<div class="form-group input-group">
							<label class="input-group-addon" for="bday">이메일</label>
							<input class="form-control" type="text" id="u_email" name="u_email"/>						
						</div>							
												
						<div class="form-group txtR">
							<button type="button" class="btn btn-info" onclick="searchid(this.form)">
								아이디찾기
							</button>
							<button type="reset" class="btn btn-info" onclick="location.href='login'">
								취소
							</button>
						</div>					
						
					</fieldset>
				</form>
			</div>
		</div>
		
		<div class="panel panel-info txt">
			<div class="panel-heading">
				<b class="fz16">Search Password</b>
			</div>
			<div class="panel-body">
				<form action="searchpw">
					<fieldset>		
						<div class="form-group input-group">
							<label class="input-group-addon" for="id">ID :</label>
							<input class="form-control" type="text" 
							id="id" name="u_id" placeholder="User id"/>
						</div>					
						
						<div class="form-group input-group">
							<label class="input-group-addon" for="email">
								Email
							</label>
							<input class="form-control" type="text" 
							id="email" name="u_email" placeholder="User Email"/>						
						</div> 
												
						<div class="form-group txtR">
							<button type="button" class="btn btn-info" onclick="searchpw(this.form)" >
								비밀번호 찾기
							</button>
							<button type="reset" class="btn btn-info" onclick="location.href='login'">
								취소
							</button>
						</div>	
					</fieldset>
				</form>
			</div>
		</div>
	</div>	
	<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
	
		function searchid(frm) {
			var r_name = $("#name").val();
			var u_email = $("#u_email").val();		
		
			if(r_name.trim().length < 1){
				alert("이름을 입력해 주세요");
				frm.name.focus();
				return;
			}
			if(u_email.trim().length < 1){
				alert("이메일을 입력해 주세요");
				frm.u_email.focus();
				return;
			}	
			$.ajax({
				type : 'POST',
				data : "u_name="+encodeURIComponent(r_name)+"&u_email="+encodeURIComponent(u_email),
				url : "searchid",
				dataType : "json"
				}).done(function(data){							
					if(data.u_id != null){
						alert("회원님의 ID는: "+data.u_id+" 입니다.");
						frm.submit();
						location.href="login";	
					}	
					else{
						alert("요청하신 정보가 일치하지 않습니다.");
						$("#name").val("");
						$("#bday").val("");
						frm.name.focus();
					}
					
				}).fail(function(err){
					alert("err :"+err);
				});			
					
		}
		function searchpw(frm) {
			
			var r_id = $("#id").val();
			var r_email = $("#email").val();		
			
			if(r_id.trim().length < 1){
				alert("아이디를 입력해 주세요");
				frm.id.focus();
				return;
			}
			if(r_email.trim().length < 1){
				alert("이메일을 입력해 주세요");
				frm.email.focus();
				return;
			}	
			$.ajax({
				type : 'POST',
				data : "u_id="+encodeURIComponent(r_id)+"&u_email="+encodeURIComponent(r_email),
				url : "searchpw",
				dataType : "json"
				}).done(function(data){		
					if ( data.u_pwd != null){
						alert(r_id+"님이 요청하신 정보:"+data.u_pwd);						
						frm.submit();	
						location.href="login";	
					}
					else{
						alert("아이디 혹은 이메일이 일치하지 않습니다.");
						$("#id").val("");
						$("#email").val("");
						frm.id.focus();
					}
				}).fail(function(err){
					alert("일치하는 정보가 없습니다.!");	
					
				});			
				
		}		
	</script>	
</body>
</html>