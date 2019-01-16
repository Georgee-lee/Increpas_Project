package team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import team.vo.BoardCommVO;
import team.vo.BoardVO;

@Component
public class BoardDAO {

	@Qualifier("sqlSession")
	@Autowired
	SqlSessionTemplate ss;
	
	/*자유게시판 전체 게시물 수 가져오기 */
	public int getAll(String boardType) {
		int count = 0;
		
		count = ss.selectOne("free.all", boardType);
		
		return count;
	}
	
	/* 검색된 전체 게시물 수 가져오기 */
	public int getSearchAll(Map<String, String> map) {
		int scount = 0;
		
		scount = ss.selectOne("free.searchAll", map);
		
		return scount;
	}
	
	/* 자유게시판에서 원하는 영역만큼 게시물 가져오기 */
	public BoardVO[] getList(Map<String, String> map) {
		BoardVO[] value = null;
		
		List<BoardVO> list = ss.selectList("free.getlist", map);
		
		if(list != null) {
			value = new BoardVO[list.size()];
			list.toArray(value);
		}
		
		return value;
	}
		
	 /* 해당 글 가져오기 (글 상세보기) */
	 public BoardVO getFBbs(BoardVO vo) {
		BoardVO fvo = ss.selectOne("free.getFbbs", vo.getF_idx());
		
		return fvo;
	 }
		
	 /* 해당하는 글에 달린 댓글 가져오기 */
	 public BoardCommVO[] getfcomm(String f_idx) {
		BoardCommVO[] ar = null;
		
		List<BoardCommVO> list = ss.selectList("free.getComm", f_idx);
		
		if(list != null) {
			ar = new BoardCommVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	 }
	
	
	 /* 자유게시판에 글 쓰기 메서드*/
	 public boolean addfList(BoardVO vo) {
		int cnt = ss.insert("free.addlist", vo);
		
		if(cnt > 0)
			return true;
		else
			return false;
	 }
	 
	 /* 기본키를 갖고 글 삭제하는 기능 */
	 public int delFbbs(BoardVO vo) {
		 int i = ss.update("free.delFbbs", vo);
		 
		 return i;
	 }
	
	 /* 조회수 증가시키기 */
	 public void upHit(String f_idx) {
		ss.update("free.uphit", f_idx);
	 }
	 
	 /* 해당 글에 댓글 쓰기 */
	 public void addComm(BoardCommVO vo) {
		 Map<String, String> map = new HashMap<>();
		 map.put("fc_writer", vo.getFc_writer());
		 map.put("fc_content", vo.getFc_content());
		 map.put("f_idx", vo.getF_idx());
		 map.put("u_idx", vo.getU_idx());
		 
		 ss.insert("free.addComm", map);
	 }
	 
	 /* 해당하는 글 수정하기 기능 */
	 public boolean editBbs(BoardVO vo) {
			int cnt = ss.update("free.edit", vo);
			
			if(cnt > 0)
				return true;
			else
				return false;
		}
}
