package project.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import team.dao.BoardDAO;
import team.vo.BoardCommVO;
import team.vo.BoardVO;

@Controller
public class BoardControll {
	
	private String uploadPath = "/upload";
	
	@Autowired
	private ServletContext application;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	private BoardDAO f_dao;
	
	//페이징 기법을 위한 상수들
	public static final int BLOCK_LIST = 7;
	public static final int BLOCK_PAGE = 5;//한 블럭당 페이지 수
	
	int nowPage;// 현재 페이지 값
	int rowTotal; //전체 게시물 수
	String pageCode; // 페이징 처리된 HTML코드가 저장될 곳!
	
	//검색기능에 필요한 변수
	String searchType;  //검색 타입 ex)글쓴이, 제목
	String searchValue; //검색한 내용
	
	String boardType; //게시판 선택하기
	
	@RequestMapping(value="flist", method=RequestMethod.GET)
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 선택한 게시판을 알아낸다.
		boardType = request.getParameter("boardType");

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
		rowTotal = f_dao.getAll(boardType);
		
		//페이징 처리를 하는 객체 생성
		Paging page = new Paging(nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE, boardType);
		
		pageCode = page.getSb().toString();//페이징 HTML코드
		
		//목록을 받아오기 위해 begin과 end값을 얻어낸다.
		int begin = page.getBegin();
		int end = page.getEnd();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));
		map.put("boardType", boardType);
		map.put("searchType", searchType);
		map.put("searchValue", searchValue);
		
		BoardVO[] ar = f_dao.getList(map);
		int searchNum = ar.length;
		
		// 만약 검색했다면 검색된 레코드 수 만큼 페이징을 다시 한다!
		if(searchValue != null) {
			//페이징 처리를 하는 객체 생성
			Paging page2 = new Paging(nowPage, searchNum, BLOCK_LIST, BLOCK_PAGE, boardType);
			
			pageCode = page2.getSb().toString();//페이징 HTML코드
			
			ModelAndView mv = new ModelAndView();
			mv.addObject("list", ar);
			mv.addObject("nowPage", nowPage);
			mv.addObject("rowTotal", searchNum);
			mv.addObject("blockList", BLOCK_LIST);
			mv.addObject("pageCode", pageCode);
			mv.setViewName("free_board");
			return mv;
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", ar);
		mv.addObject("nowPage", nowPage);
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("blockList", BLOCK_LIST);
		mv.addObject("pageCode", pageCode);
		mv.setViewName("free_board");
		return mv;
	}
	
	/* 자유게시판 글쓰기 기능! */
	@RequestMapping("fwrite")
	public ModelAndView goWrite(BoardVO vo) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("ac", "fwrite");
		mv.setViewName("board_write");
		
		return mv;
	}
	
	@RequestMapping(value="fwrite", method=RequestMethod.POST)
	public ModelAndView write(BoardVO vo) throws Exception {

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
			
			//DB에 저장할 정보를 가지고 있는 BoardVO에도
			//파일명을 지정해 준다.
			vo.setUploadFileName(f_name);
		}else
			vo.setUploadFileName("");
		
		//MyBatis환경을 이용하여 vo의 정보를 DB에 저장한다.
		boolean chk = f_dao.addfList(vo);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:flist?boardType="+vo.getBoardType());
		return mv;
	}
	
	/* 해당하는 게시물 보기 기능 */
	@RequestMapping("fview")
	public ModelAndView view(BoardVO vo) {
		BoardVO fvo = f_dao.getFBbs(vo);
		
		//우선 현재 읽기를 하는 게시물에 앞서 읽었던 게시물이라면 조회수를 증가시키면 안된다!!
		//한 번이라도 읽은 게시물은(BbsVO) HttpSession에 저장된 ArrayList 안에 있다.
		//즉, 한번이라도 읽었다면 그 게시물은 세션이 있으므로 비교해서 널이면 증가, 널이 아니면 그대로
		session  = request.getSession();
		Object obj = session.getAttribute("view_list");
		
		List<BoardVO> list = null;
		if(obj == null) {
			//로그인 후 처음으로 읽은 게시물!!
			list = new ArrayList<BoardVO>();
			list.add(fvo); //사용자가 선택한 게시물을 List에 저장!
			
			f_dao.upHit(fvo.getF_idx()); //DB의 조회수를 증가시킨 거다! 먼저 따온 VO에는 적용이 안되어 있다
			int hit = Integer.parseInt(fvo.getF_hit());
			fvo.setF_hit(String.valueOf(hit+1));
			
			session.setAttribute("view_list", list);
		}else {
			//obj가 null이 아닌 경우는 분명 읽은 게시물이 있는 경우다. 우선 obj를 List<bbsvo>형태로 캐스팅이 필요하다
			list = (List<BoardVO>)obj;
			
			//list에 저장된 모든 vo들을 가져와서 기본키가 파라미터로 받은 b_idx값과 같은지 비교하자!
			boolean chk = false;
			
			for(BoardVO bvo : list) {
				if(bvo.getF_idx().equals(fvo.getF_idx())){
					chk = true;
					break;
				}
			}
			//여기 올때는 false or true 둘 다 가능. true가 떨어지면 앞서 같은 게시물을 읽은 적이 있다는 것이다. 그러므로 그냥 패스, false일 때만 작업 필요!
			if(!chk) {
				f_dao.upHit(vo.getF_idx());
				int hit = Integer.parseInt(fvo.getF_hit());
				fvo.setF_hit(String.valueOf(hit+1));
				
				list.add(fvo);
			}
		}
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("fvo", fvo);
		mv.setViewName("board_view");
		
		return mv;
	}
	
	/* 게시판에 댓글 달기 기능 */
	@RequestMapping("fcomm")
	public ModelAndView addcomm(BoardCommVO bvo) {
		f_dao.addComm(bvo);
		
		BoardVO fvo = new BoardVO();
		fvo.setF_idx(bvo.getF_idx());
		fvo.setNowPage(Integer.parseInt(bvo.getNowPage()));
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:fview?f_idx="+bvo.getF_idx()+"&nowPage="+nowPage);
		
		return mv;
	}
	
	/* 특정 게시물 지우기 기능 */
	@RequestMapping("delboard")
	@ResponseBody
	public Map<String, Integer> delFbbs(BoardVO vo, String boardType) {
		int chk = f_dao.delFbbs(vo);
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		if(chk > 0) 
			map.put("isDel", 1);
		else
			map.put("isDel", 0);
		
		return map;
	}
	
	@RequestMapping("edit")
	public ModelAndView edit_ori(BoardVO vo) {
		BoardVO fvo = f_dao.getFBbs(vo);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("fvo", fvo);
		mv.addObject("ac", "edit");
		mv.addObject("as", "disabled");
		mv.addObject("boardType", vo.getBoardType());
		mv.addObject("nowPage", String.valueOf(vo.getNowPage()));
		mv.setViewName("board_write");
		
		return mv;
	}
	
	@RequestMapping(value="edit", method=RequestMethod.POST)
	public ModelAndView edit(BoardVO vo) throws Exception {
		
		//첨부된 파일을 vo로부터 얻어낸다.
		MultipartFile mf = vo.getUpload();
		
		//파일이 첨부되지 않았다면 mf가 null은 아니지만
		//용량은 0일 것이다. 파일첨부에 대한 확인은 size로 비교한다.
		if(mf.getSize() > 0 && 
			mf.getOriginalFilename().trim().length() > 0) {
			//파일이 첨부되었을 때만 수행하는 곳!
			
			//먼저 첨부파일이 저장될 위치를 절대경로로 얻어낸다.
			String path = application.getRealPath(uploadPath);
			
			//첨부파일명 얻기
			String f_name = mf.getOriginalFilename();
			
			//첨부파일과 동일한 이름이 있다면 파일명 변경
			f_name = FileUploadUtil.checkSamefileName(f_name,
						path);
			
			mf.transferTo(new File(path, f_name));//파일업로드!!
			
			//DB에 저장할 정보를 가지고 있는 BoardVO에도
			//파일명을 지정해 준다.
			vo.setUploadFileName(f_name);
		}else
			vo.setUploadFileName("");
		
		//MyBatis환경을 이용하여 vo의 정보를 DB에 저장한다.
		boolean chk = f_dao.editBbs(vo);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("ac", "edit");
		mv.setViewName("redirect:fview?f_idx="+vo.getF_idx()+"&nowPage="+vo.getNowPage()+"&boardType="+vo.getBoardType());
		return mv;
	}
}
