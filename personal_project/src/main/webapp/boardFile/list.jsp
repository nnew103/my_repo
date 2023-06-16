<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.BoardFileVO, dao.BoardFileDAO, util.JSFunction" %>
<%@ page import="java.util.List, java.util.HashMap, java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
//Dao객체를 생성 및 DB 연결
BoardFileDAO dao = new BoardFileDAO();

//사용자가 입력한 검색 조건을 Map에 저장
Map<String, Object> map = new HashMap<String, Object>();
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");

if(searchWord != null){
    map.put("searchField", searchField);
    map.put("searchWord", searchWord);
}

List<BoardFileVO> boardList = dao.selectList(map);//게시물 목록
pageContext.setAttribute("boardList", boardList);

/*페이지 네비게이션 관련 변수 선언
1. 총 레코드 수: totalRows
2. 페이지당 테이블에 출력할 레코드 수: rows_per_page
3. 페이지 네비게이션에서 블록당 페이지 수: pages_per_block
4. 페이지 네비게이션에서 현재 페이지 번호: pageNum
5. 테이블에 표시할 시작번호: startNum
6. 테이블에 표시할 끝번호: endNum
7. 페이지 네비게이션에서 전체 페이지번호 수: totalPageNum
8. 페이지 네비게이션에서 현재 페이지 블록: pageBlock
9. 페이지 네비게이션에서 마지막 페이지 블록: lagePageBlock
*/

int totalRows = dao.selectCount(map);//총 레코드 수 
dao.close();
int rows_per_page = 10;
int pages_per_block = 5;
int pageNum = 0;
	if(request.getParameter("pageNum") == null){
		pageNum = 1;
	}else{
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
	}
int startNum = (pageNum - 1)*rows_per_page + 1;
int endNum = pageNum*rows_per_page;
int totalPageNum = (int)Math.ceil((double)totalRows/rows_per_page);
int pageBlock = 0;
	if(request.getParameter("pageBlock") == null){
		pageBlock = 1;
	}else{
		pageBlock = Integer.parseInt(request.getParameter("pageBlock"));
	}
int lastPageBlock = (int)Math.ceil((double)totalPageNum/pages_per_block);
	
%>
<!-- 변수들을 EL로 사용하기 위해 core라이브러리의 set태그로 다시 변수 저장함 -->
<c:set var="totalRows" value="<%= totalRows %>" />
<c:set var="rows_per_page" value="<%= rows_per_page %>" />
<c:set var="pages_per_block" value="<%= pages_per_block %>" />
<c:set var="pageNum" value="<%= pageNum %>" />
<c:set var="startNum" value="<%= startNum %>" />
<c:set var="endNum" value="<%= endNum %>" />
<c:set var="totalPageNum" value="<%= totalPageNum %>" />
<c:set var="pageBlock" value="<%= pageBlock %>" />
<c:set var="lastPageBlock" value="<%= lastPageBlock %>" />
<c:set var="searchField" value="<%= searchField %>" />
<c:set var="searchWord" value="<%= searchWord %>" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글목록</title>

<link rel="stylesheet" href="../resources/css/list_jsp.css" >

<style>
	#td_paging{
		height: 70px;
		font: 9px Arial, Sans-serif;
		text-align: center;
		border-color: white;
	}

</style>

</head>
<body>
    <header>
        <jsp:include page="../main/boardFile_header.jsp"/>
    </header>

    <!-- 검색 폼 -->
    <form>
        <table id="tbl_search">
            <caption>글목록</caption>
            <tr>
                <td id="td_total">
                	총게시물: ${totalRows}
                </td>
                <td id="td_search">
                    <select name="searchField">
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                    <input type="text" name="searchWord" id="searchWord">
                    <input type="submit" id="search_btn" value="검색">

                </td>
            </tr>
        </table>
    </form>


    <!-- 글목록 테이블 -->
    <table id="tbl_list">
        <tr>
            <th width="">번호</th>
            <th width="">제목</th>
            <th width="">작성자</th>
            <th width="">첨부</th>
            <th width="">등록일</th>
            <th width="">조회수</th>
        </tr>

        <!-- 글목록 내용-->
		<c:choose>
			<c:when test="${empty boardList}">
				<tr>
					<td colspan="6"> 등록된 게시물이 없습니다. </td>
				</tr>
			</c:when>
			<c:otherwise>
			
				<c:forEach var="rowNum" begin="${startNum}" end="${endNum}">
					<tr>
						<td>${rowNum}</td>
						<td id="td_title">
							<a href="view.jsp?no=${boardList[rowNum-1].board_idx}">${boardList[rowNum-1].title}</a>
						</td>
						<td>${boardList[rowNum-1].member_id}</td>
						<td style="padding-left:20px">
							<c:if test="${!empty boardList[rowNum-1].originFile}">
								<a href="download.jsp?oName=${boardList[rowNum-1].originFile}&sName=${boardList[rowNum-1].saveFile}">
									<img src="../resources/img/download.png" width="15px" height="17px">
								</a>
							</c:if>
						</td>
						<td>${boardList[rowNum-1].post_date}</td>
						<td>${boardList[rowNum-1].read_count}</td>
					</tr>
				</c:forEach>
				
			</c:otherwise>
		</c:choose>
		<tr>
			<td id="td_paging" colspan="6">
				<!-- 페이지 네비게이션 구현 -->
				<%@ include file="paging.jsp" %>
			</td>
		</tr>
    </table>
 	
	<!-- 목록 하단에 글등록 버튼 구현 -->
	<c:if test="${!empty member_info}">
		<div id="div_write">
			<a href="write.jsp"><button id="write_btn">글등록</button></a>
		</div>
	
	</c:if>

    <footer>
        <jsp:include page="../main/footer.jsp"/>
    </footer>
</body>
</html>