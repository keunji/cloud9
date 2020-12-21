<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>lml_Follow</title>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
  
    <link rel="stylesheet" href="resources/css/final_Settings_address.css">
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>

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
                        <li class="minimenu put">
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
                <div class="rContent" id="rContent">
                        <div class="friends">
                        </div>
                        <div class="change_address">
                            <!-- <button>FALLOWER</button>
                            <button>FALOWOO</button>
                            <button>BLOCK FRIENDS</button> -->
                            <ul class="tags">
                            	<c:url var="followerList" value="Settings5.do">
									<c:param name="uNum" value="${ loginUser.user_num }"/>
								</c:url>
                                <c:url var="followList" value="Settings5_woo.do">
									<c:param name="uNum" value="${ loginUser.user_num }"/>
								</c:url>
                                <c:url var="blockList" value="Settings5_block.do">
									<c:param name="uNum" value="${ loginUser.user_num }"/>
								</c:url>
								
								<li><a id="add_wer" href="${followerList }">팔로워</a></li><br><br>
								<li><a id="add_woo" href="${followList }">팔로우</a></li><br><br>
                                <li><a id="add_block" href="${blockList }">차단</a></li>
                            </ul>
                        </div>
                   
                <div id="address_block" class="address">
                    <!-- 차단친구 -->
                    	<c:if test="${ !empty BlockList }">
							<c:forEach var="bl" items="${ BlockList }">
	                       		<table class="add_table">
		                            <tr>
		                                <td class="imgtd" rowspan="2" style="width: 10%;"><img class="userimg" src="resources/images/profileImg/${bl.rename_profile_img }" alt="#"></td>
		                                <td class="idtd" style="width: 30%;">${bl.id }</td>
		                                <td class="btntd" rowspan="2" style="width: 30%;"><input class="button3" type="button" value="차단" id="${bl.to_follow }" name="button3" onclick="blockBtn(this.name, this.id);"></td>
		                            </tr>
		                            <tr>
		                                <td>${bl.uname }</td>
		                            </tr>
		                        </table>
	                       </c:forEach>
						</c:if>
						<c:if test="${ empty BlockList }">
							<table class="add_table">
			                    <tr>
			                        <td class="imgtd" rowspan="2" style="width: 10%;"></td>
			                        <td class="idtd" style="width: 30%;">차단한 사람 없음</td>
			                        <td class="btntd" rowspan="2" style="width: 30%;"></td>
			                    </tr>
			                    <tr>
			                        <td></td>
			                    </tr>
		                	</table>
						</c:if>
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

	<script>
	
	function blockBtn(name, id){
		
		if(name == 'button3'){	// 차단
			
			var followQ = confirm('차단 해제하시겠습니까?');
			
			if(followQ){
				
				console.log('block 차단 해제');
				
				var toFollow = id;	// 차단 해제 할 상대
				var fromFollow = '<c:out value="${loginUser.user_num}"/>';	// 본인
				
				console.log("Un - to : " + toFollow + " / from : " + fromFollow);
				
				$.ajax({
					url:"unblockBtn.do",
					data:{toFollow:toFollow, fromFollow:fromFollow},
					type:"post",
					success:function(data){
						if(data == "success"){
							$('#'+id).prop('class','button4');
							$('#'+id).prop('name','button4');
						}else{
							alert("실패");
						}
					},
					error:function(jqxhr, textStatus,errorThrown){
						console.log("ajax 처리 실패");
					}
				});
				
			}else{}
			
		}else if(name == 'button4'){	// 차단
			
			var followQ = confirm('차단 하시겠습니까?');
			
			if(followQ){
				
				var toFollow = id;	// 차단 할 상대
				var fromFollow = '<c:out value="${loginUser.user_num}"/>';	// 본인
				
				$.ajax({
					url:"blockBtn.do",
					data:{toFollow:toFollow, fromFollow:fromFollow},
					type:"post",
					success:function(data){
						if(data == "success"){
							$('#'+id).prop('class','button3');
							$('#'+id).prop('name','button3');
						}else{
							alert("실패");
						}
					},
					error:function(jqxhr, textStatus,errorThrown){
						console.log("ajax 처리 실패");
					}
				});
			}else{}
			
		}
	}

        </script>


      
</body>
</html>