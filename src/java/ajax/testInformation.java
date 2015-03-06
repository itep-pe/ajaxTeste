package ajax;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class testInformation extends HttpServlet {

    public final class Person implements Serializable {

        private String firstname = null;
        private String lastname = null;
        private String CPF = null;

        public Person() {
            //firstname="cara";
            //lastname="maneiro";
        }

        public String getCPF() {
            return this.CPF;
        }

        public String getName() {
            return this.firstname;
        }

        public void setFirstName(String firstname_) {
            this.firstname = firstname_;
        }

        public void setCPF(String CPF_) {
            this.CPF = CPF_;
        }

        public void setLastName(String lastname_) {
            this.lastname = lastname_;
        }
    }

    private static final long serialVersionUID = 1L;

    public testInformation() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String personCode = request.getParameter("personCode");

        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        response.setHeader("Cache-control", "no-cache, no-store");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "-1");

        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "POST");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
        response.setHeader("Access-Control-Max-Age", "86400");

        //System.out.print("Sa�da Padr�o ");
        //Gson gson = new Gson(); 
        JsonObject myObj = new JsonObject();

        Person testInfo = getInfo(personCode);
        //boolean existCPFInDB = checkIfCPFexistInDB(personCode);
        System.out.print("test");
        System.out.print(personCode);
        System.out.print("test");
        //System.out.println(testInfo.getName());

        Gson gson = new Gson();
        JsonElement je = gson.toJsonTree(testInfo);
        JsonObject jo = new JsonObject();
        jo.add("PersonRoot", je);

        JsonElement testObj = gson.toJsonTree(testInfo);
        if (testInfo.getName() == null) {
            myObj.addProperty("success", false);
        } else {
            myObj.addProperty("success", true);
        }

        /*if(existCPFInDB){
         myObj.addProperty("success", true);
         }
         else {
         myObj.addProperty("success", false);
         }*/
        myObj.add("testInfo", testObj);
        System.out.println("\n myObj to string: \n");
        out.println(myObj.toString());

        System.out.println("\n myObj to string: \n");
        System.out.print(myObj.toString());

        out.close();

    }

    private boolean checkIfCPFexistInDB(String personCode) {
        boolean test = false;
        try {

            if (personCode.equals("013.404.374-06")) {
                test = true;
            } else if (personCode.equals("054.534.494-89")) {
                test = true;
            } else {
                test = false;
            }
        } catch (Exception e) {
            System.out.println("\nException testInformation: \n");
            System.out.println(e);
        } finally {

        }
        return test;
    }

    ;
    
    //Get c Information
    private Person getInfo(String personCode) {
        Person someGuy = new Person();
        System.out.println("\n");
        System.out.println("personCode - Codigo da pessoa getInfo: ");
        System.out.println(personCode);
        System.out.println("\n");
        try {
            /*if (personCode.equals("Macario"))
             {
             someGuy.setFirstName("Macario");
             someGuy.setLastName("Granja");
             } else if(personCode.equals("Adama")) {
             someGuy.setFirstName("Adama");
             someGuy.setLastName("Sene");
             } else {
             //Do Nothing
             }*/

            if (personCode.equals("013.404.374-06")) {
                someGuy.setFirstName("Alisson");
                someGuy.setLastName("Tenorio");
                someGuy.setCPF("013.404.374-06");
            } else if (personCode.equals("335.940.766-01")) {
                someGuy.setFirstName("Adama");
                someGuy.setLastName("Sene");
                someGuy.setCPF("335.940.766-01");
            } else {
                //Do Nothing
            }
        } catch (Exception e) {
            System.out.println("\nException getInfo: \n");
            System.out.println(e);
        } finally {

        }
        if (someGuy.getName() != null) {
            System.out.println("\n someGuy.getName(): \n");
            System.out.println(someGuy.getName());

        }
        return someGuy;
    }
;

    //Get Country Information
    /*private Country getInfo(String countryCode) {
 
 Country country = new Country();
 Connection conn = null;            
 PreparedStatement stmt = null;     
 String sql = null;
 
 try {      
 Context ctx = (Context) new InitialContext().lookup("java:comp/env");
 conn = ((DataSource) ctx.lookup("jdbc/mysql")).getConnection(); 
 
 sql = "Select * from COUNTRY where code = ?"; 
 stmt = conn.prepareStatement(sql);
 stmt.setString(1, countryCode.trim());
 ResultSet rs = stmt.executeQuery(); 
 
 while(rs.next()){ 
 country.setCode(rs.getString("code").trim());
 country.setName(rs.getString("name").trim());
 country.setContinent(rs.getString("continent").trim());
 country.setRegion(rs.getString("region").trim());
 country.setLifeExpectancy(rs.getString("lifeExpectancy") == null ? new Double(0) : Double.parseDouble(rs.getString("lifeExpectancy").trim()));
 country.setGnp(rs.getString("gnp") == null ? new Double(0)  : Double.parseDouble(rs.getString("gnp").trim()));
 }                                                                         
 
 rs.close();                                                               
 stmt.close();                                                             
 stmt = null;                                                              
 
 
 conn.close();                                                             
 conn = null;                                                   
 
 }                                                               
 catch(Exception e){System.out.println(e);}                      
 
 finally {                                                       
  
 if (stmt != null) {                                            
 try {                                                         
 stmt.close();                                                
 } catch (SQLException sqlex) {                                
 // ignore -- as we can't do anything about it here           
 }                                                             
 
 stmt = null;                                            
 }                                                        
 
 if (conn != null) {                                      
 try {                                                   
 conn.close();                                          
 } catch (SQLException sqlex) {                          
 // ignore -- as we can't do anything about it here     
 }                                                       
 
 conn = null;                                            
 }                                                        
 }              
 
 return country;
 
 }   */
}
