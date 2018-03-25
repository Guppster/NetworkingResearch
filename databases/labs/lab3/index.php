<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>CS4411 MongoDB connection</title>
    </head>
    <body>
<pre>
<?php

try {
$manager = new MongoDB\Driver\Manager("mongodb://localhost:27017");
//var_dump($manager);

$bulk = new MongoDB\Driver\BulkWrite();

$_id1=$bulk->insert( array('actor'=> "Richard Gere",  'born'=>1949, 'movies'=>array('Pretty Woman', 'Runaway Bride', 'Chicago') ) );
$_id2=$bulk->insert( array('actor'=> "Julia Roberts",  'born'=>1967, 'movies'=>array('Pretty Woman', 'Runaway Bride', 'Osage County') ) );
$_id3=$bulk->insert( array('actor'=> "Meryl Streep",  'born'=>1948, 'movies'=>array('The Devil Wears Prada', 'Osage County', 'The Iron Lady', 'The Manchurian Candidate') ) );

var_dump($_id1, $_id2, $_id3);

$writeConcern = new MongoDB\Driver\WriteConcern(MongoDB\Driver\WriteConcern::MAJORITY, 100);

// DB hollywood, collection actors
$result = $manager->executeBulkWrite("hollywood.actors", $bulk, $writeConcern);


// Print all actors and year of birth. Query:
echo "----Print Collection:-----<br />";

$query = new MongoDB\Driver\Query([]); 
$rows = $manager->executeQuery("hollywood.actors", $query);

foreach ($rows as $row) {
	echo "$row->actor : $row->born\n";
}

// Filter
echo "----Print Filtered Collection:-----<br />";

$filter = [ 'actor' => 'Julia Roberts' ]; 
$query = new MongoDB\Driver\Query($filter); 

$rows = $manager->executeQuery("hollywood.actors", $query);
 
foreach ($rows as $row) {
	echo "$row->actor : $row->born\n";
}

//Drop Collection
$manager->executeCommand('hollywood', new \MongoDB\Driver\Command(["drop" => "actors"]));

}
catch (MongoDB\Driver\Exception\Exception $e) {

    echo "Exception:", $e->getMessage(), "\n";
    echo "In file:", $e->getFile(), "\n";
    echo "On line:", $e->getLine(), "\n";       
}
?>
</pre>
</body>
</html>