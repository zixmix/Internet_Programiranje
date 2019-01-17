
package Servleti;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Zix
 */
public class PromenaLozinke extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
       
        
        
        
        String username=request.getParameter("kime");
        String password=request.getParameter("pass");
        String newpass=request.getParameter("newpass");
        try {
            Class.forName("com.mysql.jdbc.Driver");
                Connection konekcija = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekat","root","");
            Statement iskaz=konekcija.createStatement();
            
            
            ResultSet upit = iskaz.executeQuery("SELECT * FROM korisnici WHERE KorisnickoIme='"+username+"' AND Password='"+password+"'");
            boolean provera=false;
            while(upit.next()){
                    String korime=request.getParameter("kime");
                    String newpass2=request.getParameter("pass");
            
            
            if (korime.equals(username)&& newpass2.equals(password))
                { 
                    Statement iskaz2=konekcija.createStatement();
                    iskaz2.executeUpdate("UPDATE korisnici SET Password='"+newpass+"' WHERE KorisnickoIme='"+username+"' AND Password='"+password+"'");
              } 
             provera=true;
            }
           
            if(provera == false)
            {
                   RequestDispatcher rd;
                   rd = request.getRequestDispatcher("/promenalozinke.jsp");
                   rd.forward(request, response);
                   out.println("Niste uneli lepo lozinku!");
             }
            else
            {
                   RequestDispatcher rd;
                   rd = request.getRequestDispatcher("/prijava.jsp");
                   rd.forward(request, response);
                    out.println("Uspesno ste promenili lozinku!");
                   
            }
            
            
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(PromenaLozinke.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

   // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PromenaLozinke.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(PromenaLozinke.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PromenaLozinke.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(PromenaLozinke.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
