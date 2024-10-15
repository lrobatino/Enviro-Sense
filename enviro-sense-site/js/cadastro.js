function verSenha() {
    if (verSenha.class === 'bi bi-eye-slash') {
        senha_input.type = 'text'; 
        verSenha.class ="bi bi-eye";
    } else {
        senha_input.type = 'password';
        verSenha.class = 'bi bi-eye-slash'; 
    }
}

function verConfirmaSenha() {
    if (confirmarSenha.class === 'bi bi-eye-slash') {
        senha_confirm_input.type = 'text'; 
        confirmarSenha.class ="bi bi-eye"; 
    } else {
        senha_confirm_input.type = 'password'; 
        confirmarSenha.class = 'bi bi-eye-slash'; 
    }
}
