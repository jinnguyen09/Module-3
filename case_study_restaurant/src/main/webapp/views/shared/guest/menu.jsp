<%@ page contentType="text/html;charset=UTF-8" %>

<%
  request.setAttribute("contentPage", "/views/guest/menu_content.jsp");
  RequestDispatcher dispatcher = request.getRequestDispatcher("/layout.jsp");
  dispatcher.forward(request, response);
%>
