package multi.semi.board;


import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import multi.semi.login.LoginVO;


@Controller
public class BoardController {
	
	@Autowired
	BoardDAO dao;
	
	// board list
	@RequestMapping(value="/board", method=RequestMethod.GET)
	public ModelAndView boardList(SearchVO paging){
		ModelAndView mv = new ModelAndView();
		
		System.out.println(paging.getType()+" - "+paging.getWord());
		
		List<BoardVO> list = dao.boardList(paging);
		mv.addObject("list", list);
		
		int cntlist = dao.cntList(paging);
		paging.settingPage(cntlist);
		mv.addObject("paging", paging);
		
		mv.setViewName("board/board");
		return mv;
	}
	
	// write
	@RequestMapping("/boardwrite")
	public String boardWrite(HttpSession httpsession) {
		LoginVO user = (LoginVO) httpsession.getAttribute("member");
		System.out.println(user);
		
		if(user == null) {
			return "redirect:/";
		}
		
		return "board/boardwrite";
	}
	
	// insert content
	@RequestMapping(value="/boardinsert", method=RequestMethod.POST)
	public String boardInsert(HttpSession httpsession, BoardVO board) {
		board.setBoard_content(board.getBoard_content().replace("\r\n", "<br>"));
		
		System.out.println("[ boardinsert ]"+board);
		dao.boardInsert(board);
		
		return "redirect:/board";
	}
	
	// detail
	@RequestMapping(value="/boarddetail", method=RequestMethod.GET)
	public ModelAndView boardDetail(BoardVO board){
		ModelAndView mv = new ModelAndView();
		
		board = dao.selectOne(board.getBoard_num());
		// board_cnt +1
		dao.plusCnt(board);
		board = dao.selectOne(board.getBoard_num());
		
		mv.addObject("board", board);
		
		mv.setViewName("board/boarddetail");
		return mv;
	}
	
	// modify
	@RequestMapping(value="/boardmodify", method= RequestMethod.GET)
	public ModelAndView boardModify(BoardVO board) {
		ModelAndView mv = new ModelAndView();
		System.out.println("[ modify GET Method ]"+board);
		System.out.println("board_content : "+board.getBoard_content());
		board.setBoard_content(board.getBoard_content().replace("<br>", "\r\n"));
		mv.addObject("board", board);
		
		mv.setViewName("board/boardmodify");
		return mv;
	}
	
	// update
	@RequestMapping(value="/boardmodify", method = RequestMethod.POST)
	public String boardUpdate(BoardVO board) {
		System.out.println("[ modify POST Method ]"+board);
		BoardVO db_board = dao.selectOne(board.getBoard_num());
		db_board.setBoard_title(board.getBoard_title());
		db_board.setBoard_content(board.getBoard_content().replace("\r\n", "<br>"));
		db_board.setBoard_cnt(db_board.getBoard_cnt()-1);
		dao.boardUpdate(db_board);
		
		return "redirect:/boarddetail?board_num="+db_board.getBoard_num();
	}
	
	// delete
	@RequestMapping("/boarddelete")
	public String boardDelete(int board_num) {
		dao.boardDelete(board_num);
		
		return "redirect:/board";
	}
}
