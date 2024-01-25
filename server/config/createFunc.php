<?php 
require_once 'config.php';

try{
    $value = "FUNC";
    $cmd = $conn->prepare("CALL SP_FuncionarioCreate(?, ?, ?, ?, ?)");
    $cmd->bindParam(1, $_POST['emailFunAdd']);
    $cmd->bindParam(2, $_POST['senhaFunAdd']);
    $cmd->bindParam(3, $_POST['nomeFunAdd']);
    $cmd->bindParam(4, $_POST['telefoneFunAdd']);
    $cmd->bindParam(5, $value);
    
    $cmd->execute();
} catch (PDOException $e) {
    echo "Erro no banco de dados: " . $e->getMessage();
} catch (PDOException $e) {
    echo "Erro genérico: " . $e->getMessage();
}

echo '<script>';
echo 'window.location.href = "../editarFuncionarios.php";';
echo '</script>';
exit;

?>