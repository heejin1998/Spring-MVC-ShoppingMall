package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.board.dao.BoardDAO;
import com.board.domain.BoardVO;
import com.board.domain.Criteria;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO dao;
	
	// write a post
	@Override
	public void write(BoardVO boardVO) throws Exception {
		dao.write(boardVO);
	}
	
	// Post list lookup
	@Override
	public List<BoardVO> list(Criteria cri) throws Exception{
		return dao.list(cri);
	}
	
	// Post list_Toys lookup
	@Override
	public List<BoardVO> list_Toys(Criteria cri) throws Exception{
		return dao.list_Toys(cri);
	}
	
	// Post list_Clothes lookup
	@Override
	public List<BoardVO> list_Clothes(Criteria cri) throws Exception{
		return dao.list_Clothes(cri);
	}
	
	// Post list_Fruits lookup
	@Override
	public List<BoardVO> list_Fruits(Criteria cri) throws Exception{
		return dao.list_Fruits(cri);
	}
	
	// Post list_Electronics lookup
	@Override
	public List<BoardVO> list_Electronics(Criteria cri) throws Exception{
		return dao.list_Electronics(cri);
	}
	
	// Count Total number of bulletin boards
	@Override
	public int listCount() throws Exception{
		return dao.listCount();
	}
	
	// Count number of posts in the category
	@Override
	public int listCount2(String category) throws Exception{
		return dao.listCount2(category);
	}
	
	// View Posts
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO read(int id) throws Exception{
		dao.boardClick(id);
		return dao.read(id);
	}
	
	// Post Edit
	@Override
	public void update(BoardVO boardVO) throws Exception{
		dao.update(boardVO);
	}
			
	// Delete a post
	@Override
	public void delete(int id) throws Exception{
		dao.delete(id);
	}

}