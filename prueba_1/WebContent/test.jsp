<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<style>
.content{
	width: 100%;
    height: fit-content;
    padding: 7%;
}
.content > div {
	position:relative;
	margin: 0;
}
.content p{
	text-align: justify;
}
.draggable > div{
    display: none;
}
.resizable > div{
    display: none;
}

</style>
<body>
<%
    	Connection con;
    	String url = "jdbc:mysql://localhost:3306/cms_ruckus";
        String Driver = "com.mysql.jdbc.Driver";
        String user = "root";
        String clave = "";
        Class.forName(Driver);
        con = DriverManager.getConnection(url, user, clave);
        PreparedStatement ps;
        //Empezamos Listando los Datos de la Tabla Usuario
        Statement smt;
        int id=Integer.parseInt(request.getParameter("id"));
        ResultSet rs,rs_t,rs_p;
        smt = con.createStatement();
        rs = smt.executeQuery("select * from model where user='"+id+"' limit 1");
%>
<div class="content">
<% while (rs.next()){
	out.print(rs.getString("html"));
}
%>
</div>
<script type="text/javascript">
	var elements=document.getElementsByTagName("div");

	for (var i = 0, max = elements.length; i < max; i++) {
	    elements[i].contentEditable = "false";
	}
</script>
</body>
</html>