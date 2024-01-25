<?php
    require_once 'config/blockURLAccess.php';
    session_start();
    require_once 'config/config.php';
    include_once 'config/createPedido.php';
?>
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
    <link rel="shortcut icon" href="images/iceCreamIcon.ico" type="image/x-icon">
</head>
<body>
    <?php
        include_once 'components/header.php';
    ?>
    <main>
        <!-- TODO: Puxar dados do cliente com $_SESSION -->
        <div class="conteiner1 conteiner d-flex align-items-center flex-column w-75 p-4 my-3">
            <div class="c1">
                <div class="d-flex justify-content-center m-2"><img src="images/funcionario1.png" alt="" ></div>
                <?php 
                    echo '
                    <div id="dados">
                        <p>Nome: '.$_SESSION["userName"].'</p>
                        <p>Endereço: '.$_SESSION["userCep"].' - '.$_SESSION["userRua"].', '.$_SESSION["userNum"].', '.$_SESSION["userCompl"].' - '.$_SESSION["userBairro"].'</p>
                    </div>
                    ';
                ?>  
                <form action="" method="POST" id="formulario">
                    <label for="nome">Nome:</label>
                    <input type="text" id="nome" placeholder="Nome completo">
                    <label for="endereco">Endereço:</label>
                    <input type="text" id="endereco" placeholder="Endereço">
                    <button type="submit">Salvar</button>
                </form>
            </div>
            <button id="edit">Editar</button>
        </div>

        <div class="conteiner1 conteiner d-flex align-items-center flex-column w-75 p-4 my-3">
            <h3>Meus pedidos</h3>
            <?php
                include_once "config/getPedidos.php";
            ?>
        </div>
    </main>
    <?php
        include_once 'components/footer.php';
    ?>
    <script src="script/editar.js"></script>
</body>
</html>
