<?php
    require_once 'config/blockURLAccess.php';
    require 'config/config.php';
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Excluir produto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="style/CabecalhoRodape.css">
    <link rel="stylesheet" href="style/excluirProdS.css">
    <link rel="shortcut icon" href="images/iceCreamIcon.ico" type="image/x-icon">
</head>
<body>
    <?php
        include_once 'components/header.php';
    ?>
    <main>
    <h1 class="m-auto text-center pt-4 pb-4">Excluir Produto</h1>
        <div class="conteiner">
            <h3>Tem certeza que deseja excluir esse produto?</h3>
            
            <div class="conteiner1">   
                <div class="c1">
                    <?php
                        $idProduto = $_GET['produto'];
                        $stmt = $conn->prepare('SELECT * from tbproduto where idProduto = :id');
                        $stmt->bindParam(':id', $idProduto);
                        $stmt->execute();

                        while($row = $stmt->fetch()){
                            echo'
                            <form action="config/deleteProd.php" method="POST" id="formulario" class="formulario">
                                <input type="hidden" name="nomeProdExcl" value="'.$row['nomeProduto'].'">
                                <button type="submit">Excluir</button>
                            </form>';  

                            echo '
                                <div class="c2">
                                    <div class="c3">
                                        <picture>
                                        <img src="images/'.$row["fotoProduto"].'" alt="'.$row["fotoProduto"].'" class="imagem">
                                        </picture>
                                    </div>
                                    <div class="d-flex flex-column">
                                        <div id="dados">
                                            <h3 class="titulo px-3">'.$row["nomeProduto"].'</h3>
                                            <div class="px-3">
                                                <p>Tipo:'.$row["tipoProduto"].'</p>
                                            </div>
                                        </div>
                                    </div>        
                                </div>
                            ';
                        }
                        
                    ?>
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