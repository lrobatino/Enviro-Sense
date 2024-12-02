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
    var cadastrarUsuarios = document.getElementById('cadastrar-usuarios')
    var cadastrarFabricas = document.getElementById('cadastrar-fabricas')
    mostrarEsconderMenu()

    cadastrarUsuarios.style.display = 'none'
    cadastrarFabricas.style.display = 'none'
    dashboard.style.display = 'flex'
}

function cadastrarUsuarios() {
    var dashboard = document.getElementById('dashboard')
    var cadastrarUsuarios = document.getElementById('cadastrar-usuarios')
    var cadastrarFabricas = document.getElementById('cadastrar-fabricas')
    mostrarEsconderMenu()

    dashboard.style.display = 'none'
    cadastrarFabricas.style.display = 'none'
    cadastrarUsuarios.style.display = 'flex'
}

function cadastrarFabricas() {
    var dashboard = document.getElementById('dashboard')
    var cadastrarUsuarios = document.getElementById('cadastrar-usuarios')
    var cadastrarFabricas = document.getElementById('cadastrar-fabricas')
    mostrarEsconderMenu()

    dashboard.style.display = 'none'
    cadastrarUsuarios.style.display = 'none'
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

function mostrarSenha() {
    var senha = document.getElementById('inpSenha')
    var senhaEmpresa = document.getElementById('inpSenhaEmpresa')
    var imgSenha = document.getElementById('imgSenha')
    var imgSenhaEmpresa = document.getElementById('imgSenhaEmpresa')

    senha.type = 'text'
    imgSenha.src = 'images/visualizar.png'
    imgSenha.onclick = esconderSenha
    senhaEmpresa.type = 'text'
    imgSenhaEmpresa.src = 'images/visualizar.png'
    imgSenhaEmpresa.onclick = esconderSenha
}

function esconderSenha() {
    var senha = document.getElementById('inpSenha')
    var senhaEmpresa = document.getElementById('inpSenhaEmpresa')
    var imgSenha = document.getElementById('imgSenha')
    var imgSenhaEmpresa = document.getElementById('imgSenhaEmpresa')

    senha.type = 'password'
    imgSenha.src = 'images/esconder.png'
    imgSenha.onclick = mostrarSenha
    senhaEmpresa.type = 'password'
    imgSenhaEmpresa.src = 'images/esconder.png'
    imgSenhaEmpresa.onclick = mostrarSenha
}