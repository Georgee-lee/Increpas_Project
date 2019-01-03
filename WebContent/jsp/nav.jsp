<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/modern-business.css" rel="stylesheet">
    <link href="css/botom-board.css"  rel="stylesheet">

  	 <!-- Custom Fonts -->
    <link href="css/all.min.css" rel="stylesheet" type="text/css">
    <link href="css/simple-line-icons.css" rel="stylesheet"> 
    <link href="css/font-awesome/css/font-awesome.min.css" rel="stylesheet"> 
    
    <!-- Custom CSS -->
    <link href="css/stylish-portfolio.min.css" rel="stylesheet">  
    <link href="css/Hayley.css" rel="stylesheet"> 
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
    

	<!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.11.2/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.11.2/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.11.2/build/css/themes/semantic.min.css"/>
	<!-- Bootstrap theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.11.2/build/css/themes/bootstrap.min.css"/>

<body>
    <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <p style="margin: 15px auto; width: 190px;height: 50px; color: white; font-size: 25px; font-style: italic;">
        	<c:if test="${lvo != null}">${lvo.u_name }</c:if></p>
        <a href="myInfo">내 정보</a>
        <a href="myEvent">참여 현황</a>
        <a href="myBoard">내가 쓴 글</a>
        <a href="signout">회원탈퇴</a>
    </div>
  <div id="main">
    <nav class="navbar navbar-expand-lg navbar-light bg-light h70">
        <div class="container">
          <a class="navbar-brand" href="index">INCREPAS</a>
          <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse cw" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item">
                <a class="nav-link" href="index">
					Home
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="javascript:loginchk()">
                  	나눔등록
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="rlist">
                  	나눔보기
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="flist?boardType=free">
                  	게시판
                </a>
              </li>
              <li class="nav-item ">
	              <c:if test="${lvo == null}">
	              	<a class="nav-link" href="login">
	              		로그인&nbsp;&nbsp;<i class="fas fas fa-user"></i>
	            	</a>
	              </c:if>
	              <c:if test="${lvo != null}">
	              	<a class="nav-link" href="logout">
	              		로그아웃&nbsp;&nbsp;<i class="fas fas fa-user"></i>
	            	</a>
	              </c:if>
              </li>
              <c:if test="${lvo == null}">
	              <li class="nav-item">
	                <a class="nav-link" href="signup">
	                  	회원가입&nbsp;&nbsp;<i class="fas fas fas fa-user-plus"></i>
	                </a>
	              </li>
              </c:if>
              <c:if test="${lvo != null}">
              <li class="nav-item">
                <!-- Use any element to open the sidenav -->
                <a class="nav-link" onclick="openNav()" style="cursor: pointer;">마이페이지<i class="fas fa-info-circle"></i></a>
              </li>
              </c:if>
            </ul>
          </div>
        </div>
      </nav>
      <!-- //navigation-->  

    <!-- Page Content -->
    <div id="category">
        <ul class="ico_wrap"></ul>
    </div>
 </div>
 
 	<input type="hidden" id="u_name" name="u_name" value="${lvo.u_name }">
 
 	<script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
    <script src="js/jquery.easing.min.js"></script>  

    <!-- Custom scripts for this template -->
    <script src="js/stylish-portfolio.min.js"></script>
    
   <!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.11.2/build/alertify.min.js"></script>

  <!-- Tocplus 15.1 -->
  <script type="text/javascript">
     /* Set the width of the side navigation to 250px and the left margin of the page content to 250px and add a black background color to body */
     function openNav() {
          document.getElementById("mySidenav").style.width = "250px";
          document.getElementById("main").style.marginLeft = "250px";
          document.body.style.backgroundColor = "rgba(255,255,255,0.6)";
      }

      /* Set the width of the side navigation to 0 and the left margin of the page content to 0, and the background color of body to white */
      function closeNav() {
          document.getElementById("mySidenav").style.width = "0";
          document.getElementById("main").style.marginLeft = "0";
          document.body.style.backgroundColor = "white";
      }
	
      function loginchk(){
    	  if(${lvo != null})
    		  location.href = 'reg';
    	  else
    		  alertify.alert("로그인이 필요합니다");
      }      
  </script>
</body>