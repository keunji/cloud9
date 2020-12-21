<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>아이디/비밀번호찾기</title>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<link
		href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap"
		rel="stylesheet">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
	<!-- <link rel="stylesheet" href="./css/final_main.css"> -->
	<link rel="stylesheet" href="resources/css/minwoo/idPwFind.css">
</head>

<body>
<jsp:include page="../common/header.jsp" />
	<section>
		<div class="ctable">
			<div id="mainbox">
				<div id="selectbox">
					<div id="idbutton" class="idpwbutton">아이디 찾기</div>
					<div id="pwbutton" class="idpwbutton">비밀번호 찾기</div>
				</div>
				<div id="idwindow">
					<div id="findtitlename">아이디 찾기</div>

					<div id="findPhonenumberBtn" class="findbutton">
						이름,핸드폰번호로 찾기 <img class="nextimg" src="resources/images/minwoo/next-1.png"></img>
					</div>
					<div id="findEmailBtn" class="findbutton">
						이름,이메일로 찾기 <img class="nextimg" src="resources/images/minwoo/next-1.png"></img>
					</div>
				</div>
				<div id="findPhonenumberWindow" class="hidden">
					<!--이름,핸드폰번호로 찾기-->
					<div id="findtitlename">이름,핸드폰번호로 찾기</div>
					<form method="POST" action="findIdPhone.do" class="findcenter">
						<p>이름 :</p>
						<input id="findName" name="findname" placeholder="이름을 입력해주세요." type="text"
							required><br>

						<p>핸드폰 번호 :</p>
						<input id="findPhonenumber" name="findphone"  placeholder="핸드폰 번호를 입력해주세요."
							type="text" required><br> <input id="submit"
							type="submit" value="확인">
					</form>
				</div>
				<div id="findEmailWindow" class="hidden">
					<!--이름,이메일로 찾기-->
					<div id="findtitlename">이름,이메일로 찾기</div>
					<form method="POST" action="findIdEmail.do" class="findcenter">
						<p>이름 :</p>
						<input id="findName" name="findName" placeholder="이름을 입력해주세요." type="text"
							required><br>

						<p>이메일 주소 :</p>
						<input id="findEmail" name="findEmail"  placeholder="이메일을 입력해주세요." type="text"
							required><br> <input id="submit" type="submit"
							value="확인">
					</form>
				</div>




				<div id="pwdwindow" class="hidden">
					<div id="findtitlename">비밀번호 찾기</div>

					<div id="findpwEmailBtn" class="findbutton">
						아이디,이메일로 찾기 <img class="nextimg" src="resources/images/minwoo/next-1.png"></img>
					</div>
				</div>
				
				<div id="findPwIdEmailWindow" class="hidden">
					<!--아이디,이메일로 찾기-->
					<div id="findtitlename">아이디,이메일로 찾기</div>
					<form method="POST" action="findPwEmail.do" class="findcenter">
						<p>아이디 :</p>
						<input id="findID" name="findID" placeholder="아이디를 입력해주세요." type="text"
							required><br>

						<p>이메일 주소 :</p>
						<input id="findEmail" name="findEmail"  placeholder="이메일을 입력해주세요." type="text"
							required><br> <input id="submit" type="submit"
							value="확인">
					</form>
				</div>
				
			</div>
		</div>

		<script>
                const idbutton = document.getElementById("idbutton");
                const pwbutton = document.getElementById("pwbutton");
                const idwindow = document.getElementById("idwindow");
                
                const pwdwindow = document.getElementById("pwdwindow");
                const findPhonenumberBtn = document.getElementById("findPhonenumberBtn");
                const findPhonenumberWindow = document.getElementById("findPhonenumberWindow");
                const findEmailBtn = document.getElementById("findEmailBtn");
                const findEmailWindow = document.getElementById("findEmailWindow");
                
                const findpwEmailBtn = document.getElementById("findpwEmailBtn");
                const findPwIdEmailWindow = document.getElementById("findPwIdEmailWindow");
                

                function idwindowfunc(){
                    idwindow.classList.remove("hidden");
                    pwdwindow.classList.add("hidden");
                    findPhonenumberWindow.classList.add("hidden");
                    findEmailWindow.classList.add("hidden");
                    findPwIdEmailWindow.classList.add("hidden");
                }
                function pwdwindowfunc(){
                    idwindow.classList.add("hidden");
                    pwdwindow.classList.remove("hidden");
                    findPhonenumberWindow.classList.add("hidden");
                    findEmailWindow.classList.add("hidden");
                    findPwIdEmailWindow.classList.add("hidden");
                }
                function findPhonenumberWindowfunc(){
                    findPhonenumberWindow.classList.remove("hidden");
                    idwindow.classList.add("hidden");
                    
                }
                function findEmailWindowfunc(){
                    findEmailWindow.classList.remove("hidden");
                    idwindow.classList.add("hidden");
                    
                }
                function findpwEmailBtnfunc(){
                	findPwIdEmailWindow.classList.remove("hidden");
                	pwdwindow.classList.add("hidden");
                }
                idbutton.addEventListener("click",idwindowfunc);
                pwbutton.addEventListener("click",pwdwindowfunc);
                findPhonenumberBtn.addEventListener("click",findPhonenumberWindowfunc);
                findEmailBtn.addEventListener("click",findEmailWindowfunc);
                
                findpwEmailBtn.addEventListener("click",findpwEmailBtnfunc);
            </script>
	</section>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>