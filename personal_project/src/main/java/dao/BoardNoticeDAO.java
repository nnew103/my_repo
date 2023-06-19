package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.DBConnectionPool;
import vo.BoardNoticeVO;
import vo.BoardNoticeVO;

public class BoardNoticeDAO extends DBConnectionPool {
	// 검색 조건에 맞는 게시물 목록을 반환하는 메소드
	public List<BoardNoticeVO> selectList(Map<String, Object> map) {
		List<BoardNoticeVO> boardList = new ArrayList<BoardNoticeVO>();

		String searchWord, searchField, sql;
		searchWord = searchField = sql = null;

		try {

			if (map.size() != 0) {// 검색어가 있는 경우

				searchWord = (String) map.get("searchWord");
				searchField = (String) map.get("searchField");

				if (searchField.equals("title")) {// 검색구분이 '제목'인 경우
					sql = "select * from board_notice " + "where title like '%'||?||'%' " + "order by board_idx desc";
				} else {// 검색구분이 '내용'인 경우
					sql = "select * from board_notice " + "where content like '%'||?||'%' " + "order by board_idx desc";
				}
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchWord);
				// PreparedStatement like를 이용한 검색시 %와 ? 바인딩 방법
				// --MySQL sql문에서는 like ?로 쓰고 pstmt.setString(1, "%"+searchWord+"%");로
				// 작성함
			} else {// 검색어가 없는 경우
				sql = "select * from board_notice order by board_idx desc";
				pstmt = conn.prepareStatement(sql);

			}
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardNoticeVO vo = new BoardNoticeVO();
				vo.setBoard_idx(rs.getInt("board_idx"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setPost_date(rs.getDate("post_date"));
				vo.setMember_idx(rs.getInt("member_idx"));
				vo.setMember_id(rs.getString("member_id"));
				vo.setOriginFile(rs.getString("originfile"));// 원본 파일명
				vo.setSaveFile(rs.getString("savefile"));// 저장 파일명
				vo.setRead_count(rs.getInt("read_count"));
				vo.setDel_or_not(rs.getInt("del_or_not"));// 삭제 여부(1:유지, -1:삭제)

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
		int totalCount = 0;// 총 게시물 수 반환값

		String searchWord, searchField, sql;
		searchWord = searchField = sql = null;

		try {

			if (map.size() != 0) {// 검색어가 있는 경우

				searchWord = (String) map.get("searchWord");
				searchField = (String) map.get("searchField");

				if (searchField.equals("title")) {// 검색구분이 '제목'인 경우
					sql = "select count(*) from board_notice " + "where title like '%'||?||'%' "
							+ "order by board_idx desc";
				} else {// 검색구분이 '내용'인 경우
					sql = "select count(*) from board_notice " + "where content like '%'||?||'%' "
							+ "order by board_idx desc";
				}
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchWord);
				// PreparedStatement like를 이용한 검색시 %와 ? 바인딩 방법
				// --MySQL sql문에서는 like ?로 쓰고 pstmt.setString(1, "%"+searchWord+"%");로
				// 작성함

			} else {// 검색어가 없는 경우
				sql = "select count(*) from board_notice order by board_idx desc";
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
	
	public int insertBoard(BoardNoticeVO vo) {
		int result = 0;// 글등록 실패시 반환값

		try {
			String sql = "insert into board_notice ("
					+ "board_idx, title, content, member_idx, member_id, originfile, savefile) "
					+ "values(board_notice_seq.nextval, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getMember_idx());
			pstmt.setString(4, vo.getMember_id());
			pstmt.setString(5, vo.getOriginFile());
			pstmt.setString(6, vo.getSaveFile());

			result = pstmt.executeUpdate();// executeUpdate()쿼리 수행결과 적용된 행의 수 반환
			// 성공시 1 반환

		} catch (Exception e) {
			System.out.println("게시글 등록 중 예외 발생");
			e.printStackTrace();

		}
		return result;
	}
	
	// 조회수 증가시키는 메소드
		public void updateReadCount(int board_idx) {
			String sql = "update board_notice set read_count = read_count+1 where board_idx=?";
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
		public BoardNoticeVO selectView(int board_idx) {
			BoardNoticeVO vo = new BoardNoticeVO();

			String sql = "select * from board_notice where board_idx = ?";

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
					vo.setOriginFile(rs.getString("originfile"));// 원본 파일명
					vo.setSaveFile(rs.getString("savefile"));// 저장 파일명
					vo.setRead_count(rs.getInt("read_count"));
					vo.setDel_or_not(rs.getInt("del_or_not"));
				}

			} catch (Exception e) {
				System.out.println("게시물 상세보기 중 예외 발생");
				e.printStackTrace();
			}
			return vo;
		}
		
		public int deletePost(BoardNoticeVO vo) {
			int result = 0; // 게시글 삭제 실패시 반환값

			try {
				String sql = "delete from board_notice where board_idx=?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, vo.getBoard_idx());

				result = pstmt.executeUpdate();

			} catch (Exception e) {
				System.out.println("게시물 삭제 중 예외 발생");
				e.printStackTrace();
			}

			return result;
		}
		
		// 지정한 게시물의 내용을 수정하는 메소드
		public int updateBoard(BoardNoticeVO vo) {
			int result = 0;// 수정 실패했을 때 반환값
			String sql = null;

			try {

				if (vo.getOriginFile() != null) {// 새로운 파일을 선택한 경우
					sql = "update board_notice set " + "title=?, content=?, originfile=?, savefile=? " + "where board_idx=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, vo.getTitle());
					pstmt.setString(2, vo.getContent());
					pstmt.setString(3, vo.getOriginFile());
					pstmt.setString(4, vo.getSaveFile());
					pstmt.setInt(5, vo.getBoard_idx());

				} else {// 새로운 파일을 선택하지 않은 경우
					sql = "update board_notice set " + "title=?, content=? " + "where board_idx=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, vo.getTitle());
					pstmt.setString(2, vo.getContent());
					pstmt.setInt(3, vo.getBoard_idx());
				}

				// 쿼리문 실행 후 적용된 행의 수 반환
				// 성공 시 1 반환
				result = pstmt.executeUpdate();

			} catch (Exception e) {
				System.out.println("게시물 수정 중 예외 발생");
				e.printStackTrace();

			}

			return result;
		}
}
