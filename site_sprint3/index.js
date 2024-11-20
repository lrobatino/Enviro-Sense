
function mostrarMenu() {
  var login = document.getElementsByClassName('login')[0]
  if(login.style.display == 'none'){
     login.style.display = 'flex'
     login.style.transform = 'translate(0%)'
  } else{
    login.style.display = 'none'
  }
}

function validarInputs() {
   var email = inp_email.value
   var senha = inp_senha.value

   if(!emailValido(email)){
      return alert("Email inválido. Email deve conter '@' e '.' após o arroba")
   }
   if(!senhaValida(senha)){
    return alert("Senha inválida. Senha deve conter pelo menos um caractere especial\numa letra maiuscula e um numero\nE ter pelo menos 8 digitos")
   }
}

function emailValido(email){

var validar = (email != "" && email.indexOf("@") != -1)

      if (validar){
        for (var posicao = email.indexOf("@"); posicao < email.length; posicao++){
          if(email[posicao] == "."){
            return true
          }
        }
        return false
      }
      return false
}

function senhaValida(senha){

  var caracteresLista = ["!","@","#","$","%","&","*","(",")","?","<",">"]
  var validar = (senha != "" && (senha.length >=8 && senha.length <=32))
  var temcaractere = false
  var temNumero = false
  if(validar){
    for(var posicao = 0;posicao<senha.length;posicao++){
      if(senha.includes(caracteresLista[posicao])){
          temcaractere = true
          break
      }
    }
    
    for (var posicao = 0;posicao<senha.length;posicao++){
      if(senha[posicao] != isNaN(senha[posicao])){
        temNumero = true
        break
      }
    }
    for (var posicao = 0;posicao<senha.length;posicao++){
      if(senha[posicao] == senha[posicao].toUpperCase()){
        temMaiuscula = true
        break
      }
    }
    if (temNumero && temcaractere && temMaiuscula){
      return true
    }
    return false
  }return false
    
}