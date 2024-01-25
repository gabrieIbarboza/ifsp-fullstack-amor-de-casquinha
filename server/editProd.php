<?php
require_once 'config/blockURLAccess.php';
session_start();
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Produto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="style/CabecalhoRodape.css">
    <link rel="stylesheet" href="style/editFuncS.css">
    <link rel="shortcut icon" href="images/iceCreamIcon.ico" type="image/x-icon">
</head>
<body>
    <?php
        include_once 'components/header.php';
    ?>
    <main>
        <h1 class="m-auto text-center pt-4 pb-4">Editar Produto</h1>
        <div class="conteiner">
            <div class="conteiner1">
                
                <div class="c1">
                    <div class="c2">
                        <?php
                        require 'config/config.php';
                        $idProduto = $_GET['produto'];
                        $stmt = $conn->prepare('SELECT * from tbproduto where idProduto = :id');
                        $stmt->bindParam(':id', $idProduto);
                        $stmt->execute();

                        while($row = $stmt->fetch()){
                            echo'
                            <form action="config/updateProd.php" method="POST" id="formulario" class="formulario">
                                <input type="hidden" name="nomeProdAtual" value="'.$row['nomeProduto'].'">
                                <label for="nome2">Nome:</label>
                                <input type="text" id="nome2" name="nomeProdEdt" placeholder="Nome" value="'.$row['nomeProduto'].'">
                                <label for="email2">Tipo:</label>
                                <input type="text" id="tipo2" name="tipoProdEdt" placeholder="Tipo" value="'.$row['tipoProduto'].'">
                                <label for="foto2">Nome do arquivo de imagem:</label>
                                <input type="text" id="imagem2" name="imagemProdEdt" placeholder="imagem.png" value="'.$row['fotoProduto'].'">
                                <button type="submit">Salvar</button>
                            </form>';  
                        }
                            
                        ?>
                    </div>
                </div>
            </div>
            <button class="voltar"><a href="editarProdutos.php">Voltar</a></button>
        </div>
    </main>
    <?php
        include_once 'components/footer.php';
    ?>
</body>
</html>