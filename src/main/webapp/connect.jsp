<%@ page import ="java.sql.*"%>
<%
String category=request.getParameter("category");
String date=request.getParameter("date");
String name=request.getParameter("name");
String description=request.getParameter("description");
int amount = Integer.parseInt(request.getParameter("amount"));

try{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test2","root","");
  PreparedStatement ps = conn.prepareStatement("insert into taskTracker(category, date, name, description,amount) values(?,?,?,?,?);");
   ps.setString(1,category);
   ps.setString(2,date);
   ps.setString(3, name);
   ps.setString(4,description);
   ps.setInt(5, amount);
   int x=ps.executeUpdate();

   if(x>0){
   response.sendRedirect("showdata.jsp?category=" + category + "date=" + date+"name="+name+"description"+description+"&amount"+amount);
   }
   else{
   out.println("Registration Failed");
   }
}
catch(Exception e){
out.println(e);
}
%>