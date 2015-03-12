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

        response.setContentType("text/html");
        response.setHeader("Cache-control", "no-cache, no-store");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "-1");
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "POST");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
        response.setHeader("Access-Control-Max-Age", "86400");

        Person testInfo = getInfo(personCode);
        JsonObject myObj = new JsonObject();
        Gson gson = new Gson();
        JsonElement testObj = gson.toJsonTree(testInfo);

        if (testInfo.getName() == null) {
            myObj.addProperty("success", false);
        } else {
            myObj.addProperty("success", true);
        }

        myObj.add("testInfo", testObj);
        PrintWriter out = response.getWriter();
        out.println(myObj.toString());
        out.close();
    }

    private Person getInfo(String personCode) {
        Person someGuy = new Person();
        Person guy1 = new Person("Alisson", "Tenorio", "013.404.374-06");
        Person guy2 = new Person("Adama", "Sene", "335.940.766-01");

        List<Person> listPerson = new ArrayList<Person>();
        listPerson.add(guy1);
        listPerson.add(guy2);

        try {
            for (int i = 0; i < listPerson.size(); i++) {
                if (listPerson.get(i).getName().toUpperCase().equals(personCode.toUpperCase())) {
                    someGuy = listPerson.get(i);
                }
            }
        } catch (Exception e) {
            System.out.println("\nException getInfo: \n");
            System.out.println(e);
        }
        return someGuy;
    }
}
