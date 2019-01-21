package project.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import team.dao.JoinDAO;
import team.vo.JoinVO;

@Controller
public class JoinControll {

	@Autowired
	private JoinDAO j_dao;

	@RequestMapping(value="join", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> join(JoinVO jvo) {
		Map<String, String> map = new HashMap<>();
		String isJoin = "";
		
		int joinCheck = j_dao.joinCheck(jvo);
		
		if(joinCheck == 0) {
			boolean chk = j_dao.joinEvent(jvo);
			
			if(chk) {
				isJoin = "Success";
				map.put("isJoin", isJoin);
				map.put("nowPage", jvo.getNowPage());
			}else {
				isJoin = "Fail";
				map.put("isJoin", isJoin);
				map.put("nowPage", jvo.getNowPage());
			}
		}else {
			isJoin = "Already";
			map.put("isJoin", isJoin);
			map.put("nowPage", jvo.getNowPage());
		}
		
		return map;
	}
	
	@RequestMapping(value="isJoin", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Integer> isjoin(JoinVO jvo) {
		Map<String, Integer> map = new HashMap<>();

		int joinCheck = j_dao.joinCheck(jvo);
		
		if(joinCheck == 0) 
			map.put("join", joinCheck);
		else
			map.put("join", joinCheck);
		
		return map;
	}
	
	
	
}
