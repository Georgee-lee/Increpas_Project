<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page errorPage="error404.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.css" rel="stylesheet">

<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
<link href="css/board.css" rel="stylesheet">
<link href="css/gaia.css"  rel="stylesheet">
</head>
<body>
	<div id="main">
	<jsp:include page="nav.jsp"/>
		<div id="bbs" style="width: 1020px; margin: 0 auto;">
			<form action="${ac }" method="post" encType="multipart/form-data">
				<table summary="게시판 글쓰기" style="margin-bottom: 30px;">
				<h2>게시판 글쓰기</h2>
					<colgroup>
						<col width="250px">
						<col width="*">
					</colgroup>
					
					<tbody>
						<tr>
							<th>제목:</th>
							<td><input type="text" name="f_title" size="45" <c:if test="${fvo!=null }">value="${fvo.f_title }"</c:if>/></td>
						</tr>
						<tr>
							<th>내용:</th>
							<td style="width: 1000px;"><textarea id="content" name="f_content" cols="50" 
									rows="8"><c:if test="${fvo!=null }">${fvo.f_content }</c:if></textarea></td>
						</tr>
						<tr>
							<th>첨부파일:</th>
							<td><input type="file" name="upload"/></td>
						</tr>
					<c:if test="${as != 'disabled'}">	
						<tr>
							<th>비밀번호:</th>
							<td><input type="password" id="pwd" name="f_pwd" size="12" /></td>
						</tr>
					</c:if>
						<tr>
							<td colspan="2" style="text-align: right;">
								<input type="button" value="등록"
								onclick="sendData()"/>
								<input type="button" value="취소" 
								onclick="goBack()"/>
							</td>
						</tr>
					</tbody>
				</table>
				
				<input type="hidden" name="f_writer" value="${lvo.u_name}">
				<input type="hidden" name="u_idx" value="${lvo.u_idx}">
				<input type="hidden" name="boardType" value="${param.boardType}">
				<input type="hidden" name="f_idx" value="${fvo.f_idx}">
				<input type="hidden" name="nowPage" value="${param.nowPage}">
			</form>
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
   	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.js"></script>
	<script src="js/summernote/lang/summernote-ko-KR.js"></script>
   	<script src="js/bootstrap.bundle.min.js"></script>
   	
	<script type="text/javascript">
	$(function(){
		$("#content").summernote({
	        tabsize: 2,
	        height: 300,
	        lang: "ko-KR",
	        maxHeight: 700,
	        minHeight: 300,
	        focus: true,/* 커서를 미리 가져다 놓는다. */
	        callbacks:{
	        	onImageUpload:function(files, editor){
	        		//이미지가 에디터에 추가될 때마다 수행하는 곳!!
	        		// 이미지를 첨부하면 배열로 인식된다.
	        		//이것을 서버로 비동기식 통신을 수행하는
	        		//함수를 호출하여 보낸다.
	        		for(var i=0; i<files.length; i++)
	        			sendFile(files[i], editor);
	        	},
	        }
		});
		
		$("#content").summernote("lineHeight", 0.7);
		
	});

	
	function sendFile(file, editor){
//		alert(files.length+":^^");
		
		// 파라미터를 전달하기 위해 폼객체를 만든다.
		var frm = new FormData();
		// <form></form>
		
		//보내고자 하는 자원들을 파라미터 값으로 등록
		frm.append("upload", file);
		
		//비동기식 통신
		$.ajax({
			url: "jsp/saveImage.jsp",
			data: frm,
			cache: false,
			contentType: false,
			processData: false,
			type: "post",
			dataType: "json" // 나중 받을 데이터의 형식
		}).done(function(data){
			//도착함수
			//alert(data.url);
			
			// 에디터에 img태그로 저장하기 위해
			//다음과 같이 img태그를 정의한다.
			//var image = $("<img>").attr("src", data.url);
			//에디터에 정의한 img태그를 넣어준다.
			//$("#content").summernote("insertNode", image[0]);
			
			$("#content").summernote(
				"editor.insertImage", data.url);
		}).fail(function(e){
			//오류발생 시
			console.log(e);
		});
	}
		
		function sendData(){
	    	if(document.forms[0].f_title.value == "" || document.forms[0].f_title.value.trim().length == 0){
	    		alert("제목을 입력하세요");
	    		document.forms[0].title.focus();
	    		return;
	    	}
	    	if(document.forms[0].f_content.value == "" || document.forms[0].f_content.value.trim().length == 0){
	    		alert("내용을 입력하세요");
	    		document.forms[0].content.focus();
	    		return;
	    	}
	    	<c:if test="${as != 'disabled'}">
		    	if(document.forms[0].f_pwd.value == "" || document.forms[0].f_pwd.value.trim().length == 0){
		    		alert("비밀번호를 입력하세요");
		    		document.forms[0].pwd.focus();
		    		return;
		    	}
	    	</c:if>
			document.forms[0].submit();
		}
		
		function goBack(){
			location.href = 'flist?boardType='+'${param.boardType}'+'&nowPage='+'${param.nowPage}';
		}
		
		history.go(1);
	</script>
</body>
</html>