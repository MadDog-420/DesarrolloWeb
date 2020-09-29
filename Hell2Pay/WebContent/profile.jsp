<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp" flush="true" />
	<link href="assets/css/profile.css" rel="stylesheet">
  	<script src="assets/js/profile.js"></script>
  	
  	<%
    	Connection con;
    	String url = "jdbc:mysql://localhost:3306/my_angel";
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
        rs = smt.executeQuery("select * from users");
    %> 
    
      <!-- Update Pass-->  
          <div class="modal" tabindex="-1" role="dialog" id="upPass" style="top: 5%; z-index: 9999">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Cambiar contraseña</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                    
                        <form method="post" id="UpdatePass">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">Contraseña actual</label>
                                    <input type="password" name="contrasena_O" class="form-control" id="inputPassword4" placeholder="Contraseña" value="">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">Contraseña nueva</label>
                                    <input type="password" name="contrasena_N" class="form-control" id="inputPassword5" placeholder="Contraseña" value="">
                                </div>
                            </div>
                            <input style="margin: 0 5px;" type="submit" name="updatepass" class="btn btn-secondary" value="Cambiar">
                            <input style="margin: 10px 5px;" type="reset" class="btn btn-secondary" data-dismiss="modal" value="Cerrar" id="reset">
                        </form>
                    </div>
                    <div class="modal-footer"></div>
                </div>
            </div>
          </div>
    <!-- Hero Area Start-->
    <% while(rs.next()) {%>
    <div class="slider-area ">
            <div class="single-slider slider-banner d-flex align-items-center" style="margin-top: 80px; min-height: 100px">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap text-center">
                                <h2><%=rs.getString("first_name") %></h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
    
    <!-- Hero Area End-->
    <!--================PersonalInfo_part Area =================-->
    <section class="login_part section_padding">
      <div class="container">
      
          <div class="row align-items-center">
                <div class="popular-items" data-slug="panel1">
                  <form method="post" id="personalInfo" enctype="multipart/form-data">
                    
                    <div class="single-popular-items mb-50 justify-content-center">
                      <div class='popular-img'>
                        <div class='img-cap' id="upload">
                          <input type="hidden" name="photo" value="" placeholder="" />
                          <input type="file" name="img" id="fileInput" class="inputfile" />
                          <label for="fileInput">Sube una foto</label>
                        </div>
                        <img class="avatar" src='assets/uploads/user_photo/<%=rs.getString("photo") %>' alt='Missing file :('>
                      </div>
                    </div>
                  
                    <h4>Información personal <span id="editD" style="color: #333"><i class="fas fa-edit"></i></span></h4>
                    
                    <input type="hidden" name="id" value="<%=rs.getInt("id") %>"/>
                    <input type="hidden" name="email" value="<%=rs.getString("email") %>"/>
                    <input type="hidden" name="phone" value="<%=rs.getInt("phone") %>"/>
                    <input type="hidden" name="level" value="<%=rs.getInt("level") %>"/>
                    
                    <div class="col-md-12 form-group p_star">
                      <div class="large-12 columns">
                        <label>Nombre</label>
                      </div>
                      <div class="large-12 columns">
                        <input id="nombre" type="text" name="nombre" value="<%=rs.getString("first_name") %>" disabled />
                      </div>
                    </div>
                    
                    <div class="col-md-12 form-group p_star">
                      <div class="large-12 columns">
                        <label>Apellidos</label>
                      </div>
                      <div class="large-12 columns">
                        <input id="apellido" type="text" name="apellido" value="<%=rs.getString("last_name") %>" disabled />
                      </div>
                    </div>

                    <div class="col-md-12 form-group p_star">
                      <div class="large-12 columns">
                        <label>País</label>
                      </div>
                      <div class="large-12 columns">
                        <input id="pais" type="text" name="pais" value="<%=rs.getInt("country") %>" disabled />
                      </div>
                    </div>

                    <div class="col-md-12 form-group p_star">
                      <div class="large-4 columns">
                        <label>
                          <button id="save" type="submit" name="save" class="btn_3">GUARDAR</button>
                        </label>
                        <label>
                          <button type="submit" name="logout" class="btn_3">SALIR</button>
                        </label>
                        <label>
                          <button type="button" name="logout" class="btn_3" data-toggle="modal" data-target="#upPass">
                            CAMBIAR CONTRASEÑA
                          </button>
                        </label>
                      </div>
                    </div>

                  </form>
                </div>
          </div>
    <% } %>
    
    </section>
<jsp:include page="footer.jsp" flush="true" />