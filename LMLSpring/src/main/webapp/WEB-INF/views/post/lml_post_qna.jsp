<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>lml_QnA_Style</title>

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
			<form action="styleQnaUpload.do" method="post"
				enctype="multipart/form-data">
				<button type="submit" class="uploadBtn" onclick="return insert();">업로드</button>
				<div class="Atable">
					<div class="Abox">
						<div class="post-div">
							<input type="hidden" name="q_user_num"
								value="${loginUser.user_num}" />
							<div class="div-img">
								<div class="post-img">QNA 이미지</div>

								<div class="post-img-div">
									<div class="img-upload1" id="preview1">
										<input type="file" id="up1input" name="qUploadImg1"
											class="uploadImg" onchange="changeValue(this,$('#up1'))"
											accept="image/*" /> <img class="img-upload-icon" id="up1"
											src="resources/images/post/imgPlusIcon.png"
											onclick="uploadBtn(this.id);" />
										<!-- multiple="multiple"  -->
									</div>
									<div class="img-upload1" id="preview2">
										<input type="file" id="up2input" name="qUploadImg2"
											class="uploadImg" onchange="changeValue(this,$('#up2'))"
											accept="image/*" /> <img class="img-upload-icon" id="up2"
											src="resources/images/post/imgPlusIcon.png"
											onclick="uploadBtn(this.id);" />
									</div>
									<div class="img-upload1" id="preview3">
										<input type="file" id="up3input" name="qUploadImg3"
											class="uploadImg" onchange="changeValue(this,$('#up3'))"
											accept="image/*" /> <img class="img-upload-icon" id="up3"
											src="resources/images/post/imgPlusIcon.png"
											onclick="uploadBtn(this.id);" />
									</div>
									<div class="img-upload1" id="preview4">
										<input type="file" id="up4input" name="qUploadImg4"
											class="uploadImg" onchange="changeValue(this,$('#up4'))"
											accept="image/*" /> <img class="img-upload-icon" id="up4"
											src="resources/images/post/imgPlusIcon.png"
											onclick="uploadBtn(this.id);" />
									</div>
									<div class="img-upload1" id="preview5">
										<input type="file" id="up5input" name="qUploadImg5"
											class="uploadImg" onchange="changeValue(this,$('#up5'))"
											accept="image/*" /> <img class="img-upload-icon" id="up5"
											src="resources/images/post/imgPlusIcon.png"
											onclick="uploadBtn(this.id);" />
									</div>
								</div>
							</div>
							<div class="div-cont">
								<div class="post-cont">질문 내용</div>
								<div class="post-cont-div">
									<div id="cont-write" class="cont-write">
										<textarea id="q_content" name="q_content"
											placeholder="내용을 입력해주세요" required></textarea>
									</div>
								</div>
								<div id="post-cont" style="display: flex;">
									<h5 style="padding-left: 10px;">게시글 태그</h5>
									<h5 style="padding-left: 507px;">사용자 태그</h5>
								</div>
								<div style="display: -webkit-inline-box;">
									<div id="hihi"
										style="width: 250px; height: 100px; border: solid 1px gainsboro; overflow-y: scroll;">
									</div>

									<div class="post-cont-div1"
										style="padding-top: 25px; padding-left: 20px;">
										<!-- <form action="#" id="tag" method="post"> -->
										<input type="text" class="tagtag" autocomplete=”off”
											id="hashtag" size="7" placeholder="게시글 태그입력" /> <input
											type="hidden" id="hashArr" name="b_hash" value="" />
										<button type="button" class="tagbtn" id="tagbtn"
											onclick="addhash();">태그 등록</button>
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
		var doubleSubmitFlag = false;
		function doubleSubmitCheck() {
			if (doubleSubmitFlag) {
				return doubleSubmitFlag;
			} else {
				doubleSubmitFlag = true;
				return false;
			}
		}

		function insert() {
			//if (doubleSubmitCheck())
			//	return false;
			const up1input = document.getElementById('up1input').value;
			const up2input = document.getElementById('up2input').value;
			const up3input = document.getElementById('up3input').value;
			const up4input = document.getElementById('up4input').value;
			const up5input = document.getElementById('up5input').value;
			const content2 = document.getElementById('q_content');

			if (!up1input && (!up2input || !up3input || !up4input || !up5input)) {
				alert("제일 왼쪽에 있는 이미지를 등록해주셔야합니다.");
				return false;
			} else if (!(content2.value.length > 0)) {
				alert("질문 내용을 입력해주세요.");
				return false;
			} else {
				alert("등록");
				$('#uploadd').prop('disabled', false);
				return true;
			}
		}

		var content = document.getElementById('q_content').innerHTML;
		var splitedArray = content.split(' ');
		var linkedContent = '';

		for ( var word in splitedArray) {
			word = splitedArray[word];
			var ab = word.replace("#", "");
			if (word.indexOf('#') == 0) {
				word = '<a href=\'Search.do?keyword=' + ab + '\'>' + word
						+ '</a>';
			}

			linkedContent += word + ' ';
		}

		document.getElementById('hihi').innerHTML = linkedContent;

		var hasharr = "";

		function addhash(){
			var tag = '<a href=\'Search.do?keyword='+$('#hashtag').val()+'\'>'  +  '#'+$('#hashtag').val()+'</a><br>';
			
			document.getElementById('hihi').innerHTML+= tag;
			
			hasharr += '#'+$('#hashtag').val()+',';
			console.log("제이쿼리는들어가? " + hasharr);
			$('#hihi').scrollTop($('#hihi').prop('scrollHeight'));
			$('#hashArr').val(hasharr);
		
			$('#hashtag').val("");
		}
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
		function changeValue(html, $target) {
			console.log(html.files.length);
			if (html.files && html.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$target.attr('src', e.target.result);
					$target.css({
						'width' : '180px',
						'height' : '180px',
						'margin' : '0'
					});
				}
				reader.readAsDataURL(html.files[0]);
			}
		}

		/*iput태그 파일*/
		function uploadBtn(id) {
			$('#' + id + 'input').click();
		}

		var idnum = 77701;
	</script>
</body>
</html>