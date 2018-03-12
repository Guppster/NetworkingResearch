import java.sql.*;   // Use classes in java.sql package
 
// JDK 7 and above
public class JavaProject1 {  // Save as "JavaProject"
 
  public static void main(String[] args) {

      try (
         // Step 1: Allocate a database "Connection" object
         Connection conn = DriverManager.getConnection(
               "jdbc:mysql://135.0.85.147:3306/lab1?useSSL=false", "webuser", "student"); // MySQL
 
         // Step 2: Allocate a "Statement" object in the Connection
         Statement stmt = conn.createStatement();
      ) {
         // Step 3: Execute a SQL SELECT query, the query result
         //  is returned in a "ResultSet" object.
         String strSelect = "select * from students";
         System.out.println("The SQL query is: " + strSelect); // Echo For debugging
         System.out.println();
 
         ResultSet rset = stmt.executeQuery(strSelect);
 
         // Step 4: Process the ResultSet by scrolling the cursor forward via next().
         //  For each row, retrieve the contents of the cells with getXxx(columnName).
         System.out.println("The records selected are:");
         int rowCount = 0;
         while(rset.next()) {   // Move the cursor to the next row
            String name = rset.getString("name");
            String major = rset.getString("major");
            int    studentID   = rset.getInt("studentID");
            int    grade   = rset.getInt("grade");

            //System.out.println(studentID + ", " + name + ", " + major + ", " + grade);
	    System.out.printf( "%-10s%-5s%3d\n",  name,major,grade);
            ++rowCount;
         }
         System.out.println("Total number of records = " + rowCount);
 
      } catch(SQLException ex) {
         ex.printStackTrace();
      }
      // Step 5: Close the resources - Done automatically by try-with-resources
   }

    
}
