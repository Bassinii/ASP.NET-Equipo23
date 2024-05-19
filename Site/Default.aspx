<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Site.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Carrito</title>
    <link href="Content/Styles.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
</head>
<body>
    <form id="form1" runat="server">
    <!-- Navbar -->
    <nav class="navbar bg-body-tertiary" data-bs-theme="dark">
        <div class="container-fluid d-flex justify-content-left align-items-center">
            <a class="navbar-brand d-flex align-items-center" href="#">
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="24" fill="currentColor" class="bi bi-minecart" viewBox="0 0 16 16">
                    <path d="M4 15a1 1 0 1 1 0-2 1 1 0 0 1 0 2m0 1a2 2 0 1 0 0-4 2 2 0 0 0 0 4m8-1a1 1 0 1 1 0-2 1 1 0 0 1 0 2m0 1a2 2 0 1 0 0-4 2 2 0 0 0 0 4M.115 3.18A.5.5 0 0 1 .5 3h15a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 14 12H2a.5.5 0 0 1-.491-.408l-1.5-8a.5.5 0 0 1 .106-.411zm.987.82 1.313 7h11.17l1.313-7z"/>
                </svg>
                <span class="ms-2">Minecart</span>
            </a>

            <button id="add-to-cart-btn" class="btn btn-primary d-flex align-items-center ms-auto">
                <img src="/Content/basket.svg" alt="Imagen del botón" width="24" height="24" class="me-2"/>
            </button>
        </div>
    </nav>

    <div class="d-flex">
        <!-- Sidebar Filtros -->
        <div id="sidebar" class="bg-light p-3" style="height: 100vh; width: 300px;">
            <h2>Filtros</h2>
            <div class="price-selector">
                <label for="price-range">Precio:</label>
                <input type="range" class="form-range" id="price-range" min="0" max="1000" step="10" oninput="this.nextElementSibling.value = this.value">
                <output>500</output>
            </div>
        </div>

        <!-- Contenido Principal -->
        <div class="flex-grow-1">
            <div class="container">
                <div class="row row-cols-1 row-cols-md-3 g-4">
                    <% foreach (ClasesDeDominio.Articulo articulo in ListArticulos) { %>
                        <div class="col">
                            <div class="card h-100">
                                
                                    <img src="<%= !string.IsNullOrEmpty(articulo.listImagenes[0].urlImagen) ? articulo.listImagenes[0].urlImagen : "/Content/noimage.jpg" %>" class="card-img-top align-middle" alt="..." data-default="/Content/noimage.jpg" onerror="this.onerror=null;this.src=this.getAttribute('data-default');" style="max-width: 100%; max-height: 100%;"/>
                                
                                <div class="card-body">
                                    <h5 class="card-title"><%= articulo.nombre %></h5>
                                    <div class="info-container">
                                        <div class="left-info">
                                            <p class="brand">Marca</p>
                                            <p>Samsung</p>
                                            <p class="category">CATEGORIA</p>
                                            <p>TELEVISORES</p>
                                        </div>
                                        <div class="right-info">
                                            <p class="price">$1234.56</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <a href="/">Ver Detalle</a>

                                </div>
                            </div>
                        </div>

                    <% } %>
                </div>
            </div>
        </div>
    </div>
</form>




    <script/ src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>



