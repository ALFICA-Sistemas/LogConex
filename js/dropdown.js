function LeerTexto(URL){
  console.log("LeerTexto en "+URL)
  fetch(URL)
  .then((res) => res.text())
  .then((text) => {
    console.log(text);
    return text;
    // do something with "text"
   })
  .catch((e) => console.error(e));
}

function LlenarLista(objLista, Elementos){  
  objLista.innerHTML += '<option value=Otro></option>';
  objLista.innerHTML += '<option value="Uno mas"></option>';
}