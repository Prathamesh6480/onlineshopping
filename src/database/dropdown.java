package database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class dropdown {
	public static Statement stmt;
	public static ResultSet rslookup;
	public static ResultSet rs;
	
	
	public static void getlookup()
	{
	  //if (rslookup==null)
	  {	  
	      System.out.println("fetching lookup data");
	  	  try {
	  		  db.getdbconn();
	  		  stmt=db.dbconn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
		      rslookup=stmt.executeQuery("select * from lookup");
		  	} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	  }
	}
	  public static int select(String sql)
	  {
		  int rowcount;
		  System.out.println(sql);
		  try 
		  {
			  db.getdbconn();
			  stmt=db.dbconn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			  rs=stmt.executeQuery(sql);
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
	public static String getSelecttag(String name,String type, int code) {
		String select ="";
		String selected="";
		getlookup();
		select=select+ "<select name='"+name+"'>";
		try {
			rslookup.beforeFirst();
			while(rslookup.next())
			{
				if(!rslookup.getString("type").equals(type))continue;
				if(rslookup.getInt("icode")== code)selected="selected";
				//if(Integer.parseInt(rslookup.getString("icode"))== code)selected="selected";
				select=select+"<option value="+rslookup.getString("icode")+" "+selected+">"+rslookup.getString("value")+"</option>";
				selected="";
		    }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		select = select+"</select>";
		//String placeholder="AddNew";
		//select = select+"<input type=text name="+descr+" placeholder="+placeholder+">";
		return select;
	}
	public static String getSelectMultitag(String name,String type, int[] code) {
		String select ="";
		String selected="";
		getlookup();
		select=select+ "<select multiple name='"+name+"'>";
		try {
			rslookup.beforeFirst();
			while(rslookup.next())
			{
				if(!rslookup.getString("type").equals(type))continue;
				for(int i=0;i<code.length;i++)if(Integer.parseInt(rslookup.getString("icode"))== code[i])selected="selected";
				select=select+"<option value="+rslookup.getString("icode")+" "+selected+">"+rslookup.getString("value")+"</option>";
				selected="";
		    }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		select = select+"</select>";
		//String placeholder="AddNew";
		//select = select+"<input type=text name="+descr+" placeholder="+placeholder+">";
		return select;
	}
	public static String getSelecttagTable(String name,String col, int id1) {
		String select ="";
		String selected="";
		
		select=select+ "<select name='"+name+"'>";
		try {
			//db.rs.beforeFirst();
			while(db.rs.next())
			{
				if(db.rs.getInt("id")== id1)selected="selected";
				select=select+"<option value="+db.rs.getString("id")+" "+selected+">"+db.rs.getString(col)+"</option>";
				selected="";
		    }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		select = select+"</select>";
		//String placeholder="AddNew";
		//select = select+"<input type=text name="+descr+" placeholder="+placeholder+">";
		return select;
	}
	public static String getValue(String type,int icode)
	{
		String svalue="";
		select("select *  from lookup where  type='"+type+"' and icode="+icode);
		try {
		while(rs.next())
		{
			svalue=(rs.getString("value"));
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return svalue;
	}
	public static String getValueTable(String table,String col,int id)
	{
		String svalue="";
		select("select *  from "+table+" where  id="+id);
		try {
				while(rs.next())
				{
					svalue=(rs.getString(col));
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return svalue;
	}
	
}
