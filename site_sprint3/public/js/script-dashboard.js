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
    var dashboard = document.getElementById('dashboard')
    var cadastrarFabricas = document.getElementById('cadastrar-fabricas')
    mostrarEsconderMenu()

    cadastrarFabricas.style.display = 'none'
    dashboard.style.display = 'flex'
}

function cadastrarFabricas() {
    var dashboard = document.getElementById('dashboard')
    var cadastrarFabricas = document.getElementById('cadastrar-fabricas')
    mostrarEsconderMenu()

    dashboard.style.display = 'none'
    cadastrarFabricas.style.display = 'flex'
}

function entrarCabine(numeroCabine) {
    var informacaoIndividual = document.getElementById('informacao-individual')
    var informacaoGeral = document.getElementById('informacao-geral')
    var botaoVoltar = document.getElementById('icone-voltar')

    informacaoGeral.style.display = 'none'
    informacaoIndividual.style.display = 'flex'
    botaoVoltar.style.display = 'flex'
}

function sairCabine() {
    var informacaoIndividual = document.getElementById('informacao-individual')
    var informacaoGeral = document.getElementById('informacao-geral')

    informacaoGeral.style.display = 'flex'
    informacaoIndividual.style.display = 'none'
}


