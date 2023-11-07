function LeerTexto(URL){
  var Leido='';
  fetch(URL)
  .then((res) => res.text())
  .then((text) => {
    Leido = text;
    console.log(Leido);
  })
  .catch((e) => console.error(e));

  return Leido;  
}

function LlenarLista(objLista, URL){  
  Lista = LeerTexto(URL);     //  Leer el contenido del archivo especificado
// var Items = Lista.split('\n');    //  Separar a un array cada linea del archivo
  console.log(Lista);
//  console.log('');
//  console.log(Items[0]);

//  console.log(Lista);
/*  objLista.innerHTML += '<option value=Otro></option>';
  objLista.innerHTML += '<option value="Uno mas"></option>'; */
}