<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body>
	<h1>P�gina de ejemplo de HTML</h1>
	<h2>Esto es un subt�tulo</h2>
	<form>
		<label>Cuenta: <input type="text" name="cuenta" value="Bruno" placeholder="Cuenta"></label><br>
		<label>Contrase�a: <input type="password" name="contrasena" value="1234" placeholder="Contrase�a"></label><br>
		<label>Campo oculto: <input type="hidden" name="codigo" value="bailarina77"></label><br>
		<button class="btn btn-primary" type="submit">ENVIAR</button>
	</form>
	<h2>Ejemplo de Tabla: </h2>
	<table  style="margin-top:20px;" border="2" cellspacing="1" rules="all">
		<tr>
			<th>Nombre</th>
			<th>Apellidos</th>
			<th>Calificaci�n</th>
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
</body>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</html>