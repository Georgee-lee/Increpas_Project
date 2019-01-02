<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Modern Business - Start Bootstrap Template</title>


    <link rel="stylesheet" href="lib/css/pagination.css">
    <link href="css/gaia.css"  rel="stylesheet">
     <!-- style★ -->

    <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style type="text/css">
    	.overwrap{
    		overflow: hidden;
		    text-overflow: ellipsis;
		    display: -webkit-box;
		    -webkit-line-clamp: 3;
		    -webkit-box-orient: vertical;
		    word-wrap: break-word;
		    line-height: 1.2em;
		    height: 3.6em;
    	}
    </style>
</head>

  <body>
    <div id="main">
    <jsp:include page="nav.jsp"/>

    <!-- Portfolio -->
    <section class="content-section" id="portfolio">
      <div class="container">
        <div class="content-section-heading text-center">
          <h2 class="text-secondary mb-0">재능나눔</h2>
          <h3 class="mb-5">함께나누면 두배 즐거운 재능을 나눠보아요</h3>
          <div class="btn-group" role="group" aria-label="Basic example">
			  <button type="button" class="btn btn-warning">전체</button>
			  <button type="button" class="btn btn-warning">카테고리순</button>
			  <button type="button" class="btn btn-warning">인기순</button>
		  </div>
	</div>
	<br/>
  
  
      <div class="row no-gutters">        
          <%-- 여기부터 나눔보기 반복문 --%>
      <c:forEach var="vo" items="${list }" varStatus="idx">
          <div class="col-lg-6 col-xl-4">
            <a class="portfolio-item" href="javascript:chkLogin(${vo.r_idx})">
              <span class="caption">
              </span>
             <div class="card" style="width: 18rem;">
		  <img class="card-img-top" src="${vo.imagepath }" alt="Card image cap" style="width: 250px; height: 154px;">
		  <div class="card-body">
		    <p data-title="IDX">${rowTotal-((nowPage-1)*blockList+idx.index) }</p>
		    <h5 class="card-title">${vo.r_title }</h5>
		    <p class="card-text overwrap">${vo.r_sTitle}</p>
		    <a href="javascript:chkLogin(${vo.r_idx})" class="btn btn-primary">나눔 상세보기</a>
		   </div>
		</div>
		  </a>
		</div>
		</c:forEach>

        <!-- 페이징 -->
                 
		 <div class="container">
	         <nav aria-label="Page navigation example">
				${pageCode }	             
			</nav>
		</div>		
        <!-- 페이징의 끝 -->
          
          
          <!-- 검색창 -->
	 <div class="input-box" style="margin-left: 410px;">
       <select name="search" id="search" style="height: 27px;">
               <option value="r_title">제목</option>
               <option value="r_writer">글쓴이</option>
       </select> <input type="text" name="searchValue" id="searchValue"
                      placeholder="검색어 입력">
       <button type="button" class="btn btn-outline-info"
                      onclick="search()">검색</button>
     </div>

		<!-- 검색창의 끝 -->

          
                    
     </div>           
      </div>
 </section> <!-- Portfolio의 끝 -->

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
                <a class="btn btn-warning btn-xl" href="http://www.increpas.com/index.inc">인크레파스 가기!</a>
          </div>             
      </div>
  </div>
</div>
 
 
      <!-- Footer -->
    <footer class="py-5 bg-warning">
      <div class="container">
       <p class="m-0 text-center text-white">Copyright &copy; HAYLEY 2018</p>
        <!-- //right area END -->
   <div class="quick1">
      <a href="#"><img src="images/btn_top.png" /></a>
   </div>
     </div>
      
      <!-- /.container -->
    </footer>
  </div>
  
  	<script src="js/jquery.min.js"></script>

	<script>
		function search(){
		    var searchType = document.getElementById("search").value;
		     var searchValue = document.getElementById("searchValue").value.trim();
		   
		   if(searchValue != null && searchValue != "")
		      location.href = "rlist?searchType="+searchType+"&searchValue="+searchValue
		   else
		      alertify.alert("검색어를 입력해 주세요");
		 }
		
		function chkLogin(r_idx){
			if(${lvo != null}){
				location.href = 'rdetail?r_idx='+r_idx+'&nowPage='+${nowPage};
			}
			else
				alert("로그인이 필요합니다");
		}
 	</script>
</body>
</html>