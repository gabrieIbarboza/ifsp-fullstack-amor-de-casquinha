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
    <link rel="stylesheet" href="style/editarSaboresS.css">
</head>
<body>
    
    <?php
        include_once 'components/header.php';
    ?>

    <main>
            <h1>Picolé Sabores</h1>
        
        <div class=" d-flex flex-column align-items-center justify-content-center">
          <?php  $var = isset($_SESSION['var']) ? $_SESSION['var'] : ""; 
            echo $var;
            session_destroy();
            if(session_status() === PHP_SESSION_NONE){
                session_start();
            }
          ?>
            <button class="add">Adicionar Sabor</button>
            <div>
                    <form action="config/createSabor.php" method="POST" id="addFormulario">
                        <label for="nome">Nome:</label>
                        <input type="text" id="nome" name="nomeSabAdd" placeholder="Nome do produto">
                        <label for="preco">Preço:</label>
                        <input type="text" id="preco" name="precoSabAdd" placeholder="Preço do produto">
                        <label for="nomeImagem">Nome do arquivo de imagem:</label>
                        <input type="text" id="nomeImagem" name="nomeImagemSabAdd" placeholder="imagem.png">
                        <label for="tipoP">Tipo de Produto:</label>
                        <select id="tipoP" name="ProdutoSabAdd" style="border-radius: 10px;
    border: 2px solid rgb(167, 167, 167); padding-left: 4px; height: 30px;">
                            <option value="Produto Teste">Produto Teste</option>
                            <option value="Açaí Teste">Açaí Teste</option>
                        </select>
                        <button name="bntCreatSab" type="submit">Salvar</button>
                    </form>
                </div>
            <div class="conteiner1">
                <div class="c1">
                    <?php
                        include_once 'config/getVariacoesFun.php';
                    ?>
                </div>
            </div>
            <button class="voltar"><a href="index.php">Voltar</a></button>
        </div>
    </main>
    
    <?php
        include_once 'components/footer.php';
    ?>
    
    <script src="script/header.js"></script>
    <script src="script/adicionar.js"></script>
    <!-- <script src="script/editar.js"></script> -->
    
</body>
</html>