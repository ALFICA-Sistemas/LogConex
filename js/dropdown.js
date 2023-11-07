function LeerTexto(URL){
  console.log("LeerTexto en "+URL)
  fetch(URL)
  .then((res) => res.text())
  .then((text) => {
    console.log(text);
    return text;    
   })
  .catch((e) => console.error(e));
}

function LlenarLista(objLista, URL){  
  Lista=LeerTexto(URL);
  return Lista;
//  console.log(Lista);
/*  objLista.innerHTML += '<option value=Otro></option>';
  objLista.innerHTML += '<option value="Uno mas"></option>'; */
}