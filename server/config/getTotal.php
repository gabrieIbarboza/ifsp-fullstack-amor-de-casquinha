<?php

session_start();

if(isset($_SESSION["cartArray"]))
{
    $total = 0;

    //foreach($array as $key => $key_value)
    foreach ($_SESSION["cartArray"] as $variacaoId => $cartItem) {

        $id = $variacaoId;
        $nome = $cartItem["nome"];
        $preco = $cartItem["preco"];
        $foto = $cartItem["foto"];
        $qntd = $cartItem["qntd"];
        $total += $qntd * $preco;

        echo '
        <div class="c1">
            <div class="d-flex flex-row">
                <div class="c2">
                    <img src="'.$foto.'" alt="'.$nome.'" class="imagem">
                </div>
                <div class="d-flex flex-column c3 ps-2">
                    <h3>'.$nome.'</h3>
                    <div class="preco d-flex flex-row justify-content-between">
                        <p>Preço</p>
                        <span>R$ '.$preco.'</span>
                    </div>
                </div>
            </div>
            <div class="botao text-center d-flex justify-content-between mt-3 flex-row">
                <div class="excl">
                    <button id="'.$id.'" class="b-excluir">Excluir</button>
                </div>
                <div>
                    <p>Quantidade: '.$qntd.'</p>
                </div>
            </div>
        </div>
        ';
    }

    echo '
    <div class="c4">
        <h4>Total</h4>
        <p>R$ '.$total.'</p>
    </div>
    ';
}
else
{
    header('location: index.php');
}
?>