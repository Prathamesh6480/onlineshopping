package database;

import java.io.FileInputStream;
import java.sql.*;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class db
{
  public static String dbDriver; 
  public static String dburl;
  public static String dbuser;
  public static String dbpassword;
  public static Connection dbconn;
  public static Statement stmt;
  public static ResultSet rs;
  public static int stmt_ret_val;
  public static int rowcount;
 
  public static void getProperties()
  {
	  try {
			 FileInputStream fp= new FileInputStream("C:\\db.properties");
			 Properties prop= new Properties();
			 prop.load(fp);
			 dbDriver=prop.getProperty("dbDriver");
			 dburl=prop.getProperty("dbURL");
			 dbuser=prop.getProperty("dbUSER");
			 dbpassword=prop.getProperty("dbPWD");
			 fp.close();
			 System.out.println("\ndbDriver="+dbDriver+"\ndburl="+dburl+"\nusername="+dbuser+"\npassword="+dbpassword);
	  }
	  catch(Exception e)
	  {
		  e.printStackTrace();
	  }
  }
  public static int getdbconn()
  {
	  if (dbconn==null)
	  {  
		  getProperties();
	      System.out.println("Connecting to Database");
		  try
		  {
			 Class.forName(dbDriver);
			 dbconn=DriverManager.getConnection(dburl,dbuser,dbpassword);
			 stmt=dbconn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
		  }
		  catch(Exception e)
		  {
			  e.printStackTrace();
			  return -1;
		  }
	  }
	return 0;
  }
  public static int select(String sql)
  {
	  int rowcount;
	  System.out.println(sql);
	  try 
	  {
		  getdbconn();
		  rs=db.stmt.executeQuery(sql);
		  rs.last();
		  rowcount = rs.getRow();
		  System.out.println("rowcount="+rowcount);
		  rs.beforeFirst();
	  } 
	  catch (SQLException e) 
	  {
		e.printStackTrace();
		return -1;
	  }
	  return rowcount;
  }
  public static int insert(String sql)
  {
	  System.out.println(sql);
	  try 
	  {
		  getdbconn();
		  rowcount=db.stmt.executeUpdate(sql);
	  } 
	  catch (SQLException e) 
	  {
		e.printStackTrace();
	  }
	  return rowcount;
  }
  public static int update(String sql)
  {
	  System.out.println(sql);
	  try 
	  {
		  getdbconn();
		  rowcount=db.stmt.executeUpdate(sql);
	  } 
	  catch (SQLException e) 
	  {
		e.printStackTrace();
	  }
	  return rowcount;
  }
  public static int getmaxrows(String tablename)
  {
	 int maxrows=0;
	 try 
	 {
		     String sql="select count(*) from "+tablename;
		     select(sql);
		     rs.next();
		     maxrows=Integer.parseInt(rs.getString(1));
	 }
	 catch(Exception e)
		 {
			System.out.println(e);	
		 }
	 return maxrows;
  }
  public static void close_dbconn()
  {
	  try
	  {
		db.dbconn.close();
	  } 
	  catch (SQLException e) 
	  {
		e.printStackTrace();
	  }
   }
}
