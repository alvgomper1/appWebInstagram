<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Instagram App v1.0</title>
</head>
<body>

	

<h1>LOGIN</h1>

	<div class="formularioLogin">
		<form action="ControllerUsuario" method="post">
			<p>
				Nombre de Usuario <input placeholder="XXXX-XXXXXX"
					class="form-input" id="txt-input" type="text" required
					name="nombreUsuario" maxlength="10" pattern="[0-9]{10}">
			</p>
			<br>
			<p>
				CONTRASEÑA: <input placeholder="***********" class="form-input"
					type="password" id="pwd" name="contrasenaLogin" required
					maxlength="32">
			</p><div class="botonFormulario">
		<input type="hidden" name="opcion" value="consultar" required>
		<input class="botonLogin" type="submit" name="confirmarLogin" 
			 alt="Aceptar"  />



	</div>
		</form>
	</div>


	<%
			Object error = request.getAttribute("errorLogin");
		%>
		<%
			if (error != null) {
		%>
		<p class="errorLogin"><%=error%></p>

		<%
			}
		%>


</body>
</html>