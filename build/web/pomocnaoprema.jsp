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
        <title>Sef Labaratorije</title>
          <script language="javascript">
            function prikaz(ID)
            {
            var f=document.form;
            f.method="post";
            f.action='prikaziPomocna.jsp?ID='+ID;
            f.submit();
            }
          </script> 
      
    </head>
     <body bgcolor="#1E2F41">
       <div class="naslov">
        <h1>Dobrodosli, ${osoba.ime} ${osoba.prezime}</h1>
        Vi ste sef labaratorije. Imate ${osoba.godinar} godina.
           <br>
        <div class="menidva">
        <ul class="ul">
            <li class="li"><a href="Odjava">Odjavi se</a></li>
            
                </ul>
            </div>
        
          <div class="meni"> 
            <p><a href="seflabaratorije.jsp">Nazad</a></p>
            <p></p>
          </div>
            </div>
          
          
    <div class="pocetni">
         
	<br>
        <form name="form">
              <table width="100%" height="44" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td><h1 align="center" class="naslov">POMOCNA OPREMA</h1></td>
      </tr>
    </table>
	<p>&nbsp;</p>
	<br><br>
          <table border="3" align="center" font-size="10px">
              <tr><th></th><th>Naziv</th></tr>
<%
        Connection con = null;

        int sumcount=0;
        Statement st;
        try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekat", "root","");
        String query = "select * from pomocnaoprema";
        st = con.createStatement();
        ResultSet rs = st.executeQuery(query);
        %>
<%
while(rs.next()){
%>
<tr>

    <td><th><%=rs.getString(1)%></th><th><%=rs.getString(2)%></th></td>
           <td><input type="button" name="prikazi" value="Prikazi" style="background-color:#ff0000;font-weight:bold;color:#ffffff;" onclick="prikaz(<%=rs.getString(3)%>);" ></td>
</tr>
<%
}
%>
<%
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
