<?php
$db = new PDO("mysql:host=localhost;dbname=hirdb", "root", "");


if(isset($_GET['id']) && isset($_POST['nev']) && isset($_POST['szoveg']))
{
 $nev=$_POST['nev'];
 $szoveg=$_POST['szoveg'];
$id=$_GET['id'];


 $result="INSERT INTO hozzaszolas(szerzo, comment, hir_idhir) VALUES (:nev, :szoveg, :id)";

 $statement= $db->prepare($result);
 $statement->bindparam(":nev", $nev, PDO::PARAM_STR);
 $statement->bindparam(":szoveg", $szoveg, PDO::PARAM_STR);
 $statement->bindparam("id", $id, PDO::PARAM_INT);
 $statement->execute();


    
}

header("Location: index.php");




?>