<%@page import="java.sql.*" %>
<%@page import="Project.ConnectionProvider" %>
<%
String mobile=request.getParameter("mobilenumber");
try{
Connection con=ConnectionProvider.getCon();
Statement st=con.createStatement();
 st.executeUpdate("delete from bloodrequest where mobilenumber='"+mobile+"'");

response.sendRedirect("requestForBlood.jsp");
}
catch(Exception e){
	response.sendRedirect("requestForBlood.jsp");
	System.out.println(e);
}
%>