<?php
require 'config.php';

$recordsLimit = 100;
$recordsOffset = 0;
$stmt = $conn->prepare("CALL SP_ProdutoReadAllActive(?, ?)");
$stmt->bindParam(1, $recordsLimit);
$stmt->bindParam(2, $recordsOffset);
$stmt->execute();

do {
    while ($row = $stmt->fetch()) 
    {
        $redirectToVariacao = 'editarSabores.php?produto='.$row['idProduto'];
        $redirectToEditar = 'editProd.php?produto='.$row['idProduto'];
        $redirectToExcluir = 'excluirProd.php?produto='.$row['idProduto'];
        // $redirectTo = 'saboresFunc.php?produto='.$row['idProduto'];
        echo '
        <div class="c1">
            <div class="card categ d-flex align-items-center">
                <picture>
                    <img src="images/'.$row["fotoProduto"].'" alt="'.$row["nomeProduto"].'">
                </picture>
                <div class="botao text-center d-flex justify-content-evenly mt-3">
                    <button id="vari"><a href="'.$redirectToVariacao.'">Ver Sabores</a></button>        
                    <button id="edit"><a href="'.$redirectToEditar.'">Editar</a></button>        
                    <button id="excl"><a href="'.$redirectToExcluir.'">Excluir</a></button>        
                </div>
            </div>
        </div>';
    }
} while ($stmt->nextRowset());

?>