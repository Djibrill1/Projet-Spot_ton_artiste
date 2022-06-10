<?php

$server = "mysql:host=localhost;dbname=test";
$user = "tata";
$password = "";
$dbh = new PDO($server, $user, $password);

if($link){
echo "connexion étabie";
}
else{
die(mysqli_connect_error());

}







?>