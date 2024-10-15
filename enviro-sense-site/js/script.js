document.addEventListener('DOMContentLoaded', function() {
    const togglePassword = document.querySelector('#togglePassword');
    const senhaInput = document.querySelector('#senha_input');
    

    togglePassword.addEventListener('click', function() {
        // Alterna entre 'password' e 'text'
        const tipo = senhaInput.getAttribute('type') === 'password' ? 'text' : 'password';
        senhaInput.setAttribute('type', tipo);

        // Alterna o ícone entre 'bi-eye' e 'bi-eye-slash'
        this.classList.toggle('bi-eye');
        this.classList.toggle('bi-eye-slash');
    });
});
