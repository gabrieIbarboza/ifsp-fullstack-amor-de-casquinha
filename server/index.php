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
    <link rel="stylesheet" href="style/indexS.css">
</head>
<body>
    
    <?php
        include_once 'components/nav.php';
    ?>

        <h1 class="m-auto text-center pt-4 pb-4">Bem vindo ao Amor de Casquinha</h1>
    <main>
        <section>
            <div class="conteiner1 d-flex flex-column justify-content-center align-items-center">
                <h3>Explore nosssas opções de sorvete</h3>
                <div class="c1">
                    <div class="card categ d-flex align-items-center">
                        <picture>
                            <source media="(min-width: 768px)" srcset="images/sorveteBolaDesktop.png">
                            <img src="images/sorvetebola.png" alt="Sorvete em bola">
                        </picture>
                        <div class="d-flex align-items-center flex-column c2">
                            <h4>Sorvete em Bola</h4>
                            <button><a href="sabores.php">ver</a></button>
                            <!-- <?php /*
                            
                            if(CONDIÇÃO PARA FUNCIONÁRIO){
                                echo "<button><a href='editarSabores.php'>ver</a></button>";
                            } elseif(CONDIÇÃO PARA CLIENTES){
                                echo "<button><a href='sabores.php'>ver</a></button>";
                            }*/
                            
                            ?> -->
                        </div>
                    </div>
                    <div class="card categ d-flex align-items-center">
                        <picture>
                            <source media="(min-width: 768px)" srcset="images/sorvetePoteDesktop.png">
                                <img src="images/sorvetePote.png" alt="Sorvete de Pote">
                        </picture>
                        <div class="d-flex align-items-center flex-column c2">
                            <h4>Sorvete de Pote</h4>
                            <button><a href="sabores.php">ver</a></button>
                            <!-- <?php /*
                            
                            if(CONDIÇÃO PARA FUNCIONÁRIO){
                                echo "<button><a href='editarSabores.php'>ver</a></button>";
                            } elseif(CONDIÇÃO PARA CLIENTES){
                                echo "<button><a href='sabores.php'>ver</a></button>";
                            }*/
                            
                            ?> -->
                        </div>
                    </div>
                    <div class="card categ d-flex align-items-center">
                        <picture>
                            <source media="(min-width: 768px)" srcset="images/picoleDesktop.png">
                                <img src="images/picole.png" alt="Picolé">
                        </picture>
                        <div class="d-flex align-items-center flex-column c2">
                            <h4>Picolé</h4>
                            <button><a href="sabores.php">ver</a></button>
                            <!-- <?php /*
                            
                            if(CONDIÇÃO PARA FUNCIONÁRIO){
                                echo "<button><a href='editarSabores.php'>ver</a></button>";
                            } elseif(CONDIÇÃO PARA CLIENTES){
                                echo "<button><a href='sabores.php'>ver</a></button>";
                            }*/
                            
                            ?> -->
                        </div>
                    </div>
                    <div class="card categ d-flex align-items-center align-content-between">
                        <picture>
                            <source media="(min-width: 768px)" srcset="images/sundaeDesktop.png">
                                <img src="images/sundae.png" alt="Sundae">
                        </picture>
                        <div class="d-flex align-items-center flex-column c2">
                            <h4>Sundae</h4>
                            <button><a href="sabores.php">ver</a></button>
                            <!-- <?php /*
                            
                            if(CONDIÇÃO PARA FUNCIONÁRIO){
                                echo "<button><a href='editarSabores.php'>ver</a></button>";
                            } elseif(CONDIÇÃO PARA CLIENTES){
                                echo "<button><a href='sabores.php'>ver</a></button>";
                            }*/
                            
                            ?> -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    
    <?php
        include_once 'components/footer.php';
    ?>

    <script src="script/header.js"></script>
    
</body>
</html>