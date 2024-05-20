using ClasesDeDominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Site;

namespace Site
{
    public partial class DetalleArticulo1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Verifica si el parámetro "id" está presente en la cadena de consulta
                if (Request.QueryString["id"] != null)
                {
                    // Intenta obtener el valor del parámetro "id"
                    string idStr = Request.QueryString["id"];
                    int articuloId;

                    // Intenta convertir el valor a un entero
                    if (int.TryParse(idStr, out articuloId))
                    {
                        // Llama a un método para cargar los detalles del artículo
                        CargarDetalleArticulo(articuloId);
                    }
                    else
                    {
                        // Maneja el caso en que "id" no sea un entero válido
                        // Por ejemplo, mostrar un mensaje de error
                        Response.Write("ID no válido.");
                    }
                }
                else
                {
                    // Maneja el caso en que "id" no esté presente en la cadena de consulta
                    // Por ejemplo, redirigir a una página de error o mostrar un mensaje
                    Response.Write("ID no proporcionado.");
                }
            }
        }
        private void CargarDetalleArticulo(int articuloId)
        {
            NegocioArticulo negocio = new NegocioArticulo();
            Articulo articulo = negocio.obtenerPorId(articuloId);
            ;

            if (articulo != null)
            {
                //asignamos los valores al formulario
                lblNombre.Text = articulo.nombre;
                lblMarca.Text = articulo.marca.descripcion;
                lblCategoria.Text = articulo.categoria.descripcion;
                lblDescripcion.Text = articulo.descripcion;
                lblPrecio.Text = articulo.precio.ToString("F3");



                // Genera el HTML del carrusel
                var carouselInner = ltlCarouselItems;
                carouselInner.Text = ""; // Limpia el contenido anterior
                for (int i = 0; i < articulo.listImagenes.Count; i++)
                {
                    var imagen = articulo.listImagenes[i];
                    var activeClass = i == 0 ? "active" : "";
                    var carouselItem = $@"
        <div class='carousel-item {activeClass}' data-bs-interval='10000'>
            <img src='{imagen.urlImagen}' class='d-block w-100' alt='Imagen del artículo'>
        </div>";
                    carouselInner.Text += carouselItem;
                }
            }
            else
            {
                Response.Write("Artículo no encontrado.");
            }
        }
    }

}

