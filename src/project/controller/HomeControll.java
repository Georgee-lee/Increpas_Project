package project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import team.dao.HomeDAO;
import team.vo.BoardVO;
import team.vo.RegVO;

@Controller
public class HomeControll {

	@Autowired
	HomeDAO h_dao;
	
	//일단 서버 시작하면 메인화면으로 가게 설정
	@RequestMapping(value = {"/", "/index"})
	public ModelAndView index() {
		BoardVO[] fvo1 = h_dao.getFree();
		BoardVO[] fvo2 = h_dao.getNotice();
		BoardVO[] fvo3 = h_dao.getQnA();
		RegVO[] rvo1 = h_dao.getJenung();
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("free", fvo1);
		mv.addObject("notice", fvo2);
		mv.addObject("QnA", fvo3);
		mv.addObject("main", rvo1);
		
		mv.setViewName("index");
		
		return mv;
	}	
}