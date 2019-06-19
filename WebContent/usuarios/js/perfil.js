//@author: angrodboh
"use strict";

function validacion(event)  {
	var pass1 = document.getElementById("pass").value;
	var pass2 = document.getElementById("pass2").value;
	
	if(pass1 !== pass2) {
		alert("Ha introducido dos nuevas claves distintas");
		document.getElementById("v1").style.display = "inline";
		document.getElementById("v2").style.display = "inline";
		event.preventDefault();
	}
	
}