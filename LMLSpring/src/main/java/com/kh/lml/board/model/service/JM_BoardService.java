package com.kh.lml.board.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.lml.board.model.vo.Board;
public interface JM_BoardService {


	ArrayList<Board> followingpost(int usernum);



	ArrayList<Board> bodyselectpost(Map<String, String> map);
	
}
