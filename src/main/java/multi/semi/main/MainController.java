package multi.semi.main;


import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import multi.semi.login.LoginVO;
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
		mv.setViewName("main/index");
		return mv;
	}

	@RequestMapping("/artinsert")
	public String insertArtForm() {
		return "main/art_insert";
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
