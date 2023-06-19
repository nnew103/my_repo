<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.BoardNoticeVO, dao.BoardNoticeDAO, util.JSFunction" %>
<%@ page import="java.util.Date, java.util.List" %>
<%@ page import="java.io.File, java.text.SimpleDateFormat" %>
<%@ page import="com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<%
String saveDirectory = application.getRealPath("/notice_uploads");//업로드된 파일을 저장할 디렉터리
int maxPostSize = 1024*1024*3; //파일 최대 크기(3MB)
String encoding = "UTF-8";

try{
	//1. MultipartRequest객체 생성
	//new DefaultFileRenamePolicy(): 동일한 파일명이 저장 디렉터리 내에 존재하면 새로운 이름이 부여되도록 함
	MultipartRequest mRequest = new MultipartRequest(request, saveDirectory, maxPostSize, 
									encoding, new DefaultFileRenamePolicy());
	
	//2. 저장 디렉터리에 저장할 새로운 파일명 만들기
	BoardNoticeVO vo = new BoardNoticeVO();
	String originFileName = mRequest.getFilesystemName("attachedFile"); //원본 파일 이름
	
	if(originFileName != null){//새로운 파일을 선택한 경우
		String ext = originFileName.substring(originFileName.lastIndexOf("."));//파일 확장자를 추출함
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		String saveFileName = now+ext;//새로운 파일이름: 업로드 일시.확장자

		//3. 파일명 변경
		File originFile = new File(saveDirectory + File.separator + originFileName);
		File saveFile = new File(saveDirectory + File.separator + saveFileName);
		originFile.renameTo(saveFile);
		vo.setOriginFile(originFileName);
		vo.setSaveFile(saveFileName);
	}
	
	//4. 다른 폼의 전달값 받고 BoardNoticeVO생성해서 저장하기
	int board_idx = Integer.parseInt(mRequest.getParameter("board_idx"));
	String title = mRequest.getParameter("title");
	String content = mRequest.getParameter("content");
	int member_idx = Integer.parseInt(mRequest.getParameter("member_idx"));
	String member_id = mRequest.getParameter("member_id");
	
	vo.setBoard_idx(board_idx);
	vo.setTitle(title);
	vo.setContent(content);
	vo.setMember_idx(member_idx);
	vo.setMember_id(member_id);
	
	//DAO 객체를 통해 DB에 VO객체에 저장된 내용 저장
	BoardNoticeDAO dao = new BoardNoticeDAO();
	int result = dao.updateBoard(vo);
	dao.close();

	if(result == 1){ //글등록 성공시
		response.sendRedirect("view.jsp?no="+vo.getBoard_idx());
	
	}else{//글등록 실패시
		JSFunction.alertBack("수정하기에 실패했습니다", out);
	}
}catch(Exception e)	{
	System.out.println("글수정 중 예외 발생");
	e.printStackTrace();

}

%>