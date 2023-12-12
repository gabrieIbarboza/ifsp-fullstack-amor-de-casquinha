<?php
$servername = "localhost";
$dbname = "db_sorveteria";
$username = "root";
$password = "Fthyy*83u";
$conn = "";

try {
  $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
  // set the PDO error mode to exception
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
  die(
    "Connection failed: " . $e->getMessage()
  );
}
?>
