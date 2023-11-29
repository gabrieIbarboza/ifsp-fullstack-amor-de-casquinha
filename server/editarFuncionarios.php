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
    <link rel="stylesheet" href="style/editarFuncionariosS.css">
</head>
<body>
    
    <?php
        include_once 'components/nav.php';
    ?>

    <main>
            <h1>Funcionários</h1>
    
        <div class="conteiner">
            <button class="add">Adicionar Funcionário</button>
            <form action="config/createFunc.php" method="POST" id="addFormulario">
                <label for="nome1">Nome:</label>
                <input type="text" id="nome1" name="nomeFunAdd" placeholder="Nome">
                <label for="email2">Email:</label>
                <input type="text" id="email1" name="emailFunAdd" placeholder="Email">
                <label for="telefone1">Telefone:</label>
                <input type="text" id="telefone1" name="telefoneFunAdd" placeholder="(11) 955555555">
                <label for="senha1">Senha:</label>
                <input type="text" id="senha1" name="senhaFunAdd" placeholder="Senha">
                <button type="submit">Salvar</button>
            </form>
            <div class="conteiner1">
                
                <div class="c1">
                    <div class="c2">
                        <div class="c3">
                            <img src="images/funcionario1.png" alt="Funcionário 1">
                        </div>
                        <div class="d-flex flex-column">
                            <div id="dados">
                                <h3 class="titulo px-3">Funcionário 1</h3>
                                <div class="px-3">
                                    <p>Email:</p>
                                    <p>Celular:</p>
                                </div>
                            </div>
                            <form action="config/updateFunc.php" method="POST" id="formulario" class="formulario">
                                <label for="nome2">Nome:</label>
                                <input type="text" id="nome2" name="nomeFunEdt" placeholder="Nome">
                                <label for="email2">Email:</label>
                                <input type="text" id="email2" name="emailFunEdt" placeholder="Email">
                                <label for="telefone2">Telefone:</label>
                                <input type="text" id="telefone2" name="telefoneFunEdt" placeholder="(11) 955555555">
                                <label for="senha2">Senha:</label>
                                <input type="text" id="senha2" name="senhaFunEdt" placeholder="Senha">
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
    
    <script src="script/header.js"></script>
    <script src="script/adicionar.js"></script>
    <script src="script/editar.js"></script>
    
</body>
</html>