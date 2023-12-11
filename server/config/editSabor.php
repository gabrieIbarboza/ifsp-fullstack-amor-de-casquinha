<?php
require_once 'config.php';
session_start();

    if(isset($_POST['btnEditar'])){
        // Verifica se todos os campos foram preenchidos
        if(!empty($_POST['nomeSabEdt']) && !empty($_POST['precoSabEdt']) && !empty($_POST['imagemSabEdt'])){
            $antNome = isset($_SESSION['antNome']) ? $_SESSION['antNome'] : 0;
            $nome = $_POST['nomeSabEdt'];
            $preco = $_POST['precoSabEdt'];
            $imag = $_POST['imagemSabEdt'];
            $act = 1;
            try{

                // ****** SEM PROCEDURE *********************
                // $cmd = $conn->prepare("UPDATE tbVariacaoProduto SET nomeVariacao = :nome, precoVariacao = :preco, fotoVariacao = :foto where idVariacao = :id");
                // $cmd->bindParam(":nome", $nome);
                // $cmd->bindParam(":preco", $preco);
                // $cmd->bindParam(":foto", $imag);
                // $cmd->bindParam(":id", $idVari);
                // ******************************************

                // COM PROCEDURE
                $cmd = $conn->prepare("CALL SP_VariacaoUpdate(?, ?, ?, ?, ?)");
                $cmd->bindParam(1, $antNome);
                $cmd->bindParam(2, $nome);
                $cmd->bindParam(3, $preco);
                $cmd->bindParam(4, $imag);
                $cmd->bindParam(5, $act);
                $cmd->execute();
            } catch (PDOException $e) {
                echo "Erro no banco de dados: " . $e->getMessage();
            } catch (Exception $e) {
                echo "Erro genérico: " . $e->getMessage();
            }

            header('Location: ../editarProdutos.php');
            exit();
            
        }else{
            $_SESSION['var'] = "<h1 class='aviso'>Preencha todos os campos!!!</h1>";
            header('Location: ../editaSabor.php');
            exit();
        }
    }
?>
        