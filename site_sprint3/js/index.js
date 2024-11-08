// var posicao = 1
// passarCarrosel()

// function passarCarrosel() {
//   var slidejs = document.getElementsByClassName("slide");
//   for (var posicaoSlide = 0; posicaoSlide < slidejs.length; posicaoSlide++) {
//     slidejs[posicaoSlide].style.display = "none"; 
//   }
//   posicao++;
//   if (posicao > slidejs.length) {posicao = 1}
//   slidejs[posicao-1].style.display = "block"; 
//   setTimeout(passarCarrosel, 2000); 
// }

// function mostrarMenu() {
  
// }


var posicaoSlide = 1;
mostrarSlide(posicaoSlide);

function passarSlide(n) {
  mostrarSlide(posicaoSlide += n);
}

function slideAtual(n) {
  mostrarSlide(posicaoSlide = n);
}

function mostrarSlide(n) {
  var slidejs = document.getElementsByClassName("slide");
  var seletor = document.getElementsByClassName("seletorSlide");
  if (n > slidejs.length) {posicaoSlide = 1}
  if (n < 1) {posicaoSlide = slidejs.length}
  for (var index = 0; index < slidejs.length; index++) {
    slidejs[index].style.display = "none";  
  }
  for (index = 0; index < seletor.length; index++) {
    seletor[index].style.color = 'transparent';
  }
  slidejs[posicaoSlide-1].style.display = "block";  
  seletor[posicaoSlide-1].style.color = 'white';
}


function mostrarMenu() {
  var menu = document.getElementById('menuLogin')
  if(menu.classList.contains('aparecer')){
     menu.classList.remove('aparecer')
  } else{
    menu.classList.add('aparecer')
  }
}
