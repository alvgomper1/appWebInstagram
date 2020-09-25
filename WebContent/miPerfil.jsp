<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $('#btn1').on('click', function(){
        $.ajax({
            type: "POST",
            url: "login.jsp",
            success: function(response) {
                $('#div-results').html(response);
            }
        });
    });
 
    $('#btn2').on('click', function(){
        $.ajax({
            type: "POST",
            url: "ejemplo2.thml",
            success: function(response) {
                $('#div-results').html(response);
            }
        });
    });
    $('#btn3').on('click', function(){
        $.ajax({
            type: "POST",
            url: "login.jsp",
            success: function(response) {
                $('#div-results').html(response);
            }
        });
    });
    $('#btn4').on('click', function(){
        $.ajax({
            type: "POST",
            url: "login.jsp",
            success: function(response) {
                $('#div-results').html(response);
            }
        });
    });
    $('#btn5').on('click', function(){
        $.ajax({
            type: "POST",
            url: "login.jsp",
            success: function(response) {
                $('#div-results').html(response);
            }
        });
    });
    $('#btn6').on('click', function(){
        $.ajax({
            type: "POST",
            url: "login.jsp",
            success: function(response) {
                $('#div-results').html(response);
            }
        });
    });
    $('#btn7').on('click', function(){
        $.ajax({
            type: "POST",
            url: "login.jsp",
            success: function(response) {
                $('#div-results').html(response);
            }
        });
    });
    $('#btn8').on('click', function(){
        $.ajax({
            type: "POST",
            url: "login.jsp",
            success: function(response) {
                $('#div-results').html(response);
            }
        });
    });
});
</script>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

<title>Mi Perfil</title>
</head>
<body>
	<div class="menuSuperior">
		<ul>
			<li style="display: inline; margin: 5px;"><button>Logo</button></li>
			<li style="display: inline; margin: 5px;"><button>Cerrar sesion</button></li>
		</ul>
	</div>



	<!-- <div class="menuDesplegable">

		<ol style="list-style:none;">
			<li><a href="#" id="btn1" class="list-group-item list-group-item-action bg-light"> Resumen de tu cuenta </a></li>
			<li><a href="#"class="list-group-item list-group-item-action bg-light"> Quien no me sigue</a></li>
			<li><a href=" "class="list-group-item list-group-item-action bg-light">A quien no sigo</a></li>
			<li><a href=" "class="list-group-item list-group-item-action bg-light">Seguidores mutuos</a></li>
			<li><a href=" "class="list-group-item list-group-item-action bg-light">Lista de seguidos </a></li>
			<li><a href=" "class="list-group-item list-group-item-action bg-light"> Lista de seguidores </a></li>
			<li><a href=" "class="list-group-item list-group-item-action bg-light"> Comparador de seguidores </a></li>
			<li><a href=" "class="list-group-item list-group-item-action bg-light"> Comparador de seguidores </a></li>
		</ol>
	</div> -->
	
	<div class="contenidoCentro">
	<div class="datosCentro">
	
	<form action="RecibirTXT" method="post" >

 <p>Lista de seguidores y seguidos</p>

  <p><textarea name="seguidoresTXT" placeholder="Pega aquí la lista de seguidores"></textarea></p>
  <p><textarea name="seguidosTXT" placeholder="Pega aquí la lista de seguidos"></textarea></p>

  <p><input type="submit" value="Enviar "></p>

</form>
	
	
	
	 </div>
	<div class="botonesCentro"><button type="button" class="btn btn-primary">Aceptar</button><button type="button" class="btn btn-danger">Cancelar</button></div>
	
	</div>
	
	<!-- <a class="btn btn-success" id="btn1">Ver el archivo que contiene hola</a> 
<a class="btn btn-danger" id="btn2">Ver el archivo que contiene adios</a>
<div id="div-results"></div>
 -->
</body>
</html>