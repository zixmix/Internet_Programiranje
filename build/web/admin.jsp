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
        
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adinistrator</title>
        <script language="javascript">
function prikazi(KorisnickoIme)
{
    var f=document.form;
    f.method="post";
    f.action='prikaziAdmin.jsp?KorisnickoIme='+KorisnickoIme;
    f.submit();
}
</script>
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
              
              <br>
              <table width="100%" height="44" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td><h1 align="center" class="naslov">Korisnici</h1></td>
      </tr>
    </table>
	<br>
        <form method="post">
<table border="1" width="100%" height="100%">
<tr><th>Ime</th><th>Prezime</th><th>KorisnickoIme</th><th>Adresa</th><th>Telefon</th><th>status</th><th>nivo</th></tr>
<%
    
    
    try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekat", "root","");
        
        Statement st = conn.createStatement();
        if (request.getParameter("idKorisnika") != null && request.getParameter("akcija") != null)
        {
                            String idKorisnika=request.getParameter("idKorisnika");
                            String akcija = request.getParameter("akcija");
                            
                            if (akcija.equals("deaktiviraj"))
                            {
                                st.executeUpdate("UPDATE korisnici SET status=0 WHERE idKorisnika=" + idKorisnika);
                               
                            } 
                            else if (akcija.equals("aktiviraj")) {
                                st.executeUpdate("UPDATE korisnici SET status=1 WHERE idKorisnika=" + idKorisnika);
                            }
                        }
        String upit = "SELECT * FROM korisnici";
        ResultSet rs = st.executeQuery(upit);
                        while (rs.next()) {
                            String id = rs.getString("idKorisnika");
                            String status = rs.getString("status");
                            String statusFull = "";
                            String nivopristupa = rs.getString("nivo");
                            String nivoFull = "";

                            if (nivopristupa.equals("1"))
                            {
                                nivoFull = "Administrator";
                            } 
                            else if (nivopristupa.equals("2"))
                            {
                                nivoFull = "sef labaratorije";
                            }
                            else if (nivopristupa.equals("3")) 
                            {
                                nivoFull = "sef magacina";
                            } 
                            if (status.equals("0"))
                            {
                                statusFull = "<a href=\"admin.jsp?akcija=aktiviraj&idKorisnika=" + id + "\" class=\"aktiviraj\" title=\"Aktiviraj korisnika!\">Aktiviraj</a>";
                            } 
                            else if (status.equals("1"))
                            {
                              statusFull = "<a href=\"admin.jsp?akcija=deaktiviraj&idKorisnika=" + id + "\" class=\"deaktiviraj\" title=\"Deaktiviraj korisnika!\">Deaktiviraj</a>";
                            }

                    %>
        
            
        

<tr>
    <td><%=rs.getString("Ime")%></td>
    <td><%=rs.getString("Prezime")%></td>
    <td><%=rs.getString("KorisnickoIme")%></td>
    <td><%=rs.getString("Adresa")%></td>
    <td><%=rs.getString("Telefon")%></td>
    
                            <td><%=statusFull%></td>
                             <td><%=nivoFull%></td>
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
          </div>

        <div class="footer" >
            @Copyright Informacioni sistem za labaratorije srednjih skola;
        </div>
        </body>
</html>
