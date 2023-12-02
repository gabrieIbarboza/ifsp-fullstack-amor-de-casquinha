<?php
  require 'config/config.php';
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
    <!-- <link rel="stylesheet" href="style/editarFuncionariosS.css"> -->
</head>
<body>
    
    <?php
        include_once 'components/nav.php';
    ?>

    <main>
            <h1>Editar Funcionários</h1>
    
        <div class="conteiner">
            <class="conteiner1">
                
                <div class="c1">
                    <div class="c2">
                        <?php
                        $idFuncionario = $_GET['funcionario'];
                        $stmt = $conn->prepare('SELECT * from tbfuncionario where idFuncionario = :id');
                        $stmt->bindParam(':id', $idFuncionario);
                        $stmt->execute();

                        while($row = $stmt->fetch()){
                            echo'
                            <form action="config/updateFunc.php" method="POST" id="formulario" class="formulario">
                                <input type="hidden" name="emailFunAtual" value="'.$row['emailFuncionario'].'">
                                <label for="nome2">Nome:</label>
                                <input type="text" id="nome2" name="nomeFunEdt" placeholder="Nome" value="'.$row['nomeFuncionario'].'">
                                <label for="email2">Email:</label>
                                <input type="text" id="email2" name="emailFunEdt" placeholder="Email" value="'.$row['emailFuncionario'].'">
                                <label for="telefone2">Telefone:</label>
                                <input type="text" id="telefone2" name="telefoneFunEdt" placeholder="(11) 955555555" value="'.$row['telefoneFuncionario'].'">
                                <button type="submit">Salvar</button>
                            </form>';  
                        }
                            
                        ?>
                        </div>
                    </div>
                </div>
            <button class="voltar"><a href="editarFuncionarios.php">Voltar</a></button>
        </div>
    </main>
    
    <?php
        include_once 'components/footer.php';
    ?>
    
    <!-- <script src="script/header.js"></script> -->
</body>
</html>