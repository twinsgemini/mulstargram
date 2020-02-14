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
	public LoginVO findUserId(String user_name, String user_email) {
		LoginVO vo = new LoginVO();
		vo.setUser_name(user_name);
		vo.setUser_email(user_email);

		vo = session.selectOne("find_id", vo);
		return vo;
	}
}
