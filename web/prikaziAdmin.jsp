<%-- 
    Document   : prikaziAdmin
    Created on : Jan 24, 2014, 3:14:18 PM
    Author     : Zix
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css\mycss.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
          
            <p></p>
           
        </div>
        
        
        
        
          <div class="pocetni">
              
              <br>
              <table width="100%" height="44" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td><h1 align="center" class="naslov">Clanci</h1></td>
      </tr>
    </table>
	<p>&nbsp;</p>
<form method="post">
<table border="1" align="center" width="100%" height="100%">
<tr><th>Naslov</th><th>Sadrzaj</th><th>Datum objave</th><th>Autor</th><th>Oblast</th></tr>
<%
    String KorisnickoIme=request.getParameter("KorisnickoIme");
    
    try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekat", "root","");
        String query = "select * from korisnici where KorisnickoIme'"+KorisnickoIme+"'";
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(query);
    while(rs.next()){
%>
<tr>
    <td><%=rs.getString("Ime")%></td>
    <td><%=rs.getString("Prezime")%></td>
    <td><%=rs.getString("KorisnickoIme")%></td>
    <td><%=rs.getString("Adresa")%></td>
    <td><%=rs.getString("Telefon")%></td>
</tr>
<%
}
}
catch(Exception ex){}
%>
</table>
</form>

          </div>\
	<p>&nbsp;</p>
	<p>&nbsp;</p>
  


</div>

        <div class="footer" >
            @Copyright Informacioni sistem za labaratorije srednjih skola;
        </div>
        </body>
</html>
