// var posicaoSlide = 1;
// mostrarSlide(posicaoSlide);

// function passarSlide(n) {
//   mostrarSlide(posicaoSlide += n);
// }

// function slideAtual(n) {
//   mostrarSlide(posicaoSlide = n);
// }

// function mostrarSlide(n) {
//   var slidejs = document.getElementsByClassName(`slide-${posicaoSlide}`);
//   if (n > slidejs.length) {posicaoSlide = 1}
//   if (n < 1) {posicaoSlide = slidejs.length}
//   for (var index = 0; index < slidejs.length; index++) {
//     slidejs[index].style.display = "none";  
//   }
//   slidejs[posicaoSlide-1].style.display = "block";  
// }


function mostrarMenu() {
  var login = document.getElementsByClassName('login')[0]
  if(login.style.display == 'none'){
     login.style.display = 'flex'
     login.style.transform = 'translate(0%)'
  } else{
    login.style.display = 'none'
  }
}
