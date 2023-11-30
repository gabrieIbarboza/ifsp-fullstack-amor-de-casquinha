<?php
require 'config.php';

$recordsLimit = 100;
$recordsOffset = 0;
$stmt = $conn->prepare("CALL SP_FuncionarioReadAllActive(?, ?)");
$stmt->bindParam(1, $recordsLimit);
$stmt->bindParam(2, $recordsOffset);
$stmt->execute();

do {
    while ($row = $stmt->fetch()) 
    {
        echo '<div class="c1">
        <div class="c2">
            <div class="c3">
                <picture>
                <source media="(min-width: 768px)" srcset="'.$row["profile"].'">
                <img src="'.$row["profile"].'" alt="'.$row["nomeFuncionario"].'">
                </picture>
            </div>
            <div class="d-flex flex-column">
                <div id="dados">
                    <h3 class="titulo px-3">'.$row["nomeFuncionario"].'</h3>
                    <div class="px-3">
                        <p>Email:'.$row["emailFuncionario"].'</p>
                        <p>Celular:'.$row["telefoneFuncionario"].'</p>
                    </div>
                </div>
            </div>        
        </div>
        <div class="botao text-center d-flex justify-content-evenly mt-3">
            <button id="excl">Excluir</button>
            <button id="edit">Editar</button>
        </div>
        </div>';
    }
} while ($stmt->nextRowset());

?>