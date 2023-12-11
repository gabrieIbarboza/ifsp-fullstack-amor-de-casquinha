<?php 
require_once 'config.php';

try{
    $cmd = $conn->prepare("CALL SP_ProdutoCreate(?, ?, ?)");
    $cmd->bindParam(1, $_POST['nomeProAdd']);
    $cmd->bindParam(2, $_POST['tipoProAdd']);
    $cmd->bindParam(3, $_POST['imagemProAdd']);
    
    
    $cmd->execute();
} catch (PDOException $e) {
    echo "Erro no banco de dados: " . $e->getMessage();
} catch (PDOException $e) {
    echo "Erro genérico: " . $e->getMessage();
}

echo '<script>';
echo 'window.location.href = "../editarProdutos.php";';
echo '</script>';
exit;

?>