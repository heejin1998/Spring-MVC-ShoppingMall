package com.board.service;

import java.util.List;

import com.board.domain.BoardVO;
import com.board.domain.Criteria;

public interface BoardService {
	//Write a post
	public void write(BoardVO boardVO) throws Exception;
	
	// Post list lookup
	public List<BoardVO> list(Criteria cri) throws Exception;
	
	// Post list_Toys lookup
	public List<BoardVO> list_Toys(Criteria cri) throws Exception;
	
	// Post list_Clothes lookup
	public List<BoardVO> list_Clothes(Criteria cri) throws Exception;
		
	// Post list_Fruits lookup
	public List<BoardVO> list_Fruits(Criteria cri) throws Exception;
	
	// Post list_Electronics lookup
	public List<BoardVO> list_Electronics(Criteria cri) throws Exception;
	
	// Count Total number of bulletin boards
	public int listCount() throws Exception;
	
	// Count number of posts in the category
	public int listCount2(String category) throws Exception;
	
	// View Posts
	public BoardVO read(int id) throws Exception;
	
	// Post Edit
	public void update(BoardVO boardVO) throws Exception;
		
	// Delete a post
	public void delete(int id) throws Exception;
}