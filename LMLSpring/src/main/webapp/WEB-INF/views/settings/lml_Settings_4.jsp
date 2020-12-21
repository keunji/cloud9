<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>lml_Withdrawal</title>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="resources/css/final_Settings_Withdrawal.css">
</head>
</head>
<body>
   <jsp:include page="../common/header.jsp"/>
    <section>
        <div class="AContent">
            <div class="Atable">
                <div class="Abox">
                   <div class="lContent">
                    <div class="lmenu">
                       <li class="minimenu put"><a href="Settings.do" class="Ma"> <img class="mainbtn" src="resources/images/icon/settings/Mprofile.png">프로필 수정</a></li>
                        <li class="minimenu"><a href="Settings2.do" class="Ma"> <img class="mainbtn" src="resources/images/icon/settings/Mrock.png">비밀번호 변경</a></li>
                        <li class="minimenu">
							<c:url var="followList" value="Settings5.do">
								<c:param name="uNum" value="${ loginUser.user_num }"/>
							</c:url>
                        	<a href="${followList}" class="Ma"> 
                        		<img class="mainbtn" src="resources/images/icon/settings/xxx.png">친구관리
                        	</a>
						</li>
                        <li class="minimenu"><a href="Settings3.do" class="Ma"> <img class="mainbtn" src="resources/images/icon/settings/Memail.png">이메일 문의</a></li>
                     </div>
                </div>
                   <div class="rContent">
                    <form method="POST" action="mDelete.do" class="withdrawal_info">
                        <div class="Withdraw_input_container">
                            <div class="Email With">이메일
                                <input class="withdraw_input" id="email" name="email" type="email" maxlength="30" >
                            </div>
                            
                            <div class="Id With">아이디
                                <input class="withdraw_input" id="id" name="id" type="text" maxlength="13" >
                            </div>

                            <div class="PWD With">비밀번호
                                <input class="withdraw_input" id="pwd" name="password" type="password" maxlength="13" >
                            </div>
                            
                        </div>
                        <div class="withdrawal_btn_container">
                            <input type="submit" class="withdrawal" id="submit" value="탈퇴하기">
                        </div>
		            </form>
                    </div>
                </div>
                </div>
            </div>
        </div>
    </section>

    <script>
        /*입력이 되지 않았을 때*/
        $("#submit").click(function(){
             if($("#email").val()!="${loginUser.mail}"){
                 console.log("hi");
                 
                 
            	 
            	 alert("이메일 다릅니다.");
                  return false;
                }else if($("#id").val()!="${loginUser.id}"){
                    alert("아이디 다릅니다.");
                    return false;
                }else if($("#pwd").val()!="${loginUser.upwd}"){
                    alert("패스워드 다릅니다.");
                    return false;
                }else{
                 $(".withdrawal_info").submit();
                }
         });
    </script>
        
    <script>
        /*선택 메뉴 고정*/
        $(document).ready(function(){
          $('.minimenu').on('click', function(){
              $(this).addClass('put');
              $(this).siblings().removeClass('put');
          });
      });
  </script>

      <script>
          /* 상단 메뉴 스크롤 */
          $(function () {
            var lastScrollTop = 0,
                delta = 15;
            $(window).scroll(function (event) {
                var st = $(this).scrollTop();
                if (Math.abs(lastScrollTop - st) <= delta) return;
                if ((st > lastScrollTop) && (lastScrollTop > 0)) {
                    $(".hMenu").css("top", "0px");
                } else {
                    $(".hMenu").css("top", "50px");
                }
                lastScrollTop = st;
            });
        });

        $(document).ready(function(){
            $('.hMenu2').on('click', function(){
                $(this).addClass('on');
                $(this).siblings().removeClass('on');
            });
        });

        /* 마이페이지 햄버거메뉴 */
        $(document).ready(function(){
            $(".mySub").hide();
            $(".myMenu").click(function(){
                $("ul",this).slideToggle("fast");
            });
        });

        $("body").click(function(e){
            if(!$(".myMenu").has(e.target).length){
                $(".mySub").hide();
            }
        });


      </script>

      
</body>
</html>