package multi.semi.login;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;




@Repository
public class LoginDAO {
	
	@Autowired
	SqlSession session;
	
	public LoginVO selectMember(String user_id, String user_pw) {
		LoginVO vo = new LoginVO();
		vo.setUser_id(user_id);
		vo.setUser_pw(user_pw);

		vo = session.selectOne("getmember", vo);
		return vo;
	}
	
	public int insertMember(LoginVO vo) {
		int result = 0;
		result = session.insert("newmember", vo);
		return result;
	}
	
	public int idCheck(String user_id) {
		int result =0;
		result = session.selectOne("id_check", user_id);
		return result;
		
	}
	public int emailCheck(String user_email) {
		int result = 0;
		result = session.selectOne("email_check", user_email);
		return result;
		
	}
	
	public LoginVO findUserId(String user_name, String user_email) {
		LoginVO vo = new LoginVO();
		vo.setUser_name(user_name);
		vo.setUser_email(user_email);

		vo = session.selectOne("find_id", vo);
		return vo;
	}
	
	public LoginVO findUserPw(String user_id, String user_birth) {
		LoginVO vo = new LoginVO();
		vo.setUser_id(user_id);
		vo.setUser_birth(user_birth);

		vo = session.selectOne("find_pw", vo);
		return vo;
	}
}
