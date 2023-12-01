<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="style/CabecalhoRodape.css">
    <link rel="stylesheet" href="style/loginS.css">
    <link rel="stylesheet" href="style/forms.css">
</head>
<body class="d-flex flex-column min-vh-100">
    <?php
        include_once 'components/nav.php';
    ?>
    <header class="text-center registro">
    <div class="titulo d-flex align-items-center justify-content-center flex-column">
            <h3>Crie sua conta!</h3>
            <img src="images/Rectangle 1.png">
        </div>
    </header>
    <main class="flex-grow-1 d-flex justify-content-center align-items-center">
    <form action="" method="post" class="d-flex flex-column my-4 formu">
        <input type="text" name="nome" placeholder="Nome" required>
        <input type="text" name="email" placeholder="Email" required>
        <input type="text" name="telefone" placeholder="Telefone" required>
        <input type="text" name="cep" placeholder="CEP" required>
        <input type="text" name="rua" placeholder="Rua" required>
        <input type="text" name="bairro" placeholder="Bairro" required>
        <input type="number" name="numero" placeholder="Número do Endereço" required>
        <input type="password" name="senha" placeholder="Senha" required>
        <input type="submit" value="Registre-se" class="btn btn-primary mt-3">
    </form>
</main>

<footer>
        <div class="conteiner-fluid d-flex justify-content-center rodape align-items-center flex-column">
            <div class="d-flex flex-row justify-content-around align-items-center">
                <img src="images/image 1.png" alt="Logo Amor de Casquinha" class="pe-4 logo">
                <h3>Amor de Casquinha</h3>
            </div>
            <img src="images/Rectangle 1048.png" class="pt-3 linha">
            <div class="text-center">
                <p> &copy; 2023 Amor de Casquinha Todos os direitos reservados</p>
            </div>
        </div>
    </footer>
</body>
</html>
