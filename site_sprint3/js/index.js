var posicao = 0
passarCarrosel()

function passarCarrosel() {
  var slidejs = document.getElementsByClassName("slide");
  for (var posicaoSlide = 0; posicaoSlide < slidejs.length; posicaoSlide++) {
    slidejs[posicaoSlide].style.display = "none"; 
  }
  posicao++;
  if (posicao > slidejs.length) {posicao = 1}
  slidejs[posicao-1].style.display = "block"; 
  setTimeout(passarCarrosel, 2000); 
}

function mostrarMenu() {
  
}