<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<!-- <script type="text/javascript">						FUNCION PARA MOSTRAR CONTENIDO DE OTRA VISTA SIN RECARGAR LA PAGINA
	$(document).ready(function() {
		$('#btn1').on('click', function() {
			$.ajax({
				type : "POST",
				url : "login.jsp",
				success : function(response) {
					$('#div-results').html(response);
				}
			});
		});

		$('#btn2').on('click', function() {
			$.ajax({
				type : "POST",
				url : "ejemplo2.thml",
				success : function(response) {
					$('#div-results').html(response);
				}
			});
		});
		
		
	});
</script> -->
<script type="text/javascript">
	
	function ocultar(){ 
		   document.getElementById('noLoSigo').style.display = 'none';		   
		   document.getElementById('noMeSigue').style.display = 'none';
		   document.getElementById('mutuos').style.display = 'none';
		   document.getElementById('seguidores').style.display = 'none';
		   document.getElementById('seguidos').style.display = 'none';
			
			
			}   

</script>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">

<title>Mi Perfil</title>
</head>
<body>
	<div class="menuSuperior">
		<ul>
			<li style="display: inline; margin: 5px;"><button>Logo</button></li>
			<li style="display: inline; margin: 5px;"><button>Cerrar
					sesion</button></li>
		</ul>
	</div>



	 <div class="menuDesplegable">

		<ol style="list-style:none;">
			<li><a onclick="ocultar()" href="javascript:document.getElementById('resumen').style.display='block';void0"class="list-group-item list-group-item-action bg-light"> Resumen de tu cuenta </a></li>
			<li><a onclick="ocultar()"href="javascript:document.getElementById('noMeSigue').style.display='block';void0" class="list-group-item list-group-item-action bg-light"> Quien no me sigue</a></li>
			<li><a onclick="ocultar()"href="javascript:document.getElementById('noLoSigo').style.display='block';void0"class="list-group-item list-group-item-action bg-light">A quien no sigo</a></li>
			<li><a onclick="ocultar()"href="javascript:document.getElementById('mutuos').style.display='block';void0"class="list-group-item list-group-item-action bg-light">Seguidores mutuos</a></li>
			<li><a onclick="ocultar()"href="javascript:document.getElementById('seguidos').style.display='block';void0"class="list-group-item list-group-item-action bg-light">Lista de seguidos </a></li>
			<li><a onclick="ocultar()" href="javascript:document.getElementById('seguidores').style.display='block';void0"class="list-group-item list-group-item-action bg-light"> Lista de seguidores </a></li>
			
			
			
			
			<!-- <li><a href=""id="btn7"class="list-group-item list-group-item-action bg-light"> Comparador de seguidores </a></li>
			<li><a href=""id="btn8"class="list-group-item list-group-item-action bg-light"> Comparador de seguidores </a></li> -->
		</ol>
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

			</form>
			<%
				String error = (String) request.getAttribute("errorFormato");
			if (error != null) {

				out.print(String.format("<p> %s</p>", error));
			}
			%>


		</div>
		<!-- <div class="botonesCentro"><button type="button" class="btn btn-primary">Aceptar</button><button type="button" class="btn btn-danger">Cancelar</button></div>
	 -->
	</div>
	
	<div id="noMeSigue" style="display: none">
	<ol>NO ME SIGUEN:<c:forEach var="user" items="${noMeSigue}" >
  <li> ${user} </li>
</c:forEach></ol>
</div>

<div id="noLoSigo" style="display: none">
<ol>NO LOS SIGO:<c:forEach var="user" items="${noLoSigo}" >
  <li> ${user} </li>
</c:forEach></ol>
</div>

<div id="mutuos" style="display: none">
<ol>MUTUOS:<c:forEach var="user" items="${mutuos}" >
  <li> ${user} </li>
</c:forEach></ol>
</div>

<div id="seguidos" style="display: none">
<ol>SEGUIDOS:<c:forEach var="user" items="${seguidos}" >
  <li> ${user} </li>
</c:forEach></ol>
</div>

<div id="seguidores" style="display: none">
<ol>SEGUIDORES:<c:forEach var="user" items="${seguidores}" >
  <li> ${user} </li>
</c:forEach></ol>
</div>

<div id="resumen" style="display: none">
	<ol>RESUMEN:  
	 <li>SEGUIDORES: ${seguidores.size()} </li>
	  <li>SEGUIDOS: ${seguidos.size()} </li>
	   <li>MUTUOS: ${mutuos.size()} </li>
	    <li>NO ME SIGUEN: ${noMeSigue.size()} </li>
	     <li>NO LOS SIGO: ${noLoSigo.size()} </li>
</ol>
</div>

	<!-- <a class="btn btn-success" id="btn1">Ver el archivo que contiene hola</a> 
<a class="btn btn-danger" id="btn2">Ver el archivo que contiene adios</a>
<div id="div-results"></div>
 -->


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