<?php 
require_once 'config.php';
session_start();

if(isset($_POST['bntCreatSab'])){
    // Verifica se todos os campos estão preenchidos
    if(!empty($_POST['nomeSabAdd']) && !empty($_POST['precoSabAdd']) && !empty($_POST['nomeImagemSabAdd']) && !empty($_POST['ProdutoSabAdd'])){
        $nome = $_POST['nomeSabAdd'];
        $preco = $_POST['precoSabAdd'];
        $img = $_POST['nomeImagemSabAdd'];
        $idP = $_POST['ProdutoSabAdd'];

        try{
            $cmd = $conn->prepare("CALL SP_VariacaoCreate(?, ?, ?, ?)");
            $cmd->bindParam(1, $nome);
            $cmd->bindParam(2, $preco);
            $cmd->bindParam(3, $img);
            $cmd->bindParam(4, $idP);
            $cmd->execute();
        } catch (PDOException $e) {
            echo "Erro no banco de dados: " . $e->getMessage();
        } catch (Exception $e) {
            echo "Erro genérico: " . $e->getMessage();
        }

        header("Location: ../saboresFun.php");
        exit();

    } else{
        $_SESSION['var'] = "<h1 class='aviso'>Preencha todos os campos!!!</h1>";
        header('Location: ../saboresFun.php');
        exit();
    }
}



?>