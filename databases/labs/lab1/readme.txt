1.Import student.sql into lab1 database:
mysql lab1 < student.sql

2. Compile JavaProject1:
javac JavaProject1.java

3. Run JavaProject:
java JavaProject1

4. Compile JavaProject2:
javac JavaProject2.java

3. Run JavaProject2:
java JavaProject2

4. Try SQL Injection:
java Injection
## insert 85

java Injection
## insert 85 OR Grade < 100


Note: If you see an error "Java.sql.SQLException: No suitable driver found" then 
you might want to add MySQL Connector to classPath:
export CLASSPATH=/usr/share/java/mysql-connector-java-5.1.42.jar:$CLASSPATH
