package lookup;





import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


public class lookup {
    public static Connection con;
    public static Statement stat;
    public static ResultSet rs;
    public String tab;
	public String optn;
	public String region;
	public int user_id=0;
	public String user_name="";
	public String user_type="";
	public String emp_id="";
	public String version="1.0";
	public String candidate_id="";
	public String candidate_name="";
	public String op_id="";
	public static lookup l;
	public static lookup getlookup() 
    { 
        if (l == null) 
        {
        	l = new lookup(); 
        }
        return l; 
    } 
 	public  lookup()
	{
     	getdbcon();
    	//getdata();
     	//getlookupdata();
	}
	public static void getdbcon()
	{
	     try{ 
	    	 database.db.getProperties();
 	    	 Class.forName(database.db.dbDriver);  
	    	 con = DriverManager.getConnection(database.db.dburl, database.db.dbuser, database.db.dbpassword);
	    	 stat = con.createStatement();
	     }
	     catch(Exception e)
		 {
			e.printStackTrace();
		 }
	}
	public static void getrs1(String sql)
	{

	    try{
	    	System.out.println(sql);
	    	rs = stat.executeQuery(sql);

	    }
	     catch(Exception e)
		 {
			System.out.println(e);	
		 }
	}
	public void getrs(String sql)
	{

	    try{
	    	System.out.println(sql);
	    	rs = stat.executeQuery(sql);

	    }
	     catch(Exception e)
		 {
			System.out.println(e);	
		 }
	}

 	public  int getmaxrows(String tablename)
	{
     int maxrows=0;
     try 
     {
	     String sql="select count(*) from "+tablename;
	     getrs(sql);
	     rs.next();
	     maxrows=Integer.parseInt(rs.getString(1));
     }
     catch(Exception e)
	 {
		System.out.println(e);	
	 }
     return maxrows;
    }
    public String actionhead()
    {
    	String s="";
    //	if(user_type.equals("opst")) {
    		s="<td class=\"td1\">Action</td>";
    //	}
    		return(s);
    }
  //  @SuppressWarnings("static-access")
	public String editbutton(String s) {
  //  	if(user_type.equals("opst")) {
		System.out.println("in editbutton="+s);
   		s = "<td class=td1><input type=button value=Edit onclick="+s+"></td>";
 //   	}
//    	else s="";
   		return (s);
    }
    public String addbutton(String s) {
//    	if(user_type.equals("opst")) {
    		System.out.println("in addbutton="+s);
    		s="<input type=button value=Add onclick="+s+">";
//    	}
//    	else s="";
		return (s);
    }
    public String addchildbutton(String s) {
//    	if(user_type.equals("opst")) {
    		System.out.println("in addchildbutton="+s);
    		s="<td class=td1><input type=button value=AddChild onclick="+s+"></td>";
    		System.out.println(s);
//    	}
//    	else s="";
		return (s);
    }
    public String listchildbutton(String s) {
//    	if(user_type.equals("opst")) {
    		System.out.println("in listchildbutton="+s);
    		s="<td class=td1><input type=button value=ListChild onclick="+s+"></td>";
    		System.out.println(s);
//    	}
//    	else s="";
		return (s);
    }
    static List<LookUpObject> listOfLookUpObjects= new ArrayList<LookUpObject>();
	public  void getlookupdata() {
		try {
			getrs("select * from vlookup");
			while (rs.next()) {
				LookUpObject lookupobject = new LookUpObject();
				lookupobject.setDescr(rs.getString("descr"));
				lookupobject.setCode(rs.getString("code"));
				lookupobject.setVal(rs.getString("val"));
				listOfLookUpObjects.add(lookupobject);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	public static Map<String, String> getOptions(String descr){
		Iterator<LookUpObject> it= listOfLookUpObjects.iterator();
		Map<String,String>listOfOptions= new HashMap<>();
		while (it.hasNext()) {
			LookUpObject l=(LookUpObject)it.next();
			if(l.getDescr().equals(descr))
			{
				listOfOptions.put(l.getCode(),l.getVal());
			}
			
		}
		return listOfOptions;
	}
	public static String getSelecttag(String descr, String code) {
		String select ="";
		//select= "<label>"+descr+"</label>"
		select=select+ "<select>";
		Map<String,String> m=getOptions(descr);
		Iterator<String> it=m.keySet().iterator();
		while(it.hasNext())
		{
			String key=it.next();
	//		if(code.equalsIgnoreCase(it.getKey()) 
		//		select=select+"<option selected id="+key+">"+m.get(key)+"</option>";
		//	else
				select=select+"<option id="+key+">"+m.get(key)+"</option>";
	    }
		select = select+"</select>";
		String placeholder="AddNew";
		select = select+"<input type=text name="+descr+" placeholder="+placeholder+">";
		return select;
	}
	public static String getSelectMultitag(String descr) {
		String select = "";
		//select= "<label>"+descr+"</label>"
		select=select+ "<select multiple>";
		Map<String,String> m=getOptions(descr);
		Iterator<String> it=m.keySet().iterator();
		while(it.hasNext())
		{
	  	 String key=it.next();  
				select=select+"<option id="+key+">"+m.get(key)+"</option>";

	     }
		select = select+"</select>";
		return select;
	}
	   public int candidatelogin(String login,String password) {
		    try{
		    	String sql="select candidate_id,title,first_name,last_name from candidate where login='"+login+"' and password='"+password+"'";
		        rs = stat.executeQuery(sql);
		        while (rs.next()) {
		        	candidate_id=(String)rs.getString(1);
		        	candidate_name=(String)rs.getString(2)+" "+(String)rs.getString(3)+" "+(String)rs.getString(4);
		        	user_id=Integer.parseInt(rs.getString(1));
		        	user_name=candidate_name;
		        	user_type="candidate";
		        	System.out.println("user_id="+user_id+" user_name="+user_name+" user_type="+user_type);
		        }
		    }
		    catch(Exception e)
			 {
				System.out.println(e);	
			 }
		     return user_id;
		    }
	   public int login(String login,String password) {
		    try{
		    	String sql="select * from rmsuser where login1='"+login+"' and password1='"+password+"'";
		        rs = stat.executeQuery(sql);
		        while (rs.next()) {
		        	user_id=Integer.parseInt(rs.getString(1));
		        	user_name=(String)rs.getString(2);
		        	emp_id=(String)rs.getString(3);
		        	user_type=(String)rs.getString(4);
		        	System.out.println("user_id="+user_id+" user_name="+user_name+" emp_id="+emp_id+" user_type="+user_type);
		        }
		    }
		    catch(Exception e)
			 {
				System.out.println(e);	
			 }
		     return user_id;
		    }
	public static void main(String argv)
	{
		lookup l= new lookup();
		String s=l.addchildbutton("test");
		System.out.println(s);
	}
}