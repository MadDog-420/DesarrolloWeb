<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">-->
</head>
<body>
	<h1>Página de ejemplo de HTML</h1>
	<h2>Esto es un subtítulo</h2>
	<form>
		<label>Cuenta: <input type="text" name="cuenta" value="Bruno" placeholder="Cuenta"></label><br>
		<label>Contraseña: <input type="password" name="contrasena" value="1234" placeholder="Contraseña"></label><br>
		<label>Campo oculto: <input type="hidden" name="codigo" value="bailarina77"></label><br>
		<button class="btn btn-primary" type="submit">ENVIAR</button>
	</form>
	<h2>Ejemplo de Tabla: </h2>
	<table style="margin-top:20px;" cellspacing="4" cellpadding="3" border="1">
		<tr>
			<th>Nombre</th>
			<th>Apellidos</th>
			<th>Calificación</th>
		</tr>
		<tr>
			<td>Nombre 1</td>
			<td>Apellidos 1</td>
			<td>Calific. 1</td>
		</tr>
		<tr>
			<td>Nombre 2</td>
			<td>Apellidos 2</td>
			<td>Calific. 2</td>
		</tr>
		<tr>
			<td>Nombre 3</td>
			<td>Apellidos 3</td>
			<td>Calific. 3</td>
		</tr>
	</table>
	<h2>Imágenes en una página web</h2>
	<img src="https://2.bp.blogspot.com/-J5dtIRU_dqo/WZqgWuk5r3I/AAAAAAAAAAY/9CCoDfgsfyEPfAJURbzewU5wAiEZ3mIgQCLcBGAs/s1600/Pingu%25CC%2588ino2.jpg"
	width="200" align="left" alt="No se puede encontrar la imagen">
	<h2>Tabla con imágenes</h2>
	<table style="margin-top:20px;" cellspacing="4" cellpadding="3" border="1">
		<tr>
			<th align="center">Pinguino</th>
			<th align="center">Desierto</th>
			<th align="center">Tulipanes</th>
		</tr>
		<tr>
			<td><img src="https://2.bp.blogspot.com/-J5dtIRU_dqo/WZqgWuk5r3I/AAAAAAAAAAY/9CCoDfgsfyEPfAJURbzewU5wAiEZ3mIgQCLcBGAs/s1600/Pingu%25CC%2588ino2.jpg"
	width="200" align="center" alt="No se puede mostrar">
			</td>
			<td><img src="https://estaticos.muyinteresante.es/media/cache/760x570_thumb/uploads/images/article/5ac338575bafe812fe03d598/sahara_0.jpg"
	width="200" align="center"  alt="No se puede mostrar">
			</td>
			<td><img src="https://www.hogarmania.com/archivos/201208/tulipan-1280x720x80xX.jpg"
	width="200" align="center" alt="No se puede mostrar">
			</td>
		</tr>
	</table>
</body>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</html>