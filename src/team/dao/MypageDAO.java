package team.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import team.vo.UserVO;

@Component
public class MypageDAO {
	
	@Qualifier("sqlSession")
	@Autowired
	private SqlSessionTemplate ss;
	
	// 회원탈퇴 기능
	public boolean signOut(UserVO vo) {		
			
		int value = ss.update("user.signOut",vo);
			
		if ( value == 1) {
			return true;
		}
		else
			return false;		
	}	
	
	
}
