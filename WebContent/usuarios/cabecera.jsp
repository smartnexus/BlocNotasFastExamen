	<!-- @author: angrodboh -->
	<script src="${pageContext.request.contextPath}/usuarios/js/cabecera.js"></script> <!-- Se incluye el script aqui para evitar copiarlo y pegarlo en todas las páginas -->
	<div id="cabecera">
		<div id="logotipo">
				<a href="${pageContext.request.contextPath}/menu.jsp">
				<img src="${pageContext.request.contextPath}/imagenes/blocnotasfast-p.png" alt="Bloc de Notas FAST" />
				</a>
		</div>
		
		<p class='acceso' id='nombreusuario'>${usuario.nombre}</p>
		<ul id="desplegable">
			<li><a href="${pageContext.request.contextPath}/usuarios/perfil.jsp">Perfil</a></li>
			<!-- Se asigna la url a menu.jsp directamente ya que con el filtro de menú no es necesaria la distinción en todo el codigo entre admin y usuario para acceder a menu.jsp -->
			<li><a href="${pageContext.request.contextPath}/menu.jsp">Notas</a></li>
			<li><a href="${pageContext.request.contextPath}/index.jsp?salir">Cerrar Sesión</a></li>
		</ul>
	</div>
