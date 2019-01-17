<%-- 
    Document   : korisnik
    Created on : Jan 11, 2014, 7:26:46 PM
    Author     : Zix
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
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
      <p>Status</p>
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
         
         <div class="korisnici">
             <br>
            
         <form name="forma">
             <h1 align="center">Pomocna oprema</h1>
<table border="1" width="100%" height="100%">
<tr><th>Naziv</th><th>Status</th><tr>
<%
    
    
    try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekat", "root","");
        String query = "select * from pomocnaoprema";
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(query);
    while(rs.next()){
%>
<tr>
    <td><%=rs.getString("Naziv")%></td>
    
    <td><%=rs.getString("Status")%></td>
  
</tr>
<%
}
}
catch(Exception ex){}
%>
</table>
         </form>
</div>
<div class="korisnici">
    <br>
    <form method="post">  
        <h1 align="center">Osnovna oprema</h1>
<table border="1" width="100%" height="100%">
<tr><th>Naziv</th><th>Status</th></tr>
<%
    
    
    try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekat", "root","");
        String query = "select * from osnovnaoprema";
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(query);
    while(rs.next()){
%>
<tr>
    <td><%=rs.getString("Naziv")%></td>
    
    <td><%=rs.getString("Status")%></td>
  
</tr>
<%
}
}
catch(Exception ex){}
%>
</table>

</form></div>          
             </div>
         <div class="footer" >
            @Copyright Informacioni sistem za labaratorije srednjih skola;
        </div>
    </body>
</html>
