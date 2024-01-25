<?php

require_once 'config.php';

$cepEnd = $_POST["cep"];
$rua = $_POST["rua"];
$numero = $_POST["numero"];
$complemento = $_POST["complemento"];
$bairro = $_POST["bairro"];
$nome = $_POST["nome"];
$email = $_POST["email"];
$senha = password_hash($_POST["senha"], PASSWORD_DEFAULT);
$telefone = $_POST["telefone"];

$stmt = $conn->prepare("CALL SP_ClienteCreate(?, ?, ?, ?, ?, ?, ?, ?, ?)");
$stmt->bindParam(1, $cepEnd);
$stmt->bindParam(2, $rua);
$stmt->bindParam(3, $numero);
$stmt->bindParam(4, $complemento);
$stmt->bindParam(5, $bairro);
$stmt->bindParam(6, $nome);
$stmt->bindParam(7, $email);
$stmt->bindParam(8, $senha);
$stmt->bindParam(9, $telefone);
$stmt->execute();

do{
    while($row = $stmt->fetch()){
        if($row['Status'] == '201'){
            session_start();
            $_SESSION["userCep"] = $cepEnd;
            $_SESSION["userRua"] = $rua;
            $_SESSION["userNum"] = $numero;
            $_SESSION["userCompl"] = $complemento;
            $_SESSION["userBairro"] = $bairro;
            $_SESSION["userName"] = $nome;
            $_SESSION["userEmail"] = $email;
            $_SESSION["userTel"] = $telefone;
            $_SESSION["userEnderecoId"] = $row['Body'];

            header('location: ../sobre.php');

        } 
        else if ($row['Status'] == '403') 
        {
            echo '<script>';
            echo 'alert("Cliente já cadastrado! Faça login!");';
            echo 'location.replace("../login.php");';
            echo '</script>';
            exit;
        }
            
    }
}while ($stmt->nextRowset());


?>