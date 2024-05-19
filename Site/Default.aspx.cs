using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClasesDeDominio;
using Negocio;

namespace Site
{
    public partial class Default : System.Web.UI.Page
    {
        public List<ClasesDeDominio.Articulo> ListArticulos { get; set; }
        

        protected void Page_Load(object sender, EventArgs e)
        {
           
                NegocioArticulo negocio = new NegocioArticulo();
                ListArticulos = negocio.listar();
            

        }

        protected void AgregarAlCarrito_Command(object sender, CommandEventArgs e)
        {
            Response.Write("<script>alert('Artículo agregado al carrito');</script>");
            if (e.CommandName == "AgregarAlCarrito")
            {
                int articuloId = Convert.ToInt32(e.CommandArgument);
                // Lógica para agregar el artículo al carrito usando el artículoId
                // Por ejemplo, agregar el artículo a una lista en la sesión
                List<ClasesDeDominio.Articulo> carrito = Session["Carrito"] as List<ClasesDeDominio.Articulo>;

                if (carrito == null)
                {
                    carrito = new List<ClasesDeDominio.Articulo>();
                    Session["Carrito"] = carrito; // Inicializar la sesión del carrito si es nula
                }

                ClasesDeDominio.Articulo articulo = ListArticulos.Find(a => a.id == articuloId);
                if (articulo != null)
                {
                    carrito.Add(articulo);
                    // No es necesario agregar la sesión nuevamente, simplemente asigna el carrito existente
                    Session["Carrito"] = carrito;
                }

                // Opcional: Mostrar un mensaje de confirmación
                Response.Write("<script>alert('Artículo agregado al carrito');</script>");
            }
        }
    }



}