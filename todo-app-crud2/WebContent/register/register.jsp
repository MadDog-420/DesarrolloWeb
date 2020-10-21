<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>

</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container">

	<h2>Formulario de Registro</h2>
	<div class="col-md-6 col-md-offset-3">
			<div class="alert alert-success center" role="alert">
				<p>${NOTIFICATION}</p>
			</div>
			
				<form action="<%=request.getContextPath()%>/register" method="post">

					<div class="form-group">
						<label for="uname">Nombre:</label> <input type="text"
							class="form-control" id="uname" placeholder="Nombre"
							name="firstName" required>
					</div>

					<div class="form-group">
						<label for="uname">Apellido:</label> <input type="text"
							class="form-control" id="uname" placeholder="Apellido"
							name="lastName" required>
					</div>

					<div class="form-group">
						<label for="uname">Correo:</label> <input type="text"
							class="form-control" id="username" placeholder="Correo"
							name="username" required>
					</div>

					<div class="form-group">
						<label for="uname">Contraseña:</label> <input type="password"
							class="form-control" id="password" placeholder="Contraseña"
							name="password" required>
					</div>

					<button type="submit" class="btn btn-primary">Enviar</button>

				</form>
			</div>
		</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>