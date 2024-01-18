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
    <title>Excluir Funcionário</title>
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
    <h1 class="m-auto text-center pt-4 pb-4">Excluir Funcionário</h1>
        <div class="conteiner">
            <h3>Tem certeza que deseja excluir esse funcionário?</h3>
            
            <div class="conteiner1">   
                <div class="c1">
                    <?php
                        require 'config/config.php';
                        $idFuncionario = $_GET['funcionario'];
                        $stmt = $conn->prepare('SELECT * from tbfuncionario where idFuncionario = :id');
                        $stmt->bindParam(':id', $idFuncionario);
                        $stmt->execute();

                        while($row = $stmt->fetch()){
                            echo'
                            <form action="config/deleteFunc.php" method="POST" id="formulario" class="formulario">
                                <input type="hidden" name="emailFunExcl" value="'.$row['emailFuncionario'].'">
                                <button type="submit">Excluir</button>
                            </form>';  

                            echo '
                                <div class="c2">
                                    <div class="c3">
                                        <picture>
                                        <source media="(min-width: 768px)" srcset="images/'.$row["profile"].'.png">
                                        <img src="images/'.$row["profile"].'.png" alt="'.$row["profile"].'">
                                        </picture>
                                    </div>
                                    <div class="d-flex flex-column">
                                        <div id="dados">
                                            <h3 class="titulo px-3">'.$row["nomeFuncionario"].'</h3>
                                            <div class="px-3">
                                                <p>Email:'.$row["emailFuncionario"].'</p>
                                                <p>Celular:'.$row["telefoneFuncionario"].'</p>
                                            </div>
                                        </div>
                                    </div>        
                                </div>
                            ';
                        }
                        
                    ?>
                </div>
            </div>
            <button class="voltar"><a href="editarFuncionarios.php">Voltar</a></button>
        </div>
    </main>
    <?php
        include_once 'components/footer.php';
    ?>
</body>
</html>