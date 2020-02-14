package multi.semi.main;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;


@Repository
public class MainDAO {
	
	@Autowired
	SqlSession session;
	
	public List<ArticleVO> getAllArticle() {
		List<ArticleVO> list = session.selectList("allarticle");
		return list;
	}
	
	public int insertArticle(ArticleVO vo) {
		int i = session.insert("insertarticle", vo);
		return i;
	}
	
}
