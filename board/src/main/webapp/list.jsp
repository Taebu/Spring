<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" import="board.*, java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
BoardDao dao = new BoardDao();
List<BoardVo> ls = dao.selectAll();
pageContext.setAttribute("ls", ls);
%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
</head>
<body>
<h2>게시글 목록</h2>
<table border="1">
<tr>
<td>num</td>
<td>title</td>
<td>writer</td>
<td>regdate</td>
<td>cnt</td>
</tr>
<c:forEach var="board" items="${ls}">
<tr>
<td>${board.num}</td>
<td><a href="${pageContext.request.contextPath}/boardDetail.jsp?num=${board.num}">${board.title}</a></td>
<td>${board.writer}</td>
<td>${board.regdate}</td>
<td>${board.cnt}</td>
</tr>
</c:forEach>
</table>

<a href="<c:url value="registerForm.jsp"/>"><button>글등록</button></a>
</body>
</html>