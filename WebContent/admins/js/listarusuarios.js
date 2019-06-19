//@author: angrodboh.
"use strict";

var ultid="null";

function mostrarEsperando(elemento) {
	var html = "<p><strong>Obteniendo detalles...</strong></p>"+
				"<img src='../imagenes/espera.gif' alt='Espera' />";
	elemento.innerHTML=html;
}

function mostrarDetalle(elemento, objetoDetalle, id) {
	if (objetoDetalle.error != null && objetoDetalle.error !="") {
		elemento.innerHTML="<p>Error: "+objetoDetalle.error+"</p>";
	} else {
		var listacat = "";
		var listacol = "";
		var listaerr = "";
		for(var i=0; i<objetoDetalle.categorias.length; i++) {
			listacat += "<li>" + objetoDetalle.categorias[i] + "</li>";
		}
		for(var i=0; i<objetoDetalle.colores.length; i++) {
			listacol += "<li>" + objetoDetalle.colores[i] + "</li>";
		}
		for(var i=0; i<objetoDetalle.errores.length; i++) {
			listaerr += "<li>" + objetoDetalle.errores[i] + "</li>";
		}
		elemento.innerHTML="<ul><li>categorias:<ul>" + listacat + "</ul></li>" +
				"<li>colores:<ul>" + listacol + "</ul></li>" +
				"<li>errores:<ul>" + listaerr + "</ul></li></ul>"
	}
}

function mostrar() {
	var prefix = "fila-";
	var id = this.parentElement.id.substring(prefix.length);
	
	if (ultid != "null") {
		if (document.getElementById("detalle-"+ultid) != null )
			document.getElementById("detalle-"+ultid).style.display="none";
	}
	if (ultid == id)
		ultid = "null"; 
	else {
		ultid = id;
		
		var divDetalle = document.getElementById("detalle-"+ultid);
		mostrarEsperando(divDetalle);
		divDetalle.style.display="block";

		var peticion="cyc";
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.open("POST",peticion,true);
		xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xmlhttp.onreadystatechange = function(){ 
			if (xmlhttp.readyState==4) {
				if (xmlhttp.status==200) {
					var detalleUsuario = JSON.parse(xmlhttp.responseText);
					mostrarDetalle(divDetalle, detalleUsuario, id);
				} else {
					divDetalle.innerHTML=cabDetalle+"<p>Error</p>";
				}
			}
		  };
		xmlhttp.send("nombre_usu="+id); //enviamos
	}
}

window.addEventListener("load", function() {
	var infos = document.querySelectorAll(".infousuario");
	for(var i=0; i< infos.length; i++) {
		infos[i].onclick=mostrar;
	}
});