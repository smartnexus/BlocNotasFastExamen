<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"
		import="java.util.List, fast.bloc.Usuario, fast.bloc.DAOException"%>
<!-- @author: angrodboh -->
<jsp:useBean id="usuario" class="fast.bloc.Usuario" scope="session"/>
<jsp:useBean id="usuarios" class="fast.bloc.UsuariosDAO" scope="application"/>
<jsp:useBean id="nota" class="fast.bloc.Nota"/>

<!DOCTYPE html>
<html>
<head>
	<title>Bloc de Notas - FAST: Crear/Editar nota</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="../css/estilo.css" />
	<script src="js/perfil.js"></script>
</head>
<body>
	<jsp:include page="cabecera.jsp" />
	
	<%
	String mensajeError = "";
	String pass = request.getParameter("pass");
	String oldpass = request.getParameter("oldpass");
	
	if(request.getParameterMap().containsKey("pass")) {
		try {
			if(usuarios.existe(usuario.getNombre(), oldpass) != null) {
				usuarios.cambiarContraseña(usuario.getNombre(), pass);
			} else {
				mensajeError = "Usuario/Clave actual incorrectos";
			}
		} catch (DAOException e) {
			mensajeError = e.getMessage();
		}
		
	    //Muestra error o exito
		if (!mensajeError.isEmpty()) {
		%>
			<div id="error"><p> ERROR: 
			<%= mensajeError %>
			</p></div>
		<%
		} else { %>
			<div id="exito"><p> INFO: PERFIL ACTUALIZADO CORRECTAMENTE</p></div>
	<%
		}
	}
	%>
	
	<div id="crear">
		<h1>Editar Perfil del Usuario</h1>
		<div id="formperfil">
		<form id="notaform" method="post" action="" onsubmit="validacion(event)">
			<div class="campo-div">
				<label for="usuario"><strong>Nombre del usuario</strong></label>
				<input id="usuario" type="text" value="${usuario.nombre}" name="usuario" disabled/>
			</div>
			<div class="campo-div">
				<label for="oldpass"><strong>Clave actual</strong></label>
				<input id="oldpass" type="password" name="oldpass" required="required" autofocus="autofocus"/>
			</div>
			<div class="campo-div">
				<label for="pass"><strong>Nueva Clave</strong><b id="v1" class="validation">*</b></label>
				<input id="pass" type="password" name="pass" required="required"/>
			</div>
			<div class="campo-div">
				<label for="pass2"><strong>Nueva Clave (Repetir)</strong><b id="v2" class="validation">*</b></label>
				<input id="pass2" type="password" required="required"/>
			</div>
			<input class="boton" id="enviarnota" type="submit" value="Guardar" name="cambiarperfil" />
			<input class="boton" id="limpiar" type="reset" value="Limpiar" name="limpiar" />
		</form>
		</div>
	</div>

	<%@include file="../pie.jsp"%>
  </body>
</html>