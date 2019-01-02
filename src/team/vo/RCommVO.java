package team.vo;

public class RCommVO {
	private String  rc_idx, //댓글의 기본키 
					rc_writer, //글쓴이
					rc_content, //댓글의 내용
					rc_star, // 별점
					rc_pwd, //비밀번호
					rc_writeDate, //글쓴 날짜								
					rc_status, // 게시물 상태
					r_idx,//원글의 기본키*****
					u_idx;  //회원인지 아닌지 확인용!

	private int nowPage, // 현재페이지
				rc_avg;  // 해당 글의 평점!
				
	
	public String getRc_idx() {
		return rc_idx;
	}

	public void setRc_idx(String rc_idx) {
		this.rc_idx = rc_idx;
	}

	public String getRc_writer() {
		return rc_writer;
	}

	public void setRc_writer(String rc_writer) {
		this.rc_writer = rc_writer;
	}

	public String getRc_content() {
		return rc_content;
	}

	public void setRc_content(String rc_content) {
		this.rc_content = rc_content;
	}

	public String getRc_pwd() {
		return rc_pwd;
	}

	public void setRc_pwd(String rc_pwd) {
		this.rc_pwd = rc_pwd;
	}

	public String getRc_writeDate() {
		return rc_writeDate;
	}

	public void setRc_writeDate(String rc_writeDate) {
		this.rc_writeDate = rc_writeDate;
	}


	public String getRc_star() {
		return rc_star;
	}

	public void setRc_star(String rc_star) {
		this.rc_star = rc_star;
	}

	public String getRc_status() {
		return rc_status;
	}

	public void setRc_status(String rc_status) {
		this.rc_status = rc_status;
	}

	public String getR_idx() {
		return r_idx;
	}

	public void setR_idx(String r_idx) {
		this.r_idx = r_idx;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getRc_avg() {
		return rc_avg;
	}

	public void setRc_avg(int rc_avg) {
		this.rc_avg = rc_avg;
	}

	public String getU_idx() {
		return u_idx;
	}

	public void setU_idx(String u_idx) {
		this.u_idx = u_idx;
	}
	
}