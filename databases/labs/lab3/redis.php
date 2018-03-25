<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>CS4411 Redis connection</title>
    </head>
    <body>

<pre>
<?php
   //Connecting to Redis server on localhost
   $redis = new Redis();
   $redis->connect('127.0.0.1', 6379) or die ('Cannot Connect to Redis Server');

   //We passed the connection state and notify
   echo "Connection to server is done!\n";

   // set key and value
   $key='course';
   $value='cs4411';
	
   //check whether we can "ping" the server:
   echo "Server is running: " . $redis->ping();
   echo "\n";

   // Set the data {key:value}:
   echo "Setting {key:value} pair as: { $key:$value }\n";
   $redis->set($key, $value);

   // Check if key exists
   echo "Verifying key '$key' : ";
   echo $redis -> exists($key)? "does exist" : "does not exist";
   echo "\n";

   // Get the stored data and print it
   echo "Getting value of key '$key' : ";
   echo $redis -> get($key);
   echo "\n";

   // Delete the key:
   $redis -> del($key);

   // Close connection
   $redis->close();


?>
</pre>
</body>
</html>