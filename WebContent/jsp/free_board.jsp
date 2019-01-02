<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title><c:if test="${param.boardType == 'free' }">자유 게시판</c:if>
	<c:if test="${param.boardType == 'notice' }">공지 게시판</c:if> <c:if
		test="${param.boardType == 'QnA' }">질문 게시판</c:if></title>

<link href="css/table-custom.css" rel="stylesheet">
<link href="css/pagination.css" rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" rel="stylesheet">
<link href="css/gaia.css" rel="stylesheet">

<style type="text/css">
.btn-right {
	display: inline-block;
	margin-bottom: 15px;
	float: right;
}

.right {
	font-size: 18px;
	font-weight: bold;
}

.input-box {
	display: inline;
	height: 40px;
	width: 400px;
}

.input-box>input {
	width: 30%;
}

table ol.paging li {
	float: left;
	margin-right: 8px;
}

table ol.paging li a {
	display: block;
	padding: 3px 7px;
	border: 1px solid #00B3DC;
	color: #2f313e;
	font-weight: bold;
}

table ol.paging li a:hover {
	background: #00B3DC;
	color: white;
	font-weight: bold;
}

.disable {
	padding: 3px 7px;
	border: 1px solid silver;
	color: silver;
}

.now {
	padding: 3px 7px;
	border: 1px solid #ff4aa5;
	background: #ff4aa5;
	color: white;
	font-weight: bold;
}
</style>
</head>
<body>
<div id="main">
	<jsp:include page="nav.jsp" />

	
		<!-- table -->
		<div class="free_table">
			<h1>
				<c:if test="${param.boardType == 'free' }">자유 게시판</c:if>
				<c:if test="${param.boardType == 'notice' }">공지 게시판</c:if>
				<c:if test="${param.boardType == 'QnA' }">질문 게시판</c:if>
			</h1>
			<button type="button" class="btn btn-outline-dark m5"
				onclick="location.href='flist?boardType=free'">자유게시판</button>
			<button type="button" class="btn btn-outline-warning m5"
				onclick="location.href='flist?boardType=notice'">공지사항</button>
			<button type="button" class="btn btn-outline-info m5"
				onclick="location.href='flist?boardType=QnA'">질문게시판</button>
			<div class="table-responsive-vertical shadow-z-1">
				<!-- Table starts here -->
				<table id="table" class="table table-hover table-mc-light-blue">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>조회수</th>
							<th>날짜</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${list }" var="item" varStatus="idx">
							<tr>
								<td data-title="IDX">${rowTotal-((nowPage-1)*blockList+idx.index) }</td>
								<td data-title="TITLE"><a
									href="fview?f_idx=${item.f_idx}&nowPage=${nowPage}"
									onclick="return chkLog();">${item.f_title } &nbsp; <c:if
											test="${ fn:length(item.fc_list) > 0 }">[${ fn:length(item.fc_list) }]</c:if></a></td>
								<td data-title="WRITER">${item.f_writer }</td>
								<td data-title="HIT">${item.f_hit }</td>
								<td data-title="WRITEDATE">${fn:substring(item.f_writedate, 0, 10) }</td>
							</tr>
						</c:forEach>


						<tr>
							<td colspan="5" style="padding-left: 40%">${pageCode }</td>
						</tr>


						<tr>
							<td colspan="4">
								<div class="input-box">
									<select name="opt" id="opt" style="height: 27px;">
										<option value="f_title">제목</option>
										<option value="f_writer">글쓴이</option>
									</select> <input type="text" name="searchValue" id="searchValue"
										placeholder="검색어 입력">
									<button type="button" class="btn btn-outline-info"
										onclick="searching()">검색</button>
								</div>
							</td>
							<td>
								<div class="btn-right">
									<input type="button" value="글쓰기"
										class="btn btn-outline-info right" onclick="chklogin()">
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<!--//table  -->
		<div class="section section-small section-get-started">
			<div class="parallax filter">
				<div class="image"
					style="background-image: url('images/wizard-book.jpg')"></div>
				<div class="container">
					<div class="title-area">
						<h2 class="text-white">저희는 인크레파스 교육생입니다.</h2>
						<div class="separator line-separator">♦</div>
						<p class="description">인크레파스에 대해 더 알고싶으면 아래를 클릭해주세요!</p>
					</div>
					<div class="button-get-started">
						<a class="btn btn-xl" href="http://www.increpas.com/index.inc"
							style="background-color: azure;">인크레파스 가기!</a>
					</div>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<footer class="py-5 bg-warning">
			<div class="container">
				<p class="m-0 text-center text-white">Copyright &copy; HAYLEY
					2017</p>
				<!-- //right area END -->
				<div class="quick1">
					<a href="#"><img src="images/btn_top.png" /></a>
				</div>
			</div>
		</footer>
	</div>

	<script src="js/jquery.min.js"></script>

	<script>
 function chklogin() {
   	  if( ${lvo != null} ) {
   		  if(${lvo.u_id == 'admin'})
   			location.href = "fwrite?boardType="+'${param.boardType}'+"&nowPage="+${nowPage};
   			
   		  else if(${param.boardType != 'notice'}) /* 공지 게시판에서 글쓰기 버튼을 눌렀을 때 */
			location.href = "fwrite?boardType="+'${param.boardType}'+"&nowPage="+${nowPage};
   		  
   		  else
   			alertify.alert("해당 게시판은 관리자만 글쓰기가 가능합니다.");
   		  
   	  }else /* 로그인 안 했을때 */
   		alertify.alert("로그인이 필요합니다");
     }
 
 function chkLog(){
	 if( ${lvo != null} )
		 return true;
	else{
		alertify.alert("로그인이 필요합니다");
		return false;
	}
 }
 
 function searching(){
	 var searchType = document.getElementById("opt").value;
     var searchValue = document.getElementById("searchValue").value.trim();
	
	if(searchValue != null && searchValue != "")
		location.href = "flist?boardType="+'${param.boardType}'+"&searchType="+searchType+"&searchValue="+searchValue
	else
		alertify.alert("검색어를 입력해 주세요");
 }
 </script>
</body>
</html>