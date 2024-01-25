<?php 
require_once 'config.php';

try{

    $value = 1;
    $cmd = $conn->prepare("CALL SP_ProdutoDeleteByName(?)");
    $cmd->bindParam(1, $_POST['nomeProdExcl']);
    
    $cmd->execute();

} catch (PDOException $e) {
    echo "Erro no banco de dados: " . $e->getMessage();
    echo "nn";
} catch (PDOException $e) {
    echo "Erro genérico: " . $e->getMessage();
    echo "nn";
}

echo '<script>';
echo 'window.location.href = "../editarProdutos.php";';
echo '</script>';
exit;

?>