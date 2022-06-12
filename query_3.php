<?php

include "connection.php";

$user_date = $_GET["user_date"];

$sth = $conn->prepare('SELECT netname FROM computer where ? > (DATE_ADD(date_purchase, INTERVAL guarantee MONTH))');
$sth->execute(array($user_date));
$res = $sth->fetchAll();
    foreach ($res as $row) {
        echo "<p>$row[0]</p>";
    }
?>