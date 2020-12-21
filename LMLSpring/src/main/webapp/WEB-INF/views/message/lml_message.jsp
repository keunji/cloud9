<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>채팅</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="resources/css/final_message.css">

</head>






<body>
	<jsp:include page="../common/header.jsp" />
	<script>
	  
      var rename_profile_img;
      var touser;
      var RoomID;
 
 </script>
	<section>
		<div class="sContent">
			<div class="aTable">
				<div class="aBox">
					<div class="lContent">
						<div class="direct-div">Direct</div>
						<div class="direct-user-div">


							<c:forEach var="message" items="${messageList}">
								<div class="direct-user ${message.touser}">
									<img
										src="resources/images/profileImg/${message.rename_profile_img}">
									<div class="user-li">
										<div class="li-userId">${message.touser}</div>
										<div class="${message.chatroomid} li-direct">${message.recentChat}</div>
										<button class="delbtn" onclick="location.href='deleteChat.do?roomid=${message.chatroomid}'">X</button>
										<c:if test="${message.count ne 0 }">
										<div class="alarm alarm${message.chatroomid}">${message.count}</div>
										</c:if>
										
										<c:if test="${message.count eq 0 }">
										<div class="alarm alarm${message.chatroomid}" hidden="hidden">0</div>
										</c:if>
									</div>
								</div>
								<script>
								 
								
                                    $('.${message.touser}').on('click', function () {
                                    	$(".message").html('');
                                    	$(".inputsend").removeAttr("disabled");
                                    	rename_profile_img ="${message.rename_profile_img}";
                                    	touser = "${message.touser}";
                                    	 
                                    	var as = "${loginUser.id}";
  									  socket.emit("login",as,"${message.chatroomid}");
                                    	
                                        $(this).addClass('select-bar');
                                        $(this).siblings().removeClass('select-bar');
                                         RoomID =  '${message.chatroomid}';
                                        $("#user-id").html('${message.touser}');
                                    	$("#user-img").attr("src","resources/images/profileImg/${message.rename_profile_img}");
                                    	$("#user-img").removeAttr("hidden");
                                    	

                                       
                                       $(".useridatag").attr("href","userPage.do?p=1&id=${message.touser}");
                                       
                                       
                                       
                                     
                                       
                                       
                                       
                                       
                                       
                                       $.ajax({
                       					url : "chatLog.do",
                       					data : {chatid : "${message.chatroomid}"},
                       					type : "post",
                       					success : function(data) {
                       						$.each(data,function(index,value){
                       						if(value.user_name == "${message.touser}"){
                       							$('.message').append('<div class="yourmessagediv"><img src="resources/images/profileImg/${message.rename_profile_img}" class="yourmessageimg"><div style="width:fit-content;   margin: 0 0 0 82px;"><p class="yourmessage">'+ value.chatlog +'</p></div></div>');
                       							
                            				}else{
                            					$('.message').append('<div class="mymessagediv"><p class="mymessage">' + value.chatlog + '</p></div>');
                            				}
                       						$('.message').scrollTop($('.message').prop('scrollHeight'));
                       						
                       						});	
                       					},
                       					error : function(jqxhr, textStatus, errorThrown) {
                       						console.log("ajax 오류");

                       					}
                       					});
                                    	
                                       
                                       $.ajax({
                          					url : "checkChat.do",
                          					data : {room : "${message.chatroomid}",name : "${message.touser}"},
                          					type : "post",
                          					success : function(data) {
											
                          						console.log(data);
                          						$('.alarm${message.chatroomid}').html('0');
                           						$('.alarm${message.chatroomid}').attr("hidden","hidden");
                          						
                          					},
                          					error : function(jqxhr, textStatus, errorThrown) {
                          						console.log("ajax 오류");

                          					}
                          					});
                                       
                                       
                                       $.ajax({
                             				url : "alalarm.do",
                             				data : {id : "${loginUser.id}"},
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
                                    
                                    
                                    
                                    </script>

							</c:forEach>




						</div>
					</div>

					<div class="rContent">
						<div class="message-user-div">
							<div class="user-img">
								<a href="MyPage.do"><img id="user-img" src="" hidden="true"></a>
							</div>
							<a class="useridatag" href="#"><div class="user-id" id="user-id"></div></a>
						</div>
						<div class="message"></div>
						<div class="send">
							<input type="text" class="inputsend" placeholder="메세지 입력..."
								onKeyPress="if( event.keyCode==13 ){send();}">
						</div>

					</div>

				</div>

			</div>
		</div>
	</section>

	<jsp:include page="../common/footer.jsp" />

	<script>
      
            $(document).ready(function () {
            	
           
                
            	
            	$(".inputsend").attr("disabled",true);
            	
            	
            	 socket.on('hi',function(room,name,msg){
					
     				if(name ==touser){
        				$('.message').append('<div class="yourmessagediv"><img src="resources/images/profileImg/' + rename_profile_img +  '" class="yourmessageimg"><div style="width:fit-content;   margin: 0 0 0 82px;"><p class="yourmessage">'+ msg +'</p></div></div>');
     				}
        		    $('.message').scrollTop($('.message').prop('scrollHeight'));
        		    $('.' +room).html(textLengthOverCut(msg,5,'...'));
            		
        		    if(name != "${loginUser.id}" && touser != name){
   						$('.alarm'+room).html(Number($('.alarm'+room).html())+Number(1));
   						$('.alarm'+room).removeAttr("hidden");
        		    }
        		    if('${loginUser.id}' == name){
        		    	console.log("name : "+ name );
        		    	console.log("RoomId : "+ RoomID );
        		    	
        		    	console.log("여기 왜들어와짐?");
        		    $.ajax({
       					url : "chatAlram.do",
       					data : {roomid : room,name:name},
       					type : "post",
       					success : function(data) {
       						
       						console.log(data);
       						if(data == "fail"){
       							alert("상대방이 대화방을 나가셨습니다..");
       							location.href="Message.do?id='${loginUser.id}'";
       							
       							
       						}
       					},
       					error : function(jqxhr, textStatus, errorThrown) {
       						console.log("ajax 오류");

       					}
       					});
        			
        		    $.ajax({
           				url : "alalarm.do",
           				data : {id : "${loginUser.id}"},
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
        		    
        		    
        		    
        		    $.ajax({
      					url : "checkChat.do",
      					data : {room : room,name : touser},
      					type : "post",
      					success : function(data) {
						
      						console.log(data);
      						$('.alarm${message.chatroomid}').html('0');
       						$('.alarm${message.chatroomid}').attr("hidden","hidden");
      						
      					},
      					error : function(jqxhr, textStatus, errorThrown) {
      						console.log("ajax 오류");

      					}
      					});
        		    
        		    }
        		    
        		    if(name==touser&&room==RoomID){
        		    	
        		    	 $.ajax({
           					url : "checkChat.do",
           					data : {room : room,name : name},
           					type : "post",
           					success : function(data) {
     						
           						console.log("여기");
           						
           					},
           					error : function(jqxhr, textStatus, errorThrown) {
           						console.log("ajax 오류");

           					}
           					});
        		    	
        		    	
        		    	
        		    }
        		    
     			});
         	 
            	
            	
            });
           
            /* 채팅 */
            function send(){
                if($('.inputsend').val()!=''){
              //ggd
                var as = "${loginUser.id}";
                var mas = '<div class="mymessagediv"><p class="mymessage">' + $('.inputsend').val() + '</p></div>';
                $('.message').append(mas);
                socket.emit("send_msg",as,$(".inputsend").val());
         		
                $('.inputsend').val('');
                $('.message').scrollTop($('.message').prop('scrollHeight'));
                
                
                }
            };
			
            function textLengthOverCut(txt, len, lastTxt) {
                if (len == "" || len == null) { // 기본값
                    len = 20;
                }
                if (lastTxt == "" || lastTxt == null) { // 기본값
                    lastTxt = "...";
                }
                if (txt.length > len) {
                    txt = txt.substr(0, len) + lastTxt;
                }
                return txt;
            }


        </script>

</body>
</html>