<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>lml_Email</title>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
   
    <link rel="stylesheet" href="resources/css/final_Settings_Email.css">
</head>
<body>
   <jsp:include page="../common/header.jsp"/>
    <section>
        <div class="AContent">
            <div class="Atable">
                <div class="Abox">
                   <div class="lContent">
                    <div class="lmenu">
                        <li class="minimenu"><a href="Settings.do" class="Ma"> <img class="mainbtn" src="resources/images/icon/settings/Mprofile.png">프로필 수정</a></li>
                        <li class="minimenu"><a href="Settings2.do" class="Ma"> <img class="mainbtn" src="resources/images/icon/settings/Mrock.png">비밀번호 변경</a></li>
                        <li class="minimenu">
							<c:url var="followList" value="Settings5.do">
								<c:param name="uNum" value="${ loginUser.user_num }"/>
							</c:url>
                        	<a href="${followList}" class="Ma"> 
                        		<img class="mainbtn" src="resources/images/icon/settings/xxx.png">친구관리
                        	</a>
						</li>
                        <li class="minimenu put"><a href="Settings3.do" class="Ma"> <img class="mainbtn" src="resources/images/icon/settings/Memail.png">이메일 문의</a></li>
                     </div>
                </div>
                <div class="rContent">
                    <div class="emailform">
                        문의사항 혹은 저희 홈페이지에 대한<br>
                        피드백이 있으시다면<br>
                        하단의 메일 버튼을 누르시거나<br>
                        <a href="mailto:feedback@lml.com">feedback@lml.com</a> 으로 메일을 보내주세요!
                    </div>
                    <div class="Ebtn">
                        <a href="mailto:feedback@lml.com"><img id="emailbtn" src="resources/images/icon/settings/email2.png"></a>
                    </div>
               </div>
                </div>
            </div>
        </div>
    </section>

    <script>
        /*선택 메뉴 고정*/
        $(document).ready(function(){
          $('.minimenu').on('click', function(){
              $(this).addClass('put');
              $(this).siblings().removeClass('put');
          });
      });
  </script>

    

      
</body>
</html>