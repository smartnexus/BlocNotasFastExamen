<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.List, fast.bloc.Usuario"%>
	
<jsp:useBean id="usuario" class="fast.bloc.Usuario" scope="session" />
<jsp:useBean id="notas" class="fast.bloc.NotasDAO" scope="application" />
<jsp:useBean id="usuarios" class="fast.bloc.UsuariosDAO" scope="application" />
<%
List<String> lista = usuarios.obtenerUsuarios(); // Se obtienen id y título de todas los usuarios
%>
<!-- @author: angrodboh -->

<!DOCTYPE html>
<html>
  <head>
    <title>Bloc de Notas - FAST: Mostrar usuarios</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="../css/estilo.css" />
    <script src="js/listarusuarios.js"></script>
  </head>
	
	<jsp:include page="../usuarios/cabecera.jsp" />

	<div id="lista">
		<h1>Lista de TODOS los usuarios</h1>
		<div id="lista-div">
			<table id="lista-tabla">
			<%
			for (String nombre: lista) {
				//Generamos tabla
			%>
				<tr id='fila-<%=nombre%>'>
					<td class="infousuario">
						<p><strong><%=nombre%></strong></p>
						<div class='detalle' id='detalle-<%=nombre%>'></div>
					</td>
				</tr>
			<%
			}
			%>
			</table>
		</div>

	</div>

	<%@include file="../pie.jsp"%>
  </body>
</html>