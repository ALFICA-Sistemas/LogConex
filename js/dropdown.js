var Leido; 
function LeerTexto(URL) {
  var Solicitud = new XMLHttpRequest();
  Solicitud.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      Leido = this.responseText;
    }
  };
  Solicitud.open("GET", URL,false);
  Solicitud.send(); 
  return Leido;
}

function LlenarLista(objLista, URL){
  let Lista = LeerTexto(URL);     //  Leer el contenido del archivo especificado
  console.log(Lista);
  console.log('');
  var Items = Lista.split('\n');    //  Separar a un array cada linea del archivo
  Items.sort;
//  Items.reverse;
  console.log(Items[0]);
  objLista.innerHTML += '<option value=Otro></option>';
  objLista.innerHTML += '<option value="Uno mas"></option>';
}