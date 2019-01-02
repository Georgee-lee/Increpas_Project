package project.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import team.dao.HomeDAO;
import team.vo.BoardVO;
import team.vo.RegVO;

@Controller
public class HomeControll {

	@Autowired
	HomeDAO h_dao;

//	RegVO[] beforeList = null;  //비동기통신으로 주기적으로 체크하는 데이터 중 원본 배열
//	RegVO[] afterList = null;   //비동기통신으로 체크하는 데이터에 변화가 있는 지 확인할 배열
//	
//	boolean oops = true;
	
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
	
	/* 비동기통신을 주기적으로 하여 새로운 메세지를 확인한다 */
	/*@RequestMapping(value="chkMsg", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> chkMsg(String u_name, int num){
		Map<String, String> map = new HashMap<>();
		
		if(num == 1 && oops == true) {
				beforeList = firstChk(u_name);
				afterList = secondChk(u_name);
				System.out.println(num);
				oops = false;
			}
		else if(num == 2) {
			//첫 로그인때만 1을 받는데, 등록한 게시글이 없다면 2를 받을 때 한번 더 체크한다
			//if(beforeList == null && beforeList.length < 1)
				//beforeList = firstChk(u_name);
			
			afterList = secondChk(u_name);
			
			//if(beforeList.length > afterList.length)
				//beforeList = secondChk(u_name);
			
			if(beforeList != null && afterList != null) {
				for(int i=0; i<beforeList.length; i++) {
					  int before = beforeList[i].getR_equals();
					  int after = afterList[i].getR_equals();
					  String title = afterList[i].getR_title();
					
					  if((before+1) / (after+1) != 1) {
					  	  map.put("checkValue", "2");  //참여자 발생
//					  	  System.out.println("변화를 감지!!");
//					  	  System.out.println("현재 글의 제목: "+title);
//					  	  System.out.println("원래 인원수:"+before);
//						  System.out.println("나중 인원수:"+after);
//						  System.out.println("-------------------------------------------------------");
					  	  System.out.println("원래 인원수:"+before);
						  System.out.println("나중 인원수:"+after);
						  System.out.println("등록하신 나눔 "+title+"의 현재 참여인원은 "+after+"명 입니다.");
						  //map.put("output", "등록하신 나눔 "+title+"의 현재 참여인원은 "+after+"명 입니다.");
						  map.put("output", "등록하신 나눔 "+title+"에 새로운 참여자가 생겼습니다.");
					  }else {
						  map.put("checkValue", "1");  //변동사항 없음
//						  System.out.println("현재 글의 제목: "+title);
//					  	  System.out.println("원래 인원수:"+before);
//						  System.out.println("나중 인원수:"+after);
//						  System.out.println("-------------------------------------------------------");
					  }
					  	
					}//for문 끝
				
				//System.arraycopy(afterList, 0, beforeList, 0, beforeList.length);
				if(beforeList != null && afterList != null)
					beforeList = afterList.clone();
		}
			
	}//위에 else if문 끝
		map.put("doNothing", "nope");
		return map;
	}
	
	public RegVO[] firstChk(String u_name) {
		return beforeList = h_dao.getMylist(u_name); //첫 번째 리스트에 저장
	}
	
	public RegVO[] secondChk(String u_name) {
		return afterList = h_dao.getMylist(u_name); //두 번째 배열에 저장
	}
	*/
	
}