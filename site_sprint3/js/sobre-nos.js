    window.addEventListener('scroll', function() {
    const header = document.getElementById('header');
    if (window.scrollY > 50) { // Mude 50 para o valor que preferir
        header.classList.add('scrolled');
    } else {
        header.classList.remove('scrolled');
    }
});
