<?php 
require_once 'config.php';

    try{

        $value = 1;
        $cmd = $conn->prepare("CALL SP_ProdutoUpdate(?, ?, ?, ?, ?)");
        $cmd->bindParam(1, $_POST['nomeProdAtual']);
        $cmd->bindParam(2, $_POST['nomeProdEdt']);
        $cmd->bindParam(3, $_POST['tipoProdEdt']);
        $cmd->bindParam(4, $_POST['imagemProdEdt']);
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
echo 'window.location.href = "../editarProdutos.php";';
echo '</script>';
exit;

?>