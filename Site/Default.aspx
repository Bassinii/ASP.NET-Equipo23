<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Site.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Carrito</title>
    <link href="Content/Styles.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <style>
    .items{
        display :flex;
        justify-content : center;
        align-items : center;
        gap : 1.1rem;
    }
    .cantProd {
        color: white;
        background-color : red;
        padding : 0.1rem 0.6rem;
        border-radius : 100%;
        border : 1px solid red;
        margin-top : 0.7rem;
        font-weight : bold;

    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
        <nav class="navbar bg-body-tertiary" data-bs-theme="dark">
            <div class="container-fluid d-flex justify-content-left align-items-center">
                <a class="navbar-brand d-flex align-items-center" href="/Default.aspx">
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="24" fill="currentColor" class="bi bi-minecart" viewBox="0 0 16 16">
                        <path d="M4 15a1 1 0 1 1 0-2 1 1 0 0 1 0 2m0 1a2 2 0 1 0 0-4 2 2 0 0 0 0 4m8-1a1 1 0 1 1 0-2 1 1 0 0 1 0 2m0 1a2 2 0 1 0 0-4 2 2 0 0 0 0 4M.115 3.18A.5.5 0 0 1 .5 3h15a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 14 12H2a.5.5 0 0 1-.491-.408l-1.5-8a.5.5 0 0 1 .106-.411zm.987.82 1.313 7h11.17l1.313-7z" />
                    </svg>
                    <span class="ms-2">Minecart</span>
                </a>
                <div class="items"> 
                <p class="cantProd"><%=cantidadProduc%></p>

                <button type="button" id="openCartButton" class="btn btn-primary d-flex align-items-center ms-auto" data-bs-toggle="offcanvas" data-bs-target="#carrito">
                    <img src="/Content/basket.svg" alt="Imagen del botón" width="24" height="24" class="me-2" />
                    Abrir Carrito
                </button>
                </div>
            </div>
        </nav>

        <div class="d-flex">
            <!-- Sidebar Filtros -->
            <div id="sidebar" class="bg-light p-3 mt-3" style="height: 100vh; width: 300px;">
                <h2>Filtros</h2>
                <%--<h5>Precio</h5>
                <div class="input-group">
                    <span class="input-group-text">$</span>
                    <input type="text" aria-label="Precio minimo" class="form-control" placeholder="Min." />
                    <input type="text" aria-label="Precio maximo" class="form-control" placeholder="Max." />
                    <button type="button" class="btn btn-primary ">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8m15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0M4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5z"></path>
                        </svg>
                    </button>
                </div>--%>
                
                <!-- Select con opciones filtrables -->
                <div class="form-group mb-2">
                    <label class="fs-5" for="CategoryFilter">Categoría:</label>
                    <select id="CategoryFilter" class="form-select" runat="server" aria-label="Default select example">
                        <option value="" selected="selected">Seleccionar</option>
                    </select>
                </div>
                <div class="form-group mb-2">
                    <label class="fs-5" for="BrandFilter">Marca:</label>
                    <select id="BrandFilter" class="form-select" runat="server" aria-label="Default select example">
                        <option value="" selected="selected">Seleccionar</option>
                    </select>
                </div>
                <div class="price-selector mb-2 mt-2">
                    <label class="fs-5" for="price-range">Precio:</label>
                    <input type="range" class="form-range" id="price-range" min="1" max="100000" step="100" oninput="filterByPrice(this.value)" />
                    <div style="display: flex; justify-content: center;">
                        <output>50000</output>
                    </div>
                </div>
            </div>

            <!-- Offcanvas -->
            <section class="offcanvas offcanvas-end bg-light custom-offcanvas-width" id="carrito" tabindex="-1">
                <div class="offcanvas-header">
                    <h5>Carrito</h5>
                    <button class="btn-close" type="button" aria-label="Close" data-bs-dismiss="offcanvas"></button>
                </div>
                <div class="offcanvas-body">
                    <% foreach (ClasesDeDominio.Articulo articulo1 in ListCarrito)
                        { %>
                    <div class="card mb-3" style="max-width: 540px;">
                        <div class="row g-0">
                            <div class="col-md-4 d-flex align-items-start">
                                <a href="Default.aspx?id=<%= articulo1.id %>&action=0" class="btn-close p-3 pt-2 align-self-start"></a>
                                <img src="<%= !string.IsNullOrEmpty(articulo1.listImagenes[0].urlImagen) ? articulo1.listImagenes[0].urlImagen : "/Content/noimage.jpg" %>" class="img-fluid rounded-start" alt="..." data-default="/Content/noimage.jpg" onerror="this.onerror=null;this.src=this.getAttribute('data-default');" />
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title"><%= articulo1.nombre %></h5>
                                    <p class="card-text">Categoría: <%= articulo1.categoria.descripcion %></p>
                                    <p class="card-text">Marca: <%= articulo1.marca.descripcion %></p>
                                    <p class="card-text">Precio: $<%= articulo1.precio %></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% } %>
                    <!-- Mostrar el Total del Carrito -->
                    <div class="d-flex justify-content-between align-items-center mt-4">
                        <h5>Total: $<%= TotalCarrito %></h5>
                        <a href="#" class="btn btn-primary">Finalizar compra</a>
                    </div>
                </div>
            </section>

            <!-- Contenido Principal (cards) -->
            <div class="flex-grow-1 mt-5" id="article-list">
                <div class="container">
                    <div class="row row-cols-1 row-cols-md-3 g-4">
                        <% foreach (ClasesDeDominio.Articulo articulo in ListArticulos)
                            { %>
                        <div class="col article-card" data-price="<%= articulo.precio %>" data-category="<%= articulo.categoria.id %>" data-brand="<%= articulo.marca.id %>">
                            <div class="card h-100">
                                <div class="square-div">
                                    <div class="square-div-content">
                                        <img src="<%= !string.IsNullOrEmpty(articulo.listImagenes[0].urlImagen) ? articulo.listImagenes[0].urlImagen : "/Content/noimage.jpg" %>" class="card-img-top align-middle" alt="..." data-default="/Content/noimage.jpg" onerror="this.onerror=null;this.src=this.getAttribute('data-default');" style="max-width: 100%; max-height: 100%;" />
                                    </div>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title"><%= articulo.nombre %></h5>
                                    <div class="info-container">
                                        <div class="left-info">
                                            <p class="brand">Marca</p>
                                            <p><%= articulo.marca.descripcion %></p>
                                            <p class="category">CATEGORÍA</p>
                                            <p><%= articulo.categoria.descripcion %></p>
                                        </div>
                                        <div class="right-info">
                                            <p class="price">$<%= articulo.precio %></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <a href="DetalleArticulo.aspx?id=<%= articulo.id %>&action=2" class="btn btn-secondary btn-sm">Ver Detalle</a>
                                    <a href="Default.aspx?id=<%= articulo.id %>&action=1" class="btn btn-primary btn-sm">Agregar al carrito</a>
                                </div>
                            </div>
                        </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <!-- Script para el filtrado de categorías, marcas y precio -->
    <script>
        document.getElementById('<%= CategoryFilter.ClientID %>').addEventListener('change', filtrarArticulos);
        document.getElementById('<%= BrandFilter.ClientID %>').addEventListener('change', filtrarArticulos);
        document.getElementById('price-range').addEventListener('input', filtrarArticulos);

        function filtrarArticulos() {
            const selectedCategory = document.getElementById('<%= CategoryFilter.ClientID %>').value;
            const selectedBrand = document.getElementById('<%= BrandFilter.ClientID %>').value;
            const selectedPrice = parseInt(document.getElementById('price-range').value);

            updatePriceOutput(selectedPrice); // Actualiza el valor del rango de precios

            const articles = document.querySelectorAll('#article-list .col');

            articles.forEach(article => {
                const articleCategory = article.dataset.category;
                const articleBrand = article.dataset.brand;
                const articlePrice = parseFloat(article.dataset.price);

                const matchCategory = !selectedCategory || articleCategory === selectedCategory;
                const matchBrand = !selectedBrand || articleBrand === selectedBrand;
                const matchPrice = selectedPrice === 0 || articlePrice <= selectedPrice;

                if (matchCategory && matchBrand && matchPrice) {
                    article.style.display = "block";
                } else {
                    article.style.display = "none";
                }
            });
        }

        function updatePriceOutput(price) {
            const output = document.querySelector('.price-selector output');
            output.textContent = price; // Actualiza el valor del output con el precio seleccionado
        }
    </script>
</body>
</html>