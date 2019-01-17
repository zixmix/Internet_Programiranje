<%-- 
    Document   : admin
    Created on : Jan 11, 2014, 7:26:27 PM
    Author     : Zix
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css\mycss.css">
        
     <script type="text/javascript" language="javascript">

    function provera_polja(polje,poruka)
    {
        with (polje) {
            var uzorak = /\d/;
            if(!(uzorak.test(value))){
                alert(poruka);
                return false;
            }else {
             return true;
            }
        }
    }
   
    
    


   

    function obavezno_polje(polje,poruka)
    {
        with (polje) {
            if (value==null||value=="") {
                alert(poruka);return false;
            }else {
             return true;
            }
        }
    }

   
    function provera_forme(forma)
    {
        with (forma)
        {
            if (obavezno_polje(id,"Niste uneli ime!")==false)
            {
                id.focus();
                return false;
            }
            if (provera_polja(id,"Niste uneli prezime!")==false)
            {
                id.focus();
                return false;
            }
            if (obavezno_polje(naziv,"Niste uneli korisniÄko ime!")==false)
            {
                naziv.focus();
                return false;
            }
            if (provera_polja(naziv,"Niste uneli lozinku!")==false)
            {
                naziv.focus();
                return false;
            }
            if (obavezno_polje(kvadratura,"Niste ponovili lozinku!")==false)
            {
                kvadratura.focus();
                return false;
            }
          
            if (provera_polja(kvadratura,"Niste ispravno uneli Adresu!")==false)
            {
                kvadratura.focus();
                return false;
            }
            if (obavezno_polje(brm,"Niste uneli telefon!")==false)
            {
                brm.focus();
                return false;
            }
            if (provera_polja(brm,"Telefon nije u ispravnom formatu!")==false)
            {
                brm.focus();
                return false;
            }
        }   
        
    }

</script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Labaratorije</title>
        <
    </head>
    <body bgcolor="#1E2F41">
        <div class="naslov">
        <h1>Dobrodosli, ${osoba.ime} ${osoba.prezime}</h1>
        
        Vi ste administrator.
        <br>
        <div class="menidva">
        <ul class="ul">
            <li class="li"><a href="Odjava">Odjavi se</a></li>
            <li> - </li>    
            <li><a href="PromenaLozinke">PromenaLozinke</a></li>
                </ul>
            </div>
        </div>
        <div class="meni"> 
            <ul class="ul">
                                <li class="li"><a href="admin.jsp">Korisnici</a></li>
                                 <li> - </li>
                                 <li><a href="labaratorije.jsp">Labaratorije</a></li>
                                
                                 
                              
                              </ul>
           
        </div>
          <div class="korisnici">
           <form method="post">
               
<table border="1" width="100%" height="100%">
    <br>
    <h1>  Labaratorije:</h1>
<tr><th>ID</th><th>Naziv</th><th>Kvadratura</th><th>Broj Radnih Mesta</th></tr>
<%
    
    
    try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekat", "root","");
        
        Statement st = conn.createStatement();
        
        String upit = "SELECT * FROM labaratorije";
        ResultSet rs = st.executeQuery(upit);
                        while (rs.next()) {
                            String id = rs.getString("idLabaratorije");
                            String naziv = rs.getString("Naziv");
                            String kvadratura = rs.getString("Kvadratura");
                            String rad = rs.getString("BrojRadnihMesta");
                            

                           

                    %>
        
            
        

<tr>
    <td><%=rs.getString("idLabaratorije")%></td>
    <td><%=rs.getString("Naziv")%></td>
    <td><%=rs.getString("Kvadratura")%></td>
    <td><%=rs.getString("BrojRadnihMesta")%></td>
   
</tr>


<%

%>
<%
}
}
catch(Exception ex){}
%>
</table>
</form>
<form name="formaa" action="dodajlab" method="post" onsubmit="return provera_forme(this)">
    <h1>     Dodjaj Labaratoriju:</h1>
    <table alig="centre">
        <tr>
            <td>
                ID:
            </td>
            <td>
        <input type="text" name="id">
        </td>
        </tr>
        <tr>
            <td>
                Naziv:
            </td>
            <td>
        <input type="text" name="naziv"></td>
        </tr>
        <tr>
            <td>
                Kvadratura:
            </td><td>
        <input type="text" name="kvadratura"></td>
        </tr>
        <tr>
            <td>
                Broj Rdnih Mesta:
            </td><td>
        <input type="text" name="brm"></td>
        </tr>
        <tr>
                      <td>
                          <input type="submit" class="dugme" value="Dodaj">    
                      </td>
                    </tr>
    </table>

</form>
          </div>
<div class="korisnici2">
    <br>
<form name="2">
<table border="1" width="100%" height="100%">
    <br>
    <h1>Proizvodjaci:</h1>
<tr><th>ID</th><th>Naziv</th><th>Adresa</th><th>Telefon</th><th>Email</th><th>Kontakt</th><th>Spisak</th></tr>
<%
    
    
    try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekat", "root","");
        
        Statement st = conn.createStatement();
        
        String upit = "SELECT * FROM proizvodjac";
        ResultSet rs = st.executeQuery(upit);
                        while (rs.next()) {
                            String id = rs.getString("ID");
                            String naziv = rs.getString("Naziv");
                            String adresa = rs.getString("Adresa");
                            String telefon = rs.getString("Telefon");
                            String email = rs.getString("Email");
                            String kontakt = rs.getString("Kontakt");
                            String spisak = rs.getString("Spisak");
                            

                           

                    %>
<tr>
    <td><%=rs.getString("ID")%></td>
    <td><%=rs.getString("Naziv")%></td>
    <td><%=rs.getString("Adresa")%></td>
    <td><%=rs.getString("Telefon")%></td>
      <td><%=rs.getString("Email")%></td>
    <td><%=rs.getString("Kontakt")%></td>
    <td><%=rs.getString("Spisak")%></td>
   
</tr>
</table>
</form>
<%

%>
<%
}
}
catch(Exception ex){}
%>
</table>
</form>
<br>
<form name="formaa" action="dodajpro" method="post" onsubmit="return provera_forme(this)">
    <h1>     Dodjaj Proizvodjaca:</h1>
    <table alig="centre">
        <tr>
            <td>
                ID:
            </td>
            <td>
        <input type="text" name="idpro">
        </td>
        </tr>
        <tr>
            <td>
                Naziv:
            </td>
            <td>
        <input type="text" name="nazivpro"></td>
        </tr>
        <tr>
            <td>
                Adresa:
            </td><td>
        <input type="text" name="adresapro"></td>
        </tr>
        <tr>
            <td>
              Telefon:
            </td><td>
        <input type="text" name="telefonpro"></td>
        </tr>
        <tr>
            <td>
                Email:
            </td>
            <td>
        <input type="text" name="email">
        </td>
        </tr>
        <tr>
            <td>
                Kontakt:
            </td>
            <td>
        <input type="text" name="kontakt"></td>
        </tr>
        <tr>
            <td>
                Spisak:
            </td><td>
        <input type="text" name="spisak"></td>
        </tr>
        
        <tr>
                      <td>
                          <input type="submit" class="dugme" value="Dodaj">    
                      </td>
                    </tr>
    </table>

</form>
          </div>

        <div class="footer" >
            @Copyright Informacioni sistem za labaratorije srednjih skola;
        </div>
        </body>
</html>
