<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String name=request.getParameter("fullname");
String address=request.getParameter("address");
String country=request.getParameter("country");
String mobile=request.getParameter("mobile");
String email=request.getParameter("email");
String idtype=request.getParameter("idtype");
int idno=Integer.parseInt(request.getParameter("idno"));
String gender=request.getParameter("gender");
int noadults=Integer.parseInt(request.getParameter("no_adults"));
int nokids=Integer.parseInt(request.getParameter("no_kids"));
String checkin=request.getParameter("checkin");
String checkout=request.getParameter("checkout");
int room=Integer.parseInt(request.getParameter("room"));
String roomtype=request.getParameter("roomtype");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms", "root", "root");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into customer(name,address,country,mobile,email,idtype,idno,gender,noadults,nokids,checkin,checkout,room,roomtype)values('"+name+"','"+address+"','"+country+"','"+mobile+"','"+email+"','"+idtype+"','"+idno+"','"+gender+"','"+noadults+"','"+nokids+"','"+checkin+"','"+checkout+"','"+room+"','"+roomtype+"')");
out.println("Data is successfully inserted!");
ResultSet rs = st.executeQuery("select * from customer where name='"+name+"' and checkin='"+checkin+"' ");
while(rs.next()){
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
<table border="1" width="600" align="center" cellpadding="4">
 <tr>
    <td>Date:</td>
    <td>xxxxxxxxx</td>
    <td>BookingId</td>
    <td><%=rs.getString("id") %></td>
  </tr>
</table>
<br><br>
<table border="1" width="600" align="center" cellpadding="4">
 <tr>
    <td><b>Booking Name</td>
    <td><%=name %></td>
  </tr>
  <tr>
    <td><b>Address</td>
    <td><%=address %></td>
  </tr>
  <tr>
    <td><b>No.of Rooms</td>
    <td><%=room %></td>
  </tr>
  <tr>
    <td><b>Room Type</td>
    <td><%=roomtype %></td>
  </tr>
  <tr>
    <td><b>Check In date</td>
    <td><%=checkin %></td>
  </tr>
  <tr>
    <td><b>Check out date</td>
    <td><%=checkout %></td>
  </tr>
  <hr>
  <tr>
    <td><b><i>BASE CHARGES :</i></td>
    <td>Rs.1500</td>
  </tr>
  <tr>
    <td><b><i>GST :</i></td>
    <td>+17%</td>
  </tr>
  <tr>
    <td><b>TOTAL :</td>
    <td><b> Rs. 1755</b></td>
  </tr>
</table>




<%}
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
<center><br><h3><a href="index.html">Home</a></h3></center>