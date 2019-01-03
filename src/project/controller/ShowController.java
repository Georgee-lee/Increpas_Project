package project.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import project.util.FileUploadUtil;
import project.util.Paging;
import project.util.RlistPaging;
import team.dao.RegDAO;
import team.vo.RCommVO;
import team.vo.RegVO;

@Controller
public class ShowController {

	private String uploadPath = "/upload";
	private String realPath = uploadPath.substring(1); //시스템 경로상 이미지 폴더 표기 !!
	
	@Autowired
	private ServletContext application;
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private RegDAO r_dao;
	
	//페이징 기법을 위한 상수들
	public static final int BLOCK_LIST = 6;
	public static final int BLOCK_PAGE = 5;//한 블럭당 페이지 수
	
	int nowPage;// 현재 페이지 값
	int rowTotal; //전체 게시물 수
	String rlistPaging; // 페이징 처리된 HTML코드가 저장될 곳!
	
	String pageCode; // 페이징 처리된 HTML코드가 저장될 곳!
	
	//나중에 각자가 해결해야 할 문제(검색기능)에 필요한 변수
	String searchType, searchValue;
	
	
	@RequestMapping("reg")
	public String Register() {
		return "Register";
	}
	
	@RequestMapping("regist")
	public ModelAndView write(RegVO vo) throws Exception{
		
		//첨부된 파일을 vo로부터 얻어낸다.
		MultipartFile mf = vo.getUpload();
		MultipartFile mf2 = vo.getImage_upload();
		
		//파일이 첨부되지 않았다면 mf가 null은 아니지만
		//용량은 0일 것이다. 파일첨부에 대한 확인은 size로 비교한다.
		if(mf.getSize() > 0 && mf.getOriginalFilename().trim().length() > 0) {
			//파일이 첨부되었을 때만 수행하는 곳!
			
			//먼저 첨부파일이 저장될 위치를 절대경로로 얻어낸다.
			String path = application.getRealPath(uploadPath);
			
			//첨부파일명 얻기
			String f_name = mf.getOriginalFilename();
			String i_name = mf2.getOriginalFilename();
			
			//첨부파일과 동일한 이름이 있다면 파일명 변경
			f_name = FileUploadUtil.checkSamefileName(f_name, path);
			i_name = FileUploadUtil.checkSamefileName(i_name, path);
			
			mf.transferTo(new File(path, f_name));//파일업로드!!
			mf2.transferTo(new File(path, i_name));
			
			//DB에 저장할 정보를 가지고 있는 RegVO에도
			//파일명을 지정해 준다.
			vo.setUploadFileName(f_name);
			vo.setThumbnailFile(i_name);
			vo.setImagepath(realPath+"\\"+i_name);  //이미지 경로 !! ex) 시스템상 기본 경로가 WebContent로 잡혀있기때문에 이렇게 하면 WebContent\\upload\파일이름으로 저장! 역슬래시를 두 번 쓴 이유는 Escape문자열!!
		}else {
			vo.setUploadFileName("");
			vo.setThumbnailFile("");
		}
		
		vo.setR_ip(request.getRemoteAddr()); //ip알아내기
		
		//MyBatis환경을 이용하여 vo의 정보를 DB에 저장한다.
		int idx = r_dao.getIdx();
		vo.setR_idx(String.valueOf(idx));
		boolean chk = r_dao.write(vo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("rvo", vo);
		mv.setViewName("redirect:/rdetail?r_idx="+vo.getR_idx()+"&nowPage="+vo.getNowPage()+"&r_add="+vo.getR_add());
		return mv;
	}
	
	@RequestMapping("map")
	public String map() {
		return "map";
	}
	

	@RequestMapping("regEdit")
	public ModelAndView edit(String r_idx, String nowPage) {
		RegVO vo = r_dao.getReg(r_idx);
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("regEdit");
		return mv;
	}
	
	
	@RequestMapping(value="regEdit", method=RequestMethod.POST)
	public ModelAndView edit(RegVO vo) throws Exception{
		//첨부된 파일을 vo로부터 얻어낸다.
		MultipartFile mf = vo.getUpload();
		
		//파일이 첨부되지 않았다면 mf가 null은 아니지만
		//용량은 0일 것이다. 파일첨부에 대한 확인은 size로 비교한다.
		if(mf.getSize() > 0 && mf.getOriginalFilename().trim().length() > 0) {
			//파일이 첨부되었을 때만 수행하는 곳!
			//먼저 첨부파일이 저장될 위치를 절대경로로 얻어낸다.
			String path = application.getRealPath(uploadPath);
			
			//첨부파일명 얻기
			String f_name = mf.getOriginalFilename();
			
			//첨부파일과 동일한 이름이 있다면 파일명 변경
			f_name = FileUploadUtil.checkSamefileName(f_name, path);
			
			mf.transferTo(new File(path, f_name));//파일업로드!!
			
			//DB에 저장할 정보를 가지고 있는 RegVO에도 파일명을 지정해준다.
			vo.setUploadFileName(f_name);
		}else {
			vo.setUploadFileName("");
		}
		
		vo.setR_ip(request.getRemoteAddr()); //ip알아내기
		
		//myBatis환경을 이용하여 vo의 정보를 DB에 저장한다.
		boolean chk = r_dao.edit(vo);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/rdetail?r_idx="+vo.getR_idx()+"&nowPage="+vo.getNowPage()+"&r_add="+vo.getR_add());
		return mv;
	}	
	
	
	@RequestMapping("rlist")
	public ModelAndView handleRequest(HttpServletRequest request,HttpServletResponse response) throws Exception {

	// 검색했다면 그 값을 알아내자.
	searchType = request.getParameter("searchType");
	searchValue = request.getParameter("searchValue");	
		
		
	// 현재 페이지 값 얻어내기
	String c_page = request.getParameter("nowPage");
	if(c_page == null)
		nowPage = 1;
	else
		nowPage = Integer.parseInt(c_page);
	
	//총 게시물의 수를 얻어낸다.
	rowTotal = r_dao.getAll();
	
	//페이징 처리를 하는 객체 생성
	RlistPaging page = new RlistPaging(nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE);
	
	pageCode = page.getSb().toString();//페이징 HTML코드
	
	//목록을 받아오기 위해 begin과 end값을 얻어낸다.
	int begin = page.getBegin();
	int end = page.getEnd();
	
	Map<String, String> map = new HashMap<String, String>();
	map.put("begin", String.valueOf(begin));
	map.put("end", String.valueOf(end));
	map.put("searchType", searchType);
	map.put("searchValue", searchValue);
	
	
	RegVO[] ar = r_dao.getList(map);
	int searchNum = ar.length;
	/* 만약 검색했다면 검색된 레코드 수 만큼 페이징을 다시 한다! */
	if(searchValue != null) {
		//페이징 처리를 하는 객체 생성
		RlistPaging page1 = new RlistPaging(nowPage, searchNum, BLOCK_LIST, BLOCK_PAGE);	
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", ar);
		mv.addObject("nowPage", nowPage);
		mv.addObject("rowTotal", searchNum);
		mv.addObject("blockList", BLOCK_LIST);
		mv.addObject("pageCode", pageCode);
		mv.setViewName("showList");
		return mv;
	}
	else {
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", ar);
		mv.addObject("nowPage", nowPage);
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("blockList", BLOCK_LIST);
		mv.addObject("pageCode", pageCode);
		mv.setViewName("showList");
		return mv;
	}
}

	
	@RequestMapping("rdetail")
	public ModelAndView showDetail(String r_idx, String nowPage) {
		ModelAndView mv = new ModelAndView();
		RegVO vo = r_dao.getReg(r_idx);
		int rc_avg = r_dao.getAvg(r_idx); // 별점 평균
		mv.addObject("rvo", vo);
		mv.addObject("rc_avg", rc_avg);
		mv.setViewName("showDetail");
		return mv;
	}
	
	
	@RequestMapping("rcomm")
	public String addRComm(RCommVO cvo) {
		r_dao.addRComm(cvo);
		//return showDetail(cvo.getR_idx(), String.valueOf(cvo.getNowPage()));
		System.out.println(cvo.getNowPage());
		return "redirect:rdetail?r_idx="+cvo.getR_idx()+"&nowPage="+cvo.getNowPage();
	}

	// 게시물 삭제
	@RequestMapping("delReg")
	@ResponseBody
	public Map<String, Integer> delFbbs(RegVO vo) {
		boolean chk = r_dao.delReg(vo);
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		if(chk) 
			map.put("isDel", 1);
		else
			map.put("isDel", 0);
		
		return map;
	}
	
	
	// 댓글 삭제
	@RequestMapping("del")
	public ModelAndView del(String r_idx, String rc_idx, String nowPage) {
		r_dao.delrcomm(rc_idx);
		RegVO vo = new RegVO();
		ModelAndView mv = showDetail(r_idx, nowPage);
		return mv;
	}
	
	// 목록으로 다시 가기
	// 게시물 삭제
	@RequestMapping("backlist")
	public String backlist(String r_idx, String nowPage) {
		return "redirect:rlist?r_idx="+r_idx+"&nowPage"+nowPage;
	}
	
	@RequestMapping(value="map", method=RequestMethod.POST)
	public String getmap(String r_idx, String nowPage) {
		return "redirect:rlist?r_idx="+r_idx+"&nowPage"+nowPage;
	}
	
	
}
