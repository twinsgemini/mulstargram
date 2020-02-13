package multi.semi.board;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class BoardController {
	
	@Autowired
	BoardDAO dao;
	
	
	@RequestMapping(value="/board", method=RequestMethod.GET)
	public ModelAndView boardList(PagingVO paging){
		ModelAndView mv = new ModelAndView();
		
		List<BoardVO> list = dao.boardList(paging);
		mv.addObject("list", list);
		
		int cntlist = dao.cntList();
		paging.settingPage(cntlist);
		mv.addObject("paging", paging);
		
		mv.setViewName("board/board");
		return mv;
	}
	
	// write
	@RequestMapping("/boardwrite")
	public String boardWrite() {
		return "board/boardwrite";
	}
	
	// insert content
	@RequestMapping(value="/boardinsert", method=RequestMethod.POST)
	public String boardInsert(HttpSession httpsession, BoardVO board) {
		//String user_id = (String)httpsession.getAttribute("user_id");
		board.setUser_id("");
		board.setBoard_content(board.getBoard_content().replace("\r\n", "<br>"));
		
		System.out.println("[ boardinsert ]"+board);
		dao.boardInsert(board);
		
		return "redirect:/board";
	}
	
	// detail
	@RequestMapping(value="/boarddetail", method=RequestMethod.GET)
	public ModelAndView boardDetail(BoardVO board){
		ModelAndView mv = new ModelAndView();
		
		// board_cnt +1
		dao.plusCnt(board);
		
		BoardVO vo = dao.selectOne(board.getBoard_num());
		mv.addObject("board", vo);
		
		boolean iswriter = true;
		mv.addObject("iswriter",iswriter);
		
		mv.setViewName("board/boarddetail");
		return mv;
	}
	
	// modify
	@RequestMapping("/boardmodify")
	public ModelAndView boardModify(int board_num) {
		ModelAndView mv = new ModelAndView();
		
		BoardVO board = dao.selectOne(board_num);
		board.setBoard_content(board.getBoard_content().replace("<br>", "\r\n"));
		mv.addObject("board", board);
		
		mv.setViewName("board/boardmodify");
		return mv;
	}
	
	// update
	@RequestMapping(value="/boardmodify", method = RequestMethod.POST)
	public String boardUpdate(BoardVO board) {
		board.setBoard_content(board.getBoard_content().replace("\r\n", "<br>"));
		dao.boardUpdate(board);
		
		return "redirect:/boarddetail?board_num="+board.getBoard_num();
	}
	
	// delete
	@RequestMapping("/boarddelete")
	public String boardDelete(int board_num) {
		dao.boardDelete(board_num);
		
		return "redirect:/board";
	}
}
