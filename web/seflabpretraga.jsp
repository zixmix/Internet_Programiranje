<%-- 
    Document   : korisnik
    Created on : Jan 11, 2014, 7:26:46 PM
    Author     : Zix
--%>

<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
           <link rel="stylesheet" type="text/css" href="css\mycss.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sef Labaratorije</title>
    </head>
     <body bgcolor="#1E2F41">
         <div class="naslov">
        <h1>Dobrodosli, ${osoba.ime} ${osoba.prezime}</h1>
        Vi ste sef labaratorije.
        <br>
          <div class="menidva">
        <ul class="ul">
            <li class="li"><a href="Odjava">Odjavi se</a></li>
            <li> - </li>    
            <li><a href="PromenaLozinke">PromenaLozinke</a></li>
                </ul>
            </div>
      <p>Pretraga</p>
         </div>
        
        
        <div class="meni" align="left"> 
            <ul class="ul">
                                  <li class="li"><a href="seflabaratorije.jsp">Artikli</a></li>
                                 <li> - </li>
                                 <li><a href="seflabpretraga.jsp">Pretraga</a></li>
                                  <li> - </li>
                                 <li><a href="seflabnabavka.jsp">Nabavka</a></li>
                                  <li> - </li>
                                 <li><a href="seflabstatus.jsp">Status</a></li>
                                
                              </ul>
           
        </div>
         
        
        
<div class="pocetni">
    <%
                        HttpSession sesija = request.getSession(true);
                        String korisnickoIme = (String) sesija.getAttribute("korIme");
                    %>
    <form name="forma" method="post" action="PretragaKorisnikServlet">
                    <table width="350" border="0" align="center">
                       <%
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekat", "root", "");
                                        Statement stmt = con.createStatement();
                                         ResultSet rs;
                                        %>
                        <tr>
                            <td><label>Naziv artikal:</td></label>
                            <td><input type="text" name="naziv"></td>
                        </tr>
                        
                        <tr>
                            <td colspan="2">
                                <input type="reset" value="Ponisti">
                                <input type="submit" value="Trazi">
                            </td>
                        </tr>
                    </table>
                </form>
    </form>
       <%
                    String poruka = (String) sesija.getAttribute("poruka");
                    if (poruka != null) {
                        out.println(poruka);
                    }

                    int id = 0;
                    if (request.getParameter("naziv") != null ) {

                        if (request.getParameter("naziv") != null) {
                            id = Integer.parseInt(request.getParameter("ID"));

                            rs = stmt.executeQuery("select * from osnovnaporema where ID=" + id + " and arhiva=0");
                            out.println("<table border='1'");
                            out.println("<tr><th>Hotel</th><th>Kategorija</th><th>Tip sobe</th><th>Broj nocenja</th>"
                                    + "<th>Datum od</th><th>Datum do</th><th>Tip prevoza</th><th>Tip ishrane</th><th>Cena</th><th>Napomena</th><th>Rezervacija</th></tr>");
                            while (rs.next()) {
                                int idPut = rs.getInt("ID");
                                String hotel = rs.getString("Naziv");
                                
                                out.println("<tr><td>" + hotel+" <td></tr>");
                            }
                            out.println("</table>");
                        } 
                        
                            out.println("</table>");
                        }


                    
                %>
  </div>


        <div class="footer" >
            @Copyright Informacioni sistem za labaratorije srednjih skola;
        </div>
    </body>
</html>
