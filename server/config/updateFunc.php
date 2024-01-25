<?php 
require_once 'config.php';

    try{

        $value = "Func";
        $cmd = $conn->prepare("CALL SP_FuncionarioUpdate(?, ?, ?, ?, ?)");
        $cmd->bindParam(1, $_POST['emailFunAtual']);
        $cmd->bindParam(2, $_POST['emailFunEdt']);
        $cmd->bindParam(3, $_POST['nomeFunEdt']);
        $cmd->bindParam(4, $_POST['telefoneFunEdt']);
        $cmd->bindParam(5, $value);
        
        $cmd->execute();

    } catch (PDOException $e) {
        echo "Erro no banco de dados: " . $e->getMessage();
        echo "nn";
    } catch (PDOException $e) {
        echo "Erro genérico: " . $e->getMessage();
        echo "nn";
    }

echo '<script>';
echo 'window.location.href = "../editarFuncionarios.php";';
echo '</script>';
exit;

?>