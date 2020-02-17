package multi.semi.main;


import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import multi.semi.utils.UploadFileUtils;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	@Autowired
	MainDAO dao;
	
	@Resource(name = "uploadPath")
	String uploadPath;
	

	@RequestMapping("/index")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("articles", dao.getAllArticle());
		
		
		List<multi.semi.board.BoardVO> list = dao.getBoardList();
		mv.addObject("list", list);
		mv.setViewName("main/index");
		return mv;
	}

	@RequestMapping("/artinsert")
	public String insertArtForm() {
		return "main/art_insert";
	}
	
	@RequestMapping("/ajaxinsert")
	@ResponseBody
	public List<ArticleVO> moreArticle(@RequestParam("numberOfRequests") int numberOfRequests) {
		int cntPerPage = 3;
		int start = (numberOfRequests-1) * cntPerPage + 1;
		int end = numberOfRequests * cntPerPage;
		int param [] = {start,end};
		List<ArticleVO> list = dao.getMoreArticle(param);
		return list;
	}

	@RequestMapping(value = "/artinsert", method = RequestMethod.POST)
	public String insertArticle(ArticleVO vo, MultipartFile file) {
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		
		if(file != null) {
			try {
				fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		} else {
			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}
		vo.setArticle_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		
		dao.insertArticle(vo);
		return "redirect:/index";
	}

}
