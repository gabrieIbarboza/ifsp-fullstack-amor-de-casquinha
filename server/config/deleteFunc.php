<?php 
require_once 'config.php';

    try{

        $value = 1;
        $cmd = $conn->prepare("CALL SP_FuncionarioDeleteByEmail(?)");
        $cmd->bindParam(1, $_POST['emailFunExcl']);
        
        $cmd->execute();

    } catch (PDOException $e) {
        echo "Erro no banco de dados: " . $e->getMessage();
        echo "nn";
    } catch (PDOException $e) {
        echo "Erro genérico: " . $e->getMessage();
        echo "nn";
    }


header("Location: ../editarFuncionarios.php");
exit();

?>