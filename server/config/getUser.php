<?php
session_start();

if(isset($_SESSION["userEmail"]))
{
    header('location: ../sobre.php');
}
else if(isset($_POST["email"]) && isset($_POST["senha"]))
{
    require_once 'config.php';

    $email = $_POST["email"];
    $senha = $_POST["senha"];

    $stmt = $conn->prepare("CALL SP_Login(?)");
    $stmt->bindParam(1, $email);
    $stmt->execute();
    $result = $stmt->fetchAll();

    foreach($result as $row)
    {
        $profile = $row["profile"];
        $isDeleted = $row["isDeleted"];

        if($isDeleted == 1)
        {
            echo '
            <script>
                alert("Este usuário não possui mais acesso, entre em contato com um administrador!");
                window.location.replace = "../login.php"; 
            </script> 
            ';
        }
        else
        {
            switch($profile)
            {
                case 'FUNC':
                    if(password_verify($senha, $row["senhaFuncionario"]))
                    {
                        $_SESSION["userEmail"] = $row["emailFuncionario"];
                        $_SESSION["userName"] = $row["nomeFuncionario"];
                        $_SESSION["userTel"] = $row["telefoneFuncionario"];
                        $_SESSION["userProfile"] = ($row["isAdm"] == 1 ? "FADM" : "FUNC" );
                        header("location: ../pedidos.php");
                    }
                    else
                    {
                        echo '
                            <script>
                                alert("Senha errada!");
                                location.replace("../login.php"); 
                            </script> 
                        ';
                    }
                    break;
                case 'CLIE':
                    if(password_verify($senha, $row["senhaCliente"]))
                    {
                        $_SESSION["userEmail"] = $row["emailCliente"];
                        $_SESSION["userName"] = $row["nomeCliente"];
                        $_SESSION["userTel"] = $row["telefoneCliente"];
                        $_SESSION["userCep"] = $row["cep"];
                        $_SESSION["userRua"] = $row["rua"];
                        $_SESSION["userNum"] = $row["numero"];
                        $_SESSION["userCompl"] = $row["complemento"];
                        $_SESSION["userBairro"] = $row["bairro"];
                        $_SESSION["userEnderecoId"] = $row["idEndereco"];
                        $_SESSION["userProfile"] = $row["profile"];
                        header("location: ../sobre.php");
                    }
                    else
                    {
                        echo '
                            <script>
                                alert("Senha errada!");
                                location.replace("../login.php"); 
                            </script> 
                        ';
                    }
                    break;
                default:
                    echo '
                        <script>
                            alert("Ocorreu um erro! Perfil não encontrado.");
                            location.replace("../login.php");  
                        </script> 
                    ';
                    break;
            }
        }
    }

}
else
{
    header('location: ../index.php');
}
?>