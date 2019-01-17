package Servleti;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Drasko
 */
public class pretragaosnovneLab extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
       
        String zemlja = request.getParameter("Naziv");
   
        
        try {
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekat", "root", "");
            Statement stmt = con.createStatement();
            
            String upit = "select * from osnovnaoprrema where Naziv=" + zemlja + " and arhiva=0";
            if(zemlja!=""){
                upit+= " and zemlja LIKE '%" + zemlja + "%'";
            }
            
            ResultSet rs = stmt.executeQuery(upit);
            HttpSession sesija = request.getSession(true);
            while(rs.next()){
                int id = rs.getInt("ID");
                if(id!=0){
                    sesija.setAttribute("poruka", "Rezultati pretrage:");
                    RequestDispatcher rd;
                    if(zemlja==""){
                        rd = request.getRequestDispatcher("pretragaKorisnik.jsp?idsvi="+zemlja);
                        rd.forward(request, response);
                    } else {
                        rd = request.getRequestDispatcher("pretragaKorisnik.jsp?idput="+id);
                        rd.forward(request, response);
                    }
                }
            }
            sesija.setAttribute("poruka", "Nisu dobri parametri pretrage!");
            RequestDispatcher rd = request.getRequestDispatcher("pretragaKorisnik.jsp");
            rd.forward(request, response);
        }//catch(SQLException sqlgreska){}
        catch(Exception e){ out.println(e.toString()); }
        
    }
}
