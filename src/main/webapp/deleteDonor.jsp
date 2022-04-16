<%@page import="java.sql.*" %>
<%@page import="Project.ConnectionProvider" %>

<% 
String id=request.getParameter("id");
try{
	Connection con = ConnectionProvider.getCon();
	Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
	  st.executeUpdate("delete from donor where id='"+id +"'");
	  response.sendRedirect("editDeleteList.jsp?msg=deleted");
	  }
	  catch(Exception e){
		  response.sendRedirect("editDeleteList.jsp?msg=invalid");
	  }
	  %>