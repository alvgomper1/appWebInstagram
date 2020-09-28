<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function ocultar() {
		document.getElementById('noLoSigo').style.display = 'none';
		document.getElementById('noMeSigue').style.display = 'none';
		document.getElementById('mutuos').style.display = 'none';
		document.getElementById('seguidores').style.display = 'none';
		document.getElementById('seguidos').style.display = 'none';
		document.getElementById('resumen').style.display = 'none';

	}
	

</script>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/miPerfil.css" />
<link rel="stylesheet"	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"crossorigin="anonymous">
<title>Mi Perfil</title>
</head>

<body>

<div class="grid">
	<nav class="navbar navbar-dark bg-dark">


		<ul>
			<li class="logo" style="display: inline; margin: 5px;"><button>Logo</button></li>
			<li class="cerrarSesion" style="display: inline; margin: 5px;"><button onclick="location.href = 'ControladorSesion?disconnect=true'">Cerrar sesion</button></li>
		</ul>


	</nav>
	
	
	<div class="menuLateral" >

		
			<li onclick="ocultar();document.getElementById('resumen').style.display='block';void0"> Resumen
					de tu cuenta </li>
			<li onclick="ocultar();javascript:document.getElementById('noMeSigue').style.display='block';void0">
				Quien
					no me sigue</li>
			<li onclick="ocultar();javascript:document.getElementById('noLoSigo').style.display='block';void0">
				A quien
					no sigo</li>
			<li onclick="ocultar();javascript:document.getElementById('mutuos').style.display='block';void0">Seguidores
					mutuos</li>
			<li onclick="ocultar();javascript:document.getElementById('seguidos').style.display='block';void0">Lista de
					seguidos </li>
			<li onclick="ocultar(); javascript:document.getElementById('seguidores').style.display='block';void0"> Lista
					de seguidores </li>
		
	</div>



	<div class="contenidoCentro">
		<div class="datosCentro">

			<form action="RecibirTXT" method="post">

				<p>Lista de seguidores y seguidos</p>

				<p>
					<textarea required="required" name="seguidoresTXT"
						placeholder="Pega aquí la lista de seguidores"></textarea>
				</p>
				<p>
					<textarea required="required" name="seguidosTXT"
						placeholder="Pega aquí la lista de seguidos"></textarea>
				</p>

				<p>
					<input type="submit" value="Enviar ">
				</p>
<%
				String error = (String) request.getAttribute("errorFormato");
			if (error != null) {

				out.print(String.format("<p> %s</p>", error));
			}
			%>
			</form>
			
<div id="noMeSigue" style="display: none">
		<ol>
			NO ME SIGUEN:
			<c:forEach var="user" items="${noMeSigue}">
				<li>${user}</li>
			</c:forEach>
		</ol>
	</div>

	<div id="noLoSigo" style="display: none">
		<ol>
			NO LOS SIGO:
			<c:forEach var="user" items="${noLoSigo}">
				<li>${user}</li>
			</c:forEach>
		</ol>
	</div>

	<div id="mutuos" style="display: none">
		<ol>
			MUTUOS:
			<c:forEach var="user" items="${mutuos}">
				<li>${user}</li>
			</c:forEach>
		</ol>
	</div>

	<div id="seguidos" style="display: none">
		<ol>
			SEGUIDOS:
			<c:forEach var="user" items="${seguidos}">
				<li>${user}</li>
			</c:forEach>
		</ol>
	</div>

	<div id="seguidores" style="display: none">
		<ol>
			SEGUIDORES:
			<c:forEach var="user" items="${seguidores}">
				<li>${user}</li>
			</c:forEach>
		</ol>
	</div>

	<div id="resumen" style="display: none">
		<ol style="list-style: none;">
			RESUMEN:
			<li>SEGUIDORES: ${seguidores.size()}</li>
			<li>SEGUIDOS: ${seguidos.size()}</li>
			<li>MUTUOS: ${mutuos.size()}</li>
			<li>NO ME SIGUEN: ${noMeSigue.size()}</li>
			<li>NO LOS SIGO: ${noLoSigo.size()}</li>
		</ol>
	</div>

		</div>
		
	</div>

	

	</div>


	<%-- Para enviar al login si el usuario no tiene una sesion abierta
	<%
		HttpSession misession = (HttpSession) request.getSession();
	Object miUsuario = (Object) misession.getAttribute("usuario");
	%>
	<%
		if (miUsuario == null) {
	%>
	<script type="text/javascript">
		location.href = "login.jsp";
	</script>
	<%
		response.sendRedirect("login.jsp");
	%>
	<%
		}
	%> --%>

</body>
</html>