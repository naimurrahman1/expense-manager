<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>List of Registered Users</title>
	<style>
		table {
			font-family: Arial, sans-serif;
			border-collapse: collapse;
			width: 100%;
		}

		td, th {
			border: 1px solid #dddddd;
			text-align: left;
			padding: 8px;
		}

		tr:nth-child(even) {
			background-color: #dddddd;
		}
	</style>
</head>
<body>
	<h1>List of Registered Users</h1>
	<table>
		<thead>
			<tr>
				<th>Category</th>
				<th>Date</th>
				<th>Name</th>
                <th>Description</th>
                <th>Amount</th>
			</tr>
		</thead>
		<tbody>
			<%
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test2", "root", "");
					PreparedStatement ps = conn.prepareStatement("select * from taskTracker ORDER BY date ASC;");
					ResultSet rs = ps.executeQuery();

					while (rs.next()) {
						String category = rs.getString("category");
						String date = rs.getString("date");
						String name = rs.getString("name");
                        String description = rs.getString("description");
                        int amount = rs.getInt("amount");


						out.println("<tr>");
						out.println("<td>" + category + "</td>");
						out.println("<td>" + date + "</td>");
						out.println("<td>" + name + "</td>");
                        out.println("<td>" + description + "</td>");
                        out.println("<td>" + amount + "</td>");
						out.println("</tr>");
					}

					rs.close();
					ps.close();
					conn.close();
				} catch (Exception e) {
					out.println(e);
				}
			%>
		</tbody>
	</table>
</body>
</html>
