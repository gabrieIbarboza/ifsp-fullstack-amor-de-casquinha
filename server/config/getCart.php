<?php

require 'config.php';
session_start();

if(isset($_GET["add"]))
{
    $variacaoId = $_GET["add"];

    $stmt = $conn->prepare("CALL SP_VariacaoReadById(?)");
    $stmt->bindParam(1, $variacaoId);
    $stmt->execute();

    do {
        while ($row = $stmt->fetch()) 
        {
            $id = $row["idVariacao"];
            $nome = $row["nomeVariacao"];
            $preco = $row["precoVariacao"];
            $foto = $row["fotoVariacao"];

            if(!isset($_SESSION["cartArray"]))
            {
                $_SESSION["cartArray"] = array();
            }

            $_SESSION["cartArray"][$id] = array (
                "nome" => $nome,
                "preco" => $preco,
                "foto" => $foto,
                "qntd" => 1
            );
        }
    } while ($stmt->nextRowset());
}

if(isset($_SESSION["cartArray"]))
{
    //foreach($array as $key => $key_value)
    foreach ($_SESSION["cartArray"] as $variacaoId => $cartItem) {

        $id = $variacaoId;
        $nome = $cartItem["nome"];
        $preco = $cartItem["preco"];
        $foto = $cartItem["foto"];

        echo '<div class="c1">
        <div class="row">
            <div class="col col-4 c2">
                <img src="'.$foto.'" alt="'.$nome.'" class="imagem">
            </div>
            <div class="col c3">
                <h3 class="">'.$nome.'</h3>
                <div class="preco d-flex flex-row justify-content-between px-2">
                    <p>Preço</p>
                    <span>R$ '.$preco.'</span>
                </div>
            </div>
        </div>
        <div class="botao text-center d-flex justify-content-evenly mt-3 flex-row row">
                <div class="col col-3 d-flex align-items-start excl">
                    <button id="'.$id.'" class="b-excluir">Excluir</button>
                </div>
                <div class="col d-flex align-items-start col-7">
                    <p>Quantid.</p>
                    <select name="selecao">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                    </select>
                </div>
        </div>
        </div>';
    }
    echo '<button class="conc">Concluir</button>';
}
else
{
    echo 'Carrinho está vazio!';
}

?>