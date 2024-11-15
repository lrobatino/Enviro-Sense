window.onload = function() {
    document.getElementById("continue-button").onclick = function() {
        // Esconde os labels e inputs visíveis
        document.querySelectorAll('.campo-cadastro').forEach(el => {
            el.classList.add('hide'); // adiciona a classe 'hide' a cada elemento com a classe 'campo-cadastro'
            el.classList.remove('campo-cadastro'); // remove a classe 'campo-cadastro' de cada elemento
        });

        // Mostra os labels e inputs que estão escondidos
        document.querySelectorAll('.hide.escondido').forEach(el => {
            el.classList.remove('hide');
            el.classList.remove('escondido');
        });

        // Esconde o botão "Continuar" e mostra o botão "Cadastrar"
        document.getElementById('continue-button').classList.add('hide');
        document.getElementById('cadastrar').classList.remove('hide');

        document.querySelector('.cadastro').style.height = "65vh";
    };
};