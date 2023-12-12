<?php

$isLoggedIn = isset($_SESSION["userEmail"]);
if($isLoggedIn)
{
    $cep = $_SESSION["userCep"];
    $rua = $_SESSION["userRua"];
    $num = $_SESSION["userNum"];
    $compl = $_SESSION["userCompl"];
    $bairro = $_SESSION["userBairro"];
}

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
                    <img src="images/'.$foto.'" alt="'.$nome.'" class="imagem">
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

    //Needs styling @jessi
    if($isLoggedIn)
    {
        echo '
        <form action="sobre.php" method="post">
            <input name="ckbIsDelivery" id="ckbIsDelivery" type="checkbox" checked=true>
            <label for="ckbIsDelivery" id="labelForCkbIsDelivery">O pedido será entregue no seu endereço!</label>
            <div id="addressDiv">
                '.$cep.' - '.$rua.', '.$num.', '.$compl.' - '.$bairro.'
            </div>
            <input type="hidden" name="notaFiscal" value="1">
            <input name="btnSubmit" id="btnSubmit" type="submit" value="Concluir Pedido" class="btn">
        </form>
        ';
    }
    else
    {
        echo '
        <button id="btnGoToLogin" class="btn">Fazer Login para Concluir Pedido</button>
        ';
    }
}
else
{
    header('location: index.php');
}
?>