function LeerTexto(URL){
  fetch(URL)
  .then((res) => res.text())
  .then((text) => {
    return text;    
   })
  .catch((e) => console.error(e));
}

function LlenarLista(objLista, URL){  
  Lista=LeerTexto(URL);
  
//  console.log(Lista);
/*  objLista.innerHTML += '<option value=Otro></option>';
  objLista.innerHTML += '<option value="Uno mas"></option>'; */
}