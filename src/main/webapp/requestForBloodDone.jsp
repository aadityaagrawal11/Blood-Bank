<%@page import="java.sql.*" %>
<%@page import="Project.ConnectionProvider" %>
<%
String mobilenumber=request.getParameter("mobilenumber");
try{
Connection con=ConnectionProvider.getCon();
PreparedStatement ps=con.prepareStatement("update bloodrequest set status='completed' where mobilenumber=?");
ps.setString(1,mobilenumber);
ps.execute();
response.sendRedirect("requestForBlood.jsp");
}
catch(Exception e){
	response.sendRedirect("requestForBlood.jsp");
	System.out.println(e);
}
%>