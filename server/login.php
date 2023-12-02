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
    <link rel="stylesheet" href="style/loginS.css">
</head>
<body>
    
    <?php
        include_once 'components/nav.php';
    ?>

        <div class="titulo d-flex align-items-center justify-content-center flex-column">
            <h3>Login</h3><img src="images/Rectangle 1.png">
        </div>
    <main>
        <div class="d-flex justify-content-center align-items-center">
            <form action="" method="post" class="d-flex flex-column my-4 formu">
                <input type="text" name="usuario" placeholder="Usuário">
                <input type="text" name="senha" placeholder="Senha">
                <input type="submit" value="Login">
            </form>
        </div>
    </main>
    
    <?php
        include_once 'components/footer.php';
    ?>
    
    <script src="script/header.js"></script>
    
</body>
</html>