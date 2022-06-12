<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>comp</title>
    <script src="./script.js"></script>
</head>
<body>
    <div class="main-block">
      <h4>Choose Processor</h4>
         <select id="processor" name="processor">
            <?php
            include "connection.php";

            $query = 'SELECT * FROM `processor`';

            foreach ($conn->query($query) as $name) {
               echo "<option  value='".$name[1]."'>";
               print_r($name[1]);
               echo "</option>";
           }
            ?>
         </select>
         <input type="submit" name="form1" value="Поиск" onclick="firstRequest()"><br>
      <h4>Choose Software</h4>
         <select id="software" name="software">
               <?php
                include "connection.php";

               $query = 'SELECT * FROM `software`';

               foreach ($conn->query($query) as $name) {
                  echo "<option  value='".$name[1]."'>";
                  print_r($name[1]);
                  echo "</option>";
              }
               ?>
         </select>
         <input type="submit" name="form2" value="Поиск" onclick="secondRequest()"><br>
         
         <h4>ПК с истекшим гарантийным сроком. <br> Example 2022-03-06</h4>
         <input id="user_date" type="text" name="user_date" />
         <input type="submit" name="form3" value="Поиск" onclick="thirdRequest()"><br>
   </div>

   <div id="info-body"></div>
</body>
</html>