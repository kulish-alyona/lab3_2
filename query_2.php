<?php

include "connection.php";

$software = $_GET["software"];

$sth = $conn->prepare('SELECT netname from computer, computer_software, software 
where ID_Computer=FID_Computer and FID_Software=ID_Software and name=?');
$sth->execute(array($software));
$res = $sth->fetchAll();

    foreach ($res as $row) {
        echo "<p>$row[0]</p>";
    }
?>