function LeerTexto(URL){
  const xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      console.log(this.responseText);
      return this.responseText;      
    }
  };
  xhttp.open("GET", URL);
  xhttp.send(); 
//  return Leido;
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