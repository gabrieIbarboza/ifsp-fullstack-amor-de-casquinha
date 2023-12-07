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
    <link rel="stylesheet" href="style/editarSabores.css">
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

    
    <main>
            <h1>Picolé Sabores</h1>
        
        <div class=" d-flex flex-column align-items-center justify-content-center">
            <button class="add">Adicionar Sabor</button>
            <div>
                    <form action="" method="POST" id="addFormulario">
                        <label for="nome1">Nome:</label>
                        <input type="text" id="nome1" name="nomeSabAdd" placeholder="Nome do produto">
                        <label for="preco1">Preço:</label>
                        <input type="text" id="preco1" name="precoSabAdd" placeholder="Preço do produto">
                        <label for="nomeImagem">Nome do arquivo de imagem:</label>
                        <input type="text" id="nomeImagem" name="nomeImagemSabAdd" placeholder="imagem.png">
                        <button type="submit">Salvar</button>
                    </form>
                </div>
            <div class="conteiner1">
                <div class="c1">

                    <div class="d-flex flex-row">
                        <div class="col col-4">
                            <img src="images/picoleCoco.png" alt="Picolé sabor coco" class="imagem">
                        </div>
                        <div id="dados">
                            <h3 class="titulo px-2">Nestlé La Frutta Coco</h3>
                            <div class="preco d-flex flex-row justify-content-between px-2">
                                <p>Preço</p>
                                <span>R$ 1,50</span>
                            </div>
                        </div>
                        <div>
                            <form action="" method="POST" id="formulario" class="formulario">
                                <label for="nome2">Nome:</label>
                                <input type="text" id="nome2" name="nomeSabEdt" placeholder="Nome do produto">
                                <label for="preco2">Preço:</label>
                                <input type="text" id="preco2" name="precoSabEdt" placeholder="Preço do produto">
                                <button type="submit">Salvar</button>
                            </form>
                        </div>
                    </div>

                    <div class="botao text-center d-flex justify-content-evenly mt-3">
                        <button id="excl">Excluir</button>
                        <button id="edit">Editar</button>
                    </div>

                </div>
            </div>
            <button class="voltar"><a href="index.html">Voltar</a></button>
        </div>
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
    <script src="script/adicionar.js"></script>
    <script src="script/editar.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>
</html>
