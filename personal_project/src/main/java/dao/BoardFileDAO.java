package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.DBConnectionPool;
import vo.BoardFileVO;

public class BoardFileDAO extends DBConnectionPool {
	// 검색 조건에 맞는 게시물 목록을 반환하는 메소드
	public List<BoardFileVO> selectList(Map<String, Object> map) {
		List<BoardFileVO> boardList = new ArrayList<BoardFileVO>();

		String searchWord, searchField, sql;
		searchWord = searchField = sql = null;

		try {

			if (map.size() != 0) {// 검색어가 있는 경우

				searchWord = (String) map.get("searchWord");
				searchField = (String) map.get("searchField");

				if (searchField.equals("title")) {// 검색구분이 '제목'인 경우
					sql = "select * from board_file " + "where title like '%'||?||'%' " + "order by board_idx desc";
				} else {// 검색구분이 '내용'인 경우
					sql = "select * from board_file " + "where content like '%'||?||'%' " + "order by board_idx desc";
				}
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchWord);
				// PreparedStatement like를 이용한 검색시 %와 ? 바인딩 방법
				// --MySQL sql문에서는 like ?로 쓰고 pstmt.setString(1, "%"+searchWord+"%");로
				// 작성함
			} else {// 검색어가 없는 경우
				sql = "select * from board_file order by board_idx desc";
				pstmt = conn.prepareStatement(sql);

			}
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardFileVO vo = new BoardFileVO();
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
					sql = "select count(*) from board_file " + "where title like '%'||?||'%' "
							+ "order by board_idx desc";
				} else {// 검색구분이 '내용'인 경우
					sql = "select count(*) from board_file " + "where content like '%'||?||'%' "
							+ "order by board_idx desc";
				}
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchWord);
				// PreparedStatement like를 이용한 검색시 %와 ? 바인딩 방법
				// --MySQL sql문에서는 like ?로 쓰고 pstmt.setString(1, "%"+searchWord+"%");로
				// 작성함

			} else {// 검색어가 없는 경우
				sql = "select count(*) from board_file order by board_idx desc";
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

}
