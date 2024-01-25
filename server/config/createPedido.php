<?php
if(isset($_POST["notaFiscal"]) && isset($_SESSION["cartArray"]))
{
    include 'config/config.php';

    //Criar pedido
    $isDelivery = 0;
    if(isset($_POST["ckbIsDelivery"]) && $_POST["ckbIsDelivery"] == 'on')
    {
        $isDelivery = 1;
    }
    $email = $_SESSION["userEmail"];
    $id_endereco = $_SESSION["userEnderecoId"];

    $stmt = $conn->prepare("CALL SP_PedidoCreate(NOW(), ?, ?, ?)");
    $stmt->bindParam(1, $isDelivery);
    $stmt->bindParam(2, $email);
    $stmt->bindParam(3, $id_endereco);
    $stmt->execute();

    $stmt->setFetchMode(PDO::FETCH_ASSOC);

    while($row = $stmt->fetch())
    {
        if($row["Status"] == 201) // HTTP Code para Created
        {
            //Pega Id do pedido criado
            $pedidoId = $row["Body"];
            
            //Para cada variacao no carrinho, criar um item no pedido
            foreach ($_SESSION["cartArray"] as $variacaoId => $cartItem) {

                $variacaoQntd = $cartItem["qntd"];
                
                $stmt = $conn->prepare("CALL SP_ProdutoPedidoCreate(?, ?, ?)");
                $stmt->bindParam(1, $pedidoId);
                $stmt->bindParam(2, $variacaoId);
                $stmt->bindParam(3, $variacaoQntd);
                $stmt->execute();
            }

            unset($_SESSION["cartArray"]); // Limpa carrinha, pois já cadastrou pedido e itens no banco de dados
        }
        break;
    }

    $conn = null;
}
?>