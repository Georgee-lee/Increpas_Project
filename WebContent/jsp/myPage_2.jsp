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

              <div class="table_layout">
                  <div class="buttons">
                    <button type="button" class="btn btn-secondary">내가 나눔한 재능</button>
                    <button type="button" class="btn btn-secondary">내가 참여한 재능</button>
                    <button type="button" class="btn btn-secondary">지난 참여목록</button>
                  </div>
              </div>
                  <!-- //navigation-->
                               
             <div class="tables">
             <table class="table table-sm">
             <colgroup>
             <col width="10%";>
             <col width="" ;>
             <col width="10%";>
             <col width="10%";>
             <col width="10%";>
             </colgroup>
			  <thead>
			    <tr class="table-group alert-dark">
			      <th scope="col">번호</th>
			      <th scope="col">제목</th>
			      <th scope="col">글쓴이</th>
			      <th scope="col">등록일</th>
			      <th scope="col">조회수</th>
			    </tr>
			  </thead>
			  
			  <tbody>
			    <tr>
			      <th scope="row">1</th>
			      <td>가나다라마바사아자차카</td>
			      <td>홍길동</td>
			      <td>18-11-01</td>
			      <td>1</td>
			    </tr>
			    <tr>
			      <th scope="row">2</th>
			      <td>라아라아나나아아라</td>
			      <td>홍당무</td>
			      <td>18-11-01</td>
			      <td>12</td>
			    </tr>
			    <tr>
			      <th scope="row">3</th>
			      <td>야이야이아야아아아</td>
			      <td>홍당물</td>
			      <td>18-11-01</td>
			      <td>11</td>
			    </tr>
			    <tr>
			      <th scope="row">4</th>
			      <td>호호호호호호호홍홍</td>
			      <td>홍홍홍</td>
			      <td>18-11-01</td>
			      <td>12</td>
			    </tr>
			    <tr>
			      <th scope="row">5</th>
			      <td>희희희흐히희희</td>
			      <td>청청청</td>
			      <td>18-11-01</td>
			      <td>8</td>
			    </tr>
			    <tr>
			    <tr>
			      <th scope="row">6</th>
			      <td>희희희흐히희희</td>
			      <td>청청청</td>
			      <td>18-11-01</td>
			      <td>8</td>
			    </tr>
			    <tr>
			      <th scope="row">7</th>
			      <td>희희희흐히희희</td>
			      <td>청청청</td>
			      <td>18-11-01</td>
			      <td>8</td>
			    </tr>
			    <tr>
			      <th scope="row">8</th>
			      <td>희희희흐히희희</td>
			      <td>청청청</td>
			      <td>18-11-01</td>
			      <td>8</td>
			    </tr>
			    <tr>
			      <th scope="row">9</th>
			      <td>희희희흐히희희</td>
			      <td>청청청</td>
			      <td>18-11-01</td>
			      <td>8</td>
			    </tr>
				<tr>
			      <th scope="row">10</th>
			      <td>희희희흐히희희</td>
			      <td>청청청</td>
			      <td>18-11-01</td>
			      <td>8</td>
			    </tr>
			    
			  </tbody>
			</table>
			</div>
			
			<div class="searchbar" id="searchbar">
     			<select name="search_key" style="height:29.5px;">
					<option value="seller_id" >글쓴이</option>
				</select>
		       	<input type="text"  name="searchValue"/>
				<button type="button">검색</button>     
			</div>

                  <div class="paging"> 
                    <nav aria-label="Page navigation example">
                        <ul class="pagination" style="margin-top: 20px;">
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                  </div>
                    <!-- 콘텐츠 영역 -->
                  
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