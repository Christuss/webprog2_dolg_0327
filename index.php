<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Szendefi Krisztofer Daniel</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    
</body>
<?php
    $vNevek = ["Nagy", "Szabó", "Kovács", "Hofi"];
    $kNevek = ["Tibor", "Klára", "Tóbiás", "Géza"];
    $szuletesEve = [rand(1998, 2005), rand(1998, 2005), rand(1998, 2005), rand(1998, 2005)]; 
    echo "<table><tr><th>Vezetéknév</th><th>Keresztnév</th><th>Születés éve</th></tr>"; 
    for ($i=0; $i < 4; $i++) { 
        echo "<tr><td>$vNevek[$i]</td><td>$kNevek[$i]</td><td>$szuletesEve[$i]</td></tr>";
    }
    echo "</table>";
?>
</html>