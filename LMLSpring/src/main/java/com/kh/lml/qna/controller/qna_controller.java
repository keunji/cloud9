package com.kh.lml.qna.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonIOException;
import com.kh.lml.qna.Service.qnaService;
import com.kh.lml.qna.vo.qnaBoard;
import com.kh.lml.qna.vo.qnaComment;

@SessionAttributes("loginUser")
@Controller
public class qna_controller {

	@Autowired
	private qnaService qService;

	@RequestMapping("styleQnaUpload.do")
	public String insertQnaPost(qnaBoard q, MultipartHttpServletRequest request,
			@RequestParam(value="qUploadImg1", required=false) MultipartFile file1,
			@RequestParam(value="qUploadImg2", required=false) MultipartFile file2,
			@RequestParam(value="qUploadImg3", required=false) MultipartFile file3,
			@RequestParam(value="qUploadImg4", required=false) MultipartFile file4,
			@RequestParam(value="qUploadImg5", required=false) MultipartFile file5) {	

		MultipartFile[] fileList = {file1,file2,file3,file4,file5};
		String[] renameFileList = new String[5];
		if(fileList[0].getOriginalFilename().equals("")) {
			renameFileList[0] = "ClipartKey_317802201201150215.png";
		}else {
			for(int i = 0; i < fileList.length; i++) {
				if(!fileList[i].getOriginalFilename().equals("")) {
					String renameFileName = saveFile(fileList[i],request);

					if(renameFileName != null) { 
						q.setOriginalFileName(fileList[i].getOriginalFilename());
						q.setRenameFileName(renameFileName);

						renameFileList[i] = renameFileName;

					}else {
						renameFileList[i] = null;
					}
				}
			}
		}



		q.setImage1(renameFileList[0]);
		q.setImage2(renameFileList[1]);
		q.setImage3(renameFileList[2]);
		q.setImage4(renameFileList[3]);
		q.setImage5(renameFileList[4]);
		/*
		 * VALUES(QNABOARD_SEQ.NEXTVAL, #{q_user_num}, #{q_content}, DEFAULT, SYSDATE, #{image1}, #{image2}, #{image3}, #{image4}, #{image5})
		 */
		int result = qService.insertStylePost(q);
		System.out.println("result : " + result);
		int getqnum = qService.getqnum();

		String b_hash =q.getq_hash();
		String[] slist = b_hash.split(",");

		if(b_hash.length() > 0) {
			for(int i=0; i<slist.length; i++){
				qnaBoard qo = new qnaBoard();
				qo.setq_num(getqnum);
				qo.setq_hash(slist[i].toString());

				qService.insertStyleHash(qo);
			}
		}
		if(result > 0) {
			System.out.println("글쓰기 성공");
			/* return "../../index"; */
			return "minwoo/qnaPage";
		}else {
			System.out.println("글쓰기 실패");
			return "../../index";
		}
	}
	private String saveFile(MultipartFile file, HttpServletRequest request) {

		String root = request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "\\quploadFiles";

		File folder = new File(savePath);

		if(!folder.exists()) { // 폴더가 있는지 없는지
			folder.mkdirs(); // 폴더가 없다면 생성한다.
		}

		// 파일명을 rename 과정을 추가 => "년월일시분초.확장자"로 변경
		String originalFileName = file.getOriginalFilename();

		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss"); 

		String renameFileName = originalFileName.substring(0, originalFileName.lastIndexOf(".")) + sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
				+ originalFileName.substring(originalFileName.lastIndexOf(".")+1);

		String renamePath = folder + "\\" + renameFileName; // 실제 저장될 파일 경로 + 파일명

		try {
			file.transferTo(new File(renamePath)); // 전달받은 file이 rename명으로 이 때 파일이 저장된다.
		}catch(Exception e) {
			System.out.println("파일 전송 에러" + e.getMessage());
		}

		return renameFileName;
	}

	// 인덱스 메인
	@ResponseBody
	@RequestMapping(value="qnaIndexAjax.do", produces="application/json; charset=UTF-8")
	public String index1(HttpServletResponse response) throws JsonIOException, JsonProcessingException{

		ArrayList<qnaBoard> list = qService.selectList();

		ObjectMapper mapper = new ObjectMapper();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		mapper.setDateFormat(sdf);

		String jsonStr = mapper.writeValueAsString(list);

		return jsonStr;
	}

	@RequestMapping("qnaPage.do")
	public String qnaPage() {
		System.out.println("qnaPage로 이동");
		return "minwoo/qnaPage";
	}

	// 디테일
	@ResponseBody
	@RequestMapping(value="qnaDetail.do", produces="application/json; charset=UTF-8")
	public String qnaDetail(HttpServletResponse response, int qnum) throws JsonIOException, JsonProcessingException{

		ArrayList<qnaBoard> list = qService.selectOne(qnum);

		ObjectMapper mapper = new ObjectMapper();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		mapper.setDateFormat(sdf);

		String jsonStr = mapper.writeValueAsString(list);
		return jsonStr;
	}

	// 좋아요 불러오기
	@ResponseBody
	@RequestMapping(value="qnaHeart.do", produces="application/json; charset=UTF-8")
	public String qnaHeart(HttpServletResponse response, int unum) throws JsonIOException, JsonProcessingException{

		ArrayList<qnaComment> list = qService.qnaHeartList(unum);

		ObjectMapper mapper = new ObjectMapper();

		String jsonStr = mapper.writeValueAsString(list);

		return jsonStr;
	}
	// 좋아요 등록
	@ResponseBody
	@RequestMapping(value="qnaAddHeart.do")
	public String qnaAddHeart(int qnum, int unum) {

		qnaBoard q = new qnaBoard(qnum, unum);

		int result = qService.addHeart(q);

		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	// 좋아요 취소
		@ResponseBody
		@RequestMapping(value="qnaDelHeart.do")
		public String qnaDelHeart(int qnum, int unum) {
		
			qnaBoard q = new qnaBoard(qnum, unum);
		
			int result = qService.deleteHeart(q);
		
			if(result > 0) {
				return "success";
			}else {
				return "fail";
			}
		}
		// 디테일 해쉬태그 불러오기
		@ResponseBody
		@RequestMapping(value="qnaDetailHash.do", produces="application/json; charset=UTF-8")
		public String qnaDetailHash(HttpServletResponse response, int qnum) throws JsonIOException, JsonProcessingException{
			
			ArrayList<String> list = qService.selectHash(qnum);
			System.out.println("해시태그 리스트입니다. : " + list);
			ObjectMapper mapper = new ObjectMapper();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			mapper.setDateFormat(sdf);
			
			String jsonStr = mapper.writeValueAsString(list);
			
			return jsonStr;
		}
		
		// 좋아요 불러오기
		@ResponseBody
		@RequestMapping(value="qnaDetailHeart.do", produces="application/json; charset=UTF-8")
		public String qnaDetailHeart(HttpServletResponse response, int qnum) throws JsonIOException, JsonProcessingException{
			
			ArrayList<qnaBoard> list = qService.getDetailHeart(qnum);
			
			ObjectMapper mapper = new ObjectMapper();
			
			String jsonStr = mapper.writeValueAsString(list);
			
			return jsonStr;
		}
		// 디테일 댓글 불러오기
		@ResponseBody
		@RequestMapping(value="qnaDetailComm.do", produces="application/json; charset=UTF-8")
		public String qnaDetailComm(HttpServletResponse response, int qnum) throws JsonIOException, JsonProcessingException{
			
			ArrayList<qnaComment> list = qService.selectComment(qnum);
			
			ObjectMapper mapper = new ObjectMapper();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			mapper.setDateFormat(sdf);
			
			String jsonStr = mapper.writeValueAsString(list);
			
			return jsonStr;
		}
		// 댓글 등록
		@ResponseBody
		@RequestMapping(value="qnaComment.do")
		public String qnaComment(String comment, int unum, int qnum) {
		
			qnaComment cm = new qnaComment(qnum, comment, unum);
		
			int result = qService.addComment(cm);
		
			//int result = mService.followBtn(f);
		
			if(result > 0) {
				return "success";
			}else {
				return "fail";
			}
		}
		// 댓글 삭제
		@ResponseBody
		@RequestMapping(value="qnaCommentDelete.do")
		public String CommentDelete(int cno) {
		
			int result = qService.deleteComment(cno);
		
			if(result > 0) {
				return "success";
			}else {
				return "fail";
			}
		}
}
