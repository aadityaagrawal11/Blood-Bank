package Project;
import java.sql.*;
public class ConnectionProvider {

  public static Connection getCon() {    
try{  
String dbDriver = "com.mysql.cj.jdbc.Driver";
String dbURL = "jdbc:mysql:// localhost:3306/";
// Database name to access
String dbName = "bloodbank";
String dbUsername = "root";
String dbPassword = "Aditya@04";

Class.forName(dbDriver);
Connection con = DriverManager.getConnection(dbURL + dbName,dbUsername,dbPassword); 
  return con;
}
catch(Exception e) {
	System.out.println(e);

return null;
  }
  }
}
