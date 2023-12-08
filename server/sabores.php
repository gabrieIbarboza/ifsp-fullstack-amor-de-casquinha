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
    <link rel="stylesheet" href="style/saboresS.css">
</head>
<body>
    
    <?php
        include_once 'components/nav.php';
    ?>


        <h1>Picolé Sabores</h1>
    <main>
        <div class="conteiner d-flex flex-column align-items-center justify-content-center">
            <div class="conteiner1">
                <div class="c1">
                    <div class="row">
                        <div class="col col-4"><img src="images/picoleCoco.png" alt="Picolé sabor coco" class="imagem"></div>
                        <div class="col">
                            <h3 class="titulo px-2">Nestlé La Frutta Coco</h3>
                            <div class="preco d-flex flex-row justify-content-between px-2">
                                <p>Preço</p>
                                <span>R$ 1,50</span>
                            </div>
                        </div>
                    </div>
                    <div class="botao text-center d-flex justify-content-evenly mt-3">
                        <button class="add">Adicionar ao Carrinho</button>
                    </div>
                </div>      
            </div>
            <button class="voltar"><a href="index.html">Voltar</a></button>
        </div>
    </main>
    
    <?php
        include_once 'components/footer.php';
    ?>

    <script src="script/header.js"></script>
    
</body>
</html>