<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String idstring= session.getAttribute("id").toString();
int id=Integer.parseInt(idstring);
String name=request.getParameter("fullname");
String address=request.getParameter("address");
String mobile=request.getParameter("mobile");
String email=request.getParameter("email");
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

int i=st.executeUpdate("update customer set name='"+name+"',address='"+address+"',mobile='"+mobile+"',email='"+email+"',noadults='"+noadults+"',nokids='"+nokids+"',checkin='"+checkin+"',checkout='"+checkout+"',room='"+room+"',roomtype='"+roomtype+"' where id='"+id+"'");
out.println("Data is successfully updated!");

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
<a href="allbookings.jsp"> <--- BACK TO BOOKING LIST </a>