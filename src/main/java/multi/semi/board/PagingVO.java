package multi.semi.board;

public class PagingVO {
	private int page;
	private int perpage;
	private int start;
	private int end;

	private int totalpage;
	private int endpage;
	private int startpage;
	private boolean prev;
	private boolean next;
	private int size=10;
	
	public PagingVO() {
		this.page = 1;
		this.perpage = 10;
	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	public int getPerpage() {
		return perpage;
	}
	public void setPerpage(int perpage) {
		this.perpage = perpage;
	}
	public int getStart() {
		start = ((page - 1) * perpage) + 1;
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		end = page*perpage;
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}

	//
	public int getTotalpage() {
		return totalpage;
	}
	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}
	public int getEndpage() {
		return endpage;
	}
	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}
	public int getStartpage() {
		return startpage;
	}
	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}

	@Override
	public String toString() {
		return "PagingVO [page=" + page + ", perpage=" + perpage + ", start=" + start + ", end=" + end + ", totalpage="
				+ totalpage + ", endpage=" + endpage + ", startpage=" + startpage + ", prev=" + prev + ", next=" + next
				+ "]";
	}
	
	public void settingPage(int cntlist) {
		this.totalpage = cntlist/perpage;
		if(cntlist % perpage > 0) {
			totalpage+=1;
		}
		
		endpage=((page-1)/size +1)*size;
		startpage = endpage - size +1;
		if(endpage>totalpage) {
			endpage = totalpage;
		}
		
		prev = startpage==1 ? false:true;
		next = endpage==totalpage ? false:true;
	}
	
}
