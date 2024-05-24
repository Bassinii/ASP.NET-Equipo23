<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetalleArticulo.aspx.cs" Inherits="Site.DetalleArticulo1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Detalle del Artículo</title>
    <link href="Content/Styles.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
</head>
<body>
   <form id="form1" runat="server">

       <!-- Navbar -->
        <nav class="navbar bg-body-tertiary" data-bs-theme="dark">
            <div class="container-fluid d-flex justify-content-left align-items-center">
                <a class="navbar-brand d-flex align-items-center" href="/Default.aspx">
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="24" fill="currentColor" class="bi bi-minecart" viewBox="0 0 16 16">
                        <path d="M4 15a1 1 0 1 1 0-2 1 1 0 0 1 0 2m0 1a2 2 0 1 0 0-4 2 2 0 0 0 0 4m8-1a1 1 0 1 1 0-2 1 1 0 0 1 0 2m0 1a2 2 0 1 0 0-4 2 2 0 0 0 0 4M.115 3.18A.5.5 0 0 1 .5 3h15a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 14 12H2a.5.5 0 0 1-.491-.408l-1.5-8a.5.5 0 0 1 .106-.411zm.987.82 1.313 7h11.17l1.313-7z"/>
                    </svg>
                    <span class="ms-2">Minecart</span>
                </a>
                
                <button type="button" id="openCartButton" class="btn btn-primary d-flex align-items-center ms-auto" data-bs-toggle="offcanvas" data-bs-target="#carrito">
                    <img src="/Content/basket.svg" alt="Imagen del botón" width="24" height="24" class="me-2"/> Abrir Carrito
                </button>
            </div>
        </nav>

       <!-- Offcanvas -->
            <section class="offcanvas offcanvas-end bg-light" id="carrito" tabindex="-1">
                <div class="offcanvas-header">      
                        <h5>Carrito</h5>
                        <button class="btn-close" type="button" aria-label="Close" data-bs-dismiss="offcanvas"></button>       
                </div>
                    <div class="offcanvas-body">


                        <%foreach (ClasesDeDominio.Articulo articulo1 in ListCarrito){%>
                            <div class="card mb-3" style="max-width: 540px;">
                              <div class="row g-0">
                                <div class="col-md-4">
                                  <img src="<%= !string.IsNullOrEmpty(articulo1.listImagenes[0].urlImagen) ? articulo1.listImagenes[0].urlImagen : "/Content/noimage.jpg" %>" class="img-fluid rounded-start" alt="..." data-default="/Content/noimage.jpg" onerror="this.onerror=null;this.src=this.getAttribute('data-default');"/>
                                </div>
                                <div class="col-md-8">
                                  <div class="card-body">
                                    <h5 class="card-title"> <%= articulo1.nombre %> </h5>
                                    <p class="card-text">Categoria: <%= articulo1.categoria.descripcion %> </p>
                                    <p class="card-text" >Marca: <%= articulo1.marca.descripcion %> </p>
                                    <%--<p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>--%>
                                  </div>
                                </div>
                              </div>
                            </div>
                        <%}%>

                        <%--<img src="<%= !string.IsNullOrEmpty(articulo1.listImagenes[0].urlImagen) ? articulo1.listImagenes[0].urlImagen : "/Content/noimage.jpg" %>" class="img-fluid rounded-start" alt="..." data-default="/Content/noimage.jpg" onerror="this.onerror=null;this.src=this.getAttribute('data-default');" style="max-width: 100%; max-height: 100%;"/>--%>
                            
                    </div>
                
            </section>



    <div class="container mt-3 p-3">
        <h1><asp:Label ID="lblNombre" runat="server" Text=""></asp:Label></h1>
        <%
            ClasesDeDominio.Articulo articulo = new ClasesDeDominio.Articulo();
            if (Request.QueryString["id"] != null)
            {
                string idStr = Request.QueryString["id"];
                int articuloId;

                if (int.TryParse(idStr, out articuloId))
                {
                    articulo = CargarDetalleArticulo(articuloId);
                }
                else
                {
                    Response.Write("ID no válido.");
                }
            }
        %>
        <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-touch="false" data-bs-ride="carousel">
            <div class="carousel-inner">
                <%
                    int contador = 0;
                    foreach (ClasesDeDominio.Imagenes img in articulo.listImagenes)
                    {
                        if (contador == 0)
                        {
                %>
                            <div class="carousel-item active">
                                <img src="<%= img.urlImagen %>" class="d-block w-100" alt="...">
                            </div>
                <%
                        }
                        else
                        {
                %>
                            <div class="carousel-item">
                                <img src="<%= img.urlImagen %>" class="d-block w-100" alt="..."/>.
                            </div>
                <%
                        }
                        contador++;
                    }
                %>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>

    <div class="row mt-4">
        <div class="col-md-6">
            <div class="detail-info-container">
                <div class="left-info detail-left-info">
                    <p><strong>Marca:</strong> <asp:Label ID="lblMarca" runat="server" Text=""></asp:Label></p>
                    <p><strong>Categoría:</strong> <asp:Label ID="lblCategoria" runat="server" Text=""></asp:Label></p>
                    <p><strong>Descripción:</strong> <asp:Label ID="lblDescripcion" runat="server" Text=""></asp:Label></p>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="detail-info-container">
                <div class="right-info detail-right-info">
                    <p><strong>Precio: $</strong> <asp:Label ID="lblPrecio" runat="server" Text=""></asp:Label></p>
                </div>
            </div>
        </div>
    </div>
</form>
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
