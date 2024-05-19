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
    public partial class Carrito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
           
                CargarCarrito();
            
        }

        private void CargarCarrito()
        {
            List<Articulo> carrito = (List<Articulo>)Session["Carrito"];

       

            
            if (carrito != null && carrito.Count > 0)
            {
                NegocioArticulo negocio = new NegocioArticulo();
                carrito = negocio.listar();
             
                dgvCarrito.DataSource = carrito;
                dgvCarrito.DataBind();
            }
            else
            {
                // Opcional: Mostrar un mensaje si el carrito está vacío
                dgvCarrito.EmptyDataText = "El carrito está vacío. ";
                dgvCarrito.DataBind();
            }
            
        }
    }
}