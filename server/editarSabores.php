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
    <link rel="stylesheet" href="style/editarSabores.css">
</head>
<body>
    <?php
        include_once 'components/header.php';
    ?>
    <main>
        <h1>Picolé Sabores</h1>
        <div class=" d-flex flex-column align-items-center justify-content-center">
            <button class="add">Adicionar Sabor</button>
            <div>
                    <form action="" method="POST" id="addFormulario">
                        <label for="nome1">Nome:</label>
                        <input type="text" id="nome1" name="nomeSabAdd" placeholder="Nome do produto">
                        <label for="preco1">Preço:</label>
                        <input type="text" id="preco1" name="precoSabAdd" placeholder="Preço do produto">
                        <label for="nomeImagem">Nome do arquivo de imagem:</label>
                        <input type="text" id="nomeImagem" name="nomeImagemSabAdd" placeholder="imagem.png">
                        <button type="submit">Salvar</button>
                    </form>
                </div>
            <div class="conteiner1">
                <div class="c1">

                    <div class="d-flex flex-row">
                        <div class="col col-4">
                            <img src="images/picoleCoco.png" alt="Picolé sabor coco" class="imagem">
                        </div>
                        <div id="dados">
                            <h3 class="titulo px-2">Nestlé La Frutta Coco</h3>
                            <div class="preco d-flex flex-row justify-content-between px-2">
                                <p>Preço</p>
                                <span>R$ 1,50</span>
                            </div>
                        </div>
                        <div>
                            <form action="" method="POST" id="formulario" class="formulario">
                                <label for="nome2">Nome:</label>
                                <input type="text" id="nome2" name="nomeSabEdt" placeholder="Nome do produto">
                                <label for="preco2">Preço:</label>
                                <input type="text" id="preco2" name="precoSabEdt" placeholder="Preço do produto">
                                <button type="submit">Salvar</button>
                            </form>
                        </div>
                    </div>

                    <div class="botao text-center d-flex justify-content-evenly mt-3">
                        <button id="excl">Excluir</button>
                        <button id="edit">Editar</button>
                    </div>

                </div>
            </div>
            <button class="voltar"><a href="index.html">Voltar</a></button>
        </div>
    </main>
    <?php
        include_once 'components/footer.php';
    ?>
    <script src="script/adicionar.js"></script>
    <script src="script/editar.js"></script>
</body>
</html>
