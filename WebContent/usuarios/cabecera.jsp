	<!-- @author: angrodboh -->
	<script src="/bloc/usuarios/js/cabecera.js"></script> <!-- Se incluye el script aqui para evitar copiarlo y pegarlo en todas las p�ginas -->
	<div id="cabecera">
		<div id="logotipo">
				<a href="${pageContext.request.contextPath}/menu.jsp">
				<img src="${pageContext.request.contextPath}/imagenes/blocnotasfast-p.png" alt="Bloc de Notas FAST" />
				</a>
		</div>
		
		<p class='acceso' id='nombreusuario'>${usuario.nombre}</p>
		<ul id="desplegable">
			<li><a href="/bloc/usuarios/perfil.jsp">Perfil</a></li>
			<!-- Se asigna la url a menu.jsp directamente ya que con el filtro de men� no es necesaria la distinci�n en todo el codigo entre admin y usuario para acceder a menu.jsp -->
			<li><a href="/bloc/menu.jsp">Notas</a></li>
			<li><a href="/bloc/index.jsp?salir">Cerrar Sesi�n</a></li>
		</ul>
	</div>
