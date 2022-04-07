package com.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.BoardVO;
import com.board.domain.Criteria;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	//Write a post
	@Override
	public void write(BoardVO boardVO) throws Exception {
		sqlSession.insert("boardMapper.insert", boardVO);
	}
	// Post list lookup
	@Override
	public List<BoardVO> list(Criteria cri) throws Exception{
		
		return sqlSession.selectList("boardMapper.listPage", cri);
	}
	
	// Post list_Toys lookup
	@Override
	public List<BoardVO> list_Toys(Criteria cri) throws Exception{
		return sqlSession.selectList("boardMapper.listPage_Toys", cri);
	}
		
	// Post list_Clothes lookup
	@Override
	public List<BoardVO> list_Clothes(Criteria cri) throws Exception{
		return sqlSession.selectList("boardMapper.listPage_Clothes", cri);
	}
	
	
	// Post list_Fruits lookup
	@Override
	public List<BoardVO> list_Fruits(Criteria cri) throws Exception{
		return sqlSession.selectList("boardMapper.listPage_Fruits", cri);
	}
		
	// Post list_Electronics lookup
	@Override
	public List<BoardVO> list_Electronics(Criteria cri) throws Exception{
		return sqlSession.selectList("boardMapper.listPage_Electronics", cri);
	}
	
	// Count Total number of bulletin boards
	public int listCount() throws Exception{
		return sqlSession.selectOne("boardMapper.listCount");
	}
	
	// Count Total number of bulletin boards
	public int listCount2(String category) throws Exception{
		return sqlSession.selectOne("boardMapper.listCount2", category);
	}
	
	// View Posts
	@Override
	public BoardVO read(int id) throws Exception{
		return sqlSession.selectOne("boardMapper.read", id);
	}
	
	// Post Edit
	@Override
	public void update(BoardVO boardVO) throws Exception{
		sqlSession.update("boardMapper.update", boardVO);
	}
		
	// Delete a post
	@Override
	public void delete(int id) throws Exception{
		sqlSession.delete("boardMapper.delete", id);
	}
	
	// Bulletin Board Views
	public void boardClick(int id) throws Exception{
		sqlSession.update("boardMapper.boardClick", id);
	}
}