package vo;

import java.util.Date;

public class BoardFileVO{
	private int board_idx;		// 게시판 일련번호
	private String title;		// 제목
	private String content;		// 내용
	private String originFile;	// 원본 파일
	private String saveFile;	// 저장 파일
	private Date post_date;		// 등록일
	private int read_count;		// 조회수
	private int member_idx;		// 회원 일련번호
	private String member_id;	// 회원 id
	private int del_or_not;		// 회원 탈퇴 여부
	private Date del_date;		// 회원 탈퇴 날짜
	
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
	public String getOriginFile() {
		return originFile;
	}
	public void setOriginFile(String originFile) {
		this.originFile = originFile;
	}
	public String getSaveFile() {
		return saveFile;
	}
	public void setSaveFile(String saveFile) {
		this.saveFile = saveFile;
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
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
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
