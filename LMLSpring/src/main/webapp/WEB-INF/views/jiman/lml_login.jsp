<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>로그인 / 회원가입 폼 템플릿</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="resources/css/jmCSS/final_login.css">
</head>
<body>


	<%
		String clientId = "xdLgSJ5mS0zQ1kf7UqKd";//애플리케이션 클라이언트 아이디값";
	String redirectURI = URLEncoder.encode("http://localhost:9090/lml/nLogin.do", "UTF-8");
	SecureRandom random = new SecureRandom();
	String state = new BigInteger(130, random).toString();
	String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	apiURL += "&client_id=" + clientId;
	apiURL += "&redirect_uri=" + redirectURI;
	apiURL += "&state=" + state;
	session.setAttribute("state", state);
	%>

	<!-- ------------------이용약관 동의 팝업-------------------- -->
	<div class="myModal" id="myModal" style="display: none;">
		<div class="board-detail" id="board-detail" style="display: none;">
			<!-- <form action="" id="joinForm"> -->
			<ul class="join_box">
				<li class="checkBox check01">
					<ul class="clearfix">
						<li>이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택), 프로모션 안내 메일 수신(선택)에 모두
							동의합니다.</li>
						<li class="checkAllBtn"><input type="checkbox" name="chkAll"
							id="chkAll" class="chk"></li>
					</ul>
				</li>
				<li class="checkBox check02">
					<ul class="clearfix">
						<li>이용약관 동의(필수)</li>
						<li class="checkBtn"><input type="checkbox" class="chk"
							id="requebtn1"></li>
					</ul> <textarea name="" id="">여러분을 환영합니다.
	LML서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 LML 서비스의 이용과 관련하여 LML 서비스를 제공하는 LML 주식회사(이하 ‘LML’)와 이를 이용하는 LML 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 LML 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
				</li>
				<li class="checkBox check03">
					<ul class="clearfix">
						<li>개인정보 수집 및 이용에 대한 안내(필수)</li>
						<li class="checkBtn"><input type="checkbox" class="chk"
							id="requebtn2"></li>
					</ul> <textarea name="" id="">여러분을 환영합니다.
LML 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 LML 서비스의 이용과 관련하여 LML 서비스를 제공하는 LML 주식회사(이하 ‘LML’)와 이를 이용하는 LML 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 LML 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
				</li>
				<li class="checkBox check03">
					<ul class="clearfix">
						<li>위치정보 이용약관 동의(선택)</li>
						<li class="checkBtn"><input type="checkbox" class="chk">
						</li>
					</ul> <textarea name="" id="">여러분을 환영합니다.
LML 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 LML 서비스의 이용과 관련하여 LML 서비스를 제공하는 LML 주식회사(이하 ‘LML’)와 이를 이용하는 LML 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 LML 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
				</li>
				<li class="checkBox check04">
					<ul class="clearfix">
						<li>이벤트 등 프로모션 알림 메일 수신(선택)</li>
						<li class="checkBtn"><input type="checkbox" class="chk">
						</li>
					</ul>

				</li>
			</ul>
			<ul class="footBtwrap clearfix">
				<li><button class="disagree_btn" onclick="bye();">비동의</button></li>
				<li><button class="agree_btn">동의</button></li>
			</ul>
			<!--         </form> -->



		</div>
	</div>
	<!-- ----------------------여기까지 팝업 -------------------------->
	<div class="wrap">
		<div class="form-wrap">
			<div class="button-wrap">
				<div id="btn"></div>
				<button type="button" class="togglebtn" onclick="login()">LOGIN</button>
				<button type="button" class="togglebtn" onclick="register()">REGISTER</button>
			</div>
			
			<form id="login" action="mLogin.do" class="input-group" method="post">
				<input id="inID" name="id" type="text" class="input-field"	placeholder="User id" required> 
					<input  name="upwd"	type="password" class="input-field" placeholder="Enter Password" required> <input id="inCH" type="checkbox" class="checkbox"><span>Remember ID</span>
				<button class="submit">Login</button>
				<div class="social-icons">
				<a href="<%=apiURL%>"><img height="50"
				src="http://static.nid.naver.com/oauth/small_g_in.PNG" /></a>
				<a href="find_idPw.do" id="searchinfo">아이디/비밀번호찾기</a>	
			</div>
			
			</form>
			
			<form id="register" action="mInsert.do" class="input-group">
				<!-- 아이디 중복 체크  -->
				<input name="id" type="text" id="userId" class="input-field"
					placeholder="User id" required> <span class="guide ok">사용가능</span>
				<span class="guide error">사용불가능</span> <input type="hidden"
					name="idDuplicateCheck" id="idDuplicateCheck" value="0">
				<!-- 아이디 중복 체크 끝 -->

				<input name="uname" id="inputname" type="text" class="input-field"
					placeholder="Nickname" required> <span class="guides oks">사용가능</span>
				<span class="guides errors">사용불가능</span> <input type="hidden"
					name="nameDuplicateCheck" id="nameDuplicateCheck" value="0">

				<input name="mail" id="inputemail" type="email" class="input-field"
					placeholder="Your Email" required> <input name="upwd"
					id="inputpwd" type="password" class="input-field"
					placeholder="Enter Password (문자+숫자+특수문자)" required> <input
					name="m_phone" type="text" class="input-field"
					placeholder="phone" required> <input name="height"
					id="inheight" type="number" class="input-field" placeholder="hight"
					required style="width: 100px;">cm &nbsp; &nbsp; <input
					name="weight" id="inweight" type="number" class="input-field"
					placeholder="weight" required style="width: 100px;">kg <br>
				<div class="radio_gender">
					<input type="radio" name="gender" class="radio" value="M">male
					&nbsp; <input type="radio" name="gender" class="radio" value="F">female
					<br>
				</div>
				<div class="Register">
					<input type="checkbox" id="termsbtn" class="checkbox" disabled>
					<span><button type="button" style="text-decoration: underline;background: none;border: none;" id="agree">Terms and conditions</button></span>
				</div>
				<button class="submit" onclick="return validate();">REGISTER</button>
			</form>
		</div>
	</div>
	<script>
		//아이디 기억하기
		$(document).ready(function () {//저장된 쿠키캆 가져와서 넣어줌
			  var key = getCookie("key");	
			$("#inID").val(key);
			
			if($("#inID").val() != ""){ //아이디 저장해서 페이지 로딩할때 
				$("#inCH").attr("checked",true); //ID저장하기 체크상태
			}
		
		
		$("#inCH").change(function(){
			if($("#inCH").is(":checked")){
				setCookie("key",$("#inID").val(),7); //쿠키7일 보관
			}else{
				deleteCookie("key");
			}
		});
		$("#inID").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#inCH").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            setCookie("key", $("#inID").val(), 7); // 7일 동안 쿠키 보관
	        }
	    });
	});
	
		function setCookie(cookieName,value,exdays){
			var exdate = new Date();
			exdate.setDate(exdate.getDate()+exdays);
			var cookieValue = escape(value)+((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
		    document.cookie = cookieName + "=" + cookieValue;
		}
		function deleteCookie(cookieName){
		    var expireDate = new Date();
		    expireDate.setDate(expireDate.getDate() - 1);
		    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}
		function getCookie(cookieName) {
		    cookieName = cookieName + '=';
		    var cookieData = document.cookie;
		    var start = cookieData.indexOf(cookieName);
		    var cookieValue = '';
		    if(start != -1){
		        start += cookieName.length;
		        var end = cookieData.indexOf(';', start);
		        if(end == -1)end = cookieData.length;
		        cookieValue = cookieData.substring(start, end);
		    }
		    return unescape(cookieValue);
		}
		
		
	
	
	
	
	
	
		/*=========================모달======================*/
		/* 모달팝업 디테일 */
		var modal = document.getElementById('myModal');
		var detail = document.getElementById('board-detail');
		/* var content = document.getElementById('conte'); */

		$('#Register,#agree ').click(function() {
			$('.myModal').css('display', 'block');
			$('.board-detail').css('display', 'block');
		});

		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
				detail.style.display = "none";
			}
		}
		/*모달 체크박스 전체선택 */
		
		function bye(){
			$('#termsbtn').prop('checked',false);
			$('#termsbtn').prop('disabled',true);
			$('.chk').prop('checked',false);
			modal.style.display = "none";
			detail.style.display = "none";

		}
		//모두 체크 
		$('#chkAll').click(function(){
			$('.chk').prop('checked', this.checked );
		});
	
	
		
		//동의버튼 눌렀을 경우 체크박스 체크,활성화 false
		
		$('.agree_btn').click(function(){
			if($('#requebtn1').is(":checked")==false){
				alert('필수 항목을 체크해주세요');
				
			}else if($('#requebtn2').is(":checked")==false){
				alert('필수 항목을 체크해주세요');
			
			}
			else{
			$('#termsbtn').prop('checked',true);
			$('#termsbtn').prop('disabled',false);
			modal.style.display = "none";
			detail.style.display = "none";
	
			
			
		}
			
		});
		
		//해제했을때 ㄴ
		$('#termsbtn').click(function(){
			$('#termsbtn').attr('disabled',true);

			$('.chk').prop('checked',false);
			
	
			
			
		}
			
		);
		
		
		
		
		
	
		//화면 전환!!
		var x = document.getElementById("login");
		var y = document.getElementById("register");
		var z = document.getElementById("btn");

		function login() {
			x.style.left = "50px";
			y.style.left = "450px";
			z.style.left = "0";
		}

		function register() {
			x.style.left = "-400px";
			y.style.left = "50px";
			z.style.left = "110px";
		}

		function validate() {
			// 중복체크 여부,유효성검사

			if ($("#termsbtn").prop("checked") == true) {

				//비밀번호 유효성 검사
				var pw = $("#inputpwd").val();
				var id = $("#userId").val();
				var checkNumber = pw.search(/[0-9]/g);
				var checkEnglish = pw.search(/[a-z]/ig);

				if (!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/
						.test(pw)) {
					alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
					return false;
				} else if (checkNumber < 0 || checkEnglish < 0) {
					alert("숫자와 영문자를 혼용하여야 합니다.");
					return false;
				} else if (/(\w)\1\1\1/.test(pw)) {
					alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
					return false;
				} else if (pw.search(id) > -1) {
					alert("비밀번호에 아이디가 포함되었습니다.");
					return false;
				} else {
					console.log("비밀번호 ok")
				}

				//아이디 중복 검사
				if ($("#idDuplicateCheck").val() == 0) {
					alert("사용가능한 아이디를 입력해주세요");
					$("#userId").focus();
					return false;
				}
				//이름 중복 검사 
				if ($("#nameDuplicateCheck").val() == 0) {
					alert("사용가능한 이름을 입력해주세요");
					$("#inputname").focus();
					return false;
				}
				//키 유효성
				if ($("#inheight").val() < 50 || $("#inheight").val() > 300) {
					alert("키는 50이상 300이하여야 합니다.");
					return false;
				}
				//몸무게 유효성
				if ($("#inweight").val() < 30) {
					alert("30kg이상의 값을 입력해주세요.");
					return false;
				}

				//if($("input:radio[name='gender']").is(":checked")== true){
				if ($(".radio").is(":checked") == false) {
					alert("성별을 체크해주세요.");
					return false;
				}

				return true;

			} else {
				
				alert('이용약관에 동의해주세요');
				return false;
			}

		}

		$(function() {
			$("#userId").on("keyup", function() {
				
				var userId = $(this).val();

				if (userId.length < 2) {
					$(".guide").hide();
					$("#idDuplicateCheck").val(0);
					return;
				}

				$.ajax({
					url : "idCheck.do",
					data : {
						id : userId
					},
					type : "post",
					success : function(data) {
						console.log(data);
						if (data == "ok") {
							$(".error").hide();
							$(".ok").show();
							$("#idDuplicateCheck").val(1);
						} else {
							$(".ok").hide();
							$(".error").show();
							$("#idDuplicateCheck").val(0);
						}
					},
					error : function(jqxhr, textStatus, errorThrown) {
						
						//에러 로그

					}
				});
			});
		});

		//닉네임 중복 체크 여부
		$(function() {
			$("#inputname").on("keyup", function() {
				
				var userName = $("#inputname").val();

				if (userName.length < 2) {
					$(".guides").hide();
					$("#nameDuplicateCheck").val(0);
					return;
				}

				$.ajax({
					url : "nameCheck.do",
					data : {
						name : userName
					},
					type : "post",
					success : function(data) {
						console.log(data);
						if (data == "ok") {
							$(".errors").hide();
							$(".oks").show();
							$("#nameDuplicateCheck").val(1);
						} else {
							$(".oks").hide();
							$(".errors").show();
							$("#nameDuplicateCheck").val(0);
						}
					},
					error : function(jqxhr, textStatus, errorThrown) {
						console.log("ajax 처리 실패");
						//에러 로그

					}
				});
			});
		});
		
		
	</script>
</body>
</html>
