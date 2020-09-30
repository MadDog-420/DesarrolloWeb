<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CMS</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/a7b3ea38a5.js" crossorigin="anonymous"></script>
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<!-- JQuery UI-->
<script type="text/javascript" src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
<!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link rel="stylesheet" href="main.css">
</head>

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
        Statement smt,smt_t,smt_p,smt_html;
        int id=Integer.parseInt(request.getParameter("id"));
        ResultSet rs,rs_t,rs_p,rs_html;
        smt = con.createStatement();
        smt_t = con.createStatement();
        smt_p = con.createStatement();
        smt_html = con.createStatement();
        rs = smt.executeQuery("select * from users where id='"+id+"'");
        rs_html = smt_html.executeQuery("select * from model where user='"+id+"'");
        rs_t = smt_t.executeQuery("select * from components where nice_name like 'h%'");
        rs_p = smt_p.executeQuery("select * from components where nice_name like 'p'");
        String html_display="";
        while(rs_html.next()){
        	html_display=rs_html.getString("html");
        }
%> 

<style>

	#outerContainer {
		width: 100%;
		position: relative;
    	min-height: 100vh;
    	transition: all 0.3s;
	}
	
    #container {
      width: 100%;
      height: fit-content;
      margin-top: 68px;
      padding: 7%;
      background-color: #333;
      align-items: center;
      justify-content: center;
      overflow: hidden;
      touch-action: none;
    }
    
    #container p{
      text-align: justify;
    }

    .item:active {
      border: 1px solid #00aae4;
      opacity: .75;
      box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.65);
    }

    .item:hover {
      cursor: pointer;
    }
</style>

<style>
#container .draggable {
    cursor: move;
}
#container .resizable {
    border: 1px dashed #000000;
    position: relative;
    min-height: 50px;
}
.ui-resizable-handle {
    width: 10px;
    height: 10px;
    background-color: #ffffff;
    border: 1px solid #000000;
    position: absolute;
}
.ui-resizable-nw {
    left: -5px;
    top: -5px;
    cursor: nw-resize;
}
.ui-resizable-ne {
    top: -5px;
    right: -5px;
    cursor: ne-resize;
}
.ui-resizable-sw {
    bottom: -5px;
    left: -5px;
    cursor: sw-resize;
}
.ui-resizable-se {
    bottom: -5px;
    right:-5px;
    cursor: se-resize;
}
.ui-resizable-n {
    top: -5px;
    left:50%;
    cursor: n-resize;
}
.ui-resizable-s {
    bottom: -5px;
    left: 50%;
    cursor: s-resize;
}
.ui-resizable-w {
    left:-5px;
    top:calc(50% - 5px);
    cursor: w-resize;
}
.ui-resizable-e {
    right:-5px;
    top:calc(50% - 5px);
    cursor: e-resize;
}
</style>
  
<body>

	<div class="wrapper">

	<!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">
            <% while(rs.next()) {%>
                <h3><%=rs.getString("name")%> <%=rs.getString("surname")%></h3>
            <% } %>
            </div>

            <ul class="list-unstyled components">
                <p>Elementos</p>
                <li class="active">
                    <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Títulos</a>
                    <ul class="collapse list-unstyled" id="homeSubmenu">
                    <% while(rs_t.next()) {%>
                        <li>
                        	<div class="to_display"><%=rs_t.getString("content")%></div>
                        	<form method="post">
                        		<input id="<%=rs_t.getString("name")%>" type="hidden" name="<%=rs_t.getString("nice_name")%>" value="" >
                        		<input type="submit" value="agregar">
                        	</form>
                        </li>
                    <% } %>
                    </ul>
                </li>
                <li>
                    <a href="#pSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Párrafo</a>
                    <ul class="collapse list-unstyled" id="pSubmenu">
                    <% while(rs_p.next()) { %>
                        <li>
                            <a href="#"><%=rs_p.getString("content")%></a>
                        </li>
                    <% } %>
                    </ul>
                </li>
                <li>
                    <a href="#">Imagen</a>
                </li>
            </ul>

            <ul class="list-unstyled CTAs">
                <li>
                    <a href="login.jsp" class="download">SALIR</a>
                </li>
                <li>
                    <a href="https://bootstrapious.com/p/bootstrap-sidebar" class="article">Cargar imagen</a>
                </li>
            </ul>
        </nav>
        
     <div id="outerContainer" >
        <!-- nav -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn text-sidebar bg-turbo-yellow">
                        <i class="fas fa-align-left"></i>
                        <span></span>
                    </button>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-justify"></i>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    
                        <ul class="nav navbar-nav ml-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="test.jsp?id=<%=id %>">Nuevo</a>
                            </li>
                            <form method="post">
                            	<input id="html_file" type="hidden" name="html_file" value="">
	                            <li class="nav-item">
	                                <button type="submit" name="submit_html">Guardar</button>
	                            </li>
                            </form>
                        </ul>
                    
                    </div>
                </div>
            </nav>

	    <div id="container">
	      <!-- Todo here -->
	      <% if(html_display==null) { %>
	      <div class='resizable draggable'>
			    <h1>Resize Me</h1>
			    <div class="ui-resizable-handle ui-resizable-nw"></div>
			    <div class="ui-resizable-handle ui-resizable-ne"></div>
			    <div class="ui-resizable-handle ui-resizable-sw"></div>
			    <div class="ui-resizable-handle ui-resizable-se"></div>
			    <div class="ui-resizable-handle ui-resizable-n"></div>
			    <div class="ui-resizable-handle ui-resizable-s"></div>
			    <div class="ui-resizable-handle ui-resizable-e"></div>
			    <div class="ui-resizable-handle ui-resizable-w"></div>
		  </div>
		  
		  <div class='resizable draggable'>
			    <h2>Collapsible Sidebar Using Bootstrap 4</h2>
			    <div class="ui-resizable-handle ui-resizable-nw"></div>
			    <div class="ui-resizable-handle ui-resizable-ne"></div>
			    <div class="ui-resizable-handle ui-resizable-sw"></div>
			    <div class="ui-resizable-handle ui-resizable-se"></div>
			    <div class="ui-resizable-handle ui-resizable-n"></div>
			    <div class="ui-resizable-handle ui-resizable-s"></div>
			    <div class="ui-resizable-handle ui-resizable-e"></div>
			    <div class="ui-resizable-handle ui-resizable-w"></div>
		  </div>
		  
		  <div class='resizable draggable'>
			    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
			    <div class="ui-resizable-handle ui-resizable-nw"></div>
			    <div class="ui-resizable-handle ui-resizable-ne"></div>
			    <div class="ui-resizable-handle ui-resizable-sw"></div>
			    <div class="ui-resizable-handle ui-resizable-se"></div>
			    <div class="ui-resizable-handle ui-resizable-n"></div>
			    <div class="ui-resizable-handle ui-resizable-s"></div>
			    <div class="ui-resizable-handle ui-resizable-e"></div>
			    <div class="ui-resizable-handle ui-resizable-w"></div>
		  </div>
		  <div class='resizable draggable'>
			    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
			    <div class="ui-resizable-handle ui-resizable-nw"></div>
			    <div class="ui-resizable-handle ui-resizable-ne"></div>
			    <div class="ui-resizable-handle ui-resizable-sw"></div>
			    <div class="ui-resizable-handle ui-resizable-se"></div>
			    <div class="ui-resizable-handle ui-resizable-n"></div>
			    <div class="ui-resizable-handle ui-resizable-s"></div>
			    <div class="ui-resizable-handle ui-resizable-e"></div>
			    <div class="ui-resizable-handle ui-resizable-w"></div>
		  </div>
		  
		  <div class='resizable draggable'>
			    <h2>Collapsible Sidebar Using Bootstrap 4</h2>
			    <div class="ui-resizable-handle ui-resizable-nw"></div>
			    <div class="ui-resizable-handle ui-resizable-ne"></div>
			    <div class="ui-resizable-handle ui-resizable-sw"></div>
			    <div class="ui-resizable-handle ui-resizable-se"></div>
			    <div class="ui-resizable-handle ui-resizable-n"></div>
			    <div class="ui-resizable-handle ui-resizable-s"></div>
			    <div class="ui-resizable-handle ui-resizable-e"></div>
			    <div class="ui-resizable-handle ui-resizable-w"></div>
		  </div>
		  
		  <div class='resizable draggable'>
			    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
			    <div class="ui-resizable-handle ui-resizable-nw"></div>
			    <div class="ui-resizable-handle ui-resizable-ne"></div>
			    <div class="ui-resizable-handle ui-resizable-sw"></div>
			    <div class="ui-resizable-handle ui-resizable-se"></div>
			    <div class="ui-resizable-handle ui-resizable-n"></div>
			    <div class="ui-resizable-handle ui-resizable-s"></div>
			    <div class="ui-resizable-handle ui-resizable-e"></div>
			    <div class="ui-resizable-handle ui-resizable-w"></div>
		  </div>
		  <div class='resizable draggable'>
			    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
			    <div class="ui-resizable-handle ui-resizable-nw"></div>
			    <div class="ui-resizable-handle ui-resizable-ne"></div>
			    <div class="ui-resizable-handle ui-resizable-sw"></div>
			    <div class="ui-resizable-handle ui-resizable-se"></div>
			    <div class="ui-resizable-handle ui-resizable-n"></div>
			    <div class="ui-resizable-handle ui-resizable-s"></div>
			    <div class="ui-resizable-handle ui-resizable-e"></div>
			    <div class="ui-resizable-handle ui-resizable-w"></div>
		  </div>
	      <% } else { out.print(html_display); } %>
	    </div>
	    
	    <%
				        String html;
                    	html=request.getParameter("html_file");
				        
				        if(request.getParameter("submit_html")!=null){
				        
					        if(html!=null){
					        	if(rs_html.absolute(1)){
					        		ps=con.prepareStatement("update `model` set html='"+html+"' where user='"+id+"'");
					        	} else {
					        		ps=con.prepareStatement("insert into `model` (`id`, `user`, `html`) values (NULL,'"+id+"','"+html+"');");
					        	}
					            
					            
					            if(ps.executeUpdate()==1) {
					            	out.print("<script>"+
								        	"$(document).ready(function(){"+
				                                "Swal.fire({"+
				                                    "icon: 'success',"+
				                                    "title: 'Modelo guardado!'"+
				                                "})"+
				                            "})"+
				                            "</script>");
					             } else {
					            	out.print("<script>"+
								        	"$(document).ready(function(){"+
				                                "Swal.fire({"+
				                                    "icon: 'error',"+
				                                    "title: 'Error al guardar!',"+
				                                "})"+
				                            "})"+
				                            "</script>");
					            }
					            
					        }
				         } 
				        
		  %>
	    
    </div>
  </div>
  <script type="text/javascript">
  
	  $('.resizable').resizable({
		    handles: {
		        'nw': '.ui-resizable-nw',
		        'ne': '.ui-resizable-ne',
		        'sw': '.ui-resizable-sw',
		        'se': '.ui-resizable-se',
		        'n': '.ui-resizable-n',
		        'e': '.ui-resizable-e',
		        's': '.ui-resizable-s',
		        'w': '.ui-resizable-w'
		    }
		});
	  $( '#container .draggable' ).draggable({
		  drag: function(event,ui){
		      dragposition = ui.position;
		   }
	  })
		$( '#container .draggable' ).draggable().on('click', function(){
			
		    if ( $(this).is('.ui-draggable-dragging') ) {
		        return;
		    } else {
		        $(this).draggable( 'option', 'disabled', true );
		        $(this).prop('contenteditable','true');
		        $(this).css('cursor', 'text');
		    }
		})
		.on('blur', function(){
		    $(this).draggable( 'option', 'disabled', false);
		    $(this).prop('contenteditable','false');
		    $(this).css('cursor', 'move');
		});
		
  </script>
  
  <script type="text/javascript">

	  // tell the embed parent frame the height of the content
	  if (window.parent && window.parent.parent){
	    window.parent.parent.postMessage(["resultsFrame", {
	      height: document.body.getBoundingClientRect().height,
	      slug: ""
	    }], "*")
	  }
	
	  // always overwrite window.name, in case users try to set it manually
	  window.name = "result"
   </script>
   
   <script>
	  $(function(){
		  var $myDiv = $('#container');
		  var ht = $myDiv.height();
		    $(window).scroll(function() {
		        var st = $(this).scrollTop();
		        if(st>=(ht*0.6)){
		        	$myDiv.height( ht+(st*0.5) );
		        }
		    }).scroll();
		})
		
  </script>
  
  <script type="text/javascript">
  		var elementHtml
		$("body").mouseover(function() {
			elementHtml = $("#container").html();
			$("#html_file").val(elementHtml);
		});
  		
		$("#titulo_1").click(function() {
			elementHtml = $("#container").html();
			var cont = $("this").val();
			$("#this").val(cont+elementHtml);
			console.log($("#this").val());
		});
		$("#titulo_2").click(function() {
			elementHtml = $("#container").html();
			var cont = $("this").val();
			$("#this").val(cont+elementHtml);
		});
		$("#titulo_3").click(function() {
			elementHtml = $("#container").html();
			var cont = $("this").val();
			$("#this").val(cont+elementHtml);
		});
		$("#parrafo").click(function() {
			elementHtml = $("#container").html();
			var cont = $("this").val()
			$("#this").val(cont+elementHtml);
		});
  </script>
  <script type="text/javascript">
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });
    </script>
  
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
</html>