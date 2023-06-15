package vo;

import java.util.Date;

public class BoardInfoVO {
	private int board_idx;//게시글 번호(board_basic테이블의 기본키)
	private String title;//제목
	private String content;//내용
	private Date post_date;//등록일
	private int read_count;//조회수
	private String member_id;//작성자 아이디
	private int member_idx;//작성자 번호(member테이블에 대한 외래키)
	private int del_or_not;//삭제 여부(1:유지, -1:삭제)
	private Date del_date;//삭제일
	
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getPost_date() {
		return post_date;
	}
	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}
	public int getRead_count() {
		return read_count;
	}
	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public int getDel_or_not() {
		return del_or_not;
	}
	public void setDel_or_not(int del_or_not) {
		this.del_or_not = del_or_not;
	}
	public Date getDel_date() {
		return del_date;
	}
	public void setDel_date(Date del_date) {
		this.del_date = del_date;
	}
	
	
	
}
