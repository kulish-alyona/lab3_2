<?php

include "connection.php";

$processor = $_GET["processor"];

$sth = $conn->prepare('SELECT netname FROM computer WHERE FID_Processor = (SELECT id_processor FROM processor WHERE name = ?)');
$sth->execute(array($processor));
$res = $sth->fetchAll();

    foreach ($res as $row) {
        echo "<p>$row[0]</p>";
    }
    
?>