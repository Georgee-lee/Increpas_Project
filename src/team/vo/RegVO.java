package team.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class RegVO {
	// 재능나눔 테이블 생성<reg_t>
	private String  r_idx, // 나눔등록 기본키
					r_title, // 제목
					r_category1, // 카테고리 1차분류 
					r_category2, // 카테고리 2차분류 
					r_writeDate, // 작성일
					r_sDate, // 날짜 - 시작일
					r_eDate, // 날짜 - 종료일
					r_content, // 내용
					r_writer, // 등록자
					r_pwd, // 비밀번호
					r_sTitle, // 간략소개내용
					r_add, // 주소
					r_status, // 삭제여부
					uploadFileName, //첨부파일  ex) ㅇㄴㅁㅇ.exe
					r_ip,
					imagepath, //이미지 경로  이미지 전체 경로 ex) upload/123.png
					u_idx,	  //회원인지 아닌지 확인용!
					thumbnailFile; //썸네일 이미지 파일 이름 ex) 123.png
	
	private int 	r_join,  //참여인원
					r_equals; //참여인원 검사용
					
	//현재 페이지값(Parameter로 받을 수 있기 때문에 미리 준비해 준다)
	private int nowPage, avg;
			
	//파일첨부 - 파일첨부가 되지 않아도 비어있는 MultipartFile객체가 생긴다.
	private MultipartFile upload;
		
	private MultipartFile image_upload;
	
	private List<RCommVO> rc_list;

	public String getThumbnailFile() {
		return thumbnailFile;
	}

	public void setThumbnailFile(String thumbnailFile) {
		this.thumbnailFile = thumbnailFile;
	}

	public MultipartFile getImage_upload() {
		return image_upload;
	}

	public void setImage_upload(MultipartFile image_upload) {
		this.image_upload = image_upload;
	}

	public String getImagepath() {
		return imagepath;
	}

	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}

	public String getR_idx() {
		return r_idx;
	}

	public void setR_idx(String r_idx) {
		this.r_idx = r_idx;
	}


	public String getR_title() {
		return r_title;
	}


	public void setR_title(String r_title) {
		this.r_title = r_title;
	}


	public String getR_category1() {
		return r_category1;
	}


	public void setR_category1(String r_category1) {
		this.r_category1 = r_category1;
	}


	public String getR_category2() {
		return r_category2;
	}


	public void setR_category2(String r_category2) {
		this.r_category2 = r_category2;
	}


	public String getR_sDate() {
		return r_sDate;
	}


	public void setR_sDate(String r_sDate) {
		this.r_sDate = r_sDate;
	}


	public String getR_eDate() {
		return r_eDate;
	}


	public void setR_eDate(String r_eDate) {
		this.r_eDate = r_eDate;
	}

	public int getR_join() {
		return r_join;
	}

	public void setR_join(int r_join) {
		this.r_join = r_join;
	}

	public int getR_equals() {
		return r_equals;
	}

	public void setR_equals(int r_equals) {
		this.r_equals = r_equals;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}


	public String getR_writer() {
		return r_writer;
	}


	public void setR_writer(String r_writer) {
		this.r_writer = r_writer;
	}


	public String getR_pwd() {
		return r_pwd;
	}


	public void setR_pwd(String r_pwd) {
		this.r_pwd = r_pwd;
	}


	public String getR_sTitle() {
		return r_sTitle;
	}


	public void setR_sTitle(String r_sTitle) {
		this.r_sTitle = r_sTitle;
	}


	public String getR_add() {
		return r_add;
	}


	public void setR_add(String r_add) {
		this.r_add = r_add;
	}


	public String getR_status() {
		return r_status;
	}


	public void setR_status(String r_status) {
		this.r_status = r_status;
	}


	public String getUploadFileName() {
		return uploadFileName;
	}


	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}


	public String getR_ip() {
		return r_ip;
	}


	public void setR_ip(String r_ip) {
		this.r_ip = r_ip;
	}


	public int getNowPage() {
		return nowPage;
	}


	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}


	public MultipartFile getUpload() {
		return upload;
	}


	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}


	public List<RCommVO> getRc_list() {
		return rc_list;
	}


	public void setRc_list(List<RCommVO> rc_list) {
		this.rc_list = rc_list;
	}


	public String getR_writeDate() {
		return r_writeDate;
	}


	public void setR_writeDate(String r_writeDate) {
		this.r_writeDate = r_writeDate;
	}

	public int getAvg() {
		return avg;
	}

	public void setAvg(int avg) {
		this.avg = avg;
	}

	public String getU_idx() {
		return u_idx;
	}

	public void setU_idx(String u_idx) {
		this.u_idx = u_idx;
	}
}
