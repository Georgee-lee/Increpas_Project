package project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import team.dao.MypageDAO;

@Controller
public class MypageControll {
	
	@Autowired
	MypageDAO m_dao;
	
	@RequestMapping("myInfo")
	public ModelAndView myInfo() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("myPage_1");
		
		return mv;
	}
	
	@RequestMapping("myEvent")
	public ModelAndView myEvent() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("myPage_2");
		
		
		
		return mv;
	}
	
	@RequestMapping("myBoard")
	public ModelAndView myBoard() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("myPage_3");
		
		return mv;
	}
	
	@RequestMapping("signout")
	public String signOut() {
		return "myPage_4";
	}
}
