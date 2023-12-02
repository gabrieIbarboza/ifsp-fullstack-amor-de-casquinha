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
    <link rel="stylesheet" href="style/pedidosS.css">
</head>
<body>
    
    <?php
        include_once 'components/nav.php';
    ?>

    <main>
        <div class="conteiner d-flex flex-column align-items-center">
            <h1>pedidos</h1>
            <div class="container-fluid d-flex flex-column align-items-center conteiner1">

                <div>
                    <h3>Pedido N°213819</h3>
                    <!-- o for vai aqui (apenas 1 pedido com vários itens) -->
                    <div class="c1">
                        <div class="d-flex flex-row">
                            <div class="c2">
                                <img src="images/picoleCoco.png" alt="Picolé sabor coco" class="imagem">
                            </div>
                            <div class="d-flex flex-column c3 ps-2">
                                <h3>Nestlé La Frutta Coco</h3>
                                <div class="preco d-flex flex-row justify-content-between">
                                    <p>Preço</p>
                                    <span>R$ 1,50</span>
                    
                                </div>
                                <div>
                                    <p>Endereço: </p>
                                    <p>Cliente: </p>
                                </div>
                            </div>
                        </div>
                        <div class="botao text-center d-flex justify-content-between mt-3 flex-row">
                            <div class="excl">
                                <button id="excl">Excluir</button>
                            </div>
                            <div>
                                <p>Quantidade: 1</p>
                            </div>
                        </div>
                    </div>
                    <!-- Fim do for -->
                </div>
            </div>
            <button class="voltar"><a href="index.html">Voltar</a></button>
        </div>
    </main>
    
    <?php
        include_once 'components/footer.php';
    ?>
    
    <script src="script/header.js"></script>
    <script src="script/adicionar.js"></script>
    <script src="script/editar.js"></script>
    
</body>
</html>