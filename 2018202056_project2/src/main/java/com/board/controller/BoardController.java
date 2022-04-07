package com.board.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.service.BoardService;
import com.board.service.ReplyService;
import com.board.domain.BoardVO;
import com.board.domain.Criteria;
import com.board.domain.PageMaker;
import com.board.domain.ReplyVO;








@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService service;
	
	@Inject
	ReplyService replyService;
	
	// Bulletin board writing screen
	@RequestMapping(value = "/board/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception{
		logger.info("writeView");
		
	}
	// Write a bulletin board
	@RequestMapping(value = "/board/write", method = RequestMethod.POST)
	public String write(BoardVO boardVO) throws Exception{
		logger.info("write");
		String category = boardVO.getCategory();
		
		service.write(boardVO);
		
		return "redirect:/board/list_"+category;
	}
		
	// Bulletin board list inquiry
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, Criteria cri) throws Exception{
		logger.info("list");
		
		model.addAttribute("list",service.list(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCount());
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "board/list";
	}
		
	// Post list_Toys lookup
	@RequestMapping(value = "/list_Toys", method = RequestMethod.GET)
	public String list_Toys(Model model, Criteria cri) throws Exception{
		logger.info("list_Toys");
		
		model.addAttribute("list_Toys",service.list_Toys(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		String category = "Toys";
		pageMaker.setTotalCount(service.listCount2("Toys"));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "board/list_Toys";
	}
		
	// Post list_Clothes lookup
	@RequestMapping(value = "/list_Clothes", method = RequestMethod.GET)
	public String list_Clothes(Model model, Criteria cri) throws Exception{
		logger.info("list_Clothes");
		
		model.addAttribute("list_Clothes",service.list_Clothes(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCount2("Clothes"));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "board/list_Clothes";
	}
	
	// Post list_Fruits lookup
	@RequestMapping(value = "/list_Fruits", method = RequestMethod.GET)
	public String list_Fruits( Model model, Criteria cri) throws Exception{
		logger.info("list_Fruits");
		
		model.addAttribute("list_Fruits",service.list_Fruits(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCount2("Fruits"));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "board/list_Fruits";
	}
	
	// Post list_Electronics lookup
	@RequestMapping(value = "/list_Electronics", method = RequestMethod.GET)
	public String list_Electronics( Model model, Criteria cri) throws Exception{
		logger.info("list_Electronics");
		
		model.addAttribute("list_Electronics",service.list_Electronics(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.listCount2("Electronics"));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "board/list_Electronics";
	}
	
	// View post
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(BoardVO boardVO, Model model) throws Exception{
		logger.info("read");
		
		model.addAttribute("read", service.read(boardVO.getId()));
		
		List<ReplyVO> replyList = replyService.readReply(boardVO.getId());
		model.addAttribute("replyList", replyList);
		
		return "board/readView";
	}
	
	// Post Edit View
	@RequestMapping(value = "/updateView", method = RequestMethod.GET)
	public String updateView(BoardVO boardVO, Model model) throws Exception{
		logger.info("updateView");
		
		model.addAttribute("update", service.read(boardVO.getId()));
		
		return "board/updateView";
	}
	
	// Post Edit
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(BoardVO boardVO) throws Exception{
		
		logger.info("update");
		String category = boardVO.getCategory();
		service.update(boardVO);
		
		
		return "redirect:/board/list_"+category;
	}

	// Delete a Post
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(BoardVO boardVO) throws Exception{
		
		logger.info("delete");
		service.delete(boardVO.getId());
		
		return "redirect:/board/list";
	}
	
	// Write comment
	@RequestMapping(value="board/replyWrite", method = RequestMethod.POST)
	public String replyWrite(ReplyVO vo,  RedirectAttributes rttr) throws Exception {
		logger.info("reply Write");
		
		replyService.writeReply(vo);
		
		rttr.addAttribute("id", vo.getId());
		
		return "redirect:/board/readView";
	}
	


}
