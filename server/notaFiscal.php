<?php
require_once 'config/blockURLAccess.php';
session_start();
if(isset($_POST["cart"]) && isset($_SESSION["cartArray"]))
{
    //Pegando no POST a quantidade selecionada de cada item do carrinho e atualizando na SESSION
    foreach ($_SESSION["cartArray"] as $variacaoId => $cartItem) {
        
        $id = $variacaoId;
        $nome = $cartItem["nome"];
        $preco = $cartItem["preco"];
        $foto = $cartItem["foto"];
        $qntd = $cartItem["qntd"];

        if(isset($_POST["select".$id]))
        {
            $qntd = $_POST["select".$id]; //atualiza qntd com POST
        }

        // Atualiza dados na SESSION
        $_SESSION["cartArray"][$id] = array (
            "nome" => $nome,
            "preco" => $preco,
            "foto" => $foto,
            "qntd" => $qntd
        );
    }
}
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nota Fiscal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="style/CabecalhoRodape.css">
    <link rel="stylesheet" href="style/notaFiscalS.css">
    <link rel="shortcut icon" href="images/iceCreamIcon.ico" type="image/x-icon">
</head>
<body>
    <?php
        include_once 'components/header.php';
    ?>
    <main>
        <div class="conteiner1 container d-flex flex-column align-items-center">
            <h3>Confirmar Pedido?</h3>
            <?php
                include_once 'config/getTotal.php';
            ?>
        </div>
    </main>
    <?php
        include_once 'components/footer.php';
    ?>
    <script src="script/notaFiscal.js"></script>
</body>
</html>
