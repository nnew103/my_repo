package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.DBConnectionPool;
import vo.MemberInfoVO;

public class MemberInfoDAO extends DBConnectionPool {

	// 로그인
	public MemberInfoVO login(String member_id, String member_pw) {
		MemberInfoVO member_info = null;// 같은 아이디와 비밀번호가 없을 때 반환값

		String sql = "select * from memberinfo where member_id=? and member_pw=? and cancel_or_not=1";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			pstmt.setString(2, member_pw);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				member_info = new MemberInfoVO();
				member_info.setMember_idx(rs.getInt("member_idx"));
				member_info.setMember_id(rs.getString("member_id"));
				member_info.setMember_pw(rs.getString("member_pw"));
				member_info.setMember_name(rs.getString("member_name"));
				member_info.setHandphone(rs.getString("handphone"));
				member_info.setMember_email(rs.getString("member_email"));
				member_info.setJoin_date(rs.getDate("join_date"));
				member_info.setUpdate_date(rs.getDate("update_date"));
				member_info.setCancel_date(rs.getDate("cancel_date"));
				member_info.setCancel_or_not(rs.getInt("cancel_or_not"));
				member_info.setGrade(rs.getInt("grade"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return member_info;
	}

	// 아이디 중복 확인
	public int checkId(String member_id) {
		int result = -1;// 동일한 아이디가 없을 때 반환값

		String sql = "select member_id from memberinfo where member_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = 1;// 동일한 아이디가 있을 때 반환값
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return result;
	}

	// 회원가입
	public int join(MemberInfoVO vo) {
		int result = 0;// 회원가입 실패시 반환값

		try {
			String sql = "insert into memberinfo (member_idx, member_id, member_pw, member_name, "
					+ "handphone,member_email) values (memberinfo_seq.nextval,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMember_id());
			pstmt.setString(2, vo.getMember_pw());
			pstmt.setString(3, vo.getMember_name());
			pstmt.setString(4, vo.getHandphone());
			pstmt.setString(5, vo.getMember_email());

			result = pstmt.executeUpdate();
			// result값이 1이면 회원가입 성공

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			close();
		}

		return result;
	}

	// 회원정보 수정
	public MemberInfoVO update(MemberInfoVO vo) {
		MemberInfoVO member = null;

		try {
			String sql = "update memberinfo set member_pw=?, member_name=?, handphone=?, "
					+ "member_email=?, update_date=sysdate where member_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMember_pw());
			pstmt.setString(2, vo.getMember_name());
			pstmt.setString(3, vo.getHandphone());
			pstmt.setString(4, vo.getMember_email());
			pstmt.setString(5, vo.getMember_id());
			int rowCount = pstmt.executeUpdate();

			if (rowCount == 1) {
				System.out.println("업데이트 성공");
			}

			// 세션객체에 담기위해 수정된 회원정보를 조회해서 MemberInfoVO객체에 담음
			sql = "select * from memberinfo where member_id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMember_id());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				member = new MemberInfoVO();
				member.setMember_idx(rs.getInt("member_idx"));
				member.setMember_id(rs.getString("member_id"));
				member.setMember_pw(rs.getString("member_pw"));
				member.setMember_name(rs.getString("member_name"));
				member.setHandphone(rs.getString("handphone"));
				member.setMember_email(rs.getString("member_email"));
				member.setJoin_date(rs.getDate("join_date"));
				member.setUpdate_date(rs.getDate("update_date"));
				member.setCancel_date(rs.getDate("cancel_date"));
				member.setCancel_or_not(rs.getInt("cancel_or_not"));
				member.setGrade(rs.getInt("grade"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return member;
	}

	public int cancel(int member_idx) {
		int result = 0; // 회원탈퇴 실패시 반환값

		try {
			String sql = "update memberinfo set cancel_or_not=-1, cancel_date=sysdate where member_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_idx);

			result = pstmt.executeUpdate();// 업데이트 성공시 1 반환

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return result;
	}
	
	// 검색 조건에 맞는 게시물 목록을 반환하는 메소드
		public List<MemberInfoVO> selectList(Map<String, Object> map) {
			List<MemberInfoVO> memberList = new ArrayList<MemberInfoVO>();

			String searchWord, searchField, sql;
			searchWord = searchField = sql = null;

			try {

				if (map.size() != 0) {// 검색어가 있는 경우

					searchWord = (String) map.get("searchWord");
					searchField = (String) map.get("searchField");

					if (searchField.equals("member_id")) {// 검색구분이 '아이디'인 경우
						sql = "select * from memberinfo " + "where member_id like '%'||?||'%' and cancel_or_not = 1 " + "order by member_idx desc";
					} else {// 검색구분이 '이름'인 경우
						sql = "select * from memberinfo " + "where member_name like '%'||?||'%' and cancel_or_not = 1 " + "order by member_idx desc";
					}
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, searchWord);
					// PreparedStatement like를 이용한 검색시 %와 ? 바인딩 방법
					// --MySQL sql문에서는 like ?로 쓰고 pstmt.setString(1, "%"+searchWord+"%");로
					// 작성함
				} else {// 검색어가 없는 경우
					sql = "select * from memberinfo where cancel_or_not = 1 order by member_idx desc";
					pstmt = conn.prepareStatement(sql);

				}
				rs = pstmt.executeQuery();

				while (rs.next()) {
					MemberInfoVO vo = new MemberInfoVO();
					vo.setMember_idx(rs.getInt("member_idx"));
					vo.setMember_id(rs.getString("member_id"));
					vo.setMember_pw(rs.getString("member_pw"));
					vo.setMember_name(rs.getString("member_name"));
					vo.setHandphone(rs.getString("handphone"));
					vo.setMember_email(rs.getString("member_email"));
					vo.setJoin_date(rs.getDate("join_date"));
					vo.setUpdate_date(rs.getDate("update_date"));
					vo.setCancel_date(rs.getDate("cancel_date"));
					vo.setCancel_or_not(rs.getInt("cancel_or_not"));
					vo.setGrade(rs.getInt("grade"));
					
					memberList.add(vo);
				}

			} catch (Exception e) {
				System.out.println("게시물 수 구하는 중 예외 발생");
				e.printStackTrace();
			}

			return memberList;
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

					if (searchField.equals("member_id")) {// 검색구분이 '아이디'인 경우
						sql = "select count(*) from memberinfo " + "where member_id like '%'||?||'%' and cancel_or_not = 1 "
								+ "order by member_idx desc";
					} else {// 검색구분이 '이름'인 경우
						sql = "select count(*) from memberinfo " + "where member_name like '%'||?||'%' and cancel_or_not = 1 "
								+ "order by member_idx desc";
					}
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, searchWord);
					// PreparedStatement like를 이용한 검색시 %와 ? 바인딩 방법
					// --MySQL sql문에서는 like ?로 쓰고 pstmt.setString(1, "%"+searchWord+"%");로
					// 작성함

				} else {// 검색어가 없는 경우
					sql = "select count(*) from memberinfo where cancel_or_not = 1 order by member_idx desc";
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

		
		// 지정한 회원을 찾아 회원정보를 반환하는 메소드
		public MemberInfoVO selectView(int member_idx) {
			MemberInfoVO vo = new MemberInfoVO();

			String sql = "select * from memberinfo where member_idx = ?";

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, member_idx);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					vo.setMember_idx(rs.getInt("member_idx"));
					vo.setMember_id(rs.getString("member_id"));
					vo.setMember_pw(rs.getString("member_pw"));
					vo.setMember_name(rs.getString("member_name"));
					vo.setHandphone(rs.getString("handphone"));
					vo.setMember_email(rs.getString("member_email"));
					vo.setJoin_date(rs.getDate("join_date"));
					vo.setUpdate_date(rs.getDate("update_date"));
					vo.setCancel_date(rs.getDate("cancel_date"));
					vo.setCancel_or_not(rs.getInt("cancel_or_not"));
					vo.setGrade(rs.getInt("grade"));
				}

			} catch (Exception e) {
				System.out.println("게시물 상세보기 중 예외 발생");
				e.printStackTrace();
			}
			return vo;
		}
}
