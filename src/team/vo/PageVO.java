package team.vo;

public class PageVO {
		//현재 페이지값과, 페이지 당 보여질 게시물의 수
		private int nowPage = 1;
		private int numPerPage = 7;
		
		//페이징을 위한 멤버변수
		private int totalRecord;
		private int pagePerBlock = 5;
		private int totalPage;
		
		private int startPage;
		private int endPage;
		
		//게시물의 시작과 끝
		private int begin, end;

		public int getNowPage() {
			return nowPage;
		}

		public void setNowPage(int nowPage) {
			this.nowPage = nowPage;
			
			if(nowPage > totalPage)
				nowPage = totalPage;
			
			this.begin = (nowPage-1)*numPerPage+1;
			this.end = begin+numPerPage-1;

			editStartPage();
		}

		public int getNumPerPage() {
			return numPerPage;
		}

		public void setNumPerPage(int numPerPage) {
			this.numPerPage = numPerPage;
		}

		public int getTotalRecord() {
			return totalRecord;
		}

		public void setTotalRecord(int totalRecord) {
			this.totalRecord = totalRecord;
			
			this.totalPage = (int)Math.ceil((double)totalRecord/numPerPage);

		}

		public int getStartPage() {
			return startPage;
		}

		public void setStartPage(int startPage) {
			this.startPage = startPage;

		}

		public int getEndPage() {
			return endPage;
		}

		public void setEndPage(int endPage) {
			this.endPage = endPage;
		}

		public int getPagePerBlock() {
			return pagePerBlock;
		}

		public void setPagePerBlock(int pagePerBlock) {
			this.pagePerBlock = pagePerBlock;
		}

		public int getTotalPage() {
			return totalPage;
		}

		public void setTotalPage(int totalPage) {
			this.totalPage = totalPage;
		}

		public int getBegin() {
			return begin;
		}

		public void setBegin(int begin) {
			this.begin = begin;
		}

		public int getEnd() {
			return end;
		}

		public void setEnd(int end) {
			this.end = end;
		}
		
		public void editStartPage() {
			this.startPage = (int)((nowPage-1)/pagePerBlock)*pagePerBlock+1;
			
			this.endPage = startPage + pagePerBlock-1;
			
			if(endPage > totalPage)
				endPage = totalPage;
		}
}
