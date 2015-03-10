package ajax;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
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
        }

        public Person(String firstname, String lastname, String CPF) {
            this.firstname = firstname;
            this.lastname = lastname;
            this.CPF = CPF;
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

        JsonObject myObj = new JsonObject();
        Person testInfo = getInfo(personCode);

        System.out.print("test");
        System.out.print(personCode);
        System.out.print("test");

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

        myObj.add("testInfo", testObj);
        System.out.println("\n myObj to string: \n");
        out.println(myObj.toString());

        System.out.println("\n myObj to string: \n");
        System.out.print(myObj.toString());

        out.close();
    }

//    private boolean checkIfCPFexistInDB(String personCode) {
//        boolean test = false;
//
//        try {
//            if (personCode.equals("013.404.374-06")) {
//                test = true;
//            } else if (personCode.equals("054.534.494-89")) {
//                test = true;
//            } else {
//                test = false;
//            }
//        } catch (Exception e) {
//            System.out.println("\nException testInformation: \n");
//            System.out.println(e);
//        }
//        return test;
//    }
    private Person getInfo(String personCode) {
        Person someGuy = new Person();
        Person guy1 = new Person("Alisson", "Tenorio", "013.404.374-06");
        Person guy2 = new Person("Adama", "Sene", "335.940.766-01");

        System.out.println("\n");
        System.out.println("personCode - Codigo da pessoa getInfo: ");
        System.out.println(personCode);
        System.out.println("\n");

        List<Person> listPerson = new ArrayList<Person>();

        listPerson.add(guy1);
        listPerson.add(guy2);

        try {
            for (int i = 0; i < listPerson.size(); i++) {
                if (listPerson.get(i).getName().equals(personCode) || listPerson.get(i).getName().toLowerCase().equals(personCode) || listPerson.get(i).getName().toUpperCase().equals(personCode)) {
                    return listPerson.get(i);
                }
            }

//            if (personCode.equals("Alisson") || personCode.equals("alisson"))
//             {
//             someGuy.setFirstName("Alisson");
//             someGuy.setLastName("Tenorio");
//             someGuy.setCPF("013.404.374-06");
//             } else if(personCode.equals("Adama") || personCode.equals("adama")) {
//             someGuy.setFirstName("Adama");             
//             someGuy.setLastName("Sene");
//             someGuy.setCPF("335.940.766-01");
//             } else {
//             //Do Nothing
//             }
//            if (personCode.equals("013.404.374-06")) {
//                someGuy.setFirstName("Alisson");
//                someGuy.setLastName("Tenorio");
//                someGuy.setCPF("013.404.374-06");
//            } else if (personCode.equals("335.940.766-01")) {
//                someGuy.setFirstName("Adama");
//                someGuy.setLastName("Sene");
//                someGuy.setCPF("335.940.766-01");
//            } else {
//                //Do Nothing
//            }
        } catch (Exception e) {
            System.out.println("\nException getInfo: \n");
            System.out.println(e);
        }
        if (someGuy.getName() != null) {
            System.out.println("\n someGuy.getName(): \n");
            System.out.println(someGuy.getName());

        }
        return someGuy;
    }
}
