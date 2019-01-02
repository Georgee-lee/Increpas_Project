<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="error404.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>메인페이지</title>
    <link href="css/gaia.css"  rel="stylesheet">
    <style type="text/css">
    	.HideAndShow{
    		display: none;
    	}
    	
    	.caption:hover .HideAndShow{
    		display: block !important;
    	}
    </style>
  </head> 
  <body>
  <div id="main">
  	<!-- 네비게이션 include -->
    <jsp:include page="nav.jsp"/>

    <!-- Portfolio -->
    <section class="content-section" id="portfolio">
      <div class="container">
        <div class="content-section-heading text-center">
          <h2 class="text-secondary mb-0">재능나눔</h2>
          <h3 class="mb-5">함께나누면 두배 즐거운 재능을 나눠보아요</h3>
        </div>
        <div class="row no-gutters">
        <c:forEach items="${main }" var="rvo">
          <div class="col-lg-6 col-xl-4">
            <a class="portfolio-item" href="javascript:chkLogin(${rvo.r_idx })" style="height: 100%">
              <span class="caption" style="width: 100%; height: 100%" >
                <span class="caption-content HideAndShow">
                  <h2>${rvo.r_category1 }</h2>
                  <p class="mb-0">${rvo.r_title }</p>
                </span>
              </span>
              <img class="img-fluid" src="<c:if test="${rvo.imagepath == null }">images/portfolio-1.jpg</c:if>
              							  <c:if test="${rvo.imagepath != null }">${rvo.imagepath }</c:if>" alt="thumbnail"
              							  style="width: 370px; height: 330px;">
            </a>
          </div>
        </c:forEach>  
        </div>

     <!-- Features Section -->
     <ul class="m_board_sec">
      <li>
        <p style="width:347px; border-bottom:4px orchid solid; font-weight:bold; font-size: 16px;">
        자유게시판<span style="font-weight: normal; font-size: 12px; float: right; color: gray;"><a href="flist?boardType=free&nowPage=1">더보기 ></a></span>
        </p>
        <ul class="m_board_list">
			<c:forEach items="${free }" var="fvo">
				<c:if test="${lvo == null}">
					<li><a href="javascript:chkLog()">${fvo.f_title }</a></li>
				</c:if>
				<c:if test="${lvo != null}">
					<li><a href="fview?f_idx=${fvo.f_idx}&nowPage=1">${fvo.f_title }</a></li>
				</c:if>
     		</c:forEach>
        </ul>
      </li>
      
      <li>
        <p style="width:347px; border-bottom:4px #a30000 solid; font-weight:bold; font-size: 16px;">
        공지사항<span style="font-weight: normal; font-size: 12px; float: right; color: gray;"><a href="flist?boardType=notice&nowPage=1">더보기 ></a></span>
        </p>
        <ul class="m_board_list">
	        <c:forEach items="${notice }" var="fvo2">
	        	<c:if test="${lvo == null}">
					<li><a href="javascript:chkLog()">${fvo2.f_title }</a></li>
				</c:if>
				<c:if test="${lvo != null}">
					<li><a href="fview?f_idx=${fvo2.f_idx}&nowPage=1">${fvo2.f_title }</a></li>
				</c:if>
            </c:forEach>
        </ul>
      </li>
      
      <li>
        <p style="width:347px; border-bottom:4px #139c88 solid; font-weight:bold; font-size: 16px;">
        질문게시판<span style="font-weight: normal; font-size: 12px; float: right; color: gray;"><a href="flist?boardType=QnA&nowPage=1">더보기 ></a></span>
        </p>
        <ul class="m_board_list">
	        <c:forEach items="${QnA }" var="fvo3">
	        	<c:if test="${lvo == null}">
					<li><a href="javascript:chkLog()">${fvo3.f_title }</a></li>
				</c:if>
				<c:if test="${lvo != null}">
					<li><a href="fview?f_idx=${fvo3.f_idx}&nowPage=1">${fvo3.f_title }</a></li>
				</c:if>
            </c:forEach>
        </ul>
      </li>
    </ul>
      </div>
    </section>

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
                    <a class="btn btn-xl" href="http://www.increpas.com/index.inc" target="blank" style="background-color: azure;">인크레파스 가기!</a>
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

  <script type="text/javascript">
    function chkLog(){ 
    	alertify.alert("로그인이 필요한 서비스입니다");
    }
    
    function chkLogin(r_idx){
		if(${lvo != null}){
			location.href = 'rdetail?r_idx='+r_idx;
		}
		else
			alertify.alert("로그인이 필요한 서비스입니다");
	}
  </script>

  <!-- End of Tocplus -->
</body>
</html>