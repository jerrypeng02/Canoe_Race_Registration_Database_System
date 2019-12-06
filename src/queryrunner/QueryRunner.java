/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package queryrunner;

import java.util.ArrayList;
import java.util.Scanner;

/**
 * 
 * QueryRunner takes a list of Queries that are initialized in it's constructor
 * and provides functions that will call the various functions in the QueryJDBC class 
 * which will enable MYSQL queries to be executed. It also has functions to provide the
 * returned data from the Queries. Currently the eventHandlers in QueryFrame call these
 * functions in order to run the Queries.
 */
public class QueryRunner {

    
    public QueryRunner()
    {
        this.m_jdbcData = new QueryJDBC();
        m_updateAmount = 0;
        m_queryArray = new ArrayList<>();
        m_error="";
    
        
        // TODO - You will need to change the queries below to match your queries.
        
        // You will need to put your Project Application in the below variable
        
        this.m_projectTeamApplication="RaceLog";    // THIS NEEDS TO CHANGE FOR YOUR APPLICATION
        
        // Each row that is added to m_queryArray is a separate query. It does not work on Stored procedure calls.
        // The 'new' Java keyword is a way of initializing the data that will be added to QueryArray. Please do not change
        // Format for each row of m_queryArray is: (QueryText, ParamaterLabelArray[], LikeParameterArray[], IsItActionQuery, IsItParameterQuery)
        
        //    QueryText is a String that represents your query. It can be anything but Stored Procedure
        //    Parameter Label Array  (e.g. Put in null if there is no Parameters in your query, otherwise put in the Parameter Names)
        //    LikeParameter Array  is an array I regret having to add, but it is necessary to tell QueryRunner which parameter has a LIKE Clause. If you have no parameters, put in null. Otherwise put in false for parameters that don't use 'like' and true for ones that do.
        //    IsItActionQuery (e.g. Mark it true if it is, otherwise false)
        //    IsItParameterQuery (e.g.Mark it true if it is, otherwise false)
        
        // List all race names
        m_queryArray.add(new QueryData("SELECT RACE_NAME FROM racelog.race", null, null, false, false));
        
        // add a registration
        m_queryArray.add(new QueryData("INSERT INTO REGISTRATION (TEAM_NAME, CATEGORY, DIVISION, COURSE, CLUB_NAME, CANOE_NUM, RACE_NAME, PAID_FEE ) "
        								+ "values (?,?,?,?,?,?,?,?)",
        		new String [] {"Team Name", "Category", "Division", "Course", "Club Name", "Canoe Number", "Race Name", "Paid Fee? 1 for yes, 0 for no"}, new boolean [] {false, false}, true, true));
        
        // Show unpaid teams by club for a given race (supply race name)
        m_queryArray.add(new QueryData("SELECT DISTINCT CLUB_NAME, TEAM_NAME, PAID_FEE\n" + 
						        		"FROM racelog.registration\n" + 
						        		"WHERE PAID_FEE = FALSE\n" + 
						        		"AND RACE_NAME LIKE ?\n" +
						        		"ORDER BY CLUB_NAME, TEAM_NAME;",
						        		new String [] {"RACE_NAME"}, new boolean [] {true},  false, true)); 
        
        // List all team names and canoe descriptions for a given race
        m_queryArray.add(new QueryData("SELECT reg.CLUB_NAME, TEAM_NAME, TEAM_NUM, can.CANOE_NUM, CANOE_HULL_COLOR, CANOE_GUNWALE_COLOR  \n " +
        							   "FROM racelog.registration reg \n" +
        							   "JOIN racelog.canoe can \n" +
        							   "ON reg.CANOE_NUM = can.CANOE_NUM \n" +
        							   "WHERE RACE_NAME LIKE ? \n" +
        							   "ORDER BY TEAM_NUM",
        							   new String [] {"RACE_NAME"}, new boolean [] {true},  false, true)); 
        
        // add a race result by team number (team numbers are unique to a race)
        m_queryArray.add(new QueryData("INSERT INTO RACE_TIME (TEAM_NUM, TIME_IN_SECONDS) values (?,?)",
        		new String [] {"TEAM_NUM", "TIME_IN_SECONDS"}, new boolean [] {false, false}, true, true));
        
        // Show winning 1st place teams for a given race
        m_queryArray.add(new QueryData("SELECT reg.RACE_NAME, reg.TEAM_NAME, res.CATEGORY, res.DIVISION, PLACE \n" + 
						        		"FROM racelog.registration reg, racelog.race_result res \n" + 
						        		"WHERE reg.TEAM_NUM = res.TEAM_NUM \n" + 
						        		"AND reg.RACE_NAME like ? \n" + 
						        		"AND PLACE =  1 " + 
						        		"ORDER BY CATEGORY, DIVISION; \n" ,
        							   new String [] {"RACE_NAME"}, new boolean [] {true},  false, true)); 
        
        // show all results for a team (supply race and team)
        m_queryArray.add(new QueryData("SELECT reg.RACE_NAME, reg.CLUB_NAME, reg.TEAM_NAME, res.CATEGORY, res.DIVISION, res.COURSE, PLACE\r\n" + 
						        		"FROM racelog.registration reg, racelog.race_result res \n" + 
						        		"WHERE reg.TEAM_NUM = res.TEAM_NUM \n" + 
						        		"AND reg.RACE_NAME LIKE ? \n" + 
						        		"AND reg.TEAM_NAME LIKE ? \n" + 
						        		"ORDER BY RACE_NAME, TEAM_NAME; \n"
						        	    , new String [] {"Race Name", "Team Name" }, new boolean [] {true, true}, false, true));
                       
    }
       

    public int GetTotalQueries()
    {
        return m_queryArray.size();
    }
    
    public int GetParameterAmtForQuery(int queryChoice)
    {
        QueryData e=m_queryArray.get(queryChoice);
        return e.GetParmAmount();
    }
              
    public String  GetParamText(int queryChoice, int parmnum )
    {
       QueryData e=m_queryArray.get(queryChoice);        
       return e.GetParamText(parmnum); 
    }   

    public String GetQueryText(int queryChoice)
    {
        QueryData e=m_queryArray.get(queryChoice);
        return e.GetQueryString();        
    }
    
    /**
     * Function will return how many rows were updated as a result
     * of the update query
     * @return Returns how many rows were updated
     */
    
    public int GetUpdateAmount()
    {
        return m_updateAmount;
    }
    
    /**
     * Function will return ALL of the Column Headers from the query
     * @return Returns array of column headers
     */
    public String [] GetQueryHeaders()
    {
        return m_jdbcData.GetHeaders();
    }
    
    /**
     * After the query has been run, all of the data has been captured into
     * a multi-dimensional string array which contains all the row's. For each
     * row it also has all the column data. It is in string format
     * @return multi-dimensional array of String data based on the resultset 
     * from the query
     */
    public String[][] GetQueryData()
    {
        return m_jdbcData.GetData();
    }

    public String GetProjectTeamApplication()
    {
        return m_projectTeamApplication;        
    }
    public boolean  isActionQuery (int queryChoice)
    {
        QueryData e=m_queryArray.get(queryChoice);
        return e.IsQueryAction();
    }
    
    public boolean isParameterQuery(int queryChoice)
    {
        QueryData e=m_queryArray.get(queryChoice);
        return e.IsQueryParm();
    }
    
     
    public boolean ExecuteQuery(int queryChoice, String [] parms)
    {
        boolean bOK = true;
        QueryData e=m_queryArray.get(queryChoice);        
        bOK = m_jdbcData.ExecuteQuery(e.GetQueryString(), parms, e.GetAllLikeParams());
        return bOK;
    }
    
     public boolean ExecuteUpdate(int queryChoice, String [] parms)
    {
        boolean bOK = true;
        QueryData e=m_queryArray.get(queryChoice);        
        bOK = m_jdbcData.ExecuteUpdate(e.GetQueryString(), parms);
        m_updateAmount = m_jdbcData.GetUpdateCount();
        return bOK;
    }   
    
      
    public boolean Connect(String szHost, String szUser, String szPass, String szDatabase)
    {
//    	szHost = "127.0.0.1";
//    	szUser = "root";
//    	szDatabase = "racelog";

        boolean bConnect = m_jdbcData.ConnectToDatabase(szHost, szUser, szPass, szDatabase);
        if (bConnect == false)
            m_error = m_jdbcData.GetError();        
        return bConnect;
    }
    
    public boolean Disconnect()
    {
        // Disconnect the JDBCData Object
        boolean bConnect = m_jdbcData.CloseDatabase();
        if (bConnect == false)
            m_error = m_jdbcData.GetError();
        return true;
    }
    
    public String GetError()
    {
        return m_error;
    }
 
    private QueryJDBC m_jdbcData;
    private String m_error;    
    private String m_projectTeamApplication;
    private ArrayList<QueryData> m_queryArray;  
    private int m_updateAmount;
            
    /**
     * @param args the command line arguments
     */
    

    
    public static void main(String[] args) {
        // TODO code application logic here

        final QueryRunner queryrunner = new QueryRunner();
        
        if (args.length == 0)
        {
            java.awt.EventQueue.invokeLater(new Runnable() {
                public void run() {

                    new QueryFrame(queryrunner).setVisible(true);
                }            
            });
        }
        else
        {
            if (args[0].equals ("-console"))
            {
            	//System.out.println("Nothing has been implemented yet. Please implement the necessary code");
            	Scanner s = new Scanner(System.in);
            	System.out.print("Host: ");
            	String host = s.nextLine();
            	System.out.print("User: ");
            	String user = s.nextLine();
            	System.out.print("Password: ");
            	String pass = s.nextLine();
            	System.out.print("Database: ");
            	String db = s.nextLine();
            	if(!queryrunner.Connect(host, user, pass, db)) {
            		System.out.println(queryrunner.GetError());
            		s.close();
            		return;
            	}
            	int total = queryrunner.GetTotalQueries();
            	for(int i = 0; i < total; i++) {
            		System.out.println("Query " + i);
            		if(queryrunner.isParameterQuery(i)) {
            			int amt = queryrunner.GetParameterAmtForQuery(i);
            			String[] paramArray = new String[amt];
            			for(int j = 0; j < amt; j++) {
            				String param = queryrunner.GetParamText(i, j);
            				System.out.print("Enter value for parameter " + param + ": ");
            				String paramValue = s.nextLine();
            				paramArray[j] = paramValue;
            			}
            			if(queryrunner.isActionQuery(i)) {
            				queryrunner.ExecuteUpdate(i, paramArray);
            				int row = queryrunner.GetUpdateAmount();
            				System.out.println(row + " row(s) affected");
            			} else {
            				queryrunner.ExecuteQuery(i, paramArray);
            				String[] queryHeader = queryrunner.GetQueryHeaders();
            				String[][] queryData = queryrunner.GetQueryData();
            				for(int m = 0; m < queryData.length; m++) {
            					for(int n = 0; n < queryData[0].length; n++) {
            						System.out.print(queryHeader[n] + ": ");
            						System.out.print(queryData[m][n]);
            						System.out.println();
            					}
            					System.out.println();
            				}
            			}
            		}
            		System.out.println();
            	}
            	s.close();
            	queryrunner.Disconnect();
                // TODO 
                // You should code the following functionality:

                //    You need to determine if it is a parameter query. If it is, then
                //    you will need to ask the user to put in the values for the Parameters in your query
                //    you will then call ExecuteQuery or ExecuteUpdate (depending on whether it is an action query or regular query)
                //    if it is a regular query, you should then get the data by calling GetQueryData. You should then display this
                //    output. 
                //    If it is an action query, you will tell how many row's were affected by it.
                // 
                //    This is Psuedo Code for the task:  
                //    Connect()
                //    n = GetTotalQueries()
                //    for (i=0;i < n; i++)
                //    {
                //       Is it a query that Has Parameters
                //       Then
                //           amt = find out how many parameters it has
                //           Create a paramter array of strings for that amount
                //           for (j=0; j< amt; j++)
                //              Get The Paramater Label for Query and print it to console. Ask the user to enter a value
                //              Take the value you got and put it into your parameter array
                //           If it is an Action Query then
                //              call ExecuteUpdate to run the Query
                //              call GetUpdateAmount to find out how many rows were affected, and print that value
                //           else
                //               call ExecuteQuery 
                //               call GetQueryData to get the results back
                //               print out all the results
                //           end if
                //      }
                //    Disconnect()


                // NOTE - IF THERE ARE ANY ERRORS, please print the Error output
                // NOTE - The QueryRunner functions call the various JDBC Functions that are in QueryJDBC. If you would rather code JDBC
                // functions directly, you can choose to do that. It will be harder, but that is your option.
                // NOTE - You can look at the QueryRunner API calls that are in QueryFrame.java for assistance. You should not have to 
                //    alter any code in QueryJDBC, QueryData, or QueryFrame to make this work.
//                System.out.println("Please write the non-gui functionality");
                
            }
        }
    }    
}
