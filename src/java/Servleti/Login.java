package Servleti;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Binovi.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String username = request.getParameter("kime");
        String password = request.getParameter("pass");
        Binovi b = new Binovi(); 
        b.setKorisnickoIme(username);
        b.setPassword(password);
               String greska="";
                    //boolean prazno=false; 
        
        try {
            HttpSession sesija=request.getSession();
            Class.forName("com.mysql.jdbc.Driver");
            Connection konekcija= DriverManager.getConnection("jdbc:mysql://localhost:3306/projekat", "root", "");
            Statement iskaz=konekcija.createStatement();
            if(!"".equals(username)&&!"".equals(password))
            {   
                String upit= "SELECT * FROM korisnici WHERE KorisnickoIme='"+username+"' AND Password='"+password+"'";
                ResultSet rezultat= iskaz.executeQuery(upit);
                if(rezultat.next())
                {
                    String ime=rezultat.getString("Ime");
                    String prezime=rezultat.getString("Prezime");
                    String nivo=rezultat.getString("nivo");
                    String status=rezultat.getString("status");
                    b.setIme(ime);
                    b.setPrezime(prezime);
                    b.setNivo(nivo);
                    b.setStatus(status);
                    sesija.setAttribute("korisnici",b);
                  
                    switch (nivo) 
                    {
                        case "1":
                           RequestDispatcher r1= request.getRequestDispatcher("admin.jsp");
                            r1.forward(request, response);
                            break;
                        case "2":
                            RequestDispatcher r2= request.getRequestDispatcher("seflabaratorije.jsp");
                            r2.forward(request, response);
                            break;
                        case "3":
                            RequestDispatcher r3= request.getRequestDispatcher("sefmagacina.jsp");
                            r3.forward(request, response);
                            break;           
                    }
                    
                
                }
                else
                {
                    RequestDispatcher r= request.getRequestDispatcher("prijava.jsp");
                        r.forward(request, response);
                       out.println("sadasdasd");
                        greska = "<span class=\"greska\">PogreÅ¡no korisniÄ�ko ime ili lozinka! Proverite podatke ili se registrujte! </span>";
                }
                
                
                
            }
                   
            
        } catch(IOException | ClassNotFoundException | SQLException | ServletException e) {            
                greska="Doslo je do greske! Pokusajte ponovo!";
		

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
        processRequest(request, response);
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
        processRequest(request, response);
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
