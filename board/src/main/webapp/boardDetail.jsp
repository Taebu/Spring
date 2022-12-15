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
<title>글 내용</title>
</head>
<body>
<p>번호:${vo.num}</p>
<p>title:${vo.title}</p>
<p>writer:${vo.writer}</p>
<p>content:${vo.content}</p>
<p>regdate:${vo.regdate}</p>
<p>cnt:${vo.cnt}</p>
<a href="/board/editForm.jsp?num=${vo.num}"><button>수정</button></a>
<a href="/board/deleteForm.jsp?num=${vo.num}"><button>삭제</button></a>
</body>
</html>