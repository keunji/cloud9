<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>팔로우 게시글 모아보기</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="resources/css/final_main2.css">
<link rel="stylesheet" href="resources/css/final_detail.css">
<c:url var="mypage" value="MyPage.do" />
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<script>
		$(function(){
			$.ajax({
				url:"followingpostAjax.do",
				dataType:"JSON",
				data:{usernum : "${usernum}"},
				success:function(data){					
					
					
					var a = 0;	// tr
					var b = 0;	// data[b]
					
					var row = Math.ceil((data.length)/3);
					
					addTable();
					
					window.onscroll = function (e) {
		        		  if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
		        			  if(a<row){
		        				  addTable();
		        			  }		        			  
		        		  }
		        	}
					
					function addTable(){
						boardHover();
						heartIcon();
						for(var i=0; i<7; i++){	// 행
							if(a<row){
								
								$('#table').append('<tr id="'+a+'">');
							
								for(var j=0; j<3; j++){	// 열
									
									if(b < data.length){
										
										var page = "userPage.do?p=1&id=" + data[b].b_user_id;
										if(data[b].b_user_id=='${loginUser.id}'){
											page = "MyPage.do?uNum=${loginUser.user_num}&page=1";
										}
										
										$('#'+a).append('<td>'+
												'<div class="content">'+
												'<div>'+
													'<img src="resources/buploadFiles/'+ data[b].image1 +'" class="cImg">'+
												'</div>'+
												'<div class="chover">'+
													'<div class="hover-detail-content" onclick="modalDetail('+data[b].b_num+');"></div>'+
													'<div class="chContnet">'+
														'<div class="user">'+
															'<div class="userImg">'+
																'<a href="'+page + '"><img src="resources/images/profileImg/'+ data[b].b_profile_img +'"></a>'+
															'</div>'+
															'<a href="'+page + '"><div class="userId">'+ data[b].b_name +'</div></a>'+
														'</div>'+
														'<div class="con" onclick="modalDetail('+data[b].b_num+');">'+
															'<div class="userCon">'+
																'<p>'+ data[b].b_content +'</p>'+
															'</div>'+
														'</div>'+
														'<div class="cBtn">'+
															'<div class="cHeart">'+
																'<img src="resources/images/icon/main/heart.png"  id="th'+ data[b].b_num +'" class="cheart">'+
															'</div>'+
															'<div class="cComment" onclick="modalDetail('+data[b].b_num+');">'+
																'<div class="cbox"></div>'+
																'<img src="resources/images/icon/main/comment.png">'+
															'</div>'+
														'</div>'+
													'</div>'+
												'</div>'+
											'</div>'+
										'</td>');
										
									}else if(b >= data.length){
										
									}
									b++;
								}
								a++;
							}
						}
						boardHover();
						heartIcon();
					}
				},
				error:function(request,status,error){
					alert("code : " + request.status + "\n"
						+ "message : " + request.responseText + "\n"
						+ "error : " + error);
				}
			});
		});
	</script>
	
	<section>
		<!-- ===================================================== 모달 ======================================================== -->
		<div class="myModal" id="myModal" style="display: none;">
			<div class="board-detail" id="board-detail" style="display: none;">

			</div>
		</div>
		<!-- ===================================================== 모달 ======================================================== -->
		<div class="scContent">
			<div class="upBtn">
				<img src="resources/images/icon/main/arrow.png">
			</div> 
			<c:if test="${loginUser ne null}">
			<div class="postBtn">
				<img src="resources/images/icon/main/plus.png">
			</div>
			</c:if>
			<div class="choice">
				<p class="pchoice">체형별 보기</p>
				<div class="choice1">
					<div class="cSelect">
						키 : <select name="height">
							<option value="">---</option>
							<option value="1">140cm 이하</option>
							<option value="2">140~150cm</option>
							<option value="3">150~160cm</option>
							<option value="4">160~170cm</option>
							<option value="5">170~180cm</option>
							<option value="6">180~190cm</option>
							<option value="7">190cm 이상</option>
						</select>&nbsp;&nbsp;&nbsp; 몸무게 : <select name="weight">
							<option value="">---</option>
							<option value="1">40kg 이하</option>
							<option value="2">40~50kg</option>
							<option value="3">50~60kg</option>
							<option value="4">60~70kg</option>
							<option value="5">70~80kg</option>
							<option value="6">80~90kg</option>
							<option value="7">90~100kg</option>
							<option value="8">100kg 이상</option>
						</select>&nbsp;&nbsp;&nbsp;
						<div class="choiceBtn">체형별 보기</div>
					</div>
					<div class="close">
						<img src="resources/images/icon/main/close.png">
					</div>
				</div>
			</div>
			<div class="ctable">
				<table id="table">

				</table>
			</div>
		</div>
		<div class="modal2" id="modal2" style="display: none;"></div>
        <div class="md_content" id="md_content" style="display: none;">
            <span id="text">업로드</span>
            <button class="xbutton">X</button>
            <hr style="border: solid 0.5px rgb(211, 211, 211);">

            <div class="post-style-div" onclick="postStyle();">
                <div class="post-style-btn"><img class="posticon" src="resources/images/icon/main/sunglasses.png"></div>
                <div class="post-style-p">스타일</div>
            </div>

            <div class="post-qna-div" onclick="postQna();">
                <div class="post-qna-btn"><img class="posticon" src="resources/images/icon/main/QandA.png"></div>
                <div class="post-qna-p">QnA</div>
            </div>
        </div>
	</section>

	<jsp:include page="../common/footer.jsp" />


	<script>
	/* 테이블 하트 리스트 */
	function heartIcon(){
		var unum = '<c:out value="${loginUser.user_num}"/>';
		
		if(unum.length > 0){
			$.ajax({
				url:"BoardHeart.do",
				data:{unum:unum},
				success:function(data){	
					if(data.length > 0){
						for(var i=0; i<data.length; i++){
							$('#th'+data[i]).attr('src','resources/images/icon/main/heart2.png');
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
	}
	
	/* 테이블 게시물 마우스 오버 */
	function boardHover(){
	  	$('.chover').hide();
	    $('.content').mouseover(function(){
	        $('.chover',this).show();
	    });
	    $('.content').mouseout(function(){
	        $('.chover').hide();
	        
	    });
	    
	    // 게시물 좋아요 아이콘 클릭 시 아이콘 변경 
		$(".cHeart").click(function(){
			var bnum = $('.cheart',this).attr("id").substring(2);
			var unum = '<c:out value="${loginUser.user_num}"/>';
			
			if(unum.length > 0){
				//빈하트일때 좋아요 등록
				if($('.cheart',this).attr('src') == "resources/images/icon/main/heart.png"){
					
					$.ajax({
						url:"BoardAddHeart.do",
						data:{bnum:bnum, unum:unum},
						success:function(data){	
							if(data == "success"){
								$('#th'+bnum).attr('src','resources/images/icon/main/heart2.png');
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
					
				//꽉찬하트일때 좋아요 취소
				}else if($('.cheart',this).attr('src') == "resources/images/icon/main/heart2.png"){
					
					 $.ajax({
						url:"BoardDelHeart.do",
						data:{bnum:bnum, unum:unum},
						success:function(data){	
							if(data == "success"){
								$('#th'+bnum).attr('src','resources/images/icon/main/heart.png');
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
			}else{
				alert('로그인 후 이용 가능합니다.');
			}
		});
	}


	/* 체형별 */
	$( document ).ready( function() {
	    $('.choice1').hide();
	    $( '.pchoice' ).click( function() {
	        $( '.choice' ).animate( {
	            width: '1106px',
	            height: '50px',
	            cursor: 'pointer'
	        }, 400 );
	        $('.choice').css('cursor','default');
	        $('.choice1').show();
	        $('.pchoice').hide();
	    } );
	    $( '.close' ).click( function() {
	        $( '.choice' ).animate( {
	            width: '100px',
	            height: '30px'
	        }, 400 );
	        $('.choice1').hide();
	        setTimeout(function() {
	            $('.pchoice').show();
	        }, 400);
	        $('.choice').css('cursor','pointer');
	    } );

	});
      

	/* 맨 위로 가는 버튼 */
	$( document ).ready( function() {
	    $('.upBtn').hide();
	    $( window ).scroll( function() {
	        if ( $( this ).scrollTop() > 200 ) {
	            $( '.upBtn' ).fadeIn();
	        } else {
	            $( '.upBtn' ).fadeOut();
	        }
	    });
	    $( '.upBtn' ).click( function() {
	        $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
	        return false;
	    });
	});

	/* 모달팝업 디테일 */
	function modalDetail(bnum){
		
		console.log('### 글넘 : ' + bnum);
		
		var modal = document.getElementById('myModal');
		var detail = document.getElementById('board-detail');
		var content = document.getElementById('conte');
		
		$('.myModal').css('display','block');
		$('.board-detail').css('display','block');
		
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
				
				$('.board-detail').append(
						'<div class="slide">'
					    + '<img id="prev" src="resources/images/minwoo/next-1.png" alt="prev">'
					    + '<img id="next" src="resources/images/minwoo/next-1.png" alt="next">'
						+ '<div id="num1" class="board-img">' +
						'<span>' +
						'<img src="resources/buploadFiles/'+ data[0].image1 +'">'+
						'</span>' +
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
				
				followList(data[0].b_user_num);
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
				
				// 디테일 사진 슬라이드
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
		
		/* 다른 곳 누르면 모달 꺼짐 */ 
		window.onclick = function(event) {
		    if (event.target == modal) {
		        modal.style.display = "none";
		        detail.style.display = "none";
		        $('.board-detail').empty();
		    }
		}
		
	
		
		/* 디테일 부메뉴(수정, 신고) */
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
           
		/* 다른 곳 클릭하면 디테일 부메뉴 숨김 */
        $("body").click(function(e){
            if(!$('.board-etc').has(e.target).length){
                $('.boardSub').hide();
            }
        });
		

     	/* 디테일 해쉬태그, 좋아요 리스트 불러오기 */
		function hashHeartAjax(){
     		// 해시태그
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
		
		/* 디테일 팔로우 리스트 불러오기*/
		function followList(bunum){
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
		}
		
		/* 디테일 댓글 리스트 불러오기*/
		function replyList(){
			$.ajax({
				url:"BoardDetailComm.do",
				data:{bnum:bnum},
				dataType:"JSON",
				success:function(data){	
					if(data.length > 0){
						var page = "userPage.do?p=1&id=" + data[0].c_id;
						
						if(data[0].c_id=='${loginUser.id}'){
							page = "MyPage.do?page=1&uNum=${loginUser.user_num}";
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
	function addFollow(bunum){
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
	}
	
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
						page = "MyPage.do?page=1&uNum=${loginUser.user_num}";
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
	
	
	/* 디테일 댓글 태그 */
	var tagname ="";
	function tagComment(id){
		var tagunum = id.substring(3);
		tagname = tagname+"@"+ $('#'+id).html();
		
		$('.c-content').val(tagname+' ');
	}
	

	

	var modal2 = document.getElementById('modal2');
	var md_content = document.getElementById('md_content'); 
  
	$('.postBtn').click(function(){
		$( 'html, body' ).animate( { scrollTop : 0 },0);
		$('.modal2').css('display','block');
		$('.md_content').css('display','block');
	});

	window.onclick = function(event) {
	    if (event.target == modal2) {
	        modal2.style.display = "none";
	        md_content.style.display = "none";
	    }
	}

	$('.xbutton').click(function(){
	    modal2.style.display = "none";
	    md_content.style.display = "none";
	});
	
	function postStyle(){
	    location.href="PostStyle.do";
	}
	
	function postQna(){
	    location.href="PostQna.do";
	}
	
	
	function infoPage(id){
		location.href="userPage.do?p=1&id="+id;
	}
    </script>


</body>
</html>