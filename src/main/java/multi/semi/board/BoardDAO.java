package multi.semi.board;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;


@Repository
public class BoardDAO {
	
	@Autowired
	SqlSession sqlsession;
	
	// board list
	public List<BoardVO> boardList(PagingVO paging){
		return sqlsession.selectList("boardlist", paging);
	}
	
	// count list
	public int cntList(SearchVO paging){
		return sqlsession.selectOne("cntlist", paging);
	}
	
	// select one
	public BoardVO selectOne(int board_num) {
		return sqlsession.selectOne("alist", board_num);
	}
	
	// board_cnt +1
	public void plusCnt(BoardVO board) {
		int i = 0;
		i = sqlsession.update("plusCnt", board);
		if(i > 0) {
			System.out.println("조회수 증가 +"+i);
		}
	}
	
	// board create
	public void boardInsert(BoardVO board) {
		int i = 0;
		i = sqlsession.insert("insertContent", board);
		if(i > 0) {
			System.out.println("Insert 성공, i : "+i);
		}
	}
	
	// board update
	public void boardUpdate(BoardVO board) {
		int i = 0;
		i = sqlsession.update("boardupdate", board);
		if(i > 0) {
			System.out.println("Update 성공, i="+i);
		}
	}
	
	// board delete
	public void boardDelete(int board_num) {
		int i = 0;
		i = sqlsession.delete("boarddelete", board_num);
		if(i > 0) {
			System.out.println("Delete 성공, i="+i);
		}
	}
	
	
}
