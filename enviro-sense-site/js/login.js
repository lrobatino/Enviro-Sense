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