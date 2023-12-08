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
    <link rel="stylesheet" href="style/sobreS.css">
</head>
<body>
    
    <?php
        include_once 'components/nav.php';
    ?>

    <main>
        <div class="conteiner1 conteiner d-flex align-items-center flex-column w-75 p-4 my-3">
            <div class="c1">
                <div class="d-flex justify-content-center m-2"><img src="images/funcionario1.png" alt="" ></div>
                <div id="dados">
                    <p>Nome: Amanda</p>
                    <p>Data de nascimento: 15/02/1997</p>
                    <p>Endereço: Rua da Luz, 42</p>
                </div>

        
                <form action="" method="POST" id="formulario">
                    <label for="nome">Nome:</label>
                    <input type="text" id="nome" placeholder="Nome completo">
                    <label for="dataNasc">Data de nascimento:</label>
                    <input type="date" id="dataNasc" placeholder="Data de nascimento">
                    <label for="endereco">Endereço:</label>
                    <input type="text" id="endereco" placeholder="Endereço">
                    <button type="submit">Salvar</button>
                </form>
            </div>
            <button id="edit">Editar</button>
        </div>

        <div class="conteiner1 conteiner d-flex align-items-center flex-column w-75 p-4 my-3">
            <div class="d-flex flex-column c4">
                <button><a href="carrinho.php">Meu carrinho</a></button>
                <button id="btnPedidoCli">Meus pedidos</button>
            </div>
            <div class="c5">
                <h3 class="pedidoN">Pedido N°123423</h3>
                <!-- Fazer for aqui -->
                <div class="c1">
                    <div class="d-flex flex-column">
                        <div class="c2 d-flex flex-row">
                            <img src="images/picoleCoco.png" alt="Picolé sabor coco" class="imagem">
                            <h3 class="titulo2">Nestlé La Frutta Coco</h3>
                        </div>
                        <div class="d-flex flex-column c3">
                            <div class="preco d-flex flex-row justify-content-between">
                                <p>Preço</p>
                                <span>R$ 1,50</span>
                            </div>
                            <div>
                                <p>Quantidade: 1</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Fim do for -->
                <div class="botao d-flex justify-content-start mt-3 flex-column">
                    <div>
                        <p>Endereço: </p>
                    </div>
                    <div>
                        <p>Total: </p>
                    </div>
                    <div>
                        <button id="exclP">Excluir pedido</button>
                    </div>
                    
                </div>
            </div>
        </div>
    </main>
    
    <?php
        include_once 'components/footer.php';
    ?>
    
    <script src="script/sobre.js"></script>
    <script src="script/header.js"></script>
    <script src="script/editar.js"></script>
    
</body>
</html>