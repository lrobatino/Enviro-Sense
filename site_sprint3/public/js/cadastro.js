function mostrarSenha() {
    var senha = document.getElementById('inpSenha')
    var senhaEmpresa = document.getElementById('inpSenhaEmpresa')
    var imgSenha = document.getElementById('imgSenha')
    var imgSenhaEmpresa = document.getElementById('imgSenhaEmpresa')

    senha.type = 'text'
    imgSenha.src = 'imgs/visualizar.png'
    imgSenha.onclick = esconderSenha
    senhaEmpresa.type = 'text'
    imgSenhaEmpresa.src = 'imgs/visualizar.png'
    imgSenhaEmpresa.onclick = esconderSenha
}

function esconderSenha() {
    var senha = document.getElementById('inpSenha')
    var senhaEmpresa = document.getElementById('inpSenhaEmpresa')
    var imgSenha = document.getElementById('imgSenha')
    var imgSenhaEmpresa = document.getElementById('imgSenhaEmpresa')

    senha.type = 'password'
    imgSenha.src = 'imgs/esconder.png'
    imgSenha.onclick = mostrarSenha
    senhaEmpresa.type = 'password'
    imgSenhaEmpresa.src = 'imgs/esconder.png'
    imgSenhaEmpresa.onclick = mostrarSenha
}