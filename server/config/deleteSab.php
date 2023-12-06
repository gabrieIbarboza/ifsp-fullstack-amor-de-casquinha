<?php 
require_once 'config.php';
    if(isset($_POST['btnEcluirSab'])){
        
        try{
            $idSabor = isset($_POST['idSabExcl']) ? $_POST['idSabExcl'] : '';
            $cmd = $conn->prepare("UPDATE tbvariacaoproduto SET isActive = 0 WHERE idVariacao = :idSabor");
            $cmd->bindParam(":idSabor", $idSabor);
            $cmd->execute();
    
        } catch (PDOException $e) {
            echo "Erro no banco de dados: " . $e->getMessage();
            echo "nn";
        } catch (PDOException $e) {
            echo "Erro genérico: " . $e->getMessage();
            echo "nn";
        }
        header("Location: ../saboresFun.php");
    exit();
    }
    

?>