<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<!-- 달력을 보여주기 위해 필요함! -->
<link rel="stylesheet" type="text/css" href="css/jquery-ui.min.css">
<link rel="stylesheet" type="text/css" href="css/register.css">

<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.css" rel="stylesheet">

<title>재능나눔 수정하기</title>


<style>
	#regedit{margin-left: 260px; }
</style>
</head>
<body>
<div class="main">
<jsp:include page="nav.jsp"/>
	<form action="regEdit" method="post" enctype="multipart/form-data">
	
		<div id="regedit">
		  	<h2>재능 수정</h2>
			<h6>재능기부가 아닌 판매, 홍보성 글이나 무성의한 글은 승인 거절됩니다.</h6>
			<h6>직거래를 유도하는 계좌이체 혹은 외부결제를 요구할 경우 사이트 관리자에 의하여 임의로 삭제될 수 있습니다.</h6>
			<br>
			<h5>재능 정보 입력</h5>
			
			
			<%-- 다음은 수정한 후 rdetail로 돌아갈 때 필요한 값 --%>
			<input type="hidden" name="r_idx" value="${param.r_idx }"/>
			<input type="hidden" name="nowPage" value="${param.nowPage }"/>
				<%@ include file="regInsert.jsp" %>
			
		</div>
		</form>
	
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
	<script type="text/javascript">
	function check(ff){
		//유효성 검사
		
		ff.submit();
	}
	</script>
</body>
</html>