<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="style/CabecalhoRodape.css">
    <link rel="stylesheet" href="style/carrinhoS.css">
</head>
<body>
    <nav>
        <div class="conteiner-fluid d-flex justify-content-around cabecalho align-items-center">
            <div class="cabec1">
                <img src="images/image 1.png" alt="Logo Amor de Casquinha">
                <h1 class="titulo1">Amor de Casquinha</h1>
            </div>
            <div class="d-flex justify-content-around w-50 align-items-end naveg">
                <a href="index.html">Início</a>
                <a href="login.html" class="login">Login</a>
                <a href="carrinho.html"><img src="images/Icon.svg" alt="Carrinho de compras" class="carrinho"></a>
                <a href="sobre.html" class="sobre">Área do Funcionário</a>
                <img src="images/image 2.png" alt="Menu" id="menu">
            </div>
        </div>
    </nav>
    <header>
        <div class="titulo">
            <h1>Carrinho</h1>
        </div>
    </header>
    <main>
        <div class="conteiner d-flex flex-column align-items-center">
            <div class="container-fluid d-flex flex-column align-items-center conteiner1">

                <div class="c1">
                    <div class="row">
                        <div class="col col-4 c2">
                            <img src="images/picoleCoco.png" alt="Picolé sabor coco" class="imagem">
                        </div>
                        <div class="col c3">
                            <h3 class="">Nestlé La Frutta Coco</h3>
                            <div class="preco d-flex flex-row justify-content-between px-2">
                                <p>Preço</p>
                                <span>R$ 1,50</span>
                            </div>
                        </div>
                    </div>
                    <div class="botao text-center d-flex justify-content-evenly mt-3 flex-row row">
                            <div class="col col-3 d-flex align-items-start excl">
                                <button id="excl">Excluir</button>
                            </div>
                            <div class="col d-flex align-items-start col-7">
                                <p>Quantid.</p>
                                <select name="selecao">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                </select>
                            </div>
                    </div>
                </div>
                

                    <button class="conc">Concluir</button>
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
    


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>
</html>