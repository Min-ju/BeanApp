<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*" %>

<jsp:useBean id="dao" class="mybean.board.BoardDao"/>
<jsp:useBean id="dto" class="mybean.board.BoardDto"/>
<jsp:setProperty property="*" name="dto"/>   <!--setter �޼��� 12���� ȣ���ϴ� ��ſ� �����ϰ� ���  --> 
 <% 
 
    request.setCharacterEncoding("euc-kr");
    response.setCharacterEncoding("euc-kr");
 

    dao.addBoard(dto);
    response.sendRedirect("List.jsp");
%>
