<?php

$id = $_GET["item"];

session_start();
unset($_SESSION["cartArray"][$id]);

if(!(sizeof($_SESSION["cartArray"]) > 0))
{
    unset($_SESSION["cartArray"]); // Unseta carrinho, pois está vazio
}


header("location: ../index.php");

?>