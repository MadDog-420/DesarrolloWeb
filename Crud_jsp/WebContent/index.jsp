<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="base_crud/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>     
        <title>JSP Page</title>
    </head>
    <body style="margin-top: 30px">
    
    	<%
    	Connection con;
    	String url = "jdbc:mysql://localhost:3306/bd_practica";
        String Driver = "com.mysql.jdbc.Driver";
        String user = "root";
        String clave = "";
        Class.forName(Driver);
        con = DriverManager.getConnection(url, user, clave);
        PreparedStatement ps;
        //Empezamos Listando los Datos de la Tabla Usuario
        Statement smt;
        ResultSet rs;
        smt = con.createStatement();
        rs = smt.executeQuery("select * from personas");
    	%>     
        
        <div class="container">            
            <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal"> Agregar Nuevo</button>
             </div>  
              
        <br>
        <div class="container">               
                  
             <table class="table table-bordered"  id="tablaDatos">
                    <thead>
                        <tr>
                            <th class="text-center">Id</th>
                            <th>Nombres</th>
                            <th class="text-center">DNI</th>
                            <th class="text-center">Telefono</th>
                            <th class="text-center">Direccion</th>
                            <th class="text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody id="tbodys">
                       <% while(rs.next()) {%>
                        <tr>
                            <td class="text-center"><%=rs.getInt("id") %></td>
                            <td><%=rs.getString("nombre") %></td>
                            <td class="text-center"><%=rs.getString("DNI") %></td>
                            <td class="text-center"><%=rs.getString("telefono") %></td>
                            <td class="text-center"><%=rs.getString("direccion") %></td>
                            <td class="text-center">
                                
                                <a href="edit.jsp?id=<%= rs.getInt("id")%>" class="btn btn-primary">Editar</a>
                                <a href="delete.jsp?id=<%= rs.getInt("id")%>" class="btn btn-danger">Delete</a>
                            </td>
                        </tr>
                        <% } %>
                </table>
            </div>        
        <div class="container">
        <%
                
        String nom;
        int dni=0;
        nom=request.getParameter("txtNom");
        if(request.getParameter("txtDNI")!=null){
        	dni=Integer.parseInt(request.getParameter("txtDNI"));
        }
        if(nom!=null && request.getParameter("txtDNI")!=null){
            ps=con.prepareStatement("insert into personas(nombre, DNI)values('"+nom+"','"+dni+"')");
            ps.executeUpdate();  
           // response.sendRedirect("index.jsp");
        } else {
        	out.print("vacio");
        }
               
        %>         
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document" style="z-index: 9999; width: 450px">
                    <div class="modal-content">
                        <div class="modal-header">                            
                            <h4 class="modal-title" id="myModalLabel">Agregar Registro</h4>
                        </div>
                        <div class="modal-body">
                            <form action="" method="post">
                                <label>Nombre:</label> 
                                <input type="text" name="txtNom" class="form-control"/><br>
                                <label>DNI:</label> 
                                <input type="text" name="txtDNI" class="form-control"/>                                   
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>                            
                                    <input type="submit" value="Guardar" class="btn btn-primary"/>
                                </div>
                            </form>
                        </div>
                    </div>                    
                </div>
            </div>
           
        </div>        
        <script src="base_crud/js/jquery.js" type="text/javascript"></script>             
        <script src="base_crud/js/bootstrap.min.js" type="text/javascript"></script>        
    </body>
</html>