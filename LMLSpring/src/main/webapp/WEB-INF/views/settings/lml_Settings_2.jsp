<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>lml_Change_Pwd</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="resources/css/final_Settings_ChangePWd.css">
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<section>
		<div class="AContent">
			<div class="Atable">
				<div class="Abox">
					<div class="lContent">
						<div class="lmenu">
							<li class="minimenu"><a href="Settings.do" class="Ma"> <img
									class="mainbtn"
									src="resources/images/icon/settings/Mprofile.png">프로필 수정
							</a></li>
							<li class="minimenu put"><a href="Settings2.do" class="Ma">
									<img class="mainbtn"
									src="resources/images/icon/settings/Mrock.png">비밀번호 변경
							</a></li>
							<li class="minimenu">
								<c:url var="followList" value="Settings5.do">
									<c:param name="uNum" value="${ loginUser.user_num }"/>
								</c:url>
	                        	<a href="${followList}" class="Ma"> 
	                        		<img class="mainbtn" src="resources/images/icon/settings/xxx.png">친구관리
	                        	</a>
							</li>
							<li class="minimenu"><a href="Settings3.do" class="Ma">
									<img class="mainbtn"
									src="resources/images/icon/settings/Memail.png">이메일 문의
							</a></li>
						</div>
					</div>
					<div class="rContent">
						<form method="POST" action="changePwd.do" class="ChangePwd">
							<input type="text" id="id" name="id" value="${loginUser.id}"
								hidden="true">
							<div class="login_input_container">

								<div class="Origin Pwd">
									현재 비밀번호 <input class="login_input" id="origin_Pwd"
										name="origin_Pwd" type="password" maxlength="13" required>
									<span class="guide ok">불일치</span> <span class="guide error">일치</span>
									<input type="hidden" name="pwdCheck" id="pwdCheck" value="0">

								</div>

								<div class="New Pwd">
									새로운 비밀번호 <input class="login_input" id="pwd1" name="password1"
										type="password" maxlength="13" required>
								</div>

								<div class="Confirm Pwd">
									비밀번호 확인 <input class="login_input" id="pwd2" name="password2"
										type="password" maxlength="13" required>
								</div>
								<div class="alert-success Al" id="alert-success">&nbsp;&nbsp;&nbsp;비밀번호가
									일치합니다.</div>
								<div class="alert-danger Al" id="alert-danger">&nbsp;&nbsp;&nbsp;비밀번호가
									일치하지 않습니다.</div>
							</div>
							<div class="login_btn_container">
								<input type="submit" class="login_btn" id="submit" value="변경하기"
									onclick="return validate();">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		</div>
	</section>

	<script>
     function validate(){
    	 /*비밀번호 유효성*/
	      var id = $("#id").val();
	      var pwd1 = $("#pwd1").val();
	         var pwd2 = $("#pwd2").val();
	         
	         
		    var checkNumber = pwd1.search(/[0-9]/g);
		    var checkEnglish = pwd1.search(/[a-z]/ig);
		 
		    if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(pwd1)){            
		        alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
		        return false;
		    }else if(checkNumber <0 || checkEnglish <0){
		        alert("숫자와 영문자를 혼용하여야 합니다.");
		        return false;
		    }else if(/(\w)\1\1\1/.test(pwd1)){
		        alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
		        return false;
		    }else if(pwd1.search(id) > -1){
		        alert("비밀번호에 아이디가 포함되었습니다.");
		        return false;
		    }else {
			console.log("비밀번호 ok")	
			}
		    
		    
		    /*비밀번호 2차확인*/
    	 if($('#pwdCheck').val()==1){
    		 alert('현재 비밀번호가 틀립니다.');
    		 return false;
    	 }
    	 if(pwd1 != pwd2){
    		alert('변경 비밀번호 확인요망');
    		return false;
    	 }
     }
         /*pwd 입력값 비교*/
         $(function(){
            $("#alert-success").hide();
            $("#alert-danger").hide();
            $("input").keyup(function(){
            	$("#alert-success").hide();
                $("#alert-danger").hide();
                var pwd1 = $("#pwd1").val();
                var pwd2 = $("#pwd2").val();
                if(pwd1 !=""&& pwd2 !=""){
                    if(pwd1==pwd2){
                        $("#alert-success").show();
                        $("#alert-danger").hide();
                        console.log("넘어감")
                    }else if(pwd1!=pwd2){
                        $("alert-success").hide();
                        $("#alert-danger").show();
                        console.log("안넘어감")
                    }
                }
            });
         });

 
  		$(function(){
			$("#origin_Pwd").on("keyup",function(){
				console.log("비밀번호 여까지");
				var userPwd = $("#origin_Pwd").val();
				var userId= $('#id').val();
				if(userPwd.length < 1){
					$(".guide").hide();
					$("#pwdCheck").val(0);
					console.lo
					return;
				}
				
				$.ajax({
					url:"pwdCheck.do",
					data:{pwd:userPwd,id:userId},
					type:"post",
					success:function(data){
						console.log(data);
						if(data == "ok"){
							$(".error").hide();
							$(".ok").show();
							$("#pwdCheck").val(1);
						}else{
							$(".ok").hide();
							$(".error").show();
							$("#pwdCheck").val(0);
						}
					},
					error:function(jqxhr, textStatus,errorThrown){
						console.log("ajax 처리 실패");
					
					
					}
				});
			});
		});
		
         
         
         
         
         
         
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