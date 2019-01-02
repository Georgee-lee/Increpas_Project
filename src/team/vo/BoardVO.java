package team.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	private String f_idx, f_title, f_writer, f_content, f_pwd, f_status, uploadFileName, f_writedate, f_hit, boardType, u_idx;
	
	//현재 페이지값(Parameter로 받을 수 있기 때문에 미리 준비해 준다)
	private int nowPage;
		
	//파일첨부 - 파일첨부가 되지 않아도 비어있는 MultipartFile객체가 생긴다.
	private MultipartFile upload;
	
	//댓글들을 가질 리스트
	private List<BoardCommVO> fc_list;
	
	public String getU_idx() {
		return u_idx;
	}
	public void setU_idx(String u_idx) {
		this.u_idx = u_idx;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public String getF_idx() {
		return f_idx;
	}
	public void setF_idx(String f_idx) {
		this.f_idx = f_idx;
	}
	public String getF_title() {
		return f_title;
	}
	public void setF_title(String f_title) {
		this.f_title = f_title;
	}
	public String getF_writer() {
		return f_writer;
	}
	public void setF_writer(String f_writer) {
		this.f_writer = f_writer;
	}
	public String getF_content() {
		return f_content;
	}
	public void setF_content(String f_content) {
		this.f_content = f_content;
	}
	public String getF_pwd() {
		return f_pwd;
	}
	public void setF_pwd(String f_pwd) {
		this.f_pwd = f_pwd;
	}
	public String getF_status() {
		return f_status;
	}
	public void setF_status(String f_status) {
		this.f_status = f_status;
	}
	public String getF_writedate() {
		return f_writedate;
	}
	public void setF_writedate(String f_writedate) {
		this.f_writedate = f_writedate;
	}
	public String getF_hit() {
		return f_hit;
	}
	public void setF_hit(String f_hit) {
		this.f_hit = f_hit;
	}
	public List<BoardCommVO> getFc_list() {
		return fc_list;
	}
	public void setFc_list(List<BoardCommVO> fc_list) {
		this.fc_list = fc_list;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
}
