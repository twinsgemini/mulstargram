package multi.semi.login;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;




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
		
		try{if(vo.getUser_id().equals(user_id)&&vo.getUser_pw().equals(user_pw)) {
			return "redirect:/index";
		}else {
			return "login/login";
		}}catch (Exception e) {
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
//회원가입; id 중복 검사
	@RequestMapping(value = "member/idcheck", method= RequestMethod.POST)
	public int idCheck(String user_id) {
		return 0;
	}
//회원가입; email 중복 검사
	@RequestMapping(value = "member/emailcheck", method= RequestMethod.POST)
	public int emailCheck(String user_email) {
		return 0;
	}
//아이디 찾기폼
	@RequestMapping("/findUserId")
	public String findUserIdform() {
		return "login/findid";
		}
//아이디 찾기폼결과
	@RequestMapping("/findUserIdresult")
	public ModelAndView findUserIdresult(HttpServletRequest request, String user_name, String user_email) {
		LoginVO vo = dao.findUserId(user_name, user_email);		
		ModelAndView mv = new ModelAndView();
		mv.addObject("id", vo);
		mv.setViewName("login/findidsuccess");
		
		return mv;
		}
//pw 찾기폼
	@RequestMapping("/findUserPw")
	public String findUserPwform() {
		return "login/findpw";
		}
//pw 찾기폼결과
	@RequestMapping("/findUserPwresult")
	public ModelAndView findUserPwresult(HttpServletRequest request, String user_id, String user_birth) {
		LoginVO vo = dao.findUserPw(user_id, user_birth);		
		ModelAndView mv = new ModelAndView();
		mv.addObject("pw", vo);
		mv.setViewName("login/findpwsuccess");
			
		return mv;
		}
//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {

		return "redirect:/";
	}
}
