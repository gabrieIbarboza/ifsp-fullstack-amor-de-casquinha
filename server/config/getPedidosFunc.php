<?php
if(isset($_SESSION["userProfile"]) && ($_SESSION["userProfile"] == "FUNC" || $_SESSION["userProfile"] == "FADM"))
{
    include 'config/config.php';

    $stmt = $conn->prepare("CALL SP_PedidoReadAllNotCompleted()");
    $stmt->execute();

    if($stmt->rowCount() > 0)
    {
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        
        $lastPedidoId = 0;

        foreach($result as $row)
        {
            if($row["idPedido"] != $lastPedidoId)
            {
                $lastPedidoId = $row["idPedido"];
    
                echo '<div class="c1">
                <div class="c2">
                    <div class="c3">
                        <picture>
                            <img src="images/FUNC.png" alt="Pedido '.$row["idPedido"].'">
                        </picture>
                    </div>
                    <div>
                        <div id="dados">
                            <h3 class="titulo px-3">Número do Pedido: '.$row["idPedido"].'</h3>
                            <div class="px-3">
                                <p>Realizado em: '.$row['dataPedido'].'</p>
                                <p>Total: R$'.$row['totalPedido'].'</p>
                                <p>'.(($row['isDelivery']==1)?'É para entrega!':'É para buscar na sorveteria!').'</p>
                                <p>Status: '.$row['statusPedido'].'</p>
                            </div>
                        </div>
                    </div>
                </div>        
                </div>';
                /*<div class="botao text-center d-flex justify-content-evenly mt-3">
                    <button id="excl"><a href="'.$redirectToEditar.'">Editar</a></button>        
                    <button id="edit"><a href="'.$redirectToExcluir.'">Excluir</a></button>        
                </div>
                </div>';*/
            }
        }
    }
    else
    {
        echo '<div class="c1">Não há pedidos aguardando atendimento!</div>';
    }

    $conn = null;
}
else
{
    echo '<div class="c1">Você não tem acesso aos pedidos, pois não é um funcionário!</div>';
}
?>