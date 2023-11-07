function LeerTexto(URL){
  console.log("LeerTexto:");
  const d = new Date();
  console.log(d.getMilliseconds());

  fetch(URL)
  .then((res) => res.text())
  .then((text) => {
    console.log(text);
    return text;
   })
  .catch((e) => console.error(e));
}

function LlenarLista(objLista, URL){  
  console.log("LlenarLista:");
  const d = new Date();
  console.log(d.getMilliseconds());

  Lista=LeerTexto(URL);             //  Leer el contenido del archivo especificado
// var Items = Lista.split('\n');    //  Separar a un array cada linea del archivo
  console.log(Lista);

  console.log("LlenarLista");
//  const d = new Date();
//  console.log(d.getMilliseconds()); 

  //  console.log('');
//  console.log(Items[0]);

//  console.log(Lista);
/*  objLista.innerHTML += '<option value=Otro></option>';
  objLista.innerHTML += '<option value="Uno mas"></option>'; */
}