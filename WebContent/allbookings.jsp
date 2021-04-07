<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*,java.util.*"%>
<%
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms", "root", "root");
Statement st=conn.createStatement();
ResultSet rs = st.executeQuery("select * from customer");
%>
<table  width="600" align="center" cellpadding="10">
 <tr>
    <td><img alt="Imperial Hotel" src="hotel_logo.png" width="200"></td>
    <td>Imperial Hotel<br>
		+91-7238827799<br>
		Kanpur Highway, KochhaBhanwar,<br>
		Near BIET ,Jhansi-284128 </td>
  </tr>
</table>
<hr>
<center><br><a href="login.html">LOGOUT</a></center><br><center><br><h3>*****BOOKINGS*****</h3></center><hr>
<table border="1" width="1100" align="center" cellpadding="4">
<tr>
	<th>BookingID
	<th>Name
	<th>RoomType
	<th>Address
	<th>Mobile
	<th>Idtype
	<th>IdNumber
	<th>Adults
	<th>CheckIn
	<th>Checkout
	<th>Status
<%
while(rs.next()){
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(15) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(5) %></td>
<td><%=rs.getString(7) %></td>
<td><%=rs.getString(8) %></td>
<td><%=rs.getString(10) %></td>
<td><%=rs.getString(12) %></td>
<td><%=rs.getString(13) %></td>
<td><a href="edit.jsp?id=<%=rs.getString(1) %>">Edit</a></td>
</tr>
<%}
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
</table>