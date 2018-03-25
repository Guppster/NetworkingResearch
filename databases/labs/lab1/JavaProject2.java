
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;


public class JavaProject2 {
   
    public static void main(String[] args) {
      
      try (
         // Step 1: Allocate a database "Connection" object
         Connection conn = DriverManager.getConnection(
               "jdbc:mysql://135.0.85.147:3306/lab1?useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "webuser", "student"); // MySQL
 
         // Step 2: Create a "Prepared Statement" object in the Connection
         PreparedStatement pstmt = conn.prepareStatement("select name, major, grade from students where grade> ?");
      ) {
          
        Scanner input=new Scanner(System.in);
        
        System.out.print("Input minimum grade: ");
        String min_grade=input.next();

        // Step 3: Replace ? in prepared statement with grade
        // Execute the SQL SELECT query, 
         // the query result is returned in a "ResultSet" object.
        
        pstmt.setString(1, min_grade);
        ResultSet rset = pstmt.executeQuery();

         // Process the ResultSet by scrolling the cursor forward via next().
         //  For each row, retrieve the contents of the cells with getXxx(columnName).
         while(rset.next()) {   // Move the cursor to the next row
            int grade   = rset.getInt("grade");
            String name = rset.getString("name");
            String major = rset.getString("major");
            System.out.printf( "%-10s%-5s%3d\n",  name,major,grade);
         }

      } catch(SQLException ex) {
         ex.printStackTrace();
      }
      // Step 5: Close the resources - Done automatically by try-with-resources
   }

    
}
