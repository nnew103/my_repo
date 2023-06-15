<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지네비게이션</title>
</head>
<body>

    <!-- 검색어가 있는 경우와 없는 경우를 구분해서 페이징 처리함 -->
    <c:choose>
    	<c:when test="${!empty searchWord}"><!-- 검색어가 있는 경우 -->
    		    	<c:if test="${pageNum > pages_per_block}">
    		<a href="list.jsp?pageNum=1&pageBlock=1&searchField=${searchField}&searchWord=${searchWord}">&lt;&lt;</a>&nbsp;
    		<a href="list.jsp?pageNum=${(pageBlock - 2)*pages_per_block + 1}&pageBlock=${pageBlock-1}&searchField=${searchField}&searchWord=${searchWord}">
    			&lt;이전페이지
    		</a>   	
    	</c:if>
    	
    	<c:forEach var="i" begin="${(pageBlock-1)*pages_per_block + 1}" end="${pageBlock*pages_per_block}">
    		<c:if test="${i le totalPageNum}">
    			<c:choose>
    				<c:when test = "${pageNum eq i}">
    					<a href="list.jsp?pageNum=${i}&pageBlock=${pageBlock}&searchField=${searchField}&searchWord=${searchWord}">
    						<span style="color:red">${i}&nbsp;</span>
    					</a>
    				</c:when>
    				<c:otherwise>
    					<a href="list.jsp?pageNum=${i}&pageBlock=${pageBlock}&searchField=${searchField}&searchWord=${searchWord}">${i}&nbsp;</a>
    				</c:otherwise>
   			</c:choose>
    		</c:if>
    	</c:forEach>
    
    	<c:if test="${((rows_per_page*pages_per_block) lt totalRows) and (pageBlock ne lastPageBlock) }">
    		<a href="list.jsp?pageNum=${pageBlock*pages_per_block+1}&pageBlock=${pageBlock+1}&searchField=${searchField}&searchWord=${searchWord}">다음페이지&gt;</a>&nbsp;
    		<a href="list.jsp?pageNum=${totalPageNum}&pageBlock=${lastPageBlock}&searchField=${searchField}&searchWord=${searchWord}">&gt;&gt;</a>
    	</c:if>
    	</c:when>
    	
    	<c:otherwise><!-- 검색어가 없는 경우 -->
    		<c:if test="${pageNum > pages_per_block}">
    		<a href="list.jsp?pageNum=1&pageBlock=1">&lt;&lt;</a>&nbsp;
    		<a href="list.jsp?pageNum=${(pageBlock - 2)*pages_per_block + 1}&pageBlock=${pageBlock-1}">
    			&lt;이전페이지
    		</a>   	
    	</c:if>
    	
    	<c:forEach var="i" begin="${(pageBlock-1)*pages_per_block + 1}" end="${pageBlock*pages_per_block}">
    		<c:if test="${i le totalPageNum}">
    			<c:choose>
    				<c:when test = "${pageNum eq i}">
    					<a href="list.jsp?pageNum=${i}&pageBlock=${pageBlock}">
    						<span style="color:red">${i}&nbsp;</span>
    					</a>
    				</c:when>
    				<c:otherwise>
    					<a href="list.jsp?pageNum=${i}&pageBlock=${pageBlock}">${i}&nbsp;</a>
    				</c:otherwise>
   			</c:choose>
    		</c:if>
    	</c:forEach>
    
    	<c:if test="${((rows_per_page*pages_per_block) lt totalRows) and (pageBlock ne lastPageBlock) }">
    		<a href="list.jsp?pageNum=${pageBlock*pages_per_block+1}&pageBlock=${pageBlock+1}">다음페이지&gt;</a>&nbsp;
    		<a href="list.jsp?pageNum=${totalPageNum}&pageBlock=${lastPageBlock}">&gt;&gt;</a>
    	</c:if>
    	</c:otherwise>
    </c:choose>



</body>
</html>