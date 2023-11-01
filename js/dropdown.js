function LeerTexto(URL){
  console.log("LeerTexto en "+URL)
  var Peticion = new XMLHttpRequest();
  Peticion.open('GET', URL, true);
  Peticion.send(null);
  Peticion.onreadystatechange = function () {
//   console.log("readystate: "+Peticion.readyState+" Status: "+Peticion.status);
     if (Peticion.readyState === 4 && Peticion.status === 200) {
        Leido=Peticion.responseText;
//         var type = Peticion.getResponseHeader('Content-Type');
//         console.log("Content-type: "+type+" index="+type.indexOf("text"));
//         if (type.indexOf("text") !== 1) {
//            return Peticion.responseText;
//            }
//         console.log("Leido:");
//         console.log(Leido);
        return Leido;
     }
  }
}

function LlenarLista(Elementos){
  
}