function mostrarEsconderMenu() {
    var menu = document.getElementById('menu')
    if (menu.classList.contains('visivel')){
        menu.classList.remove('visivel')
        menu.classList.add('invisivel')
    } else {
        menu.classList.remove('invisivel')
        menu.classList.add('visivel')
    }
}

function dashboard() {
    mostrarEsconderMenu()
}