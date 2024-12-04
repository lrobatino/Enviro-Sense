    window.addEventListener('scroll', function() {
    const navbar = document.getElementById('navbar');
    if (window.scrollY > 50) { // Mude 50 para o valor que preferir
        header.classList.add('scrolled');
    } else {
        header.classList.remove('scrolled');
    }
});

function mostrarMenu() {
    const menu = document.getElementById('menuLogin');
    menu.classList.toggle('mostrar');
  }