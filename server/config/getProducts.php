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
        $redirectTo = 'sabores.php?produto='.$row['idProduto'];
        echo '<div class="card categ d-flex align-items-center">
            <picture>
                <img src="images/'.$row["fotoProduto"].'" alt="'.$row["nomeProduto"].'" class="imagem">
            </picture>
            <div class="d-flex align-items-center flex-column c2">
                <h4>'.$row["nomeProduto"].'</h4>
                <button><a href="'.$redirectTo.'">ver</a></button>
            </div>
        </div>';
    }
} while ($stmt->nextRowset());

?>