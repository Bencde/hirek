<?php
$db = new PDO("mysql:host=localhost;dbname=hirdb", "root", "");

$select="SELECT hircim, count(idhozza) as szam, megjelenes, szoveg, idhir
FROM hir
left join hozzaszolas on idhir= hir_idhir
where megjelenes > '2024-01-01'
group by hircim
order by megjelenes DESC
";

$statement= $db->prepare($select);
$statement -> execute();

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel= "stylesheet" type = "text/css" href="style.css">
    <title>Hírek</title>
</head>
<body class="body">
    <div class="cim">
    <h1>Hírek</h1>
    <p1> Csákai Bence Q8CHHW </p>
    </div>
    
    <div class="mainresz">
         <?php 
            while($row=$statement->fetchObject()){
         ?>
        <p2> <?=$row->hircim?> </p2>
        <br/>
        <i> <?=$row->megjelenes?> </i>
        <br/>

            <br/>
        <p3> <?=$row->szoveg?><p3>
        <br/>
        <br/>
        <p4> Hozzászólások száma: <?=$row->szam?></p4>
        <br/>
        <br/>
            <?php
                $select2="select szerzo, comment, hir_idhir 
                            from hozzaszolas";
                
                $statement2= $db->prepare($select2);
                $statement2 -> execute();

                while($row2=$statement2->fetchObject()){
                    if($row->idhir == $row2->hir_idhir){
            ?>
                <ul>
                    <li> <?=$row2->szerzo?>:  <?=$row2->comment?> </li>


                </ul>
            <?php }} ?>
         <br/>
         <br/>
         <p5> Új hozzászólás írása</p5>
         <form method="post" action="insert.php?id=<?=$row->idhir?>">

                <label> Név: </label>
                <br/>
                <input type="text" name="nev">
                <br/>
                <label> Szöveg</label>
                <br/>
                <textarea name="szoveg"> </textarea>
                <br/>
                <input type="submit" value="Küldés">
                <br/>
                <br/>

        </form>
            
        <br/>
        <br/>
        <?php } ?>
    </div>

</body>
</html>