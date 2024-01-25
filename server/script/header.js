(()=>{
//referências
var toggleBtn = document.getElementById('toggleBtn');
var navigation = document.querySelector('.navigation');

// evento de clique para toggleBtn
toggleBtn.addEventListener('click', function() {
    // Verifica se a classe "active" já está presente na navigation
    var isActive = navigation.classList.contains('active');

    // Se já estiver ativa, remove a classe; caso contrário, adiciona a classe
    if (isActive) {
        navigation.classList.remove('active');
    } else {
        navigation.classList.add('active');
    }
});
})()