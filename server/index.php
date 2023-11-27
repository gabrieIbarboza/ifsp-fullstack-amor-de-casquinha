<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="style/CabecalhoRodape.css">
    <link rel="stylesheet" href="style/indexS.css">
</head>
<body>
    <header>
        <div class="conteiner-fluid d-flex justify-content-around cabecalho align-items-center">
            <div class="logo">
                <img src="images/image 1.png" alt="Logo Amor de Casquinha" class="logo">
                <h4 class="titulo1">Amor de Casquinha</h4>
            </div>
            <nav class="navigation text-center">
                <a href="index.html">Início</a>
                <a href="login.html" >Login</a>
                <a href="carrinho.html"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M19.5 8c-2.485 0-4.5 2.015-4.5 4.5s2.015 4.5 4.5 4.5 4.5-2.015 4.5-4.5-2.015-4.5-4.5-4.5zm-.5 7v-2h-2v-1h2v-2l3 2.5-3 2.5zm-5.701-11.26c-.207-.206-.299-.461-.299-.711 0-.524.407-1.029 1.02-1.029.262 0 .522.1.721.298l3.783 3.783c-.771.117-1.5.363-2.158.726l-3.067-3.067zm-.299 8.76c0-1.29.381-2.489 1.028-3.5h-14.028v2h.643c.535 0 1.021.304 1.256.784l4.101 10.216h12l1.211-3.015c-3.455-.152-6.211-2.993-6.211-6.485zm-2.299-8.76c.207-.206.299-.461.299-.711 0-.524-.407-1.029-1.02-1.029-.261 0-.522.1-.72.298l-4.701 4.702h2.883l3.259-3.26z" class="carrinho"/></svg></a>
                <a href="sobre.html">Perfil</a>
            </nav>
            <div class="toggleBox" id="toggleBtn">
                <img src="images/image 2.png" alt="Menu" id="toggleBtn">
            </div>
        </div>
      </header>

        <h1 class="m-auto text-center pt-4 pb-4">Bem vindo ao Amor de Casquinha</h1>
    <main>
        <section>
            <div class="conteiner1 d-flex flex-column justify-content-center align-items-center">
                <h3>Explore nosssas opções de sorvete</h3>
                <div class="c1">
                    <div class="card categ d-flex align-items-center">
                        <picture>
                            <source media="(min-width: 768px)" srcset="images/sorveteBolaDesktop.png">
                            <img src="images/sorvetebola.png" alt="Sorvete em bola">
                        </picture>
                        <div class="d-flex align-items-center flex-column c2">
                            <h4>Sorvete em Bola</h4>
                            <button><a href="sabores.html">ver</a></button>
                        </div>
                    </div>
                    <div class="card categ d-flex align-items-center">
                        <picture>
                            <source media="(min-width: 768px)" srcset="images/sorvetePoteDesktop.png">
                                <img src="images/sorvetePote.png" alt="Sorvete de Pote">
                        </picture>
                        <div class="d-flex align-items-center flex-column c2">
                            <h4>Sorvete de Pote</h4>
                            <button><a href="sabores.html">ver</a></button>
                        </div>
                    </div>
                    <div class="card categ d-flex align-items-center">
                        <picture>
                            <source media="(min-width: 768px)" srcset="images/picoleDesktop.png">
                                <img src="images/picole.png" alt="Picolé">
                        </picture>
                        <div class="d-flex align-items-center flex-column c2">
                            <h4>Picolé</h4>
                            <button><a href="sabores.html">ver</a></button>
                        </div>
                    </div>
                    <div class="card categ d-flex align-items-center align-content-between">
                        <picture>
                            <source media="(min-width: 768px)" srcset="images/sundaeDesktop.png">
                                <img src="images/sundae.png" alt="Sundae">
                        </picture>
                        <div class="d-flex align-items-center flex-column c2">
                            <h4>Sundae</h4>
                            <button><a href="sabores.html">ver</a></button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <footer>
        <div class="conteiner-fluid d-flex justify-content-center rodape align-items-center flex-column">
            <div class="d-flex flex-row justify-content-around align-items-center">
                <img src="images/image 1.png" alt="Logo Amor de Casquinha" class="pe-4 logo">
                <h3>Amor de Casquinha</h3>
            </div>
            <img src="images/Rectangle 1048.png" class="pt-3 linha">
            <div class="text-center">
                <p>2023 Amor de Casquinha Todos os direitos reservados</p>
            </div>
        </div>
    </footer>







    <script src="script/header.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>
</html>