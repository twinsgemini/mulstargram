package multi.semi.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import multi.semi.login.LoginVO;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
		HttpSession session = request.getSession();
		LoginVO vo = (LoginVO) session.getAttribute("member");
		if (vo == null) {
			response.sendRedirect("/multistargram/");
			return false;
		}

		return true;
	}
}