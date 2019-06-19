//@author: angrodboh
"use strict";

function toggleMenuOpciones() {
	var actual = document.getElementById("desplegable").style.display;
	if(actual=="block") {
		document.getElementById("desplegable").style.display = "none";
	} else {
		document.getElementById("desplegable").style.display = "block";
	}	
}
window.addEventListener("load", function() {
	document.getElementById("nombreusuario").onclick = toggleMenuOpciones;
});