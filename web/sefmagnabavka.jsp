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
          <p>Nabavka</p>
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
         <form name="forma" align="centre">
             <table>    
                 <tr>
                     <td>
                         Vrsta:
                     </td>
                     <td>   
                 <select>
                     <option value="Osnovna Oprema">Osnovna Oprema</option>
                     <option value="Pomocna Oprema">Pomocna Oprema</option>
                 </select>
                         </td>
                 </tr>
                 <tr>
                     <td>Naziv:</td>
                     <td> <input type="text" name="naziv"></td>
                 </tr>
                 
                 <tr>
                     <td>Kolicina:</td>
                <td> <input type="text" name="Kolicina"></td>
                 </tr>
                 
                 <tr>
                     <td>Laboratorija:</td>
               <td>  <input type="text" name="Laboratorija"></td>
                 </tr>
                 <tr><td></td>
                <td> <input type="button" value="Potvrdi"></td>
                 </tr>
             </table>
         </form>
             </div>
         <div class="footer" >
            @Copyright Informacioni sistem za labaratorije srednjih skola;
        </div>
    </body>
</html>
