<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="css/mybody.css">
    <link rel="stylesheet" href="css/signUp.css">
    <link href="css/board_custom.css"  rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/modern-business.css" rel="stylesheet">

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
 
    <link href="css/Hayley.css" rel="stylesheet">
    <link href="css/gaia.css"  rel="stylesheet">

    <style>
        #main{margin: 0 auto; }
        .table_layout{height: 650px; }
        .mt30{margin-top: 60px; }
        .buttons{width: 104%; height: 100px; margin: 0 auto; margin-top: 8%; margin-bottom: 8%; }
        .buttons>button{width: 31%; height: 100%;  }
        .paging{width: 15%; margin: 0 auto; }
    </style>

</head>
<body>
    <div id="mySidenav" class="sidenav" style="width: 250px;">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()" style="display: none;">&times;</a>
        <a href="myInfo">내 정보</a>
        <a href="myEvent">참여 현황</a>
        <a href="myBoard">내가 쓴 글</a>
        <a href="signout">회원탈퇴</a>
    </div>

    <div id="main" style="margin-left: 250px;">
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
                    <a class="nav-link" href="reg">
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
                    <li class="nav-item">
                    <!-- Use any element to open the sidenav -->
                    <a class="nav-link" onclick="openNav()" style="cursor: pointer;">마이페이지<i class="fas fa-info-circle"></i></a>
                    </li>
                </ul>
                </div>
            </div>
        </nav>

        <div id="category">
            <ul class="ico_wrap"></ul>
        </div>
        <!-- //navigation-->

            	<!-- 콘텐츠 영역 -->

		<div id="body_contents">
			<div id="mini_c">
			<h2>회원 정보수정</h2><br/>
                <span class="mini_comment">기본회원정보를 입력해주세요</span>
                <table>
                   <tbody>
                        <colgroup>
                            <col width="150px">
                            <col width="650px">
                        </colgroup>
                        <tr>
                            <td class="left_col">
                                <label for="uname">이름:</label>
                            </td>
                            <td height="30">
                                <input type="text" name="uname" id="uname">
                            </td>
                        </tr>
                       <tr>
                           <td class="left_col">
                                <label for="upw">비밀번호:</label>
                           </td>
                           <td height="50">
                               <span class="mini_comment">안전을 위해 10개 이상의 문자조합(영문 대소문자 + 숫자 또는 기호)를 입력해 주세요</span><br/> 
                               <input type="password" name="upw" id="upw">
                           </td>
                       </tr>
                       <tr>
                            <td class="left_col">
                               <label for="upw2">비밀번호 확인:</label>
                            </td>
                            <td height="50">
                                <span class="mini_comment">입력하신 비밀번호 확인을 위해 다시 한번 입력해주세요</span><br/> 
                                <input type="password" name="upw2" id="upw2">
                            </td>
                       </tr>
                       <tr>
                            <td class="left_col">
                                    <label for="uemail">이메일</label>
                            </td>
                            <td height="50">
                                <input type="text" style="width: 150px; margin-right: 10px;"><label for="@">@</label>
                                <input type="text">
                                <select name="uemail_last" id="uemail_last">
                                    <option value="gmail.com">gmail.com</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="daum.net">daum.net</option>
                                </select><br/>
                                <input type="checkbox" name="agree">정보 수신 동의<br/>
                                <span class="mini_comment">* 이메일은 활동에 필요한 정보를 받기 위해 필요하며 수신 동의와 함께 정확한 정보를 입력해 주세요.</span>
                            </td>
                        </tr>
                       <tr>
                            <td class="left_col">
                               <label for="uaddr">주소</label>
                            </td>
                            <td>
                                <table>
                                    <tbody>
                                        <colgroup>
                                            <col width="110px">
                                            <col width="850px">
                                        </colgroup>
                                        <tr>
                                            <td>
                                                <button style="font-size: 9px;">우편번호찾기</button>
                                            </td>
                                            <td>
                                                <input type="text">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right">
                                                <span class="mini_comment">기본 주소</span>
                                            </td>
                                            <td>
                                                <input type="text" style="width:350px;">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right">
                                                <span class="mini_comment">상세 주소</span>
                                            </td>
                                            <td>
                                                <input type="text" style="width:350px;">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
        
                            </td>
                       </tr>
                       <tr>
                            <td class="left_col">
                                <label for="phone">휴대전화번호:</label>
                            </td>
                            <td>
                                 <select name="phone" id="phone">
                                     <option value="010">010</option>
                                     <option value="011">011</option>
                                     <option value="017">017</option>
                                 </select>
                                 <label for="-">-</label>
                                 <input type="text" name="phone">
                                 <label for="-">-</label>
                                 <input type="text" name="phone">
                                 <button>인증하기</button><br/>
                                 <input type="checkbox" name="agree">정보 수신 동의<br/>
                                 <span class="mini_comment">* 수신 동의 선택과 함께 안전한 회원가입을 위해 인증을 진행해 주세요. 휴대전화번호 입력 후, 인증하기를 클릭하시면 인증번호가 문자로 발송되며 해당번호를 입력 창에 입력하시면 됩니다.</span>
                            </td>
                        </tr>
                   </tbody>
                </table>
                </div>
                <div class="l_btn" id="l_btn">
                    <button class="okay_btn">확인</button> &nbsp; <button class="cancel_btn">취소</button>
                </div>
	        </div>
	    </div>
	</div>
		<!-- 콘텐츠 영역 끝 -->

        <div class="section section-small section-get-started">
                <div class="parallax filter">
                    <div class="image"
                        style="background-image: url('images/wizard-book.jpg')">
                    </div>
                    <div class="container">
                        <div class="title-area">
                            <h2 class="text-white">저희는 인크레파스 교육생입니다.</h2>
                            <div class="separator line-separator">♦</div>
                            <p class="description">인크레파스에 대해 더 알고싶으면 아래를 클릭해주세요!</p>
                        </div>
                        <div class="button-get-started">
                              <a class="btn btn-xl" href="http://www.increpas.com/index.inc" style="background-color: azure;">인크레파스 가기!</a>
                        </div>             
                    </div>
                </div>
            </div>
           
            <!-- Footer -->
            <footer class="py-5 bg-warning">
                <div class="container">
                 <p class="m-0 text-center text-white">Copyright &copy; HAYLEY 2017</p>
                  <!-- //right area END -->
                <div class="quick1">
                  <a href="#"><img src="images/btn_top.png" /></a>
                </div>
               </div>
            </footer>
    </div>

     <!-- Bootstrap core JavaScript -->
     <script src="js/jquery.min.js"></script>
     <script src="js/bootstrap.bundle.min.js"></script>

     <script>
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
     </script>
</body>
</html>