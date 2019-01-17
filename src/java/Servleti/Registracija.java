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


//@WebServlet(name="registracija", urlPatterns={"/registracija"})

public class Registracija extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
                String Ime              = request.getParameter("Ime");
                String Prezime          = request.getParameter("Prezime");
                String KorisnickoIme    = request.getParameter("KorisnickoIme");
                String Password         = request.getParameter("Password");
                String Password2        = request.getParameter("Password2");
                String Adresa           = request.getParameter("Adresa"); 
                String Telefon          = request.getParameter("Telefon");
                String email            = request.getParameter("email"); 
                String status           = request.getParameter("status"); 
                String nivo             = request.getParameter("nivo");
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection konekcija = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekat", "root","");
             Statement izjava = konekcija.createStatement();
            
        
            ResultSet rs = izjava.executeQuery("SELECT * FROM korisnici");
            petlja:
            while(rs.next()){
                String username = rs.getString("KorisnickoIme");
                
                if(username.equals(KorisnickoIme)){
                    //out.println(username);
                    out.println("Korisnicko ime vec postoji u bazi, pokusajte ponovo!");
                    out.println("<a href=\"registracija.jsp\">Vrati se na registraciju.</a>");
                    
                }
                else
                {
                    
                    Statement izjava2 = konekcija.createStatement();
                    izjava2.executeUpdate("INSERT INTO korisnici(Ime,Prezime,KorisnickoIme,Password,Password2,Adresa,Telefon,email,status,nivo) " + "VALUES('"+Ime+"','"+Prezime+"','"+KorisnickoIme+"','"+Password+"','"+Password2+"','"+Adresa+"','"+Telefon+"','"+email+"','"+status+"','"+nivo+"')");
                   
                    RequestDispatcher r= request.getRequestDispatcher("prijava.jsp");
                        r.forward(request, response);
                         out.println("Uspesno ste se prijavili");
                    break petlja;
                   
                }
            }
            izjava.close();
                konekcija.close();
         
        }catch (Exception ex)
            { out.println(ex.toString()); }
            
        
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
