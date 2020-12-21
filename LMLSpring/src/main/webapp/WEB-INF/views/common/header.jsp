<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<head>
	<meta charset="UTF-8">
	<title>헤더</title>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/final_main.css">
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    



<!-- 여기 채팅 겁난다 -->
<script src="http://52.79.234.164:3001/socket.io/socket.io.js"></script>
<script>
var socket;
$(document).ready(function () {
	socket = io("http://52.79.234.164:3001");
	
});
</script>
    
</head>
	<header>
        <div class="hTitle">
            <div class="nav1">
                <div class="hTitle1"><a href='Index.do'><img src="resources/images/logo/logo_medium.png" class="titleImg"/></a></div>
                <div class="hTitle1">
                    <form action="Search.do?" autocomplete="off">
                        <fieldset class="sUrl">
                            <input class="searchInput" type="text" name="keyword" required placeholder=" 검색" >
                            <!-- onKeyPress="if( event.keyCode==13 ){search();}" -->
                            <div class="sAfter"></div>
                        </fieldset>
                    </form>
                </div>
                <div class="hTitle1">
                    <div class="htMenu">
                 
                    	<c:if test="${ !empty sessionScope.loginUser }">
                        <div class="myMenu">
                            <img src="resources/images/icon/menu/iconmonstr-menu-thin-72.png"><!-- 이미지 클릭 시 서브메뉴 나옴 -->
                            <ul class="mySub">
	                            <c:url var="mypage" value="MyPage.do?page=1">
									<c:param name="uNum" value="${ loginUser.user_num }"/>
								</c:url>
                                <a href='${mypage}'><li><div class="mySub1">마이페이지</div></li></a>
                                <a href='Settings.do'><li><div class="mySub1">설정</div></li></a>
                                
                                <a href="logout.do"><li><div class="mySub1">로그아웃</div></li></a>
                            </ul>
                        </div><!--메뉴-->
                        <div class="heart"><img src="./resources/images/icon/menu/iconmonstr-heart-thin-72.png" class="heart heartIcon"></div><!--알림-->
                        <div><a href="Message.do?id=${ loginUser.id}"><img src="./resources/images/icon/menu/iconmonstr-speech-bubble-thin-72.png"></a><p class="messageAlarm" hidden="hidden">0</p></div><!--채팅-->
                        <script>
                        $(document).ready(function () {
			var id= "${loginUser.id}";
			
			
			$.ajax({
				url : "chatLogin.do",
				data : {id : id},
				type : "post",
				success : function(data) {
					
					console.log(data);
					for(var i = 0;i<data.length;i++){
					socket.emit("login",id,data[i].chatroomid);
					}
					
					
				},
				error : function(jqxhr, textStatus, errorThrown) {
					console.log("ajax 오류");

				}
				});
			
			
			
			
			$.ajax({
				url : "alalarm.do",
				data : {id : id},
				type : "post",
				success : function(data) {
					
					console.log(data);
					if(Number(data)==0){
						$('.messageAlarm').attr("hidden","hidden");
						$('.messageAlarm').html(Number(data));
					}else{
						$('.messageAlarm').removeAttr("hidden");
						$('.messageAlarm').html(Number(data));
					}
					
					
					
				},
				error : function(jqxhr, textStatus, errorThrown) {
					console.log("ajax 오류");

				}
				});
			
			
			socket.on('hi',function(room,name,msg){
				console.log('hi?');
				 var id= "${loginUser.id}";
				 $.ajax({
    					url : "alalarm.do",
    					data : {id : id},
    					type : "post",
    					success : function(data) {
    						
    						console.log(data);
    						if(Number(data)==0){
    							$('.messageAlarm').attr("hidden","hidden");
    							$('.messageAlarm').html(Number(data));
    						}else{
    							$('.messageAlarm').removeAttr("hidden");
    							$('.messageAlarm').html(Number(data));
    						}
    						
    					},
    					error : function(jqxhr, textStatus, errorThrown) {
    						console.log("ajax 오류");

    					}
    					});
				 
				 
				 
				 
				 
				 
			 });
			
			
});
                        
                        </script>  
                        
                        
                        </c:if>
                        
						<c:if test="${ empty sessionScope.loginUser }">
                        	<a href="login.do"><div class="loginBtn">로그인/가입</div></a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <div class="hMenu">
            <div class="hMenu1">
                <div class="hMenu2"><a href="likepost.do"><span>인기순</span></a></div>
                <div class="hMenu2 on"><a href="Index.do"><span>최신순</span></a></div>
               <c:if test="${ !empty sessionScope.loginUser }">
                <div class="hMenu2"><a href="followingpost.do"><span>팔로잉</span></a></div>
                </c:if>
                <div class="hMenu2"><a href="qnaPage.do"><span>QnA</span></a></div>
                <span></span>
            </div>
        </div>
    </header>
    
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
	            	$(".hMenu").css("top", "60px");
	        	}
	        	lastScrollTop = st;
	    	});
		});
		
	   

	    $(document).ready(function(){
            $('.hMenu2').on('click', function(){
                $(this).addClass('on');
                $(this).siblings().removeClass('on');
                console.log("dd?");
            });
            
            $(".hMenu").css("top", "60px");
            $(function(){
    	        var pageName = "";
    	     
    	        var tempPageName = window.location.href;
    	        var strPageName = tempPageName.split("/");
    	        pageName = strPageName[strPageName.length-1].split("?")[0];
    	        
    	        if(pageName=="likepost.do"){
    /* 	        	$('.hMenu2').eq(0).siblings().removeClass('on');
    	        	$('.hMenu2').eq(0).addClass('on');
     */	        	
     $('.hMenu2').eq(0).trigger("click");
     
     console.log('?');
    	        }else if(pageName=="Index.do"){
    	        /* 	$('.hMenu2').eq(1).siblings().removeClass('on');
    	        	$('.hMenu2').eq(1).addClass('on'); */
    	        	 $('.hMenu2').eq(1).trigger("click");
    	        	console.log(1);
    	        }else if(pageName=="followingpost.do"){
    	        	/* $('.hMenu2').eq(2).siblings().removeClass('on');
    	        	$('.hMenu2').eq(2).addClass('on'); */
    	        	 $('.hMenu2').eq(2).trigger("click");
    	        	console.log(2);
    	        }else if(pageName=="qnaPage.do"){
    	        	/* $('.hMenu2').eq(3).siblings().removeClass('on');
    	        	$('.hMenu2').eq(3).addClass('on'); */
    	        	 $('.hMenu2').eq(3).trigger("click");
    	        	console.log(3);
    	        }
    	        
    	        
    	        
    	      console.log(pageName);
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


        /* 알림 아이콘 클릭 시 아이콘 변경 */
        $(".heart").click(function(){
            $('.heartIcon').attr('src','resources/images/icon/menu/iconmonstr-favorite-3-72.png');
        });

        // 다른곳 클릭하면 하트 원래대로
        $("body").click(function(e){
            if(!$(".heart").has(e.target).length){
                $('.heartIcon').attr('src','resources/images/icon/menu/iconmonstr-heart-thin-72.png');
            }
        });
        
        // 검색 페이지 이동
        function search(){
            location.href="Search.do";
        };
    </script>
