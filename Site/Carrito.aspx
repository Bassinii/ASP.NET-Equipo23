<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="Site.Carrito" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>

    <title></title>
</head>
<body>
   
           <form id="form2" runat="server">
    <!-- Navbar -->
    <nav class="navbar bg-body-tertiary" data-bs-theme="dark">
        <div class="container-fluid d-flex justify-content-left align-items-center">
            <a class="navbar-brand d-flex align-items-center" href="#">
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="24" fill="currentColor" class="bi bi-minecart" viewBox="0 0 16 16">
                    <path d="M4 15a1 1 0 1 1 0-2 1 1 0 0 1 0 2m0 1a2 2 0 1 0 0-4 2 2 0 0 0 0 4m8-1a1 1 0 1 1 0-2 1 1 0 0 1 0 2m0 1a2 2 0 1 0 0-4 2 2 0 0 0 0 4M.115 3.18A.5.5 0 0 1 .5 3h15a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 14 12H2a.5.5 0 0 1-.491-.408l-1.5-8a.5.5 0 0 1 .106-.411zm.987.82 1.313 7h11.17l1.313-7z"/>
                </svg>
                <span class="ms-2">COMPRAS</span>
            </a>

            <button id="add-to-cart-btn" class="btn btn-primary d-flex align-items-center ms-auto">
                <img src="/Content/basket.svg" alt="Imagen del botón" width="24" height="24" class="me-2"/>
            </button>
        </div>
    </nav>
        <div>
        </div>

                <asp:GridView runat="server" ID="dgvCarrito" CssClass="table"></asp:GridView> 
               <a href="/" class="btn btn-primary"> Volver a la pagina anterior</a>
    </form>
</body>
</html>
