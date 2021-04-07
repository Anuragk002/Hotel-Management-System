<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="js/validateform.js"></script>
	<title>
		:: Imperial Hotel :: Booking </title>
		<link rel="stylesheet" type="text/css" href="css/bookstyle.css">
</head>
<body>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*,java.util.*"%>
<%
	int id=Integer.parseInt(request.getParameter("id"));
    session.setAttribute("id", id);
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms", "root", "root");
Statement st=conn.createStatement();
ResultSet rs = st.executeQuery("select * from customer where id='"+id+"'");
%>
<%
while(rs.next()){
%>
<form action="edit2.jsp" method="post" name="bookform" onsubmit="return(validateform());">
	<table>
		<tr>
			<td>
				<div class="tab1">
					<b>Booking ID: <%=id%></b><br>
					Name:&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" name="fullname" id="button" placeholder="full name" value="<%=rs.getString(2) %>"><br><br>
					Address:&nbsp;&nbsp;<input type="text" name="address" placeholder="specify complete address" id="button" value="<%=rs.getString(3) %>" required>
						</input><br><br>
				</div>
			</td>
			<td>
				<div class="tab2">
					<br><br>
					No. of Adults:&nbsp;<input type="text" name="no_adults" id="button" required value="<%=rs.getString(10)%>"><br><br>
					No. of Kids:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="no_kids" id="button" value="<%=rs.getString(11) %>" required>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="tab3">
					Mobile:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="tel" name="mobile" id="button" placeholder="without country code" required value="<%=rs.getString(5)%>"><br><br>
					Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="Email" name="email" id="button" required value="<%=rs.getString(6)%>">
				</div>
			</td>
			<td>
				<div class="tab4">
					Arrival/CheckIn:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="date" name="checkin" id="button" required><br><br>
					Departure/CheckOut:&nbsp;&nbsp;&nbsp;
					<input type="date" name="checkout" id="button" required><br><br>
					Room(s):&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name="room" id="button" required value="<%=rs.getString(14)%>"><br><br>
					Room Type:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;
					 <select name="roomtype" id="button" required>
						<option value="standard">STANDARD</option>
						<option value="superior">SUPERIOR</option>
						<option value="deluxe">DELUXE</option>
					</select>
				</div>
			</td>
		</tr>
	</table>     
		<input type="submit" name="book" value="UPDATE" class="book" style = "font-size:15px">
		<a href="allbookings.jsp" class="back" > CANCEL </a>
</form>	
<%}
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
%>
</body>
</html>