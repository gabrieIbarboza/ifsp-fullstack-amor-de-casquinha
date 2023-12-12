<?php
    session_start();
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Excluir Sabor</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="style/CabecalhoRodape.css">
    <link rel="stylesheet" href="style/excluirFuncS.css">
    <link rel="shortcut icon" href="images/iceCreamIcon.ico" type="image/x-icon">
</head>
<body>
    
    <?php
        include_once 'components/header.php';
    ?>

    <main>
            <h1>Desativar Sabor</h1>
    
        <div class="conteiner">
            <h3>Tem certeza que deseja desativar esse Sabor?</h3>
            
            <div class="conteiner1">   
                <div class="c1">
                    <?php
                        require 'config/config.php';
                        $idSabor = $_GET['Produto'];

                        try{
                            $cmd = $conn->prepare("CALL SP_VariacaoReadById(?)");
                            $cmd->bindParam(1, $idSabor);
                            $cmd->execute();
                        } catch (PDOException $e) {
                            echo "Erro no banco de dados: " . $e->getMessage();
                        } catch (Exception $e) {
                            echo "Erro genérico: " . $e->getMessage();
                        }
            
                        while($row = $cmd->fetch()){
                            echo'
                            <form action="config/deleteSab.php" method="POST" id="formulario" class="formulario">
                                <input type="hidden" name="idSabExcl" value="'.$row['idVariacao'].'">
                                <button name="btnEcluirSab" type="submit">Excluir</button>
                            </form>';  

                            echo '
                                <div class="c2">
                                    <div class="c3">
                                        <picture>
                                        <img src="images/'.$row["fotoVariacao"].'.png" alt="'.$row["nomeVariacao"].'">
                                        </picture>
                                    </div>
                                    <div class="d-flex flex-column">
                                        <div id="dados">
                                            <h3 class="titulo px-3">'.$row["nomeVariacao"].'</h3>
                                            <div class="px-3">
                                                <p>Preço:'.$row["precoVariacao"].'</p>
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
    
    <script src="script/header.js"></script>
</body>
</html>