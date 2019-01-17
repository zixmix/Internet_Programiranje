<%-- 
    Document   : index
    Created on : Jan 6, 2014, 3:06:26 PM
    Author     : Zix
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css\mycss.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Prijava</title>
        <script type="text/javascript" language="javascript">

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
                    if (obavezno_polje(kime,"Niste uneli korisniÄko ime!")==false)
                    {
                        kime.focus();
                        return false;
                    }
                    if (obavezno_polje(pass,"Niste uneli lozinku!")==false)
                    {
                        pass.focus();
                        return false;
                    }
                }
            }
        </script>
        
        
    </head>
    <body bgcolor="#1E2F41">
        <div class="naslov">
        <h1><a href="index.jsp">Informacioni sistem za labaratorije srednjih skola</a></h1>
         <h6><a href="index.jsp">(povratak na Pocetnu stranu)</a></h6>
            
            </div>
         <div class="boja"> 
            
            <h2 bgcolor="">Prijava</h2>
        <div class="pocetni">
            
             <br>
             
             <br>
             
             <br>
             <br>
             <br>
             <br>
             ${poruka}
             ${greska}
            <form name="forma" method="POST" action="Login" onsubmit="return provera_forme(this)" >
                <table class="centar" bgcolor="#006699">
                    <tr>
                    <td>Korisnicko ime </td>
                    <td><input type="text" name="kime"</td>
                    </td>
                     <tr>
                    <td>Password</td>
                    <td><input type="password" name="pass"</td>
                    </tr>
                </table>
                <table class="centar">
                    <tr>
                        <td>
                    <input class="dugme" type="submit" value="Prijava">
                    </td>
                    </tr>
            </table>
                           </form>
        </div>
      </div> 
        <div class="footer" >
            @Copyright Informacioni sistem za labaratorije srednjih skola;
        </div>
    </body>
</html>
