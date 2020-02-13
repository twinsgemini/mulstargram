package multi.semi.main;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	@Autowired
	MainDAO dao;
	

	@RequestMapping("/index")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("articles", dao.getAllArticle());
		mv.setViewName("main/index");
		return mv;
	}

	@RequestMapping("/artinsert")
	public String insertArtForm() {
		return "main/art_insert";
	}

	@RequestMapping(value = "/artinsert", method = RequestMethod.POST)
	public String insertArticle(ArticleVO vo) {
		dao.insertArticle(vo);
		return "redirect:/index";
	}

}
