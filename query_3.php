<?php
    include "./connection.php";
    $user_date = $_GET["user_date"];
    $sth = $conn->prepare('SELECT netname FROM computer where ? > (DATE_ADD(date_purchase, INTERVAL guarantee MONTH))');

    $sth->execute(array($user_date)); 
    $cell = $sth->fetchAll(PDO::FETCH_OBJ);
    echo json_encode($cell);
?>
