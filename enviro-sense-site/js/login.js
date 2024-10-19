function mostrarSenha() {
    const senhaInput = document.getElementById('senha_input');
    const verSenhaIcon = document.getElementById('verSenha');

    if (verSenhaIcon.className === 'bi bi-eye-slash') {
        senhaInput.type = 'text';
        verSenhaIcon.className = 'bi bi-eye';
    } else {
        senhaInput.type = 'password';
        verSenhaIcon.className = 'bi bi-eye-slash';
    }
}

function mostrarCaptcha() {

    
    var imagemCorreta = 0;

    chk_robo.hidden = true;
    btn_entrar.hidden = true;
    div_campo_captcha.innerHTML = "";
    imagens.innerHTML = `Escolha a imagem que contém uma plantinha<br>`;
    for (var imagem = 1; imagem <= 9; imagem++) {
        imagemSorteada = parseInt(Math.random() * 7 + 1);
        if (imagemSorteada == 1) {
            if(imagemCorreta == 0){
                imagemCorreta++     
            imagens.innerHTML += `<img src="images/captcha/${imagemSorteada}.png" style="height: 70px; width: 70px;" onclick ="verificarRobo()">`;
            }else {
                imagem--
            }
        } else {
            imagens.innerHTML += `<img src="images/captcha/${imagemSorteada}.png" style="height: 70px; width: 70px;" onclick ="errarVerificacao()">`;
        }
        if (imagem % 3 == 0) {
            imagens.innerHTML += `<br>`;
        }
    }
    imagens.innerHTML += `<button class="botao" onclick="sortearCaptcha()">Pular</button>`;

}
function sortearCaptcha() {

    var imagemCorreta = 0;


    imagens.innerHTML = `Escolha a imagem que contém uma plantinha<br>`;
    for (var imagem = 1; imagem <= 9; imagem++) {
        imagemSorteada = parseInt(Math.random() * 7 + 1);
        if (imagemSorteada == 1) {
            if(imagemCorreta == 0){
                imagemCorreta++
                imagens.innerHTML += `<img src="images/captcha/${imagemSorteada}.png" style="height: 70px; width: 70px;" onclick ="verificarRobo()">`;
                }else {
                    imagem--
                }
        } else {
            imagens.innerHTML += `<img src="images/captcha/${imagemSorteada}.png" style="height: 70px; width: 70px;" onclick ="errarVerificacao()">`;
        }
        if (imagem % 3 == 0) {
            imagens.innerHTML += `<br>`;
        }
    }
    imagens.innerHTML += `<button class="botao" onclick="sortearCaptcha()">Pular</button>`;

}


function verificarRobo() {
    div_campo_captcha.innerHTML = `<input type="checkbox" id="chk_robo" class="campo_captcha" onclick="mostrarCaptcha()">Você não é um robô`;
    chk_robo.checked = true;
    imagens.innerHTML = "";
    btn_entrar.hidden = false;

}

function errarVerificacao() {
    div_campo_captcha.innerHTML = `<input type="checkbox" id="chk_robo" class="campo_captcha" onclick="mostrarCaptcha()">Não sou um robô`;
    chk_robo.checked = false;
    imagens.innerHTML = "";
    btn_entrar.hidden = false;
    alert("Captcha escolhido incorretamente, tente novamente!");

}

function entrar() {
    if (chk_robo.checked != true) {
        alert("Erro no login!");
    } else {
        alert("Seja bem vindo!");
        window.location.href = 'dashboards.html';
    }
}