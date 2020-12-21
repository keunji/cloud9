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
                    
                    <div id="address_woo" class="address">
	                    <!-- 팔로우친구 -->
	                    <c:if test="${ !empty FollowList }">
							<c:forEach var="f" items="${ FollowList }">
							<c:set var="fromFollow" value="${f.from_follow}"/>
		                    	<table class="add_table">
			                         <tr>
			                             <td class="imgtd" rowspan="2" style="width: 10%;"><img class="userimg" src="resources/images/profileImg/${f.rename_profile_img }" alt="#"></td>
			                             <td class="idtd" style="width: 30%;">${f.id }</td>
			                             <td class="btntd" rowspan="2" style="width: 30%;"><input class="button1" id="${f.to_follow }" type="button" value="팔로잉" name="button1" onclick="followBtn(this.name, this.id);"></td>
			                         </tr>
			                         <tr>
			                             <td>${f.uname }</td>
			                         </tr>
			                     </table>
		                    </c:forEach>
						</c:if>
						<c:if test="${ empty FollowList }">
							<table class="add_table">
				                  <tr>
				                      <td class="imgtd" rowspan="2" style="width: 10%;"></td>
				                      <td class="idtd" style="width: 30%;">다른 사람을 팔로우 해보셔</td>
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
		function followBtn(name, id){
			
			if(name == 'button1'){	// 언팔로우
				
				var followQ = confirm('언팔로우 하시겠습니까?');
				
				if(followQ){
					
					console.log('woo 언팔');
					
					var toUnFollow = id;	// 팔로우 취소 할 상대
					var fromFollow = '<c:out value="${fromFollow}"/>';	// 본인
					
					console.log("Un - to : " + toUnFollow + " / from : " + fromFollow);
					
					$.ajax({
						url:"unfollowBtn.do",
						data:{toUnFollow:toUnFollow, fromFollow:fromFollow},
						type:"post",
						success:function(data){
							if(data == "success"){
								$('#'+id).prop('class','button2');
								$('#'+id).prop('name','button2');
								$('#'+id).prop('value','팔로우');
							}else{
								alert("실패");
							}
						},
						error:function(jqxhr, textStatus,errorThrown){
							console.log("ajax 처리 실패");
						}
					});
					
				}else{	alert('언팔 불가능');	}
				
			}else if(name == 'button2'){	// 팔로우
				
				var followQ = confirm('팔로우 하시겠습니까?');
				
				if(followQ){
					
					var toFollow = id;	// 팔로우 할 상대
					var fromFollow = '<c:out value="${fromFollow}"/>';	// 본인
					
					$.ajax({
						url:"followBtn.do",
						data:{toFollow:toFollow, fromFollow:fromFollow},
						type:"post",
						success:function(data){
							if(data == "success"){
								$('#'+id).prop('class','button1');
								$('#'+id).prop('name','button1');
								$('#'+id).prop('value','팔로잉');
							}else{
								alert("실패");
							}
						},
						error:function(jqxhr, textStatus,errorThrown){
							console.log("ajax 처리 실패");
						}
					});
				}else{	alert('팔로우 불가능');	}
				
			}else if(name == 'button3'){
				console.log('차단' + name);
			}
		}
     
      
	      // button2 팔로우 버튼 눌렀을 때
	      /* $(document).ready(function(){
		  	$('.button2',this).click(function(){
			
		  	console.log("회원 : " + $(this).prop('id') + " / 버튼 : " + $(this).prop('value'));
			var id = $(this).prop('id');
			
			if($('#'+id).prop('value') == "팔로우"){
				var followQ = confirm('팔로우 하시겠습니까?');
				console.log('안녕하세오 혹시 팔로우입니까?');
				if(followQ){
					var toFollow = $(this).prop('id');	// 팔로우 할 상대
					var fromFollow = '<c:out value="${fromFollow}"/>';	// 본인
					
					
					$.ajax({
						url:"followBtn.do",
						data:{toFollow:toFollow, fromFollow:fromFollow},
						type:"post",
						success:function(data){
							if(data == "success"){
								getFollowList();
								$('#'+toFollow).prop('class','button1');
								$('#'+toFollow).prop('value','팔로잉');
								//$('.address table').remove();
							}else{
								alert("실패");
							}
						},
						error:function(jqxhr, textStatus,errorThrown){
							console.log("ajax 처리 실패");
						}
					});
					
					function getFollowList(){
			        	var uNum = toFollow;
			        	
			        	$.ajax({
			        		url:"fSelectUser.do",
			        		data:{uNum:uNum},
			        		dataType:"json",
			        		success:function(data){
			        			if(data.id.length > 0){
			        				$("#address_woo").append('<table class="add_table">' +
										                         '<tr>' +
									                             '<td class="imgtd" rowspan="2" style="width: 10%;"><img class="userimg" src="resources/images/jmImg/'+data.profile_img+'" alt="#"></td>'+
									                             '<td class="idtd" style="width: 30%;">'+data.id+'</td>'+
									                             '<td class="btntd" rowspan="2" style="width: 30%;"><input class="button1" type="button" value="팔로잉"></td>'+
									                         '</tr>'+
									                         '<tr>'+
									                             '<td>'+data.uname+'</td>'+
									                         '</tr>'+
									                     '</table>');
			        			}else{
									alert("실패");
								}
							},
							error:function(request,status,errorData){
								console.log("user 처리 실패");
								console.log(request.status + ":" + errorData);
							}
			        	});
			        }
				}else{
					
				}
			}else{
				
			}
		}); 
		
		$('.button1',this).click(function(){
			
			console.log("회원 : " + $(this).attr('id') + " / 버튼 : " + $(this).attr('value'));
			var id = $(this).attr('id');
			if($('#'+id).prop('value') == "팔로잉"){
				console.log('안녕하세오 혹시 팔로잉입니까?');
				var unfollowQ = confirm('팔로우를 취소하시겠습니까?');
				
				if(unfollowQ){
					var toUnFollow = $(this).prop('id');	// 팔로우 취소 할 상대
					var fromFollow = '<c:out value="${fromFollow}"/>';	// 본인
					
					console.log("toUnFollow : " + toUnFollow);
					console.log("fromFollow : " + fromFollow);
					
					$.ajax({
						url:"unfollowBtn.do",
						data:{toUnFollow:toUnFollow, fromFollow:fromFollow},
						type:"post",
						success:function(data){
							if(data == "success"){
								$('#'+toUnFollow).prop('class','button2');
								$('#'+toUnFollow).prop('value','팔로우');
								$('#'+toUnFollow).click(button2);
								$('#'+toUnFollow).off('click').on('click', function(){
									button2();
								})
								//getFollowList();
							}else{
								alert("실패");
							}
						},
						error:function(jqxhr, textStatus,errorThrown){
							console.log("ajax 처리 실패");
						}
					});
					
					/* function getFollowList(){
			        	var uNum = toFollow;
			        	console.log("uNum : " + uNum);
			        	$.ajax({
			        		url:"fSelectUser.do",
			        		data:{uNum:uNum},
			        		dataType:"json",
			        		success:function(data){
			        			if(data.id.length > 0){
			        				$("#address_woo").append('<table class="add_table">' +
										                         '<tr>' +
									                             '<td class="imgtd" rowspan="2" style="width: 10%;"><img class="userimg" src="resources/images/jmImg/'+data.profile_img+'" alt="#"></td>'+
									                             '<td class="idtd" style="width: 30%;">'+data.id+'</td>'+
									                             '<td class="btntd" rowspan="2" style="width: 30%;"><input class="button1" type="button" value="팔로잉"></td>'+
									                         '</tr>'+
									                         '<tr>'+
									                             '<td>'+data.uname+'</td>'+
									                         '</tr>'+
									                     '</table>');
			        			}else{
									alert("실패");
								}
							},
							error:function(request,status,errorData){
								console.log("user 처리 실패");
								console.log(request.status + ":" + errorData);
							}
			        	});
			        } 
				}else{
					
				}
				
			}else{
				alert('언팔안됨');
			}
		});
	});
	      
       function button2(){
    	   
   			
   		  	console.log("회원 : " + $(this).prop('id') + " / 버튼 : " + $(this).prop('value'));
   			var id = $(this).prop('id');
   			
   			if($('#'+id).prop('value') == "팔로우"){
   				var followQ = confirm('팔로우 하시겠습니까?');
   				console.log('안녕하세오 혹시 팔로우입니까?');
   				if(followQ){
   					var toFollow = $(this).prop('id');	// 팔로우 할 상대
   					var fromFollow = '<c:out value="${fromFollow}"/>';	// 본인
   					
   					
   					$.ajax({
   						url:"followBtn.do",
   						data:{toFollow:toFollow, fromFollow:fromFollow},
   						type:"post",
   						success:function(data){
   							if(data == "success"){
   								getFollowList();
   								$('#'+toFollow).prop('class','button1');
   								$('#'+toFollow).prop('value','팔로잉');
   								$('#'+toFollow).click('value','팔로잉');
   								//$('.address table').remove();
   							}else{
   								alert("실패");
   							}
   						},
   						error:function(jqxhr, textStatus,errorThrown){
   							console.log("ajax 처리 실패");
   						}
   					});
   					
   					function getFollowList(){
   			        	var uNum = toFollow;
   			        	
   			        	$.ajax({
   			        		url:"fSelectUser.do",
   			        		data:{uNum:uNum},
   			        		dataType:"json",
   			        		success:function(data){
   			        			if(data.id.length > 0){
   			        				$("#address_woo").append('<table class="add_table">' +
   										                         '<tr>' +
   									                             '<td class="imgtd" rowspan="2" style="width: 10%;"><img class="userimg" src="resources/images/jmImg/'+data.profile_img+'" alt="#"></td>'+
   									                             '<td class="idtd" style="width: 30%;">'+data.id+'</td>'+
   									                             '<td class="btntd" rowspan="2" style="width: 30%;"><input class="button1" type="button" value="팔로잉"></td>'+
   									                         '</tr>'+
   									                         '<tr>'+
   									                             '<td>'+data.uname+'</td>'+
   									                         '</tr>'+
   									                     '</table>');
   			        			}else{
   									alert("실패");
   								}
   							},
   							error:function(request,status,errorData){
   								console.log("user 처리 실패");
   								console.log(request.status + ":" + errorData);
   							}
   			        	});
   			        }
   				}else{
   					
   				}
   			}else{
   				
   			}
   		
    	   
    	   
       } */
	      
	      
	      
        /* $(document).ready(function() {
	        $('#address').show(); //페이지를 로드할 때 표시할 요소
	        $('#address_woo').hide(); //페이지를 로드할 때 숨길 요소
	        $('#address_block').hide(); //페이지를 로드할 때 숨길 요소
	
	     
        });

        $('#add_woo').click(function(){
	        $ ('#address').hide(); //클릭 시 첫 번째 요소 숨김
	        $ ('#address_block').hide(); //클릭 시 세번째 요소 숨김
	        $ ('#address_woo').show(); //클릭 시 두 번째 요소 표시
	        return false;
        });
        
        $('#add_block').click(function(){
	        $ ('#address').hide(); //클릭 시 첫 번째 요소 숨김
	        $ ('#address_woo').hide(); //클릭 시 두 번째 요소 숨김
	        $ ('#address_block').show(); //클릭 시 세 번째 요소 표시
	        return false;
        });
        
        $('#add_wer').click(function(){
	        $ ('#address_woo').hide(); //클릭 시 첫 번째 요소 숨김
	        $ ('#address_block').hide(); //클릭 시 두 번째 요소 숨김
	        $ ('#address').show(); //클릭 시 세 번째 요소 표시
	        return false;
        }); */

        </script>


      
</body>
</html>