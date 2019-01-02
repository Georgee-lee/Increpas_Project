package team.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import team.vo.BoardVO;
import team.vo.RegVO;

@Component
public class HomeDAO {

	/* 인덱스(메인페이지)에 접근할 때 사용하는 DAO입니다. */

	@Qualifier("sqlSession")
	@Autowired
	SqlSessionTemplate ss;
	
	public BoardVO[] getFree() {
		BoardVO[] ar1 = null;
		
		List<BoardVO> list = ss.selectList("free.mainFree");
		
		if(list !=null && list.size() >0 ) {
			ar1 = new BoardVO[list.size()];
			list.toArray(ar1);
		}
		
		return ar1;
	}
	
	public BoardVO[] getNotice() {
		BoardVO[] ar2 = null;
		
		List<BoardVO> list = ss.selectList("free.mainNotice");
		
		if(list !=null && list.size() >0 ) {
			ar2 = new BoardVO[list.size()];
			list.toArray(ar2);
		}
		
		return ar2;
	}
	
	public BoardVO[] getQnA() {
		BoardVO[] ar3 = null;
		
		List<BoardVO> list = ss.selectList("free.mainQnA");
		
		if(list !=null && list.size() >0 ) {
			ar3 = new BoardVO[list.size()];
			list.toArray(ar3);
		}
		
		return ar3;
	}
	
	public RegVO[] getJenung() {
		RegVO[] ar4 = null;
		
		List<RegVO> list = ss.selectList("free.mainEvent");
		
		if(list != null && list.size() > 0) {
			ar4 = new RegVO[list.size()];
			list.toArray(ar4);
		}
		
		return ar4;
	}
	
	/* 비동기 통신을 위한 기능! */
	public RegVO[] getMylist(String u_name){
		RegVO[] r_list = null;
		
		List<RegVO> list = ss.selectList("reg.getMylist", u_name);
		
		if(list!=null && list.size() >0) {
			r_list = new RegVO[list.size()];
			list.toArray(r_list);
			return r_list;
		}
		
		return r_list;
	}
	
	
}