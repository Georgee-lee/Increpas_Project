package team.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import team.vo.JoinVO;
import team.vo.RegVO;

@Component
public class JoinDAO {

	@Qualifier("sqlSession")
	@Autowired
	private SqlSessionTemplate ss;
	
	@Autowired
	private RegDAO r_dao;
	
	public boolean joinEvent(JoinVO vo) {
		
		RegVO rvo = r_dao.getReg(vo.getR_idx());
		
		int limit = rvo.getR_join();  // 제한 인원
		int joinNum = rvo.getR_equals(); // 현재 참여 인원
		
		if(joinNum < limit) {
			ss.insert("reg.joinEvent", vo);
			return true;
		}else
			return false;
	}

	public int joinCheck(JoinVO vo) {
		return ss.selectOne("reg.joinCheck", vo);
	}
}
