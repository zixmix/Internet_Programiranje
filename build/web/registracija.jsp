<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
         <link rel="stylesheet" type="text/css" href="css\mycss.css">
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registracija</title>
       
       <script type="text/javascript" language="javascript">

    function provera_telefona(Telefon,poruka)
    {
        with (Telefon) {
            var uzorak = /^(\d{9,10}|\d{3}-\d{3}-\d{3,4}|\(\d{3}\)\d{3}-\d{3,4})$/;
            if(!(uzorak.test(value))){
                alert(poruka);
                return false;
            }else {
             return true;
            }
        }
    }
   
    function provera_statusa(status,poruka){
        with (status) {
             var status2 = document.registacijaforma.status.value;
            if(status2!=0)
            {
                alert(poruka);
                return false;
            }
            else 
            {
             return true;
            }
        }
    }
    function provera_nivoa(nivo,poruka){
        with (nivo) {
             var nivo1 = document.registacijaforma.nivo.value;
            
            if(nivo1!=1 && nivo1!=2&&nivo1!=3&&nivo1!=4)
            {
                alert(poruka);
                return false;
            }
            else 
            {
             return true;
            }
        }
    }


    function provera_emaila(nivo,poruka){
        with (nivo) {
            var uzorak = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
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

    function provera_lozinki()
    {
        var password1 = document.registacijaforma.Password.value;
        var password2 = document.registacijaforma.Password2.value;

        if(password1.toString().length<5 || password2.toString().length<5){
            alert("Lozinka mora sadrÅ¾ati bar 5 karaktera!");return false;
        }

        if(password1 != password2){
            alert("Lozinke se ne podudaraju!");return false;
        }else {
            return true;
        }
    }

    function provera_forme(forma)
    {
        with (forma)
        {
            if (obavezno_polje(Ime,"Niste uneli ime!")==false)
            {
                Ime.focus();
                return false;
            }
            if (obavezno_polje(Prezime,"Niste uneli prezime!")==false)
            {
                Prezime.focus();
                return false;
            }
            if (obavezno_polje(KorisnickoIme,"Niste uneli korisniÄko ime!")==false)
            {
                KorisnickoIme.focus();
                return false;
            }
            if (obavezno_polje(Password,"Niste uneli lozinku!")==false)
            {
                Password.focus();
                return false;
            }
            if (obavezno_polje(Password2,"Niste ponovili lozinku!")==false)
            {
                Password2.focus();
                return false;
            }
            if (provera_lozinki()==false)
            {
                Password.focus();
                return false;
            }
            if (obavezno_polje(Adresa,"Niste ispravno uneli Adresu!")==false)
            {
                Adresa.focus();
                return false;
            }
            if (obavezno_polje(Telefon,"Niste uneli telefon!")==false)
            {
                Telefon.focus();
                return false;
            }
            if (provera_telefona(Telefon,"Telefon nije u ispravnom formatu!")==false)
            {
                Telefon.focus();
                return false;
            }
            if (obavezno_polje(email,"Niste uneli email!")==false)
            {
                email.focus();
                return false;
            }
            if (provera_emaila(email,"Email nije u ispravnom formatu!")==false)
            {
                email.focus();
                return false;
            }
            if (obavezno_polje(status,"Niste uneli status!")==false)
            {
                status.focus();
                return false;
            }
             if (provera_statusa(status,"Niste uneli ispravno status!")==false)
            {
                status.focus();
                return false;
            }
            
            if (obavezno_polje(nivo,"Niste uneli nivo!")==false)
            {
                nivo.focus();
                return false;
            }
             if (provera_nivoa(status,"Niste uneli ispravno nivo!")==false)
            {
                nivo.focus();
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
            
            <h2 bgcolor="">Registracija</h2>
        <div class="pocetni">
            
           
             <br>
             <br>
             <br>
             
             <form class="centar" name="registacijaforma" method="POST" action="Registracija" onsubmit="return provera_forme(this)">
                <table class="centar" bgcolor="#006699">
                    <tr>
                      <td>Ime</td>
                      <td><input type="text" name="Ime" ></td>
                    </td>
                    <tr>
                      <td>Prezime</td>
                      <td><input type="text" name="Prezime"></td>
                    </tr>
                    <tr>
                      <td>Korisnicko ime</td>
                      <td><input type="text" name="KorisnickoIme"></td>
                    </td>
                    <tr>
                      <td>Lozinka</td>
                      <td><input type="pass" name="Password"></td>
                    </td>
                    </tr>
                    <tr>
                      <td>Potvrda Lozinke</td>
                      <td><input type="pass" name="Password2"></td>
                    </td>
                    </tr>
                    <tr>
                      <td>Adresa</td>
                      <td><input type="pass" name="Adresa"></td>
                    </td>
                    </tr>
                    <tr>
                      <td>Telefon</td>
                      <td><input type="pass" name="Telefon"></td>
                    </td>
                    </tr>
                    <tr>
                      <td>e-mail</td>
                      <td><input type="text" name="email"></td>
                    </td>
                    </tr>
                    <tr>
                      <td>staatus</td>
                      <td><input type="text" name="status"></td>
                    </td>
                    </tr>
                    <tr>
                      <td>nivo</td>
                      <td><input type="text" name="nivo"></td>
                    </td>
                    </tr>
                    
                </table>
                <table class="centar">
                    <tr>
                      <td>
                          <input type="submit" class="dugme" value="Registracija" >   
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
