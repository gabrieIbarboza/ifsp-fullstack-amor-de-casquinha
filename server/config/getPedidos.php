<?php
if(isset($_SESSION["userEmail"]))
{
    include 'config/config.php';

    $email = $_SESSION["userEmail"];
    $recordsLimit = 1000;
    $recordsOffset = 0;
    $stmt = $conn->prepare("CALL SP_PedidoReadByCliente(?, ?, ?)");
    $stmt->bindParam(1, $email);
    $stmt->bindParam(2, $recordsLimit);
    $stmt->bindParam(3, $recordsOffset);
    $stmt->execute();
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

    foreach($result as $row)
    {
        echo '
        <p>Número do Pedido: '.$row['idPedido'].'</p>
        <p>Realizado em: '.$row['dataPedido'].'</p>
        <p>Total: R$'.$row['totalPedido'].'</p>
        <p>'.(($row['isDelivery']==1)?'É para entrega!':'É para buscar na sorveteria!').'</p>
        <p>Status: '.$row['statusPedido'].'</p>
        <hr/>
        ';
    }

    $conn = null;
}
else
{
    echo 'Não há pedidos para mostrar!';
}
?>