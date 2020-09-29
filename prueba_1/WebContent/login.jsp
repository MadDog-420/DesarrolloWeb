<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="style.css" />
<!--<link rel="stylesheet" href="CSS/nice-select.css">-->
<!--<link href="CSS/header-footer.css" rel="stylesheet">-->
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<!-- FontAwesome -->
<script src="https://kit.fontawesome.com/a7b3ea38a5.js" crossorigin="anonymous"></script>
</head>
<body>
	<%
    	Connection con;
    	String url = "jdbc:mysql://localhost:3306/cms_ruckus";
        String Driver = "com.mysql.jdbc.Driver";
        String user = "root";
        String clave = "";
        Class.forName(Driver);
        con = DriverManager.getConnection(url, user, clave);
        if(con!=null){
        	out.print("Conectado");
        }
        //Empezamos Listando los Datos de la Tabla Usuario
    %>

	<!-- Preloader -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="img/logo.png" alt="fait">
                </div>
            </div>
        </div>
    </div>
    <!-- /Preloader -->
    
        		<%
        				PreparedStatement ps;
				        String email,pass,name,surname;
                    	email=request.getParameter("email");
                    	pass=request.getParameter("password");
                    	name=request.getParameter("name");
				        surname=request.getParameter("surname");
				        
				        if(request.getParameter("registry")!=null){
				        
					        if(name!=null && surname!=null && email!=null && pass!=null){
					            ps=con.prepareStatement("insert into `users` (`id`, `email`, `password`, `name`, `surname`) values (NULL,'"+email+"','"+pass+"','"+name+"','"+surname+"');");
					            
					            if(ps.executeUpdate()==1) {
					            	out.print("<script>"+
								        	"$(document).ready(function(){"+
				                                "Swal.fire({"+
				                                    "icon: 'success',"+
				                                    "title: 'Registrado!'"+
				                                "})"+
				                            "})"+
				                            "</script>");
					             } else {
					            	out.print("<script>"+
								        	"$(document).ready(function(){"+
				                                "Swal.fire({"+
				                                    "icon: 'error',"+
				                                    "title: 'Error en el registro!',"+
				                                "})"+
				                            "})"+
				                            "</script>");
					            }
					            
					        }
				         } 
				        
			    %>
		<!-- Registration modal-->
        <div class="modal" tabindex="-1" role="dialog" id="register" style="top: 5%; z-index: 9999">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Registro</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                    
                        <form method="post" id="">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Correo</label>
                                    <input type="email" name="email" class="form-control" id="inputEmail4" placeholder="Correo" value="">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">Contraseña</label>
                                    <input type="password" name="password" class="form-control" id="inputPassword4" placeholder="Contraseña" value="">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputName4">Nombre</label>
                                    <input type="text" name="name" class="form-control" id="inputName4" placeholder="Nombre" value="">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputSurname4">Apellido</label>
                                    <input type="text" name="surname" class="form-control" id="inputSurname4" placeholder="Apellido" value="">
                                </div>
                            </div>
                            <button style="margin: 0 5px;" type="submit" name="registry" class="btn btn-secondary" value="submit">Registrarme</button>
                            <input style="margin: 0 5px;" type="reset" class="btn btn-secondary">
                            <input style="margin: 10px 5px;" type="reset" class="btn btn-secondary" data-dismiss="modal" value="Cerrar" id="reset">
                        </form>
                    </div>
                    <div class="modal-footer"></div>
                </div>
            </div>
        </div>
        <!-- /Registration modal-->
        
    <!--================login_part Area =================-->
    <section class="login_part section_padding ">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6">
                    <div class="login_part_text text-center">
                        <div class="login_part_text_iner">
                            <h2>Nuevo en la ciudad?</h2>
                            <p>Regístrate, es gratis!</p>
                            <a href="#" class="btn_3" data-toggle="modal" data-target="#register">Crear una cuenta</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                <%
                
				    String email_1,pass_1;
                	int id;
                    email_1=request.getParameter("email_1");
                    pass_1=request.getParameter("password_1");
                    	
				        if(email_1!=null && pass_1!=null) {
				        	
				        	Statement smt;
				            ResultSet rs;
				            smt = con.createStatement();
				            rs = smt.executeQuery("select * from users where email = '"+email_1+"' and password = '"+pass_1+"'");
				            
				            if(rs!=null) {
				            	
				            	while(rs.next()) {
				            		id=rs.getInt("id");
				            		response.sendRedirect("index.jsp?id="+id);
				            	}
				            	
				            	if(!rs.absolute(1)){
				            		out.print("<script>"+
								        	"$(document).ready(function(){"+
				                                "Swal.fire({"+
				                                    "icon: 'error',"+
				                                    "title: 'Datos incorrectos!',"+
				                                "})"+
				                            "})"+
				                            "</script>");
				            	}
				            	
				            	
				            }
				        }
                    
			               
			        %>
                    <div class="login_part_form">
                        <div class="login_part_form_iner">
                            <h3>Bienvenido de vuelta ! <br>
                                Por favor inicia sesión</h3>
                            <form class="row contact_form" action="#" method="post" novalidate="novalidate">
                                <div class="col-md-12 form-group p_star">
                                    <input type="text" class="form-control" id="name" name="email_1" value=""
                                        placeholder="Usuario">
                                </div>
                                <div class="col-md-12 form-group p_star">
                                    <input type="password" class="form-control" id="password" name="password_1" value=""
                                        placeholder="Contraseña">
                                </div>
                                <div class="col-md-12 form-group">
                                    <!-- <div class="creat_account d-flex align-items-center">
                                        <input type="checkbox" id="f-option" name="selector">
                                        <label for="f-option">Recordar contraseña</label>
                                    </div> -->
                                    <button type="submit" value="submit" name="login" class="btn_3">
                                        Entrar
                                    </button>
                                    <!-- <a class="lost_pass" href="#">Olvidaste tu contraseña?</a> -->
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================login_part end =================-->
    
	<!-- Footer -->
    <footer id="footer" class="pb-4 pt-4 navbar-light">
    <!-- <div class="container navbar-nav">
            <div class="row text-center">
                <div class="col-12 col-lg"><a class="nav-link" href="#">Contáctanos</a></div>
                <div class="col-12 col-lg"><a class="nav-link disabled" href="#">Términos y condiciones</a></div>
                <div class="col-12 col-lg"><a class="nav-link disabled" href="#">Privacidad</a></div>
            </div>
        </div>
        -->
        <div class="row p-4 m-4">
            <copyright class="col-12 text-center">&copy; 2020 MadDog. All rights reserved.</copyright>
        </div>
    </footer>
    <!-- /Footer -->
</body>
<!-- Popper.js, then Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    
<!-- Jquery Plugins, main Jquery -->
<script src="js/main.js"></script>
</html>
</html>