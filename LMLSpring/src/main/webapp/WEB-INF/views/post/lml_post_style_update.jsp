<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>lml_Post_Style_Update</title>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="./././resources/css/final_post_style.css">
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<section>
		<div class="AContent">
			<form action="stylePostUpdate.do" method="post"
				enctype="multipart/form-data"  onsubmit="return insert()">
				
				<button type="button" class="deleteBtn" id="${b.b_num }" onclick="boardDelete(id);">삭제하기</button>
				<button id="uploadd" type="submit" class="uploadBtn" >수정하기</button>
				
				<div class="Atable">
					<div class="Abox">
						<div class="post-div">
							<input type="hidden" name="b_user_num" value="${loginUser.user_num}" />
							<input type="hidden" name="b_num" value="${b.b_num}" />
							<div class="div-img">
								<div class="post-img">스타일 이미지</div>

								<div class="post-img-div">
								 
								 	<c:if test="${ !empty b.image1 }">
										<div class="img-upload1" id="preview1">
	                                    	<img class="img-upload-update" id="up1" src="resources/buploadFiles/${b.image1}"/>										
										</div>
									</c:if>
									<c:if test="${ !empty b.image2 }">
										<div class="img-upload1" id="preview2">
	                                    	<img class="img-upload-update" id="up1" src="resources/buploadFiles/${b.image2}"/>										
										</div>
									</c:if>
									<c:if test="${ !empty b.image3 }">
										<div class="img-upload1" id="preview3">
	                                    	<img class="img-upload-update" id="up1" src="resources/buploadFiles/${b.image3}"/>										
										</div>
									</c:if>
									<c:if test="${ !empty b.image4 }">
										<div class="img-upload1" id="preview4">
	                                    	<img class="img-upload-update" id="up1" src="resources/buploadFiles/${b.image4}"/>										
										</div>
									</c:if>
									<c:if test="${ !empty b.image5 }">
										<div class="img-upload1" id="preview5">
	                                    	<img class="img-upload-update" id="up1" src="resources/buploadFiles/${b.image5}"/>										
										</div>
									</c:if>
									
								</div>
							</div>
							<div class="div-cont">
								<div class="post-cont">설명</div>
								<div class="post-cont-div">
									<div id="cont-write" class="cont-write">
										<textarea id="b_content" name="b_content" required="required">${b.b_content }</textarea>
									</div>
								</div>
							</div>
							<div class="div-cont1">
								<div id="post-cont" style="display: flex;"><h5 style=" padding-left: 10px;">게시글 태그</h5> <h5 style="  padding-left: 507px;">사용자 태그</h5></div>
								<div style="display: -webkit-inline-box;">
									<div id="hihi" style="width: 250px; height: 100px;border: solid 1px gainsboro; overflow-y: scroll; ">
									</div>
									
									<div class="post-cont-div1" style= "padding-top: 25px; padding-left: 20px;">
									<!-- <form action="#" id="tag" method="post"> -->
										<input type="text"  class="tagtag" autocomplete=”off” id="hashtag" size="7" placeholder="게시글 태그입력" />
										<input type="hidden" id="hashArr" name="b_hash" value=""/>
										<button type="button" class="tagbtn" id="tagbtn" onclick="addhash();">태그 등록</button>
								</div>
									
									<div id="hih2" style="width: 250px; height: 100px; margin-left: 332px;  border: solid 1px gainsboro; overflow-y: scroll;">
										
									</div>
									
									<div class="post-cont-div2">
								<input type="text" id="hashtag2" autocomplete=”off”  class="tagtag" size="7" placeholder="사용자 닉네임 입력" />
										
										<input type="hidden"  id="hashArr2" name="t_unum" value=""/>
										<button type="button"  class="tagbtn"  id="tagbtn2" onclick="addhash2();"> 태그 등록</button>
									</div>
									</div>
								
							</div>

							<div class="div-tag">
								<div style="float: left;">
									<div class="post-tag">스타일 태그</div>
								</div>

								<div class="post-tag-div">
									<div class="tag-select">
										<select name="styleTag" class="styleTag" id="clothes">
											<option value="top">상의</option>
											<option value="bottom">하의</option>
											<option value="shoes">신발</option>
											<option value="acc">acc</option>
											<option value="etc">etc</option>
										</select>&nbsp;&nbsp;&nbsp; 
										<input type="text" class="styleTag tagBrand" id="brand" placeholder="직접 입력">
										<select name="styleTag" class="styleTag tagBrand" onchange="document.getElementById('brand').value = this.options[this.selectedIndex].value">
											<option value="선택">-----</option>
											<option value="나이키">나이키</option>
											<option value="에이블린">에이블린</option>
											<option value="에잇세컨즈">에잇세컨즈</option>
											<option value="아디다스">아디다스</option>
											<option value="자라">자라</option>
										</select>&nbsp;&nbsp;&nbsp;
										<button type="button" class="styleTagBtn" onclick="styleTagBtn();">추가</button>
										<div class="tagArea"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>

	</section>
	<script>
		$(function(){
			console.log('사진1 : ' + $('#up1input').val());
		});
		
		function pic(){
			console.log('업로드사진1 : ' + $('#up1input').val());
		}
		
		function boardDelete(id){
			var qq = confirm('정말 삭제하시겠습니까?');
			if(qq == true){
				location.href = "boardDelete.do?b_num="+id;	
			}else{}
			
		}
	
	
		//게시글 태그 입력
		// 가져오기
		var tagnum = 1;
		
		$(function(){
			var hasharr="";
			var bnum = '<c:out value="${b.b_num}"/>';
			
			
			$.ajax({
				url:"getTag.do",
				data:{bnum:bnum},
				dataType:"JSON",
				success:function(data){
					if(data.length>0){
						for(var i=0; i<data.length; i++){
							var tag = '<div class="userTagDiv"><a href=\'Search.do?keyword='+data[i].b_hash+'\'>'  +  data[i].b_hash+'</a>&nbsp;&nbsp;&nbsp;<img src="resources/images/icon/menu/commentDelete.png" id="tag'+data[i].b_hash.substring(1)+'" onclick="tagDelete(id);"></div>';
							document.getElementById('hihi').innerHTML+= tag;
							hasharr += data[i].b_hash+',';
							tagnum++;
						}
						
						$('#hihi').scrollTop($('#hihi').prop('scrollHeight'));
						$('#hashArr').val(hasharr);
						console.log('11태그놈: ' + $('#hashArr').val());
					}
				},
				error:function(request,status,error){
					console.log("** error code : " + request.status + "\n"
						+ "message : " + request.responseText + "\n"
						+ "error : " + error);
				}
			});
		});
		
		
		function addhash(){
			var hasharr="";
			
			var extag = $('#hashArr').val();
		    var newtag = '#'+$('#hashtag').val();
		    
		    console.log('22태그추가: ' + extag + '/ ' + newtag);
		    console.log('존재0 노존재-1 : '+ extag.indexOf(newtag));

		    if(extag.indexOf(newtag) == -1){	// 태그가 없는 경우
				var tag = '<div class="userTagDiv"><a href=\'Search.do?keyword='+$('#hashtag').val()+'\'>'  +  '#'+$('#hashtag').val()+'</a>&nbsp;&nbsp;&nbsp;<img src="resources/images/icon/menu/commentDelete.png" id="tag'+$('#hashtag').val()+'" onclick="tagDelete(id);"></div>';
				document.getElementById('hihi').innerHTML+= tag;
				
				extag += '#'+$('#hashtag').val()+',';
				$('#hihi').scrollTop($('#hihi').prop('scrollHeight'));
				$('#hashArr').val(extag);
				
				console.log('2222추가태그놈: ' + $('#hashArr').val());
			
				$('#hashtag').val("");
		    }else{	// 태그 있는 경우
		    	alert('이미 등록된 태그입니다.');
		    }
		    
		}
		
		function insert(){
		
			 var fileCheck1 = document.getElementById("up1input").value;	 
			 var fileCheck2 = document.getElementById("up2input").value;	 
			 var fileCheck3 = document.getElementById("up3input").value;	 
			 var fileCheck4 = document.getElementById("up4input").value;	 
			 var fileCheck5 = document.getElementById("up5input").value;	 
			 
			 
			if((!fileCheck1)&&(!fileCheck2)&&(!fileCheck3)&&(!fileCheck4)&&(!fileCheck5)){
				
				alert("이미지 1개 이상은 필수입니다");

				return false;
				
			}else if((fileCheck1)&&(fileCheck2)&&(fileCheck3)&&(fileCheck4)&&(fileCheck5)){
				
				$('#uploadd').prop('disabled',false);
				return true;
			
			}
		}
		
		//사용자 태그 인풋
		// 가져오기
		$(function(){
			var hashar="";
			var bnum = '<c:out value="${b.b_num}"/>';
			console.log('비넘 : ' + bnum);
			$.ajax({
				url:"getTagUser.do",
				data:{bnum:bnum},
				dataType:"JSON",
				success:function(data){
					if(data.length>0){
						for(var i=0; i<data.length; i++){
							var tag = '<div class="userTagDiv"><a style="color:red;" href=\'Search.do?keyword='+data[i].b_name+'\'>'  +  '@'+data[i].b_name+'</a>&nbsp;&nbsp;&nbsp;<img src="resources/images/icon/menu/commentDelete.png" id="ut'+data[i].t_tagUnum+'" onclick="userTagDelete(id);"></div>';
							
							document.getElementById('hih2').innerHTML+= tag;
							
							hashar += data[i].t_tagUnum+',';
						
						}
						$('#hih2').scrollTop($('#hih2').prop('scrollHeight'));
						$('#hashArr2').val(hashar);
						
						console.log('1해시발 : ' + $('#hashArr2').val());
					}
				},
				error:function(request,status,error){
					console.log("** error code : " + request.status + "\n"
						+ "message : " + request.responseText + "\n"
						+ "error : " + error);
				}
			});
		});
		
		
		function addhash2(){
			
			var tagUser = $('#hashtag2').val();
			var tagUserArr = $('#hashArr2').val();
			var hashar="";
			
			$.ajax({
				url:"getTagUserNum.do",
				data:{tagUser:tagUser},
				success:function(data){	
					if(data != null){
						if($('#ut'+data).length == 0){
							if(Number(data)==0){
								alert('그 딴 사람없음');
							}
							else{
							var tag = '<div class="userTagDiv"><a style="color:red;" href=\'Search.do?keyword='+$('#hashtag2').val()+'\'>'  +  '@'+$('#hashtag2').val()+'</a>&nbsp;&nbsp;&nbsp;<img src="resources/images/icon/menu/commentDelete.png" id="ut'+data+'" onclick="userTagDelete(id);"></div>';
							
							document.getElementById('hih2').innerHTML+= tag;
							
							tagUserArr += data+',';
							$('#hih2').scrollTop($('#hih2').prop('scrollHeight'));
							$('#hashArr2').val(tagUserArr);
							
							console.log('2해시발 : ' + $('#hashArr2').val());
						
							$('#hashtag2').val("");
							}
						}else{
							alert('이미 태그 된 사용자입니다.');
						}
						
					}else{
						alert('일치하는 사용자를 찾을 수 없습니다.');
					}
				},
				error:function(request,status,error){
					console.log("** error code : " + request.status + "\n"
						+ "message : " + request.responseText + "\n"
						+ "error : " + error);
				}
			});
		}
		
		function userTagDelete(id){
			var deleteNum = id.substring(2);
			var tagArr = $('#hashArr2').val();
			var res = tagArr.replace(deleteNum+',', '');
			
			$('#'+id).parent().remove();
			$('#hashArr2').val(res);
			console.log('3해시발 : ' + $('#hashArr2').val());
			//console.log(id + " , " + deleteNum);
		}
		
		function tagDelete(id){
			console.log(id);
			var deleteNum = '#'+id.substring(3);
			var tagArr = $('#hashArr').val();
			var res = tagArr.replace(deleteNum+',', '');
			
			$('#'+id).parent().remove();
			$('#hashArr').val(res);
			console.log('33태그놈 : ' + $('#hashArr').val());
			//console.log(id + " , " + deleteNum);
		}
		
		
		
        function changeValue(html, $target) {
        	console.log(html.files.length);
        	if (html.files && html.files[0]) {
            	var reader = new FileReader();
                reader.onload = function (e) {
                    $target.attr('src',e.target.result);
                    $target.css({'width':'180px', 'height':'180px', 'margin':'0' });
                }
                reader.readAsDataURL(html.files[0]);
            }
        	pic();
        }

        /*iput태그 파일*/
        function uploadBtn(id){
            $('#'+id+'input').click();
        }

        var idnum = 77701;
       	
       	$(function(){
       		var btop = '<c:out value="${b.b_top}"/>';
       		var bbottom = '<c:out value="${b.b_bottom}"/>';
       		var bshoes = '<c:out value="${b.b_shoes}"/>';
       		var bacc = '<c:out value="${b.b_acc}"/>';
       		var betc = '<c:out value="${b.b_etc}"/>';
       		
       		if(btop.length > 0){
       			$('.tagArea').append('<div class="tag" id='+ idnum +'>'+
                        '<p class="clothes" id="top">top</p>'+
                        '<p class="brand">'+ btop +'</pv>'+
                        '<div class="deleteStyleTag"><img src="resources/images/post/close.png"></div>'+
                        '<input type="hidden" value="top" />' +	
                        '<input type="hidden" name="b_top" value='+ btop + ' />' +	
                    '</div>');
       			idnum++;
       		}
       		if(bbottom.length > 0){
       			$('.tagArea').append('<div class="tag" id='+ idnum +'>'+
                        '<p class="clothes" id="bottom">bottom</p>'+
                        '<p class="brand">'+ bbottom +'</pv>'+
                        '<div class="deleteStyleTag"><img src="resources/images/post/close.png"></div>'+
                        '<input type="hidden" value="bottom" />' +	
                        '<input type="hidden" name="b_bottom" value='+ bbottom + ' />' +	
                    '</div>');
       			idnum++;
       		}
       		if(bshoes.length > 0){
       			$('.tagArea').append('<div class="tag" id='+ idnum +'>'+
                        '<p class="clothes" id="shoes">shoes</p>'+
                        '<p class="brand">'+ bshoes +'</pv>'+
                        '<div class="deleteStyleTag"><img src="resources/images/post/close.png"></div>'+
                        '<input type="hidden" value="shoes" />' +	
                        '<input type="hidden" name="b_shoes" value='+ bshoes + ' />' +	
                    '</div>');
       			idnum++;
       		}
       		if(bacc.length > 0){
       			$('.tagArea').append('<div class="tag" id='+ idnum +'>'+
                        '<p class="clothes" id="acc">acc</p>'+
                        '<p class="brand">'+ bacc +'</pv>'+
                        '<div class="deleteStyleTag"><img src="resources/images/post/close.png"></div>'+
                        '<input type="hidden" value="acc" />' +	
                        '<input type="hidden" name="b_acc" value='+ bacc + ' />' +	
                    '</div>');
       			idnum++;
       		}
       		if(betc.length > 0){
       			$('.tagArea').append('<div class="tag" id='+ idnum +'>'+
                        '<p class="clothes" id="etc">etc</p>'+
                        '<p class="brand">'+ betc +'</pv>'+
                        '<div class="deleteStyleTag"><img src="resources/images/post/close.png"></div>'+
                        '<input type="hidden" value="etc" />' +	
                        '<input type="hidden" name="b_etc" value='+ betc + ' />' +	
                    '</div>');
       			idnum++;
       		}
       		
       	});

        function styleTagBtn(){
            var clothes = document.getElementById('clothes').value;
            var brand = document.getElementById('brand').value;
            
            if($('#'+clothes).length > 0){
            	 alert('이미 등록된 스타일태그입니다.');
                
            }else{
               
				var name ="";
                
                if(clothes == "top"){
                	name = "b_top";
                }else if(clothes == "bottom"){
                	name = "b_bottom";
                }else if(clothes == "shoes"){
                	name = "b_shoes";
                }
                else if(clothes == "shoes"){
                	name = "b_shoes";
                }else if(clothes == "acc"){
                	name = "b_acc";
                }else if(clothes == "etc"){
                	name = "b_etc";
                }

                if(brand.length > 0){
                	
                    $('.tagArea').append('<div class="tag" id='+ idnum +'>'+
                                            '<p class="clothes" id="'+clothes+'">'+ clothes +'</p>'+
                                            '<p class="brand">'+ brand +'</pv>'+
                                            '<div class="deleteStyleTag"><img src="resources/images/post/close.png"></div>'+
                                            '<input type="hidden" value='+ clothes + ' />' +	
                                            '<input type="hidden" name='+ name +' value='+ brand + ' />' +	
                                        '</div>');
                    idnum++;
                }else{
                    alert("옷 정보를 입력해주세요.");
                }
            }
            
        }

        $(document).on("click", ".deleteStyleTag", function (e) {
            $(this).parent().remove();
        });
    </script>
</body>
</html>