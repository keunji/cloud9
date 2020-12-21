<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>lml_Post_Style</title>

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
			<form action="stylePostUpload.do" method="post"
				enctype="multipart/form-data"  onsubmit="return insert()">
				<button id="uploadd" type="submit" class="uploadBtn1" >업로드</button>
				<div class="Atable">
					<div class="Abox">
						<div class="post-div">
							<input type="hidden" name="b_user_num"
								value="${loginUser.user_num}" />
							<div class="div-img">
								<div class="post-img">스타일 이미지</div>

								<div class="post-img-div">
									<div class="img-upload1" id="preview1">
										<input type="file" id="up1input" name="bUploadImg1" class="uploadImg" onchange="changeValue(this,$('#up1'))"  accept="image/*" />
                                    	<img class="img-upload-icon" id="up1" src="resources/images/post/imgPlusIcon.png" onclick="uploadBtn(this.id);"/>
                                    	<!-- multiple="multiple"  -->
									</div>
									<div class="img-upload1" id="preview2">
										<input type="file" id="up2input" name="bUploadImg2" class="uploadImg" onchange="changeValue(this,$('#up2'))"  accept="image/*" />
                                    	<img class="img-upload-icon" id="up2" src="resources/images/post/imgPlusIcon.png" onclick="uploadBtn(this.id);"/>
									</div>
									<div class="img-upload1" id="preview3">
										<input type="file" id="up3input" name="bUploadImg3" class="uploadImg" onchange="changeValue(this,$('#up3'))"  accept="image/*" />
                                    	<img class="img-upload-icon" id="up3" src="resources/images/post/imgPlusIcon.png" onclick="uploadBtn(this.id);"/>
									</div>
									<div class="img-upload1" id="preview4">
										<input type="file" id="up4input" name="bUploadImg4" class="uploadImg" onchange="changeValue(this,$('#up4'))"  accept="image/*" />
                                    	<img class="img-upload-icon" id="up4" src="resources/images/post/imgPlusIcon.png" onclick="uploadBtn(this.id);"/>
									</div>
									<div class="img-upload1" id="preview5">
										<input type="file" id="up5input" name="bUploadImg5" class="uploadImg" onchange="changeValue(this,$('#up5'))"  accept="image/*" />
                                    	<img class="img-upload-icon" id="up5" src="resources/images/post/imgPlusIcon.png" onclick="uploadBtn(this.id);"/>
									</div>
									
								</div>
							</div>
							<div class="div-cont">
								<div class="post-cont">설명</div>
								<div class="post-cont-div">
									<div id="cont-write" class="cont-write">
										<textarea id="b_content" name="b_content" placeholder="내용을 입력해주세요" required="required"></textarea>
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
									
									<div id="hih2" style="width: 250px; height: 100px; margin-left: 332px;  border: solid 1px gainsboro;
																	 overflow-y: scroll;">
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
	   /**
     * 중복서브밋 방지
     * 
     * @returns {Boolean}
     */
  
	//게시글 태그 입력
	
		var content = document.getElementById('b_content').innerHTML;
		var splitedArray = content.split(' ');
		var linkedContent = '';
		
		for(var word in splitedArray) {
			word = splitedArray[word];
			
	 	  	var ab = word.replace("#",""); 
		   	if(word.indexOf('#') == 0){
			   word = '<a style=" margin-right: 9px;" href=\'Search.do?keyword='+ab+'\'>'+word+'</a>';
		   	}
		   	
		   	linkedContent += word+' ';
		}
		
		
		
		document.getElementById('hihi').innerHTML = linkedContent; 
			
		var hasharr="";
		
		function addhash(){
			var tag = '<a href=\'Search.do?keyword='+$('#hashtag').val()+'\'>'  +  '#'+$('#hashtag').val()+'</a><br>';
			
			document.getElementById('hihi').innerHTML+= tag;
			
			hasharr += '#'+$('#hashtag').val()+',';
			console.log("제이쿼리는들어가? " + hasharr);
			$('#hihi').scrollTop($('#hihi').prop('scrollHeight'));
			$('#hashArr').val(hasharr);
		
			$('#hashtag').val("");
		}
		
		function insert(){
		
			 var fileCheck1 = document.getElementById("up1input").value;	 
			 var fileCheck2 = document.getElementById("up2input").value;	 
			 var fileCheck3 = document.getElementById("up3input").value;	 
			 var fileCheck4 = document.getElementById("up4input").value;	 
			 var fileCheck5 = document.getElementById("up5input").value;	 
			 const content2 = document.getElementById('q_content');
				
				if(!up1input && (!up2input||!up3input||!up4input||!up5input)){
					alert("제일 왼쪽에 있는 이미지를 등록해주셔야합니다.");
					return false;
				}else if(!(content2.value.length>0)){
					alert("질문 내용을 입력해주세요.");
					return false;
				}else{
					alert("등록");
					$('#uploadd').prop('disabled',false);
					return true;
				}
		}
		
		//사용자 태그 인풋
		
		var content = document.getElementById('b_content').innerHTML;
		var splitedArray = content.split(' ');
		var linkedContent = '';
		
		for(var word in splitedArray) {
			word = splitedArray[word];
	 	  	var ab = word.replace("@",""); 
	 	  	
		   	if(word.indexOf('@') == 0){
			   word = '<a style=" margin-right: 9px;" href=\'Search.do?keyword='+ab+'\'>'+word+'</a>';
		   	}
		   	
		   	linkedContent += word+' ';
		}
		
		
		document.getElementById('hih2').innerHTML = linkedContent; 
			
		var hashar="";
		
		function addhash2(){
			
			var tagUser = $('#hashtag2').val();
			
			$.ajax({
				url:"getTagUserNum.do",
				data:{tagUser:tagUser},
				success:function(data){	
					if(data != null){
						console.log('사람있음 : ' + data);
						if($('#ut'+data).length == 0){
							if(Number(data)==0){
								alert('그 딴 사람없음');
							}
							else{
							var tag = '<div class="userTagDiv"><a style="color:red;" href=\'Search.do?keyword='+$('#hashtag2').val()+'\'>'  +  '@'+$('#hashtag2').val()+'</a>&nbsp;&nbsp;&nbsp;<img src="resources/images/icon/menu/commentDelete.png" id="ut'+data+'" onclick="userTagDelete(id);"></div>';
							
							document.getElementById('hih2').innerHTML+= tag;
							
							//hashar += '@'+$('#hashtag2').val()+',';
							hashar += data+',';
							$('#hih2').scrollTop($('#hih2').prop('scrollHeight'));
							$('#hashArr2').val(hashar);
						
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
        }

        /*iput태그 파일*/
        function uploadBtn(id){
            $('#'+id+'input').click();
        }

        var idnum = 77701;

        function styleTagBtn(){
            var clothes = document.getElementById('clothes').value;
            var brand = document.getElementById('brand').value;
            
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
                                        '<p class="clothes">'+ clothes +'</p>'+
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

        $(document).on("click", ".deleteStyleTag", function (e) {
            $(this).parent().remove();
        });
    </script>
</body>
</html>