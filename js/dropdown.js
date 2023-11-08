var Leido=[]; 
function LeerTexto(URL) {
  var Solicitud = new XMLHttpRequest();
  Solicitud.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      Leido.push(this.responseText);
    }
  };
  Solicitud.open("GET", URL);
  Solicitud.send(); 
  return Leido;
}

function LlenarLista(objLista, URL){
  let Lista = LeerTexto(URL);     //  Leer el contenido del archivo especificado
// var Items = Lista.split('\n');    //  Separar a un array cada linea del archivo
  console.log(Lista);
//  console.log('');
//  console.log(Items[0]);

//  console.log(Lista);
/*  objLista.innerHTML += '<option value=Otro></option>';
  objLista.innerHTML += '<option value="Uno mas"></option>'; */
}