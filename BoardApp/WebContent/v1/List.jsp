<%@page import="mybean.board.BoardDto"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html;charset=euc-kr" %>
<HTML>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
   function check(){
      if(document.search.keyWord.value == ""){
         alert("�˻�� �Է��ϼ���.");
         document.search.keyWord.focus();
         return;
      }
      document.search.submit();
   }
   
   function list(){
	   document.list.action="List.jsp";
	   document.list.submit(); //�ؿ� �ִ� form�±׸� �����Ѵ�.
	  
   }
</script>
<BODY>
<center><br>
<h2>JSP Board</h2>
<jsp:useBean id="dao" class="mybean.board.BoardDao"></jsp:useBean>
<%
   String keyField = request.getParameter("keyField");
   String keyWord = request.getParameter("keyWord");
   
   if(request.getParameter("reload") != null){
   
	   if(request.getParameter("reload").equals("true")){
	   keyWord="";
   }
   }
   Vector list = dao.getBoardList(keyField, keyWord);
%>
<table align=center border=0 width=80%>
<tr>
   <td align=left>Total : <%=list.size() %> Articles(
      <font color=red>  1 / 10 Pages </font>)
   </td>
</tr>
</table>

<table align=center width=80% border=0 cellspacing=0 cellpadding=3>
<tr>
   <td align=center colspan=2>
      <table border=0 width=100% cellpadding=2 cellspacing=0>
         <tr align=center bgcolor=#D0D0D0 height=120%>
            <td> ��ȣ </td>
            <td> ���� </td>
            <td> �̸� </td>
            <td> ��¥ </td>
            <td> ��ȸ�� </td>
         </tr>
         <%
   if(list.isEmpty()){
   %>
   <b>��ϵ� ���� �����ϴ�.</b>
   <%
   }else{
      for(int i=0; i<list.size();i++){
         BoardDto dto = (BoardDto)list.get(i);
%>
         <tr align=center>
      <td><BR><%=dto.getNum() %><BR></td>
      <td><BR><%=dto.getSubject() %><BR></td>
      <td><BR><%=dto.getName() %><BR></td>
      <td><BR><%=dto.getRegdate() %><BR></td>
      <td><BR><%=dto.getCount() %><BR></td>
         </tr>
         <%
      }
   }
%>
      </table>
   </td>
</tr>
<tr>
   <td><BR><BR></td>   
</tr>

<tr>
   <td align="left">Go to Page </td>
   <td align=right>
      <a href="Post.jsp">[�۾���]</a>
      <a href="javascript:list()">[ó������]</a>
   </td>
</tr>
</table>
<BR>
<form action="List.jsp" name="search" method="post">
   <table border=0 width=527 align=center cellpadding=4 cellspacing=0>
   <tr>
      <td align=center valign=bottom>
         <select name="keyField" size="1">
            <option value="name"> �̸�
            <option value="subject"> ����
            <option value="content"> ����
         </select>

         <input type="text" size="16" name="keyWord" >
         <input type="button" value="ã��" onClick="check()">
         <input type="hidden" name="page" value= "0">
      </td>
   </tr>
   </table>
   <form name="list" method="post">
   <input type="hidden" name="reload" value="true"/>
   </form>
</form>
</center>   
</BODY>
</HTML>