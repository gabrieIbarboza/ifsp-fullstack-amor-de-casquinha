<?php
    session_start();
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
    <link rel="stylesheet" href="style/editaSaborS.css">
</head>
<body>
    
    <?php
        include_once 'components/header.php';
        include_once 'config/config.php';

        /*Variável referente a página que edita os sabores, se algum campo não estiver preenchido, é retornado essa variável
         para esta página, que vai verificar se existe e se existir, vai mostrar uma mensagem a abaixo dizendo que nem todos
         os campos foram preenchidos*/
        $var = isset($_SESSION['var']) ? $_SESSION['var'] : "";
        $_SESSION['var'] = NULL;


        // Para mostrar os dados dentro dos inputs
        if(isset($_GET['Produto']) || $_SESSION['idSaborTeste']){ //variáveis contendo o mesmo conteúdo

            /* Para que não ocorra erros na hora de colocar colocar os dados antigos dentro dos inputs, são
            examinadas a existencia de duas variáveis, a primeira vem do arquivo "editSabor" que depois de verificar 
            que todos os dados não foram preenchidos é redirecionado para esse arquivo, e a segunda ($_GET['Produto']) vem do arquivo
            saboresFun sendo a variável da primeira tentativa de editar os dados
            */
            if(isset($_SESSION['idSaborTeste'])){
                $idVari = $_SESSION['idSaborTeste'];
            // serve para que as sessions não fiquem sendo reutilizadas repitidamente
            }else{
                $idVari = $_GET['Produto'];
            }


            try{
                $cmd = $conn->prepare("CALL SP_VariacaoReadById(?)");
                $cmd->bindParam(1, $idVari);
                $cmd->execute();
            } catch (PDOException $e) {
                echo "Erro no banco de dados: " . $e->getMessage();
            } catch (Exception $e) {
                echo "Erro genérico: " . $e->getMessage();
            }

            $resul = $cmd->fetch(PDO::FETCH_ASSOC);

            // Caso os campos dos inputs não estejam todos preenchidos, o valor da variável get é armazenada na session para ir para a próximo arquivo
            $_SESSION['idSaborTeste'] = $_GET['Produto'];
        }

        // Session será usada no arquivo "editSabor.php"
        $_SESSION['antNome'] = $resul['nomeVariacao'];
        
?>

    <main>
        <div class="conteiner2">
        <h2>Editar Sabor</h2>
            <form method="POST" action="config/editSabor.php">
                <label for="nome">Nome:</label>
                <input type="text" id="nome" name="nomeSabEdt" value="<?php echo $resul['nomeVariacao'] ?>">
                <label for="preco">Preço:</label>
                <input type="text" id="preco" name="precoSabEdt" value="<?php echo $resul['precoVariacao'] ?>">
                <label for="imagem">Imagem:</label>
                <input type="text" id="imagem" name="imagemSabEdt" value="<?php echo $resul['fotoVariacao'] ?>">
                <button type="submit" name="btnEditar">Salvar</button>
            </form>
            <?php 
               // Exibe mensagem de erro caso algum campo não tenha cido preenchido
                    echo $var;
            
            ?>
        </div>
    </main>



<?php
        include_once 'components/footer.php';
    ?>
    
    <script src="script/header.js"></script>
    <script src="script/adicionar.js"></script>
    
</body>
</html>