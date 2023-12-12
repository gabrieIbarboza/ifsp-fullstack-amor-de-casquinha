<?php

if(isset($_GET["produto"]))
{
    require 'config.php';

    $produto = $_GET["produto"];
    $stmt = $conn->prepare("CALL SP_VariacaoReadByProdutoId(?)");
    $stmt->bindParam(1, $produto);
    $stmt->execute();

    do {
        while ($row = $stmt->fetch()) 
        {
            if($row['isActive'])
            {
                $redirectTo = 'carrinho.php?add='.$row['idVariacao'];
                echo '
                <div class="c1">
                <div class="c2">
                    <div><img src="images/'.$row["fotoVariacao"].'" alt="'.$row["nomeVariacao"].'" class="imagem"></div>
                    <div class="c3">
                        <h3 class="titulo px-2">'.$row["nomeVariacao"].'</h3>
                        <div class="preco d-flex flex-row justify-content-between px-2">
                            <p>Preço</p>
                            <span>R$ '.$row["precoVariacao"].'</span>
                        </div>
                    </div>
                </div>
                <div class="botao text-center d-flex justify-content-evenly mt-3">
                <button class="add"><a href="'.$redirectTo.'">Adicionar ao Carrinho</a></button>
                    </div>
                </div>';
            }
        }
    } while ($stmt->nextRowset());
}
else
{
    echo 'No products to display!';
}
?>