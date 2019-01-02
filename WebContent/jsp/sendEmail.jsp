<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<%
	request.setCharacterEncoding("utf-8");
%>
<%
	//아이디 찾기. 이름과 이메일을 받아서 그걸로 MemVO를 select한 후 나온 VO에서 이메일을 따서 보내준다.
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
//	MemVO mvo = MemberDAO.searchId(name, email);
	
/*	if(mvo != null){ //밑에 라인까지 if문 계속 !
	   String receiver = mvo.getM_email();
	   String name2 = mvo.getM_name();
	   String id = mvo.getM_id();
	   
	   String host     = "smtp.naver.com"; //이걸 localhost로 할 수 있는지 알아보자!!
	   final String user   = "javatest90"; //왜냐면 진짜 id와 비밀번호가 노출되기 때문에...
	   final String password  = "Javatest90!";

	   // Get the session object
	   Properties props = new Properties();
	   props.put("mail.smtp.host", host);
	   props.put("mail.smtp.auth", "true");

	   Session session2 = Session.getInstance(props, new javax.mail.Authenticator() {
	    protected PasswordAuthentication getPasswordAuthentication() {
	     return new PasswordAuthentication(user, password);
	    }
	   });

	   // Compose the message
	   try {
	    MimeMessage message = new MimeMessage(session2);
	    message.setFrom(new InternetAddress(user));
	    message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));

	    // Subject
	    message.setSubject("요청하신 "+name2+" 님의 아이디 정보입니다.");  //이메일 제목 작성란
	    
	    // Text
	    message.setText(name2+" 님의 아이디는 "+id+"입니다."); //이메일 본문 작성란

	    // send the message
	    Transport.send(message);
	    System.out.println("이메일 전송 완료");
	   } catch (MessagingException e) {
	    e.printStackTrace();
	   }   
	}*/%> <!-- if문의 끝 -->

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Email 확인 페이지</title>
<link href="../lib/css/bootstrap.min.css" rel="stylesheet">

<style type="text/css">
* {
  margin:0px auto;
  padding: 0px;
text-align:center;
}
body {
  background-color: #D4D9ED;
}
.cont_principal {
position: absolute;  
  width: 100%;
  height: 100%;
overflow: hidden;
}
.cont_error {
position: absolute;
  width: 100%;
  height: 300px;
  top: 50%;
  margin-top:-150px;
}

.cont_error > h1  {
 font-family: 'Lato', sans-serif;  
font-weight: 400;
  font-size:150px;
color:#fff;
position: relative;
left:-100%;
transition: all 0.5s;
}


.cont_error > p  {
 font-family: 'Lato', sans-serif;  
font-weight: 300;
  font-size:24px;
  letter-spacing: 5px;
color:#9294AE;
position: relative;
left:100%;
transition: all 0.5s;
    transition-delay: 0.5s;
-webkit-transition: all 0.5s;
 -webkit-transition-delay: 0.5s;
}

.cont_aura_1 {
  position:absolute;
  width:300px;
  height: 120%;
top:25px;
right: -340px;
  background-color: #8A65DF;
box-shadow: 0px 0px  60px  20px  rgba(137,100,222,0.5);
-webkit-transition: all 0.5s;
  transition: all 0.5s;
}

.cont_aura_2 {
  position:absolute;
  width:100%;
  height: 300px;
right:-10%;
bottom:-301px;
 background-color: #8B65E4;
box-shadow: 0px 0px 60px 10px rgba(131, 95, 214, 0.5),0px 0px  20px  0px  rgba(0,0,0,0.1);
  z-index:5;
transition: all 0.5s;
-webkit-transition: all 0.5s;
}

.cont_error_active > .cont_error > h1 {
  left:0%;
}
.cont_error_active > .cont_error > p {
  left:0%;
}

.cont_error_active > .cont_aura_2 {
    animation-name: animation_error_2;
    animation-duration: 4s;
  animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
transform: rotate(-20deg);    
}
.cont_error_active > .cont_aura_1 {
 transform: rotate(20deg);
  right:-170px;
    animation-name: animation_error_1;
    animation-duration: 4s;
  animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
}
</style>
</head>
<body>
	<div class="cont_principal">
		<div class="cont_error">
			<h1>Success!</h1>  
  			<p>요청하신 자료를 해당 이메일로 전송하였습니다.</p><br/>
  			<button type="button" class="btn btn-info" onclick="location='login.jsp'">이전 페이지로</button>
  		</div>
		<div class="cont_aura_1"></div>
		<div class="cont_aura_2"></div>
	</div>
	
	<script type="text/javascript">
		window.onload = function(){
		document.querySelector('.cont_principal').className= "cont_principal cont_error_active";  
		  
		}
	</script>
</body>
</html>