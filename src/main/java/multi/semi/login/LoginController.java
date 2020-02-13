package multi.semi.login;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;




/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {
	@Autowired
	LoginDAO dao;
	
//로그인폼
	@RequestMapping("")
	public String loginform(){
		return "login/login";
	}
//로그인폼 입력 - db users 테이블 존재 - 세션 저장	
	@RequestMapping("/loginresult")
	public String loginprocess(HttpServletRequest request, String user_id, String user_pw){
		LoginVO vo = dao.selectMember(user_id, user_pw);
		HttpSession session = request.getSession();
		session.setAttribute("member", vo);
		try {
			return "redirect:/index";
		} catch (Exception e) {
			return "login/login";
		}
	}
//회원가입
	@RequestMapping(value = "/memberinsert", method = RequestMethod.GET)
	public String insertMemberForm(LoginVO vo) {
		return "login/signin";
	}
	@RequestMapping(value = "/memberinsertresult", method = RequestMethod.POST)
	public String insertMemberResult(@ModelAttribute("vo") LoginVO vo) {
		// LoginDAO 객체 -> insertMember(vo) 전달
		dao.insertMember(vo);			
		return "login/login";
	}
//아이디 찾기폼
	@RequestMapping("/findUserId")
	public String findUserIdform() {
		return "login/findid";
		}
//아이디 찾기폼결과
	@RequestMapping("/findUserIdresult")
	public String findUserIdresult(HttpServletRequest request, String user_email, String user_name) {
		LoginVO vo = dao.findUserId(user_name, user_email);		
		HttpSession session = request.getSession();
		session.setAttribute("member", vo);
		return "login/findsuccess";
		}
}
