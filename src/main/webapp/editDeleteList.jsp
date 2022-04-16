<%@include file="header.html"%>

<%@page import="java.sql.*" %>
<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>

<html>
<head>
<style>
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 95%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
</style>
</head>
<body>
<br>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg)){
 %>
 <center><font color="red" size="5" > Successfully Updated</font></center>
<% } %>

<%
if("invalid".equals(msg)){
 %>
 <center><font color="red" size="5" > Something went Wrong!!... Try Again!!</font></center>
<% } %>

<%
if("deleted".equals(msg)){
 %>
 <center><font color="red" size="5" > Successfully Deleted</font></center>
<% } %>
<center>
<table id="customers">
<tr>
<th>ID</th>
<th> Name </th>
<th> Father's Name </th>
<th> Mother'sName </th>
<th> Mobile Number </th>
<th> Gender </th>
<th> Email </th>
<th> BloodGroup </th>
<th> Address </th>
<th> Edit </th>
<th> Delete </th>
</tr>
<tr>
<% 
try{
	Connection con = ConnectionProvider.getCon();
	Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
	ResultSet re=st.executeQuery("select * from donor");
	while(re.next())
	{
%>
<td> <%=re.getInt(1)    %></td>
<td> <%=re.getString(2) %></td>
<td> <%=re.getString(3) %></td>
<td> <%=re.getString(4) %></td>
<td> <%=re.getString(5) %></td>
<td> <%=re.getString(6) %></td>
<td> <%=re.getString(7) %></td>
<td> <%=re.getString(8) %></td>
<td> <%=re.getString(9) %></td>
<td> <a href="updateDonor.jsp?id=<%=re.getString(1)%>">Edit</a></td>
<td> <a href="deleteDonor.jsp?id=<%=re.getString(1)%>">Delete</a></td>
</tr>
<%
   }
  }
catch(Exception e){
System.out.println(e);
}
%> 
</table>
</center>
<br>
<br>
<br>
<br>
<h3><center>All Right Reserved @ Aditya Agrawal :: 2022  </center></h3>
</body>
</html>