<%-- 
    Document   : korisnik
    Created on : Jan 11, 2014, 7:26:46 PM
    Author     : Zix
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
           <link rel="stylesheet" type="text/css" href="css\mycss.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sef magacina</title>
        <script language="javascript">
            function prikaz(Proizvodjac)
            {
            var f=document.form;
            f.method="post";
            f.action='prikaziOsnovnaMag.jsp?Proizvodjac='+Proizvodjac;
            f.submit();
            }
          </script> 
    </head>
     <body bgcolor="#1E2F41">
       <div class="naslov">
        <h1>Dobrodosli, ${osoba.ime} ${osoba.prezime}</h1>
        Vi ste sef magacina.
          <br>
        <div class="menidva">
        <ul class="ul">
            <li class="li"><a href="Odjava">Odjavi se</a></li>
            
                </ul>
            </div>
          <div class="meni"> 
            <p><a href="osnovnaopremamag.jsp">Nazad</a></p>
            <p></p>
          </div>
            </div>
          
          
    <div class="pocetni">
        <form name="form"> 
	<table width="100%" height="44" border="0" cellpadding="0" cellspacing="0">
            <tr>
               <td><h1 align="center" class="naslov">Artikli - Pomocni</h1></td>
            </tr>
        </table>
	<p>&nbsp;</p>
            <form method="post">
                <table border="1" align="center" width="100%" height="100%">
                    <tr><th>Naziv</th><th>Model</th><th>Garantni Rok</th><th>Proivvodjac</th><th>Cena</th></tr>
<%
    String id=request.getParameter("ID");
    int ID = Integer.parseInt(id);
    try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekat", "root","");
        String query = "select * from osnovnaoprema where id='"+ID+"'";
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(query);
    while(rs.next()){
%>
<tr>
    <td><%=rs.getString("Naziv")%></td>
    <td><%=rs.getString("Model")%></td>
    <td><%=rs.getString("GarantniRok")%></td>
    <td><%=rs.getString("Proizvodjac")%></td>
    <td><%=rs.getString("Cena")%></td>
</tr>
<tr>
 <td></td>
  <td></td>
    <td></td>
           <td><input type="button" name="prikazi" value="Prikazi" style="background-color:#ff0000;font-weight:bold;color:#ffffff;" onclick="prikaz(<%=rs.getString(5)%>);" ></td>
 <td></td>
</tr>
<%
}
}
catch(Exception ex){}
%>
                </table>
            </form>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
        </div>
         <div class="footer" >
            @Copyright Informacioni sistem za labaratorije srednjih skola;
        </div>
    </body>
</html>
