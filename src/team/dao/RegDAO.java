package team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import team.vo.RCommVO;
import team.vo.RegVO;
import team.vo.TestVO;

@Component
public class RegDAO {

	/* reg에 관해 사용하는 DAO입니다.  */

	@Qualifier("sqlSession")
	@Autowired
	SqlSessionTemplate ss;
	
	
	/*나눔보기 전체 게시물 수 가져오기 */
	public int getAll() {
		int count = 0;
		count = ss.selectOne("reg.totalCount");
		return count;
	}
	
	
	 /* 해당하는 글에 달린 별점들 평균 */
	public int getAvg(String r_idx){
		String rc_avg = null;
		rc_avg = ss.selectOne("reg.avgStar", r_idx); // 별점 평균을 일단 스트링으로 다 받아야만해 
		if(rc_avg != null ) { // null 값이 아니라면 숫자가 문자열로 들어왔을것이다.
			 double rcAvg = Double.parseDouble(rc_avg); // 아래와 같이 바로 int로 바꾸면 실수인 문자열을 변형할때 오류남.
			//int rcAvg = Integer.parseInt(rc_avg); // 연산을 하기위해 String->int로 바꾸자.		
			int count = 0;
			count = ss.selectOne("reg.commAll", r_idx);
			if(rcAvg%count!=0) { // 나머지가 0이 아닌 예외들을 int로 캐스팅하자! 예를들어 2.5, 3.5,...and so on
				System.out.println("dao실수ok:"+rcAvg);
				int avg = (int)rcAvg; // 이제 됐다.....하....
				System.out.println("dao실수ok:"+avg);
				return avg;  
				} 	// 소수점 별점들 처리 완료
		System.out.println("dao정수ok:"+rcAvg);
		int avg = (int)rcAvg;
		return avg; // 정수 별점들 처리 완료 
		}
		else // null 일때
		return 0;
	}
	
	
	/* 나눔보기 원하는 영역만큼 게시물 가져오기 */
	public RegVO[] getList(Map<String, String> map) {
		RegVO[] ar = null;
		List<RegVO> list = ss.selectList("reg.getlist", map);
		
		if(list != null && list.size() > 0) {
			ar = new RegVO[list.size()];
			list.toArray(ar);			
		}
		return ar;
	}
	
	public RegVO getReg(String r_idx) {			
		return ss.selectOne("reg.getReg", r_idx);
	}
	
	 public int getIdx() {
		 return ss.selectOne("reg.getIdx");
	 }

	/* 게시물 등록하기 */
	public boolean write(RegVO vo) {
		int cnt = ss.insert("reg.add", vo);
		if(cnt > 0)
			return true;
		else
			return false;
	}
	
	/* 게시물 수정하기 */
	public boolean edit(RegVO vo) {
			int cnt  = ss.update("reg.edit", vo);
			if(cnt > 0)
				return true;
			else
				return false;
		}
	
	/* 게시물 삭제하기 */
	public boolean delReg(RegVO vo) {
			int cnt  = ss.delete("reg.delReg", vo);
			if(cnt > 0)
				return true;
			else
				return false;
		}
	
	 /* 해당하는 글에 달린 댓글 가져오기 */
	 public RCommVO[] getrcomm(String r_idx) {
		 RCommVO[] ar = null;		
		List<RCommVO> list = ss.selectList("reg.getRComm", r_idx);		
		if(list != null) {
			ar = new RCommVO[list.size()];
			list.toArray(ar);
		}		
		return ar;
	 }

	 public void addRComm(String rc_writer, String rc_content,String rc_star ,String r_idx, String u_idx) {
		 Map<String, String> map = new HashMap<>();
		 map.put("rc_writer", rc_writer);
		 map.put("rc_content", rc_content);
		 map.put("r_idx", r_idx);
		 map.put("rc_star", rc_star);
		 map.put("u_idx", u_idx);
		 
		 ss.insert("reg.addRComm", map);
	 }
	
	 
	 /* 해당하는 글에 달린 댓글 삭제하기 */
	 public void delrcomm(String rc_idx) {
			ss.delete("reg.del", rc_idx);
		}
	 	
	
}
