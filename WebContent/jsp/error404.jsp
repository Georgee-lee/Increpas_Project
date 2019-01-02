<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--
    에러가 발생시 띄우게 되는 페이지에는 page 지시자의 isErrorpage = "true"로 지정한다.
    지정하지 않으면 default가 false이기 때문에 에러페이지로 인식하지 않는다.
     
    isErrorPage를 true로 지정하면 exception 객체를 이용할 수 있게 된다.
    ex) exception.getMessage(); 
 -->    
<%@page isErrorPage="true" %>
<!-- 
    에러 코드 200번은 정상 페이지라는 의미인데, 가끔 자동으로 500 코드로 세팅되는 경우가 있어
    현재 에러 페이지는 정상적인 페이지다라는 세팅을 해주기 위해
    response.setStatus(200); 을 지정해 준다.
 -->
<%
    response.setStatus(200);

	exception.printStackTrace();
%> 
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>404 Error Page</title>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,700" rel="stylesheet">

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="../lib/css/style.css" />

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
</head>
<body>
	<div id="notfound">
		<div class="notfound">
			<div class="notfound-404">
				<h1>4<span></span>4</h1>
			</div>
			<h2>Oops! Page Not Be Found</h2>
			<p>Sorry but the page you are looking for does not exist, have been removed. name changed or is temporarily unavailable</p>
			<a href="index.jsp">Back to homepage</a>
		</div>
	</div>
</body>
</html>