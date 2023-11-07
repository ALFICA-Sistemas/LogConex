function LeerTexto(URL){
  fetch(URL)
  .then((res) => res.text())
  .then((text) => {
    text=text.replace(/\n/g, ',');  // Sustituir los fines de linea por comas, para
    return text;
   })
  .catch((e) => console.error(e));
}

function LlenarLista(objLista, URL){  
  Lista=LeerTexto(URL);
  
  var Items = text.split(',');    //   facilitar convertirlo a array
  console.log(text);
  console.log('');
  console.log(Items[0]);
  
//  console.log(Lista);
/*  objLista.innerHTML += '<option value=Otro></option>';
  objLista.innerHTML += '<option value="Uno mas"></option>'; */
}