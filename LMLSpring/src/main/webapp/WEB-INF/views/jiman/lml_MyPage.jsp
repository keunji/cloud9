<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.kh.lml.member.model.vo.Member" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="resources/css/minwoo/slide.css">
<link rel="stylesheet" href="resources/css/final_detail.css">
<link rel="stylesheet" href="resources/css/final_main2.css">
<link rel="stylesheet" href="resources/css/jmCSS/final_mypage.css">
</head>
<body>

<!-- 상세보기 모달(detail)  -->>
	<div class="myModal2" id="myModal2" style="display: none;">
		<div class="board-detail2" id="board-detail2" style="display: none;">
			
		</div>
	</div>

	<jsp:include page="../common/header.jsp" />
	
	<!-- 팔로워 모달 -->
		<div class="myModal3" id="myModal3" style="display: none;">
			<div class="board-detail3" id="board-detail3" style="display: none;">
				
			</div>
		</div>
		
		
	<div class="myModal10" id="myModal10" style="display: none;">
		<div class="board-detail10" id="board-detail10" style="display: none;">
		<h4 style="margin: 13px 0px 0 206px;">팔로워</h4>
			<div class="mo_fallower">
			
			
			</div>
		</div>
	</div>
	
	<!-- 팔로우 모달 -->
	<div class="myModal1" id="myModal1" style="display: none;">
		<div class="board-detail1" id="board-detail1" style="display: none;">
		<h4 style="margin: 13px 0px 0 206px;">팔로우</h4>
			<div class="mo_fallowoo">
			
			</div>
		</div>
	</div>
	
	<!-- ============모달 끝 ===========-->
	<section>
		<div id="myPage" class="myPage">
			<div class="my_top">
				<div class="top">
					<div class="my_photo">
						<img class="frofile" src="resources/images/profileImg/${loginUser.rename_profile_img}">
					</div>
					<div class="my_info">
						<div class="info">
							<h2>${loginUser.id}
								<button class="info_btn" onclick="location.href='Settings.do'">
									<img src="resources/images/jmImg/settings.png" class="btn_img">
								</button>
							</h2>
						</div>
						<div class="info">
							<div class="iftext_1">
								<span><a id="myboard" style="color: black">게시글</a>&nbsp;
									<span id="boardCount">${boardCount}</span></span>
							</div>
							<div class="iftext">
								<span><a id="myfalwer" style="color: black">팔로워</a>&nbsp;
									<span id="follwerCount">${Follower}</span> </span>
							</div>
							<div class="iftext">
							<span><a id="myfalowoo" style="color: black">팔로우</a>&nbsp;<span id="followCount">${Follow}</span></span>
							</div>
						</div>
						<div class="info">
							<div class="name">${loginUser.uname}</div>
							<c:if test="${empty loginUser.intro}">
								<div class="iftext_2">자기소개를 등록해주세요.</div>
							</c:if>
							<c:if test="${!empty loginUser.intro}">
								<div class="iftext_2">${loginUser.intro}</div>
							</c:if>

						</div>

					</div>
				</div>
				<div></div>
			</div>
			<div class="tagmenu">
				<span><button id="my" class="tagbtn"  value="1"onclick="my()">MY
						게시물</button>
					<button id="tag" class="tagbtn" value="2" onclick="tag()">태그된 게시물</button></span>
			</div>
			<div class="mytable">
				<table>
				<c:forEach var="myBoard" items="${Myboardlist }" varStatus="status" >
					<c:if test="${status.index mod 3 eq 0}">
					<tr>
					</c:if>
						<td>
							<div class="content" id="${myBoard.b_num}">
								<div class="img" style="cursor:pointer;">
									<img src="resources/buploadFiles/${myBoard.image1}" class="cImg">
								</div>
							</div>
						</td>
						
					<c:if test="${status.index mod 3 eq 2}">
					</tr>
					</c:if>
					</c:forEach>
				</table>

			</div>
		
		</div>

	</section>

	<script>
        $(document).ready(function() {
          	var id = "${loginUser.id}";
          //팔로워 목록 불러오는 ajax
            $.ajax({
				url : "werlist.do",
				data : {
					id : id
				},
				type : "post",
				success : function(data) {
					
					if (data != null) {
						console.log("여기 팔로워 리스트 "+data);
						var a = Object.keys(data).length;
						/* $('.mo_fallower').append("<table class='add_table'>"); */
						
					
						
						for(var i = 0; i<a;i++){
							console.log(data[i].id);
							console.log(data[i].rename_profile_img);
							var value;
							if(data[i].btn=="button1"){
								value = '팔로잉';
							}else{
								value = '팔로우';
							}
							
							
							
							var img = "<table class='add_table'><tr><td class='imgtd' rowspan='2' style='width: 10%;'><a class='taga' href='userPage.do?p=1&id="+data[i].id+"'><img style='width:75px; height:69px;' class='userimg' src='resources/images/profileImg/"+ data[i].rename_profile_img+"'></a></td>"+
							"<td class='idtd' style='width: 30%;'><a class='taga' href='userPage.do?p=1&id="+data[i].id+"'>"+data[i].id+"</a></td><td class='btntd' rowspan='2' style='width: 30%;'>"+ "<input class='"+data[i].btn+"' id='"+ data[i].from_follower +"'  name='"+data[i].btn+"' type='button' value='"+value+"' onclick='followBtn(this.name, this.id);'>"
									+"</td></tr><tr><td  class='nametd'><a class='taga' href='userPage.do?p=1&id="+data[i].id+"'>"+data[i].uname+"</a></td></tr></table>";
							
						/* $('.mo_fallower').append("<tr><td class='imgtd' rowspan='2' style='width:10%'><img class='userimg' src='resources/images/profileImg/"+data[i].rename_profile_img+"></tr></td>"); */
						/* $('.mo_fallower').append("<table class='add_table'><tr><td class='imgtd' rowspan='2' style='width: 10%;'><img style='width:80px; height:80px;' class='userimg' src='resources/images/profileImg/"+ data[i].rename_profile_img+"'><td>");
						$('.mo_fallower').append("<td class='idtd' style='width: 30%;'>"+data[i].id+"</td><td class='btntd' rowspan='2' style='width: 30%;'>");
						$('.mo_fallower').append("<input class='button2'  name='button2' type='button' value='팔로우' onclick='followBtn(this.name, this.id);'>");
						$('.mo_fallower').append("</td></tr><tr><td>"+data[i].uname+"</td> </tr> </table>"); */
							$('.mo_fallower').append(img);
						}
						/*  $('.mo_fallower').append("</table>"); */ 
					} else {
				
					}
				},
				error : function() {
					console.log("바보");
					//에러 로그

				}
			});
            //팔로우 목록 불러오는 ajax
            $.ajax({
				url : "woolist.do",
				data : {
					id : id
				},
				type : "post",
				success : function(data) {
					
					if (data != null) {
						console.log("여기 팔로우 리스트"+data);
						var a = Object.keys(data).length;
						/* $('.mo_fallower').append("<table class='add_table'>"); */
						
					
						
						for(var i = 0; i<a;i++){
							console.log(data[i].id);
							console.log(data[i].rename_profile_img);
							var value;
							if(data[i].btn=="button1"){
								value = '팔로잉';
							}else{
								value = '팔로우';
							}
							
							
							var img = "<table class='add_table'><tr><td class='imgtd' rowspan='2' style='width: 10%;'><a class='taga' href='userPage.do?p=1&id="+data[i].id+"'><img style='width:75px; height:69px;' class='userimg' src='resources/images/profileImg/"+ data[i].rename_profile_img+"'></a></td>"+
							"<td class='idtd' style='width: 30%;'><a class='taga' href='userPage.do?p=1&id="+data[i].id+"'>"+data[i].id+"</a></td><td class='btntd' rowspan='2' style='width: 30%;'>"+ "<input class='"+data[i].btn+"' id='"+ data[i].to_follow +"'  name='"+data[i].btn+"' type='button' value='"+value+"' onclick='followBtn(this.name, this.id);'>"
									+"</td></tr><tr><td  class='nametd'><a class='taga' href='userPage.do?p=1&id="+data[i].id+"'>"+data[i].uname+"</a></td></tr></table>";
							
						/* $('.mo_fallower').append("<tr><td class='imgtd' rowspan='2' style='width:10%'><img class='userimg' src='resources/images/profileImg/"+data[i].rename_profile_img+"></tr></td>"); */
						/* $('.mo_fallower').append("<table class='add_table'><tr><td class='imgtd' rowspan='2' style='width: 10%;'><img style='width:80px; height:80px;' class='userimg' src='resources/images/profileImg/"+ data[i].rename_profile_img+"'><td>");
						$('.mo_fallower').append("<td class='idtd' style='width: 30%;'>"+data[i].id+"</td><td class='btntd' rowspan='2' style='width: 30%;'>");
						$('.mo_fallower').append("<input class='button2'  name='button2' type='button' value='팔로우' onclick='followBtn(this.name, this.id);'>");
						$('.mo_fallower').append("</td></tr><tr><td>"+data[i].uname+"</td> </tr> </table>"); */
							$('.mo_fallowoo').append(img);
							
						}
						/*  $('.mo_fallower').append("</table>"); */ 
					} else {
				
					}
				},
				error : function() {
					console.log("바보");
					//에러 로그

				}
			});
            
        $('mytable').show(); //페이지를 로드할 때 표시할 요소
        $('.tagtable').hide(); //페이.지를 로드할 때 숨길 요소
        $('#tag').click(function(){
        $ ('.mytable').hide(); //클릭 시 첫 번째 요소 숨김
        $ ('.tagtable').show(); //클릭 시 두 번째 요소 표시
        $('#my').click(function(){
         $ ('.tagtable').hide(); //클릭 시 첫 번째 요소 숨김
        $ ('.mytable').show(); //클릭 시 두 번째 요소 표시
        })
        return false;
        });
        });

        
        
          /* 모달팝업 디테일 */
              var modal = document.getElementById('myModal10');
              var detail = document.getElementById('board-detail10');
              var modalwoo = document.getElementById('myModal1');
              var detailwoo = document.getElementById('board-detail1');
           	var modal2 =  document.getElementById('myModal2');
            var detail2 = document.getElementById('board-detail2');
           	

              $('#myfalwer').click(function(){
                  $('.myModal10').css('display','block');
                  $('.board-detail10').css('display','block');
                
                  
                  
              });
              $('#myfalowoo').click(function(){
                  $('.myModal1').css('display','block');
                  $('.board-detail1').css('display','block');
              });
              
              
      
              window.onclick = function(event) {
            	  console.log(event.target);
                  if (event.target == modal) {
                      modal.style.display = "none";
                      detail.style.display = "none";
                      $('myModal2').style.display = "none";
                  }
                  else if (event.target == modalwoo) {
                	  modalwoo.style.display = "none";
                	  detailwoo.style.display = "none";
                	  $('myModal2').style.display = "none";
                  }
                  else if (event.target == modal2) {
    			        modal2.style.display = "none";
    			        detail2.style.display = "none";
    			        $('.board-detail2').empty();
    			    }
              }
        
              $(document).ready(function(){
              	
              	var uNum = ${loginUser.user_num};
              	
              
              });
              
              
              
              //팔로우 언팔로우 ~~~~
              
              
              function followBtn(name, id){
      			
      			if(name == 'button1'){	// 언팔로우
      				console.log(name);
      				console.log(id);
      			
      				var followQ = confirm('언팔로우 하시겠습니까?');
      				
      				if(followQ){
      					
      					console.log('woo 언팔');
      					
      					var toUnFollow = id;	// 팔로우 취소 할 상대
      					var fromFollow = '${loginUser.user_num}';	// 본인
      				
      					console.log("Un - to : " + toUnFollow + " / from : " + fromFollow);
      					
      					$.ajax({
      						url:"unfollowBtn.do",
      						data:{toUnFollow:toUnFollow, fromFollow:fromFollow},
      						type:"post",
      						success:function(data){
      							if(data == "success"){
      								$('.board-detail1').find('#'+id).parent().parent().parent().parent().remove();
      								$('#followCount').html(Number($('#followCount').html())-1);
      								$('.mo_fallower').find('#'+id).prop("name",'button2');
      								$('.mo_fallower').find('#'+id).prop("class",'button2');
      								$('.mo_fallower').find('#'+id).prop("value",'팔로우');
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
      					var fromFollow = '${loginUser.user_num}';	// 본인
      					
      					$.ajax({
      						url:"followBtn.do",
      						data:{toFollow:toFollow, fromFollow:fromFollow},
      						type:"post",
      						success:function(data){
      							if(data == "success"){
      								console.log("followBtn");
      								$('.mo_fallower').find('#'+id).prop("class",'button1');
      								$('.mo_fallower').find('#'+id).prop("value",'팔로잉');
      								$('.mo_fallower').find('#'+id).prop("name",'button1');
      								$('#followCount').html(Number($('#followCount').html())+1);
      								var btn = $('.mo_fallower').find('#'+id).parent().parent().parent().parent().clone();
      								$('.mo_fallowoo').append(btn);
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
           
              
              
              
              function my(){
            	  location.href="MyPage.do?uNum=${loginUser.user_num}&page=1";
              }
              
              function tag(){
            	  location.href="MyPage.do?uNum=${loginUser.user_num}&page=2";
              }
              
              /*상세보기(detail) 시작*/
      		const content = document.getElementsByClassName("content");
      		
      		
      		function modalDetail(bnum){
      			console.log('### 글넘 : ' + bnum);
      			var modal2 = document.getElementById('myModal2');
      			var detail2 = document.getElementById('board-detail2');
      			
      			$('.myModal2').css('display','block');
      			$('.board-detail2').css('display','block');
      			
      			$.ajax({
      				url:"BoardDetail.do",
      				data:{bnum:bnum},
      				dataType:"JSON",
      				success:function(data){	
      					hashHeartAjax();
      					hashUSerAjax();
      					replyList();
      					
      					var page = "userPage.do?p=1&id=" + data[0].b_user_id;

      					if(data[0].b_user_id=='${loginUser.id}'){
      						page = "MyPage.do?uNum=${loginUser.user_num}&page=1";
      					}
      					
      					
      					$('.board-detail2').append(
      							'<div class="slide">'
      						    + '<img id="prev" src="resources/images/minwoo/next-1.png" alt="prev">'
      						    + '<img id="next" src="resources/images/minwoo/next-1.png" alt="next">'
      							+ '<div id="num1" class="board-img">' +
      							'<span>' +
      							'<img src="resources/buploadFiles/'+ data[0].image1 +'">'+
      							'<span>' +
      							'</div>'+
      							'</div>'+
      							'<div class="board-right">'+
      								'<div class="board-user">'+
      									'<div class="board-userImg">'+
      									'<a href="'+page + '"><img src="resources/images/profileImg/'+ data[0].b_profile_img +'"></a>'+
      									'</div>'+
      									'<a href="'+page + '"><div class="board-id">'+
      											'<p>'+ data[0].b_name +'</p>'+
      										'</div></a>'+
      									'<div class="board-follow" id="fo'+data[0].b_user_num+'" onclick="addFollow(id);"></div>'+
      								'</div>'+
      								'<div class="board-textDiv">'+
      									'<div class="board-text">'+ data[0].b_content +'</div>'+
      									'<div class="board-hashtag"></div>'+
      									'<div class="board-Usertag"></div>'+
      								'</div>'+
      								'<div class="board-stateicon">'+
      									'<div class="board-heartCount"></div>'+
      									'<div class="board-heart">'+
      										'<img src="resources/images/icon/menu/iconmonstr-heart-thin-72.png" id="h'+bnum+'" onclick="addHeart('+bnum+');">'+
      									'</div>'+
      									'<div class="board-etc">'+
      										'<img src="resources/images/icon/main/menu1.png">'+
      										'<ul class="boardSub">'+
      		                              '<a href="bUpdateView.do?bnum='+bnum+'" id="idboardUp"><li><div class="boardSub1">수정</div></li></a>'+
      		                              '<a href="Settings3.do" id="idboardDecla"><li><div class="boardSub1">신고</div></li></a>'+
      		                              '</ul>'+
      									'</div>'+
      								'</div>'+
      								'<div class="board-clothesInfo">'+
      									
      								'</div>'+
      							'</div>'+
      							'<div class="board-bottom">'+
      								'<div class="commentCount">'+
      									
      								'</div>'+
      								'<div class="board-commentDiv">'+
      									
      								'</div>'+
      								'<div class="board-commentWrite">'+
      									'<div class="comment-write">'+
      										'<input type="text" id="'+bnum+'" class="c-content" placeholder="댓글 달기...">'+
      									'</div>'+
      									'<div class="comment-submit" onclick="cSubmit();">게시</div>'+
      								'</div>'+
      							'</div>');
      					
      					//followList(data[0].b_user_num);
      					boardSub(data[0].b_user_num, bnum);
      					
      					if(data[0].b_top !=null){
    						$('.board-clothesInfo').append('<div class="clothesInfo-div">'+
    								'<div class="clothes-img">'+
    								'<img src="resources/images/detailImg/top.png">'+
    							'</div>'+
    							'<div class="clothes-p">top</div>'+
    							'<div class="clothes-info" id="'+data[0].b_top+'" onclick="brandSearch(id);">'+ data[0].b_top +'</div>'+
    						'</div>');
    					}
    					if(data[0].b_bottom !=null){
    						$('.board-clothesInfo').append('<div class="clothesInfo-div">'+
    								'<div class="clothes-img">'+
    								'<img src="resources/images/detailImg/pants.png">'+
    							'</div>'+
    							'<div class="clothes-p">bottom</div>'+
    							'<div class="clothes-info" id="'+data[0].b_bottom+'" onclick="brandSearch(id);">'+ data[0].b_bottom +'</div>'+
    						'</div>');
    					}
    					if(data[0].b_shoes !=null){
    						$('.board-clothesInfo').append('<div class="clothesInfo-div">'+
    								'<div class="clothes-img">'+
    								'<img src="resources/images/detailImg/shoes.png">'+
    							'</div>'+
    							'<div class="clothes-p">shoes</div>'+
    							'<div class="clothes-info" id="'+data[0].b_shoes+'" onclick="brandSearch(id);">'+ data[0].b_shoes +'</div>'+
    						'</div>');
    					}
    					if(data[0].b_acc !=null){
    						$('.board-clothesInfo').append('<div class="clothesInfo-div">'+
    								'<div class="clothes-img">'+
    								'<img src="resources/images/detailImg/bag.png">'+
    							'</div>'+
    							'<div class="clothes-p">acc</div>'+
    							'<div class="clothes-info" id="'+data[0].b_acc+'" onclick="brandSearch(id);">'+ data[0].b_acc +'</div>'+
    						'</div>');
    					}
    					if(data[0].b_etc !=null){
    						$('.board-clothesInfo').append('<div class="clothesInfo-div">'+
    								'<div class="clothes-img">'+
    								'<img src="resources/images/detailImg/watch.png">'+
    							'</div>'+
    							'<div class="clothes-p">etc</div>'+
    							'<div class="clothes-info" id="'+data[0].b_etc+'" onclick="brandSearch(id);">'+ data[0].b_etc +'</div>'+
    						'</div>');
    					}
    					
      				 	const prev = document.getElementById('prev');
      				    const next = document.getElementById('next');
      				    const ultag = document.getElementsByClassName('board-img');
      				    const imgArr =[data[0].image2,data[0].image3,data[0].image4,data[0].image5];
      				    var num = 0; // imgcheck에 사용하는 전역변수
      				    let arr = imgcheck(); // 배열 정렬, 배열이 없으면 화살표 안보이게 설정.
      				    imgmake(arr); // 이미지 생성
      				    function imgmake(arr){
      				        //이미지가 있으면 생성
      				        for(let i = 0; i<arr.length; i++){
      				          var para = document.createElement('span');
      				          var img = document.createElement('img');
      				          var element = document.getElementById("num1");
      				          img.src="resources/buploadFiles/"+arr[i];
      				          para.appendChild(img);
      				          element.appendChild(para);
      				        }
      				      }
      				      function imgcheck(){
      				        let arr=[];
      				        
      				        //배열 null 개수 체크 밑 제거
      				        for(let i = 0; i<imgArr.length; i++){
      				          if(imgArr[i]!=null){
      				            num++;
      				            arr.push(imgArr[i]);
      				          }
      				        }
      				        // 배열안에 아무것도 없으면 화살표 버튼(이미지)을 안보이게 설정.
      				        if(num==0){
      				          prev.style.display='none';
      				          next.style.display='none';
      				        }
      				        return arr;
      				      }
      				      
      				      function prevfun(){
      				        if((ultag[0].id.substring(3,4) != '1'))
      				          ultag[0].id = ultag[0].id.substring(0,3) + ((Number(ultag[0].id.substring(3,4)))-1);
      				        else
      				          ultag[0].id = ('num' + String(arr.length+1));
      				        
      				      }
      				      function nextfun(){
      				        if((ultag[0].id.substring(3,4) != String((arr.length+1))))
      				          ultag[0].id = ultag[0].id.substring(0,3) + ((Number(ultag[0].id.substring(3,4)))+1);
      				        else
      				          ultag[0].id = 'num1';
      				      }
      				      prev.addEventListener("click",prevfun);
      				      next.addEventListener("click",nextfun);
      				},
      				error:function(request,status,error){
      					console.log("** error code : " + request.status + "\n"
      						+ "message : " + request.responseText + "\n"
      						+ "error : " + error);
      				}
      			});
      			
      	/* 		window.onclick = function(event) {
      			    if (event.target == modal2) {
      			        modal2.style.display = "none";
      			        detail2.style.display = "none";
      			        $('.board-detail2').empty();
      			    }
      			} */
      			
      			function boardSub(bunum, bnum){
    	        	var unum = '<c:out value="${loginUser.user_num}"/>';
    	            var bunum = bunum;
    	            var bnum = bnum;
    	            
    	            $('.boardSub').hide();
    	            $('.board-etc').click(function(){
    	            	$('ul',this).slideToggle("fast");
    	            	if(unum.length>0){
    		            	if(unum == bunum){
    		               		$('#idboardUp').show();
    		               		$('#idboardDecla').hide();
    		               	}else{
    		               		$('#idboardUp').hide();
    		               		$('#idboardDecla').show();
    		            	}
    		            }else{
    		            	$('#idboardUp').hide();
    	               		$('#idboardDecla').show();
    	            	}
    	            });
    	        }
      			
      			$("body").click(function(e){
    	            if(!$('.board-etc').has(e.target).length){
    	                $('.boardSub').hide();
    	            }
    	        });
      			
      			function hashHeartAjax(){
      				// 해쉬태그 불러오기
      				$.ajax({
      					url:"BoardDetailHash.do",
      					data:{bnum:bnum},
      					dataType:"JSON",
      					success:function(data){	
      						for(var i=0; i<data.length; i++){
      							$('.board-hashtag').append('<a href=\'Search.do?keyword='+data[i].substring(1)+'\'>' + data[i] + ' </a>');
      						}
      					},
      					error:function(request,status,error){
      						console.log("** error code : " + request.status + "\n"
      							+ "message : " + request.responseText + "\n"
      							+ "error : " + error);
      					}
      				});
      				
      				// 디테일 좋아요 리스트 & 내가 좋아요 눌렀음 빨간하트로.
      				$.ajax({
      					url:"BoardDetailHeart.do",
      					data:{bnum:bnum},
      					dataType:"JSON",
      					success:function(data){
      						$('.board-heartCount').html('좋아요 '+ data.length +'개');
      						if(data.length > 0){
      							var unum = '<c:out value="${loginUser.user_num}"/>';
      							for(var i=0; i<data.length; i++){
      								if(data[i].h_unum == unum){
      									$('#h'+bnum).attr('src','resources/images/icon/menu/detailHeart.png');
      								}
      							}
      						}
      					},
      					error:function(request,status,error){
      						console.log("** error code : " + request.status + "\n"
      							+ "message : " + request.responseText + "\n"
      							+ "error : " + error);
      					}
      				});
      			}
      			
      			/* 디테일 유저태그 리스트 불러오기*/
    			function hashUSerAjax(){
    				$.ajax({
    					url:"UserDetailHash.do",
    					data:{bnum:bnum},
    					dataType:"JSON",
    					success:function(data){	
    						for(var i=0; i<data.length; i++){
    				$('.board-Usertag').append('<a href=\'Search.do?keyword='+data[i]+'\'>' +"@" +data[i] + ' </a>');
    						}
    					},
    					error:function(request,status,error){
    						console.log("** error code : " + request.status + "\n"
    							+ "message : " + request.responseText + "\n"
    							+ "error : " + error);
    					}
    				});
    				
    			}
      			
      			/* function followList(bunum){
      				// 디테일 팔로우리스트 가져오기
      				var unum = '<c:out value="${loginUser.user_num}"/>';
      				var bunum = bunum;
      				if(unum.length>0){
      					if(unum != bunum){
      						$.ajax({
      							url:"BoardDetailFollowList.do",
      							data:{unum:unum,bunum:bunum},
      							success:function(data){
      								if(data == 0){
      									$('.board-follow').html('팔로우');
      								}else if(data == 1){
      									console.log('팔로우 했음 1 : ' + data);
      								}
      							},
      							error:function(request,status,error){
      								console.log("** error code : " + request.status + "\n"
      									+ "message : " + request.responseText + "\n"
      									+ "error : " + error);
      							}
      						});
      					}
      				}
      			} */
      			
      			// 디테일 댓글 리스트
    			function replyList(){
    				$.ajax({
    					url:"BoardDetailComm.do",
    					data:{bnum:bnum},
    					dataType:"JSON",
    					success:function(data){	
    						if(data.length > 0){
    							var page = "userPage.do?p=1&id=" + data[0].c_id;
    							
    							if(data[0].c_id=='${loginUser.id}'){
    								page = "MyPage.do?uNum=${loginUser.user_num}";
    							}
    							
    							var unum1 = '<c:out value="${loginUser.user_num}"/>';
    							$('.commentCount').empty();
    							$('.commentCount').append('<p>댓글 ('+data.length+')</p>');
    							$('.board-commentDiv').empty();
    							for(var i=0; i<data.length; i++){
    								console.log('ㅆㅣ아이디  : ' + data[i].c_id);
    								$('.board-commentDiv').append(''+
    										'<div class="board-comment">'+
    										'<div class="comment-img">'+
    											'<a href="'+page + '"><img src="resources/images/profileImg/'+ data[i].profile +'"></a>'+
    										'</div>'+
    										'<div class="comment-content">'+
    											'<p class="comment-user" id="tag'+data[i].c_unum+'" onclick="tagComment(id);">'+ data[i].uname +'</p>'+
    											'<p class="comment-comment">'+ data[i].c_content +'</p>'+
    											'<div class="comment-delete del'+data[i].c_no+'"></div>'+
    										'</div>'+
    									'</div>');
    								$('.board-commentDiv').scrollTop($('.board-commentDiv').prop('scrollHeight'));
    								if(data[i].c_unum == unum1){	// 댓글 단 사람이랑 로그인유저랑 같으면
    									$('.del'+data[i].c_no).append('<img src="resources/images/icon/menu/commentDelete.png" id="'+data[i].c_no+'" onclick="commentDelete(id,'+bnum+');">');
    								}
    							}
    							
    							
    						}else{
    							$('.commentCount').empty();
    							$('.commentCount').append('<p>댓글 ('+data.length+')</p>');
    							$('.board-commentDiv').empty();
    							$('.board-commentDiv').append(''+
    								'<div class="board-comment">'+
    									//'<div class="comment-img"></div>'+
    									'<div class="comment-content">'+
    										'<p class="comment-user">등록된 댓글이 없습니다.</p>'+
    										'<p class="comment-comment"></p>'+
    									'</div>'+
    								'</div>');
    						}
    					},
    					error:function(request,status,error){
    						console.log("** error code : " + request.status + "\n"
    							+ "message : " + request.responseText + "\n"
    							+ "error : " + error);
    					}
    				});
    			}
      		}
      		
      		
      		
      		
      		
      		
      		
      		
      		/* 디테일 스타일태그 클릭 시 네이버 검색 */
    		function brandSearch(brand){
    			var newWindow = window.open("about:blank");
    			newWindow.location.href = 'https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query='+brand;
    		}
    		
    		/* 디테일 팔로우 버튼 */
    		/* function addFollow(bunum){
    			var fromFollow = '<c:out value="${loginUser.user_num}"/>';
    			var toFollow = bunum.substring(2);
    			
    			if(fromFollow.length>0){
    				var qfollow = confirm('팔로우 하시겠습니까?');
    				if(qfollow == true){
    					$.ajax({
    						url:"followBtn.do",
    						data:{toFollow:toFollow, fromFollow:fromFollow},
    						type:"post",
    						success:function(data){
    							if(data == "success"){
    								$('#'+bunum).html('');
    							}else{
    								alert("실패");
    							}
    						},
    						error:function(jqxhr, textStatus,errorThrown){
    							console.log("ajax 처리 실패");
    						}
    					});
    				}
    			}else{
    				alert('로그인 후 이용 가능합니다.');
    			}
    		} */
    		
    		/* 디테일 좋아요 눌러버려 */
    		function addHeart(bnum){
    			var bnum = bnum;
    			var unum = '<c:out value="${loginUser.user_num}"/>';
    			
    			if(unum.length > 0){
    				// 디테일 빈하트일때 좋아요 등록
    				if($('#h'+bnum).attr('src') == "resources/images/icon/menu/iconmonstr-heart-thin-72.png"){
    					$.ajax({
    						url:"BoardAddHeart.do",
    						data:{bnum:bnum, unum:unum},
    						success:function(data){	
    							if(data == "success"){
    								$('#h'+bnum).attr('src','resources/images/icon/menu/detailHeart.png');
    								$('#th'+bnum).attr('src','resources/images/icon/main/heart2.png');
    								detailHeartCount();
    							}else{
    								alert('좋아요 실패');
    							}
    						},
    						error:function(request,status,error){
    							console.log("** error code : " + request.status + "\n"
    								+ "message : " + request.responseText + "\n"
    								+ "error : " + error);
    						}
    					});
    					
    				//디테일 꽉찬하트일때 좋아요 취소
    				}else if($('#h'+bnum).attr('src') == 'resources/images/icon/menu/detailHeart.png'){
    					$.ajax({
    						url:"BoardDelHeart.do",
    						data:{bnum:bnum, unum:unum},
    						success:function(data){	
    							if(data == "success"){
    								$('#h'+bnum).attr('src','resources/images/icon/menu/iconmonstr-heart-thin-72.png');
    								$('#th'+bnum).attr('src','resources/images/icon/main/heart.png');
    								detailHeartCount();
    							}else{
    								alert('좋아요 취소 실패');
    							}
    						},
    						error:function(request,status,error){
    							console.log("** error code : " + request.status + "\n"
    								+ "message : " + request.responseText + "\n"
    								+ "error : " + error);
    						}
    					});
    			 	} 
    				
    				// 좋아요 수
    				function detailHeartCount(){
    					$.ajax({
    						url:"BoardDetailHeart.do",
    						data:{bnum:bnum},
    						dataType:"JSON",
    						success:function(data){
    							$('.board-heartCount').html('좋아요 '+ data.length +'개');
    						},
    						error:function(request,status,error){
    							console.log("** error code : " + request.status + "\n"
    								+ "message : " + request.responseText + "\n"
    								+ "error : " + error);
    						}
    					});
    				}
    			}else{
    				alert('로그인 후 이용 가능합니다.');
    			}
    		}
    		
    		
    		/* 디테일 댓글 등록 */
    		function cSubmit(){
    			var comment = $('.c-content').val();
    			comment.split("@");
    			var unum = '<c:out value="${loginUser.user_num}"/>';
    			var bnum = $('.c-content').attr("id");
    			
    			if(unum.length>0){
    				if(comment.length > 0){
    					$.ajax({
    						url:"BoardComment.do",
    						data:{comment:comment, unum:unum, bnum:bnum},
    						success:function(data){	
    							if(data == "success"){
    								getReplyList(bnum);
    								$('.c-content').val('');
    								$('.board-commentDiv').scrollTop($('.board-commentDiv').prop('scrollHeight'));
    							}else{
    								alert('댓글 등록 실패');
    							}
    						},
    						error:function(request,status,error){
    							console.log("** error code : " + request.status + "\n"
    								+ "message : " + request.responseText + "\n"
    								+ "error : " + error);
    						}
    					});
    				}else{
    					alert('댓글을 입력해주세요.');
    				}
    			}else{
    				alert('로그인 후 이용 가능합니다.');
    			}
    		}
    		
    		/* 댓글 삭제 */
    		function commentDelete(id,bnum){
    			console.log('삭제 아뒤, 비넘 : ' + id + ', ' + bnum);
    			var del = confirm('댓글을 삭제하시겠습니까?');
    			if(del == true){
    				$.ajax({
    					url:"CommentDelete.do",
    					data:{cno:id},
    					success:function(data){	
    						if(data == "success"){
    							getReplyList(bnum);
    						}else{
    							alert('댓글 삭제 실패');
    						}
    					},
    					error:function(request,status,error){
    						console.log("** error code : " + request.status + "\n"
    							+ "message : " + request.responseText + "\n"
    							+ "error : " + error);
    					}
    				});
    			}else{}
    		}
    		
    		/* 디테일 댓글 등록,삭제 시 실행되는 댓글리스트 */
    		function getReplyList(bnum){
    			console.log('해당 댓글 글넘 : ' + bnum);
    			$.ajax({
    				url:"BoardDetailComm.do",
    				data:{bnum:bnum},
    				dataType:"JSON",
    				success:function(data){	
    					if(data.length > 0){
    						
    						var page = "userPage.do?p=1&id=" + data[0].c_id;
    						
    						if(data[0].c_id=='${loginUser.id}'){
    							page = "MyPage.do?uNum=${loginUser.user_num}";
    						}
    						
    						var unum1 = '<c:out value="${loginUser.user_num}"/>';
    						$('.commentCount').empty();
    						$('.commentCount').append('<p>댓글 ('+data.length+')</p>');
    						$('.board-commentDiv').empty();
    						for(var i=0; i<data.length; i++){
    							console.log('ㅆㅣ아이디  : ' + data[i].c_id);
    							$('.board-commentDiv').append(''+
    									'<div class="board-comment">'+
    									'<div class="comment-img">'+
    										'<a href="'+page + '"><img src="resources/images/profileImg/'+ data[i].profile +'"></a>'+
    									'</div>'+
    									'<div class="comment-content">'+
    										'<p class="comment-user" id="tag'+data[i].c_unum+'" onclick="tagComment(id);">'+ data[i].uname +'</p>'+
    										'<p class="comment-comment">'+ data[i].c_content +'</p>'+
    										'<div class="comment-delete del'+data[i].c_no+'"></div>'+	//id="del'+data[i].c_unum+'"
    									'</div>'+
    								'</div>');
    							if(data[i].c_unum == unum1){
    								$('.del'+data[i].c_no).append('<img src="resources/images/icon/menu/commentDelete.png" id="'+data[i].c_no+'" onclick="commentDelete(id,'+bnum+');">');
    							}
    						}
    						console.log("scrollHeight : " + $('.board-commentDiv').prop('scrollHeight'));
    						$('.board-commentDiv').scrollTop($('.board-commentDiv').prop('scrollHeight'));
    					}else{
    						$('.commentCount').empty();
    						$('.commentCount').append('<p>댓글 ('+data.length+')</p>');
    						$('.board-commentDiv').empty();
    						$('.board-commentDiv').append(''+
    							'<div class="board-comment">'+
    								//'<div class="comment-img"></div>'+
    								'<div class="comment-content">'+
    									'<p class="comment-user">등록된 댓글이 없습니다.</p>'+
    									'<p class="comment-comment"></p>'+
    								'</div>'+
    							'</div>');
    					}
    				},
    				error:function(request,status,error){
    					console.log("** error code : " + request.status + "\n"
    						+ "message : " + request.responseText + "\n"
    						+ "error : " + error);
    				}
    			});
    		}
      		
      		
      		
      		
      		
      		
      		
      		
      		
      		for(let i=0; i<content.length;i++){
      			content[i].addEventListener("click",function(){
      				//console.log(i); //각 content는 번호를 갖게 됬다.
      				modalDetail(content[i].id);
      			});
      		}
      		/*상세보기(detail) 끝*/
              
    </script>

</body>
</html>