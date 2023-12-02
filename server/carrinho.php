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
    <link rel="stylesheet" href="style/carrinhoS.css">
</head>
<body>
    
    <?php
        include_once 'components/nav.php';
    ?>
    
    <main>
        <h1 class="titulo">Carrinho</h1>
        <div class="conteiner d-flex flex-column align-items-center">
            <div class="container-fluid d-flex flex-column align-items-center conteiner1">

                <div class="c1">
                    <div class="d-flex flex-row">
                        <div class="c2">
                            <img src="images/picoleCoco.png" alt="Picolé sabor coco" class="imagem">
                        </div>
                        <div class="d-flex flex-column c3">
                            <h3>Nestlé La Frutta Coco</h3>
                            <div class="preco d-flex flex-row justify-content-between">
                                <p>Preço</p>
                                <span>R$ 1,50</span>
                            </div>
                        </div>
                    </div>
                    <div class="botao text-center d-flex justify-content-evenly mt-3 flex-row">
                            <div class="d-flex align-items-start excl">
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
                <div class="d-flex flex-column c4 align-items-center">


                    <div class="d-flex flex-column c4 align-items-center">
                        <!-- Cliente não Logado -->
                        <p class="text-center">Faça Login para concluir o pedido</p>
                        <button><a href="login.php">Login / Cadastrar</a></button>
                    </div>

                    <div>
                        <!-- Cliente Logado -->
                    <button><a href="notaFiscal.html">Concluir pedido</a></button>
                    </div>

                </div>
            </div>
            <button class="voltar"><a href="index.html">Voltar</a></button>
        </div>
    </main>
    
    <?php
        include_once 'components/footer.php';
    ?>
    
    <script src="script/header.js"></script>
    <script src="script/endereco.js"></script>
    
</body>
</html>