<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재능나눔 등록하기</title>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<!-- 달력을 보여주기 위해 필요함! -->
<link rel="stylesheet" type="text/css" href="css/jquery-ui.min.css">
<link rel="stylesheet" type="text/css" href="css/register.css">

<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.css" rel="stylesheet">
<style>
	#regist{margin-left: 260px; }
</style>
</head>
<body>
	<div class="main">
	<jsp:include page="nav.jsp"/>

	<div id="regist">
	  	<h2>재능 등록</h2>
		<h6>재능기부가 아닌 판매, 홍보성 글이나 무성의한 글은 승인 거절됩니다.</h6>
		<h6>직거래를 유도하는 계좌이체 혹은 외부결제를 요구할 경우 사이트 관리자에 의하여 임의로 삭제될 수 있습니다.</h6>

		<br>
		<h5>재능 정보 입력</h5>
		<form action="regist" method="post" enctype="multipart/form-data">
		<table style="width: 85%;">
			<colgroup>
				<col width="30px" />
				<col width="*px" />
				<col width="30px" />
				<col width="*px" />
			</colgroup>
			<tbody>
					<tr>
						<td><label class="input-group-text"> 제목 </label></td>
						<td colspan="3">
						<input type="text" class="form-control" aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-sm" id="title" name="r_title"></td>						
					</tr>
					<tr>
						<td><label class="input-group-text"> 부제목 </label></td>
						<td colspan="3">
						<input type="text" class="form-control" aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-sm" id="r_sTitle" name="r_sTitle"></td>
					</tr>
					<tr>
						<td><label class="input-group-text"> 카테고리 </label></td>
						<td><select class="form-control" id="r_category1" name="r_category1">
								<option>:: 1차분류 ::</option>
								<option value="개발/제작">개발/제작</option>
								<option value="디자인">디자인</option>
								<option value="외국어/번역">외국어/번역</option>
						</select></td>
						<td colspan="2"><select class="form-control" id="r_category2" name="r_category2">
								<option>:: 2차분류 ::</option>
								<option value="프로그래밍">프로그래밍</option>
								<option value="컨텐츠제작">컨텐츠제작</option>
								<option value="영소설번역">영소설번역</option>
						</select></td>	
					</tr>
					<tr>	
						<td><label class="input-group-text" for="s_date">날짜:</label></td>
						<td colspan="1"><input type="text" class="form-control" id="r_sDate" name="r_sDate"/></td>

						<td><label class="input-group-text" for="s_date" style="text-align: center;">~</label></td>
						<td colspan="1"><input type="text" class="form-control" id="r_eDate" name="r_eDate" /></td>
					</tr>

				<tr>
					<td><label class="input-group-text" for="s_date">주소:</label></td>
					<td><input type="text" class="form-control"	id="sample4_postcode" placeholder="우편번호"></td>
					<td colspan="2"><input type="button" class="form-control" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"></td>	
				</tr>
				<tr>
					<td></td>
					<td><input type="text" class="form-control" id="sample4_roadAddress" placeholder="도로명주소"></td>
					<td colspan="2"><input type="text" class="form-control" id="sample4_jibunAddress" placeholder="지번주소" name="r_add"></td>
					<span id="guide" style="color: #999"></span>
				</tr>
				<tr>

					<td colspan="1"><label class="input-group-text"> 제한인원 </label></td>
						<td colspan="1"><select class="form-control" id="r_join" name="r_join">
								<option>:: 인원 ::</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								
						</select></td>
						<td><label class="input-group-text"> 비밀번호: </label></td>
						<td colspan="1">
						<input type="password" class="form-control" aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-sm" id="r_pwd" name="r_pwd"></td>
				<tr>
					<td colspan="4">
					<textarea class="form-control" id="r_content" name="r_content" rows="50" ></textarea></td>					
				</tr>
				<tr>
					<td><lable class="input-group-text" id="inputGroup-sizing-sm"> 썸네일 </lable></td>
					<td colspan="4"><input type="file" class="form-control" id="exampleFormControlFile1" name="image_upload"></td>
				</tr>
				<tr>
					<td><lable class="input-group-text" id="inputGroup-sizing-sm"> 첨부파일 </lable></td>
					<td colspan="4"><input type="file" class="form-control" id="exampleFormControlFile2" name="upload"></td>
				</tr>
				<tr>
					<td><input type="button" class="btn btn-outline-secondary" value="지도보기" onclick="javascript:openWin();"/></td>
					<td colspan="3" class="bt">
					<input type="hidden" name="r_writer" value="${lvo.u_name }">
					<input type="hidden" name="u_idx" value="${lvo.u_idx }">
					<button type="button" class="btn btn-danger" style="float: right;" onclick="location.href='index'">등록 취소</button>
					<button type="button" class="btn btn-primary" style="float: right; margin-right: 5px" onclick="sendData()">등록 완료</button></td>
			 	</tr>		
			</tbody>
		</table>
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
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.js"></script>
	<script src="js/summernote/lang/summernote-ko-KR.js"></script>
	
    <!-- Custom scripts for this template -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=49f129934e6f65d1385e419b3638a206&libraries=services"></script>

	<script>
		$(function() {
			//jQuery시작부분!
			$("#r_sDate").datepicker(
					{
						dateFormat : 'yy-mm-dd',
						dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
						monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						showMonthAfterYear : true
					});

			$("#r_eDate").datepicker(
					{
						dateFormat : 'yy-mm-dd',
						dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
						monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						showMonthAfterYear : true
					});
		});
		
		$(function(){
			
			$("#r_content").summernote({
				//placeholder: 'Hello stand alone ui',
				toolbar: [
                 ['style', ['style']],
                 ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
                 ['fontface', ['fontname']],
                 ['textsize', ['fontsize']],
                 ['color', ['color']],
                 ['alignment', ['ul', 'ol', 'paragraph', 'lineheight']],
                 ['height', ['height']],
                 ['table', ['table']],
                 ['insert', ['link']],
                 ['picture', ['picture']]
             ],
		        tabsize: 2,
		        lang: "ko-KR",
		        maxHeight: 700,
		        minHeight: 200,
		        height: 500,
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
			
			$("#r_content").summernote("lineHeight", 0.7);
		});
		function sendData(){
			if(document.forms[0].r_title.value == "" || 
	    			document.forms[0].r_title.value.trim().length == 0){
	    		alert("제목을 입력하세요");
	    		document.forms[0].r_title.focus();
	    		return;
	    	}
	    	if(document.forms[0].r_sTitle.value == "" || 
	    			document.forms[0].r_sTitle.value.trim().length == 0){
	    		alert("부제목을 입력하세요");
	    		document.forms[0].r_sTitle.focus();
	    		return;
	    	}
/* 	    	if(document.forms[0].r_category1.value == "" || 
	    			document.forms[0].r_category1.value.trim().length == 0){
	    		alert("카테고리 1를 입력하세요");
	    		document.forms[0].r_category1.focus();
	    		return;
	    	} */
	    /* 	if(document.forms[0].r_category2.value == "" || 
	    			document.forms[0].r_category2.value.trim().length == 0){
	    		alert("카테고리 2를 입력하세요");
	    		document.forms[0].r_category2.focus();
	    		return;
	    	} */
	    	if(document.forms[0].r_sDate.value == "" || 
	    			document.forms[0].r_sDate.value.trim().length == 0){
	    		alert("시작일을 입력하세요");
	    		document.forms[0].r_sDate.focus();
	    		return;
	    	}
	    	if(document.forms[0].r_add.value == "" || 
	    			document.forms[0].r_add.value.trim().length == 0){
	    		alert("주소를 입력하세요");
	    		document.forms[0].r_add.focus();
	    		return;
	    	}
	    	if(document.forms[0].r_pwd.value == "" || 
	    			document.forms[0].r_pwd.value.trim().length == 0){
	    		alert("비밀번호를 입력하세요");
	    		document.forms[0].r_pwd.focus();
	    		return;
	    	}
	    	if(document.forms[0].r_content.value == "" || 
	    			document.forms[0].r_content.value.trim().length == 0){
	    		alert("내용을 입력하세요");
	    		document.forms[0].r_content.focus();
	    		return;
	    	}
	    /* 	if(document.forms[0].upload.value == "" || 
	    			document.forms[0].upload.value.trim().length == 0){
	    		alert("이미지를 첨부해 주세요");
	    		document.forms[0].upload.focus();
	    		return;
	    	} */

//				document.forms[0].action = "test.jsp"; 
				document.forms[0].submit();
				
		}
		function sendFile(file, editor){
//			alert(files.length+":^^");
			
			// 파라미터를 전달하기 위해 폼객체를 만든다.
			var frm = new FormData();
			// <form></form>
			
			//보내고자 하는 자원들을 파라미터 값으로 등록
			frm.append("upload",file);
			
			//비동기식 통신
			$.ajax({
				url: "jsp/saveImage2.jsp",
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
				
				$("#r_content").summernote(
					"editor.insertImage", data.url);
			}).fail(function(e){
				//오류발생 시
				console.log(e);
			});
		}

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

		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== ''
								&& /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== ''
								&& data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						 document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
               			 document.getElementById('sample4_roadAddress').value = fullRoadAddr;
              			 document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							//예상되는 도로명 주소에 조합형 주소를 추가한다.
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';

						} else {
							document.getElementById('guide').innerHTML = '';
						}
					}
				}).open();
		}
		
		function openWin(){ 
			juso = encodeURIComponent(document.getElementById('sample4_jibunAddress').value);
		    window.open("map?juso="+juso,'window_name','width=750,height=500,location=no,status=no,scrollbars=yes');  		    
		}
		
		function check(ff){
			//유효성 검사
			
			ff.submit();
		}

	
	</script>
</body>
</html>