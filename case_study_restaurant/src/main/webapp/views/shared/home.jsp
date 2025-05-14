<%@ page contentType="text/html;charset=UTF-8" %>
<%
  request.setAttribute("contentPage", "/views/home_content.jsp");
  RequestDispatcher dispatcher = request.getRequestDispatcher("/layoutUser.jsp");
  dispatcher.forward(request, response);
%>
