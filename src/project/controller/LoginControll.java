package project.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import team.dao.UserDAO;
import team.vo.UserVO;

@Controller
public class LoginControll {

	@Autowired
	UserDAO u_dao;
	
	@Autowired
	private HttpSession session;
	
	// 회원가입 기능	
	@RequestMapping("signup")
	public String signup() {
		return "signUp";
	}	
	
	@RequestMapping(value="signup", method=RequestMethod.POST)
	public ModelAndView signup(UserVO vo) {
		ModelAndView mv = new ModelAndView();
		
		boolean value = u_dao.signUp(vo);
	
		if ( value ) {	
			mv.setViewName("redirect:index");
			return mv;
		}
		else {
			mv.setViewName("redirect:signUp");
			return mv;
		}		
	}
	
	// 로그인 기능
	@RequestMapping("login")
	public String login() {
		return "login";
	}	
	@RequestMapping(value="login", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> login(UserVO vo) {
		Map<String, String> map = new HashMap<String, String>();
		UserVO lvo = u_dao.login(vo);
	
		if(lvo != null) {
			session.setAttribute("lvo", lvo);
			map.put("msg", "0");
			map.put("name", lvo.getU_name());
		}else
			map.put("msg", "1");		 
		
		return map;
	}	
	
	// 아이디 찾기
	@RequestMapping("searchID_PW")
	public String searchid() {
		return "searchID_PW";
	}
	@RequestMapping(value="searchid", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> searchid(String u_name , String u_email) {
		
		String id = u_dao.searchID(u_name, u_email);

		Map<String, String> map = new HashMap<String, String>();
		if ( id != null ) {	
			map.put("u_id", id);
		}
		return map;
	}
	// 비밀번호 찾기

	@RequestMapping(value="searchpw", method= {RequestMethod.POST,RequestMethod.GET}) // 405에러 해결책으로 둘다 선언
	@ResponseBody
	public Map<String, String> searchpw(String u_id , String u_email) {
				
		String pw = u_dao.searchPW(u_id, u_email);		
	
		Map<String, String> map = new HashMap<String, String>();
		if ( pw != null ) {	
			map.put("u_pwd", pw);
		}
		return map;
	}
	
	@RequestMapping("logout")
	public String logout() {
		session.removeAttribute("lvo");
		
		return "redirect:index";
	}
	
	// DB에 있는 ID 값과 내가 입력한 ID값 검사 기능
	@RequestMapping(value="signUp", method=RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> idcheck(String u_id) {
        
        int count = 0;
        Map<String, Object> map = new HashMap<String, Object>(); 
        
        count = u_dao.checkID(u_id);
        map.put("cnt", count);
        
        return map;
    }
	
    @RequestMapping(value="check_email", method=RequestMethod.POST)
    @ResponseBody
    public Map<String, Integer> email_Check(String u_email){
		
		Map<String, Integer> map = new HashMap<>();		
		int count = u_dao.email_Check(u_email);			
	
		map.put("count", count);
		
		return map;
	}
	
}
