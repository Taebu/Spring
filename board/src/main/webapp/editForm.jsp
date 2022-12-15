<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="dao" class="board.BoardDao"/>
<%
  int num = Integer.parseInt(request.getParameter("num"));
  BoardVo vo = dao.selectOne(num);
  pageContext.setAttribute("vo",vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
</head>
<body>
<form action="edit.jsp" method="post">
<input type="hidden" name="num" value="${vo.num}">
<input type="text" name="title" value="${vo.title}" placeholder="제목" required><br>
<input type="text" name="writer"  value="${vo.writer}" placeholder="작성자" required><br>
<textarea rows="4" cols="20" name="content">${vo.content}</textarea><br>
<input type="submit" value="등록">

</form>
</body>
</html>