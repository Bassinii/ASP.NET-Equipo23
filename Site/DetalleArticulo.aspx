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
    <div class="container mt-3 p-3">
        <h1><asp:Label ID="lblNombre" runat="server" Text=""></asp:Label></h1>
        
<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
    <div class="carousel-indicators d-flex justify-content-center">
        <asp:Literal ID="ltlCarouselIndicators" runat="server"></asp:Literal>
    </div>
    <div class="carousel-inner">
        <asp:Literal ID="ltlCarouselItems" runat="server"></asp:Literal>
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
    </div>
</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+ZlZL5LX7lEN5amqt2+7cpZTMoC4+" crossorigin="anonymous"></script>
</body>
</html>

