<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>CS4411 MySQL connection</title>
    </head>
    <body>

<?php
// You can run the same file in your Windows Environment.
// However, you'd need to replace "localhost" with IP address of your VM

DEFINE('DB','lab1');
DEFINE('USER', 'webuser');
DEFINE('PASSWORD', 'student');
DEFINE('HOST', 'localhost');


$mysqli = new mysqli(HOST,USER,PASSWORD,DB);
/* check connection */
if ($mysqli->connect_errno) {
    printf("Failed to connect to MySQL: %s\n", $mysqli->connect_error);
    exit();
}

/* create a prepared statement */
$stmt =  $mysqli->stmt_init();
if($stmt=$mysqli->prepare("select name, major, grade from students where grade> ?")){

$grade=50;
$stmt->bind_param('i', $grade);
$stmt->execute();

/* bind variables to prepared statement */
$stmt->bind_result($name,$major,$grade);

while($stmt->fetch()){
	printf ("Name: %s, Major: %s, Grade: %s <br />",$name,$major,$grade);
}
    
$stmt->close();

}
/* close connection */
$mysqli->close();


?>
    </body>
</html>
