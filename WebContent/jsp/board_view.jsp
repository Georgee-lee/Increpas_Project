<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<style type="text/css">
	.w80{
		width: 80%;
		margin: 10px auto;
	}
	
	.viewTable{
		table-layout:fixed; width:80%; margin:0 auto; height: 500px;
		border-top:2px solid #e5e5e5; border-bottom: 2px solid #e5e5e5;
	}
	
	.comment{
		width: 80%;
		margin: 20px auto;
	}
	.comm{
		width: 80%;
		margin: 20px auto;
		text-align: right;
	}
</style>
</head>
<body>
	<div id="main">
		<jsp:include page="nav.jsp"/>

	<!-- 글 보기 바디부분 -->
	<table border=0 cellspacing=0 cellpadding=0 class='viewTable'>
		<colgroup>
			<col  width="80" />
			<col />
		</colgroup>
		<tr>
			 <td height=20>작성일</td>
			 <td>${fvo.f_writedate }</td>
		</tr>
		<tr>
			 <td height=20>글쓴이&nbsp;&nbsp;</td>
			 <td align=left width=100% style="font-weight:bold;"><span>${fvo.f_writer }</span></td>
		</tr>
		<tr>
			 <td style='border-bottom:1px solid #e5e5e5;' height=20>제목&nbsp;&nbsp;</td>
			 <td style='border-bottom:1px solid #e5e5e5;'>${fvo.f_title }</td>
		</tr>
		<tr>
			 <td style='border-bottom:1px solid #e5e5e5;' height=20>첨부파일&nbsp;&nbsp;</td>
			 <td style='border-bottom:1px solid #e5e5e5;'>
			 	<a href="javascript:download('${fvo.uploadFileName }')">${fvo.uploadFileName }</a>
			 </td>
		</tr>
		<tr>
		 <td colspan=2>
		<div class='articleArea'>
			${fvo.f_content }
		</div>
		<br><br>
		<!-- //-->
		
		 <div align='right' style='font-family:tahoma;'></div>

		 </td>
		</tr>
	</table>
	
	<!-- 댓글 작성란 -->
	<form method="post" action="fcomm">
		<div class="comment">
			<label for="comment">내용:</label>
			<input type="hidden" name="fc_writer" value="${sessionScope.lvo.u_name }">
			<input type="hidden" name="nowPage" value="${param.nowPage }">
			<input type="hidden" id="f_idx" name="f_idx" value="${fvo.f_idx }">
			<input type="hidden" id="u_idx" name="u_idx" value="${sessionScope.lvo.u_idx }">
			<input type="text" name="fc_content" id="fc_content" style="width: 550px;">
			<input type="button" value="등록" onclick="addComm(this.form)">
		</div>
	</form>
	
	<!-- 게시물 삭제시 전송할 Form -->
	<form action="delboard" method="post">
		<input type="hidden" name="nowPage" value="${param.nowPage }">
		<input type="hidden" name="f_idx" value="${fvo.f_idx }">
		<input type="hidden" id="f_pwd" name="f_pwd" value="">
		<input type="hidden" name="boardType" value="${fvo.boardType}">
	</form>
	
	 <!-- Single Comment -->
     <c:forEach items="${fvo.fc_list}" var="commvo">
	  <div class="media mb-4 w80">
        <img src="images/fox.jpg" style="width: 50px;">
        <div class="media-body">
          <h5 class="mt-0">${commvo.fc_writer}</h5>
      	  ${commvo.fc_content }
        </div>
      </div>
       <td></td>
     </c:forEach>
	   
    <hr/>
	
	<div class="comm">
		<input type="button" class="btn btn-dark" value="목록" onclick="goBack()"/>
		<input type="button" class="btn btn-warning" value="수정" onclick="editFbbs()"/>
		<input type="button" class="btn btn-danger" value="삭제" onclick="delFbbs()"/>
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
	<script type="text/javascript">
		function addComm(frm){
			var cont = document.getElementById("fc_content").value;
		
			if(cont.trim().length > 0)
				frm.submit();
			else{
				alert("내용을 입력해 주세요");
				return;
			}
		}
		
		function goBack(){
			document.location.href = 'flist?boardType='+'${fvo.boardType}'+'&nowPage='+'${param.nowPage}';
		}
  
		function editFbbs(){
			var ori_writer = "${fvo.f_writer}";
			var user_name = "${sessionScope.lvo.u_name}";
			
			if(ori_writer == user_name){
				document.location.href = 'edit?f_idx='+${fvo.f_idx}+'&boardType='+'${fvo.boardType}'+'&nowPage='+'${param.nowPage}';
			}else{
				alertify.error("작성자만 수정이 가능합니다");
			}
		}
		
		function delFbbs() {
			var ori_writer = "${fvo.f_writer}";
			var user_name = "${sessionScope.lvo.u_name}";
			
			if(ori_writer == user_name){
				var pwd = prompt("비밀번호를 입력해 주세요");
				
				if(pwd == ${fvo.f_pwd}){
					document.getElementById("f_pwd").value = pwd;
					location.href = 'del?f_idx='+${fvo.f_idx}+'&f_pwd='+pwd+'&boardType='+'${fvo.boardType}';
					//document.forms[1].submit;
				}else if(pwd == null) {
					return;
				}else {
					alertify.alert("비밀번호가 틀렸습니다");
				}
				
			}else
				alertify.error("작성자만 삭제가 가능합니다");
		}
		
		function download(fname){
			location.href = "FileDownload?dir=upload&filename="+fname;
			//서블릿으로 바로 전송!!
		}
		
		history.go(1);
</script>  
</body>
</html>