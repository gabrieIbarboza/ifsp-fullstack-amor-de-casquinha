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
    <title>Editar Funcionários</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="style/CabecalhoRodape.css">
    <link rel="stylesheet" href="style/editarFuncionariosS.css">
    <link rel="shortcut icon" href="images/iceCreamIcon.ico" type="image/x-icon">

</head>
<body>
    <?php
        include_once 'components/header.php';
    ?>
    <main>
        <h1 class="m-auto text-center pt-4 pb-4">Funcionários</h1>
        <div class="conteiner">
            <button class="add">Adicionar Funcionário</button>
            <form action="config/createFunc.php" method="POST" id="addFormulario">
                <label for="nome1">Nome:</label>
                <input type="text" id="nome1" name="nomeFunAdd" placeholder="Nome">
                <label for="email2">Email:</label>
                <input type="email" id="email1" name="emailFunAdd" placeholder="Email">
                <label for="telefone1">Telefone:</label>
                <input type="text" id="telefone1" name="telefoneFunAdd" placeholder="(11) 955555555">
                <label for="senha1">Senha:</label>
                <input type="password" id="senha1" name="senhaFunAdd" placeholder="Senha">
                <button type="submit">Salvar</button>
            </form>
            <div class="conteiner1">
                
                    <?php
                        include_once 'config/getFunc.php';
                    ?>

            </div>
            <button class="voltar"><a href="index.php">Voltar</a></button>
        </div>
    </main>
    
    <?php
        include_once 'components/footer.php';
    ?>
    <script src="script/adicionar.js"></script>
</body>
</html>