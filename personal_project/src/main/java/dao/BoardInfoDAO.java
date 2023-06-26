package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.DBConnectionPool;
import vo.BoardInfoVO;

public class BoardInfoDAO extends DBConnectionPool {

	// 검색 조건에 맞는 게시물 목록을 반환하는 메소드
	public List<BoardInfoVO> selectList(Map<String, Object> map) {
		List<BoardInfoVO> boardList = new ArrayList<BoardInfoVO>();

		String searchWord, searchField, sql;
		searchWord = searchField = sql = null;

		try {

			if (map.size() != 0) {// 검색어가 있는 경우
				searchWord = (String) map.get("searchWord");
				searchField = (String) map.get("searchField");

				if (searchField.equals("title")) {			// 검색구분이 '제목'인 경우
					sql = "select * from board_info " + "where title like '%'||?||'%' " + "order by board_idx desc";
				} else if (searchField.equals("content")){	// 검색구분이 '내용'인 경우
					sql = "select * from board_info " + "where content like '%'||?||'%' " + "order by board_idx desc";
				} else {									// 검색구분이 '작성자'인 경우
					sql = "select * from board_info " + "where member_id like '%'||?||'%' " + "order by board_idx desc";
				}
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchWord);
			} else {	// 검색어가 없는 경우
				sql = "select * from board_info order by board_idx desc";
				pstmt = conn.prepareStatement(sql);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardInfoVO vo = new BoardInfoVO();
				vo.setBoard_idx(rs.getInt("board_idx"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setPost_date(rs.getDate("post_date"));
				vo.setMember_idx(rs.getInt("member_idx"));
				vo.setMember_id(rs.getString("member_id"));
				vo.setRead_count(rs.getInt("read_count"));
				vo.setDel_or_not(rs.getInt("del_or_not"));

				boardList.add(vo);
			}
		} catch (Exception e) {
			System.out.println("게시물 수 구하는 중 예외 발생");
			e.printStackTrace();
		}
		return boardList;
	}

	// 검색 조건에 맞는 게시물 수를 반환하는 메소드
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;	// 총 게시물 수 반환값

		String searchWord, searchField, sql;
		searchWord = searchField = sql = null;
		try {
			if (map.size() != 0) {	// 검색어가 있는 경우
				searchWord = (String) map.get("searchWord");
				searchField = (String) map.get("searchField");

				if (searchField.equals("title")) {	// 검색구분이 '제목'인 경우
					sql = "select count(*) from board_info " + "where title like '%'||?||'%' "
							+ "order by board_idx desc";
				} else if (searchField.equals("content")){	// 검색구분이 '내용'인 경우
					sql = "select count(*) from board_info " + "where content like '%'||?||'%' "
							+ "order by board_idx desc";
				}else {	// 검색구분이 '작성자'인 경우
					sql = "select count(*) from board_info " + "where member_id like '%'||?||'%' "
							+ "order by board_idx desc";
				}
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchWord);
			} else {	// 검색어가 없는 경우
				sql = "select count(*) from board_info order by board_idx desc";
				pstmt = conn.prepareStatement(sql);
			}
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				totalCount = rs.getInt(1);
			}

		} catch (Exception e) {
			System.out.println("게시물 수 구하는 중 예외 발생");
			e.printStackTrace();

		}
		return totalCount;
	}

	// 게시글 등록 메소드
	public int insertBoard(BoardInfoVO vo) {
		int result = 0;// 글 등록 실패시 반환값

		try {
			String sql = "insert into board_info (" + "board_idx, title, content, member_idx, member_id) "
					+ "values(board_info_seq.nextval, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getMember_idx());
			pstmt.setString(4, vo.getMember_id());

			result = pstmt.executeUpdate();
			// 성공시 1 반환
		} catch (Exception e) {
			System.out.println("게시글 등록 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

	// 조회수 증가 메소드
	public void updateReadCount(int board_idx) {
		String sql = "update board_info set read_count = read_count+1 where board_idx=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_idx);
			pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}

	// 지정한 게시물을 찾아 내용을 반환하는 메소드
	public BoardInfoVO selectView(int board_idx) {
		BoardInfoVO vo = new BoardInfoVO();
		String sql = "select * from board_info where board_idx = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_idx);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo.setBoard_idx(rs.getInt("board_idx"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setPost_date(rs.getDate("post_date"));
				vo.setMember_idx(rs.getInt("member_idx"));
				vo.setMember_id(rs.getString("member_id"));
				vo.setRead_count(rs.getInt("read_count"));
				vo.setDel_or_not(rs.getInt("del_or_not"));
			}
		} catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return vo;
	}

	// 지정한 게시물 삭제 메소드
	public int deletePost(BoardInfoVO vo) {
		int result = 0; // 게시글 삭제 실패시 반환값
		try {
			String sql = "delete from board_info where board_idx=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getBoard_idx());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

	// 지정한 게시물 내용을 수정 메소드
	public int updateBoard(BoardInfoVO vo) {
		int result = 0;// 수정 실패했을 때 반환값

		try {
			String sql = "update board_info set " + "title=?, content=? " + "where board_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getBoard_idx());

			result = pstmt.executeUpdate();	// 성공 시 1 반환
		} catch (Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();

		}
		return result;
	}
}
