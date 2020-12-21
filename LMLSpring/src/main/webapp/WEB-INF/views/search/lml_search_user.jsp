<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 더보기(사용자)</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/final_search_user.css">
</head>
<body>
	<jsp:include page="../common/header.jsp"/>

    <section>
        <div class="upBtn">
            <img src="resources/images/icon/main/arrow.png">
        </div>
        <div class="userSection">
            <div class="userInfo">
                <div class="suser">
                    사용자
                </div>
                <div class="suserMore">
                    ${userCount}
                </div>
            </div>
            <div class="userTable">
                  <table>
                	<c:if test="${ !empty searchUser }">
                		<c:set var="i" value="0"/>
                		<c:forEach var="sUser" items="${searchUser}" varStatus="status">
                			<c:if test="${status.index mod 2 eq 0}">
                			<tr>
                			</c:if>
	                				<c:if test="${ !empty sUser }">
		                				<td>
		                					<c:set var="uNum" value="${sUser.user_num }"/>
						                    <div class="infoDiv" >
						                        <div class="uImg" onclick="infoPage('${sUser.id}');">
						                            <img src="resources/images/profileImg/${sUser.rename_profile_img}">
						                        </div>
						                        <div class="uName" onclick="infoPage('${sUser.id}');">
						                            <div class="uid">${sUser.id}</div>
						                            <div class="uname">${sUser.uname}</div>
						                        </div>
						                        <c:if test="${ !empty loginUser.id && loginUser.user_num != sUser.user_num}">
							                        <div class="follow" id="${sUser.user_num }">
							                            <div>팔로우</div>
							                        </div>
							                    </c:if>
						                    </div>
						                </td>
		                			
	                				</c:if>
								<c:if test="${status.index mod 2 eq 1}">
                				</tr>
                				</c:if>
                		</c:forEach>
					</c:if>
					<c:if test="${ empty searchUser }">
						<br>&nbsp;&nbsp;&nbsp;&nbsp;검색 결과가 없습니다
					</c:if>
                </table>
            </div>
        </div>
    </section>
    
    <jsp:include page="../common/footer.jsp"/>
    
    <script>
    
    
    function infoPage(id){
    	
    	console.log('id:'+ id);
    	//console.log("MyPage.do?uNum="+uNum);
    	location.href="userPage.do?p=1&id="+id;
    	
    	
    	
    	
    }
    
    
    
        /* 맨 위로 가는 버튼 */
        $( document ).ready( function() {
            $('.upBtn').hide();
            $( window ).scroll( function() {
                if ( $( this ).scrollTop() > 200 ) {
                    $( '.upBtn' ).fadeIn();
                } else {
                    $( '.upBtn' ).fadeOut();
                }
            } );
            $( '.upBtn' ).click( function() {
                $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
                return false;
            } );
        } );

        //스크롤 바닥 감지
        window.onscroll = function (e) {
            var td = '<td>' +
                        '<div class="infoDiv">' +
                            '<div class="uImg">' +
                                '<img src="resources/images/mainImg/palien.png">' +
                            '</div>' +
                            '<div class="uName">' +
                                '<div class="uid">@iambuzz</div>' +
                                '<div class="uname">강버즈</div>' +
                            '</div>' +
                            '<div class="follow">' +
                                '<div>팔로우</div>' +
                            '</div>' +
                        '</div>' +
                    '</td>';

            //추가되는 콘텐츠
            //window height + window scrollY 값이 document height보다 클 경우,
            if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
            //실행할 로직 (콘텐츠 추가)

            var addContent = '<tr>' + td + td + '</tr>' + '<tr>' + td + td + '</tr>' + '<tr>' + td + td + '</tr>' + '<tr>' + td + td + '</tr>';

                //article에 추가되는 콘텐츠를 append
                $('#table').append(addContent);
            }
        };
 $(document).ready(function(){
        	
        	var uNum = 0${loginUser.user_num};
        	
        
        });
        
        $(".follow").click(function(e){
        	
        	var followQ = confirm('팔로우 하시겠습니까?');
        	
        	if(followQ){
	            var to_follow = $(this).attr('id');
	    
	            var from_follow = Number(${loginUser.user_num});
	            console.log(to_follow);
	            console.log(from_follow);
	            
	            $.ajax({
					url:"followBtn.do",
					data:{toFollow:to_follow, fromFollow:from_follow},
					type:"post",
					success:function(data){
						if(data == "success"){
							$("#"+to_follow).hide();
						}else{
							alert("실패");
						}
					},
					error:function(jqxhr, textStatus,errorThrown){
						console.log("ajax 유저 쁠쁠 처리 실패");
					}
				});
        	}else{
        		
        	}
        });
        
        
        
        
        
    </script>


</body>
</html>