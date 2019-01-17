<%-- 
    Document   : korisnik
    Created on : Jan 11, 2014, 7:26:46 PM
    Author     : Zix
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
           <link rel="stylesheet" type="text/css" href="css\mycss.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sef Magacina</title>
    </head>
     <body bgcolor="#1E2F41">
         <div class="naslov">
        <h1>Dobrodosli, ${osoba.ime} ${osoba.prezime}</h1>
        Vi ste sef magacina. 
          <br>
        <div class="menidva">
        <ul class="ul">
            <li class="li"><a href="Odjava">Odjavi se</a></li>
            <li> - </li>    
            <li><a href="PromenaLozinke">PromenaLozinke</a></li>
                </ul>
            </div>
           <p>Artikli</p>
         </div>
        <div class="meni"> 
            <ul class="ul">
                                <li class="li"><a href="sefmagacina.jsp">Artikli</a></li>
                                 <li> - </li>
                                 <li><a href="sefmagpretraga.jsp">Pretraga</a></li>
                                  <li> - </li>
                                 <li><a href="sefmagnabavka.jsp">Nabavka</a></li>
                                  <li> - </li>
                                 <li><a href="sefmagstatus.jsp">Status</a></li>
                                 <li> - </li>
                              
                              </ul>
           
        </div>
           <div class="pocetni">
               <br>
             <br>
             <br>
         <form name="forma">
             <table align="center">
                 <tr>
                     <td><a href=osnovnaopremamag.jsp>Osnovna oprema</a></td>
                 </tr>
                 <tr>
                     <td><a href=pomocnaopremamag.jsp>Pomocna oprema</a></td>
                 </tr>
             </table>
         </form>
             </div>
         <div class="footer" >
            @Copyright Informacioni sistem za labaratorije srednjih skola;
        </div>
    </body>
</html>
