<?php
header('Content-Type: text/xml');
header('Cache-Control: no-cache, must-revalidate'); 
include "connection.php";
    echo '<?xml version="1.0" encoding="UTF-8"?>';
    echo "<root>";
    $software = $_GET['software']; 
    $sqlSelect = $conn->prepare('SELECT netname from computer, computer_software, software 
    where ID_Computer=FID_Computer and FID_Software=ID_Software and name=?');
    $sqlSelect->execute(array($software));
    while ($cell = $sqlSelect->fetch(PDO::FETCH_BOTH)) {
      $item = $cell[0];
      echo "<row><item> $item </item></row>";
    }
    echo "</root>"
?>