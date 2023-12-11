<header>
    <div class="conteiner-fluid d-flex justify-content-around cabecalho align-items-center">
        <div class="logo">
            <img src="images/image 1.png" alt="Logo Amor de Casquinha" class="logo">
            <h4 class="titulo1">Amor de Casquinha</h4>
        </div>
        <nav class="navigation text-center">
            <?php 
                    include "config/config.php";

                    if(!isset($_SESSION["userEmail"])){
                        echo "<a href='index.php'>Início</a>";
                        echo "<a href='login.php'>Login</a>";
                        echo "<a href='carrinho.php'><svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24'><path d='M19.5 8c-2.485 0-4.5 2.015-4.5 4.5s2.015 4.5 4.5 4.5 4.5-2.015 4.5-4.5-2.015-4.5-4.5-4.5zm-.5 7v-2h-2v-1h2v-2l3 2.5-3 2.5zm-5.701-11.26c-.207-.206-.299-.461-.299-.711 0-.524.407-1.029 1.02-1.029.262 0 .522.1.721.298l3.783 3.783c-.771.117-1.5.363-2.158.726l-3.067-3.067zm-.299 8.76c0-1.29.381-2.489 1.028-3.5h-14.028v2h.643c.535 0 1.021.304 1.256.784l4.101 10.216h12l1.211-3.015c-3.455-.152-6.211-2.993-6.211-6.485zm-2.299-8.76c.207-.206.299-.461.299-.711 0-.524-.407-1.029-1.02-1.029-.261 0-.522.1-.72.298l-4.701 4.702h2.883l3.259-3.26z' class='carrinho'/></svg></a>";
                    } else {
                        // Caso alguém tenha logado, é verificado se o email é de cliente ou de funcionarios 

                        $email = isset($_SESSION["userEmail"]) ? isset($_SESSION["userEmail"]) : 0;

                        // Examina se o email logado é de funcionário
                        try{
                            $cmd = $conn->prepare("CALL SP_FuncionarioReadByEmail(?)");
                            $cmd->bindParam(1, $email);
                            $cmd->execute();
                        } catch (PDOException $e) {
                            echo "Erro no banco de dados: " . $e->getMessage();
                         } catch (Exception $e) {
                            echo "Erro genérico: " . $e->getMessage();
                        }
                        
                        $result = $cmd->fetch(PDO::FETCH_ASSOC);

                        // Se for, exibe a opção para funcionários
                        if (!isset($result['Status'])) {

                                echo "<a href='index.php'>Início</a>";
                                echo "<a href='pedidos.php'>Pedidos</a>";
                                echo "<a href='config/logoff.php'>Log off</a>";
                                // se o profile for diferente de fun, exibe a opção para ADM
                                if($result['profile'] != "FUNC") {
                                    echo "<a href='index.php'>Início</a>";
                                    echo "<a href='editarFuncionarios.php'>Funcionários</a>";
                                    echo "<a href='config/logoff.php'>Log off</a>";
                                }
                        }

                        // Examina se o email logado é de cliente
                        try{                            
                            $cmd = $conn->prepare("CALL SP_ClienteReadByEmail(?)");
                            $cmd->bindParam(1, $email);
                            $cmd->execute();
                        } catch (PDOException $e) {
                            echo "Erro no banco de dados: " . $e->getMessage();
                        } catch (Exception $e) {
                            echo "Erro genérico: " . $e->getMessage();
                        }
                        
                        $result = $cmd->fetch(PDO::FETCH_ASSOC);

                        // Se for, exibe a opção para funcionários
                        if (!isset($result['Status'])) {
                            echo "<a href='index.php'>Início</a>";
                            echo "<a href='carrinho.php'><svg xmlns='http://www.w3.org/2000/svg' width='34' height='34' viewBox='0 0 24 24'><path d='M19.5 8c-2.485 0-4.5 2.015-4.5 4.5s2.015 4.5 4.5 4.5 4.5-2.015 4.5-4.5-2.015-4.5-4.5-4.5zm-.5 7v-2h-2v-1h2v-2l3 2.5-3 2.5zm-5.701-11.26c-.207-.206-.299-.461-.299-.711 0-.524.407-1.029 1.02-1.029.262 0 .522.1.721.298l3.783 3.783c-.771.117-1.5.363-2.158.726l-3.067-3.067zm-.299 8.76c0-1.29.381-2.489 1.028-3.5h-14.028v2h.643c.535 0 1.021.304 1.256.784l4.101 10.216h12l1.211-3.015c-3.455-.152-6.211-2.993-6.211-6.485zm-2.299-8.76c.207-.206.299-.461.299-.711 0-.524-.407-1.029-1.02-1.029-.261 0-.522.1-.72.298l-4.701 4.702h2.883l3.259-3.26z' class='carrinho'/></svg></a>";
                            echo "<a href='sobre.php'>Perfil</a>";
                            echo "<a href='config/logoff.php'>Log off</a>";
                        }                      

                    }
                                           
                    
            ?>
        </nav>
        <div class="toggleBox" id="toggleBtn">
            <img src="images/image 2.png" alt="Menu" id="toggleBtn">
        </div>
    </div>
</header>

<?php
    session_start();
?>
