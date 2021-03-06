package ajax;

/**
 *
 * @author jefferson.lima
 */
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

public class AdicionarColaboradorController extends HttpServlet {

    int contador = 0;

    public final class Person implements Serializable {

        private String id;
        private String firstname;
        private String lastname;
        private String CPF;

        public Person() {
        }

        public Person(String id, String firstname, String lastname, String CPF) {
            this.id = id;
            this.firstname = firstname;
            this.lastname = lastname;
            this.CPF = CPF;
        }

        public String getId() {
            return this.id;
        }

        public String getCPF() {
            return this.CPF;
        }

        public String getName() {
            return this.firstname;
        }

        public void setId(String ID_) {
            this.id = ID_;
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

    public AdicionarColaboradorController() {
        if(contador > 0)
            contador = 0;
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
            contador++;
        }
        System.out.println("Impressão depois de 'sucess': " + contador);
        myObj.add("testInfo", testObj);
        PrintWriter out = response.getWriter();
        out.println(myObj.toString());
        out.close();
    }

    private Person getInfo(String personCode) {
        Person someGuy = new Person();
        Person guy1 = new Person("0", "Alisson", "Tenorio", "013.404.374-06");
        Person guy2 = new Person("1", "Adama", "Sene", "335.940.766-01");
        Person guy3 = new Person("2", "Jefferson", "Lima", "105.410.304-69");
        Person guy4 = new Person("3", "Fernanda", "Franklin", "444.747.614-21");
        Person guy5 = new Person("4", "Daniel", "Cirne", "980.299.452-99");
        Person guy6 = new Person("5", "Jon", "Jones", "261.275.414-84");
        Person guy7 = new Person("6", "Macário", "Granja", "723.141.526-11");

        List<Person> listPerson = new ArrayList<Person>();
        listPerson.add(guy1);
        listPerson.add(guy2);
        listPerson.add(guy3);
        listPerson.add(guy4);
        listPerson.add(guy5);
        listPerson.add(guy6);
        listPerson.add(guy7);

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
