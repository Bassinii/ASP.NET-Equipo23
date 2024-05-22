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
        public List<Articulo> ListArticulos { get; set; }
        public List<Articulo> ListCarrito;
        public float TotalCarrito { get; set; }


        protected void Page_Load(object sender, EventArgs e)
        {
            NegocioArticulo negocio = new NegocioArticulo();
            ListArticulos = negocio.listar();

            
            ListCarrito = Session["Carrito"] != null ? (List<Articulo>) Session["Carrito"] : new List<Articulo>();
            Session.Add("Carrito", ListCarrito);

            //se trae el id del articulo añadido al carrito
            if (Request.QueryString["id"] != null && int.Parse(Request.QueryString["action"]) == 1 )
            {
                int id = int.Parse(Request.QueryString["id"]);
                //busca el id del articulo seleccionado para guardarlo en una variable
                Articulo seleccionado = ListArticulos.Find(x => x.id == id);

                //lo añade a la lista del carrito
                ListCarrito.Add(seleccionado);
            }
            TotalCarrito = ListCarrito.Sum(articulo => articulo.precio);
            if (Request.QueryString["id"] != null && int.Parse(Request.QueryString["action"]) == 0)
            {
                int id = int.Parse(Request.QueryString["id"]);
                Articulo seleccionado = ListCarrito.Find(x => x.id == id);
                ListCarrito.Remove(seleccionado);
            }
        }
    }
}

        //    protected void AgregarAlCarrito_Command(object sender, CommandEventArgs e)
        //    {
        //        Response.Write("<script>alert('Artículo agregado al carrito');</script>");
        //        if (e.CommandName == "AgregarAlCarrito")
        //        {
        //            int articuloId = Convert.ToInt32(e.CommandArgument);
        //            // Lógica para agregar el artículo al carrito usando el artículoId
        //            // Por ejemplo, agregar el artículo a una lista en la sesión
        //            List<ClasesDeDominio.Articulo> carrito = Session["Carrito"] as List<ClasesDeDominio.Articulo>;

//            if (carrito == null)
//            {
//                carrito = new List<ClasesDeDominio.Articulo>();
//                Session["Carrito"] = carrito; // Inicializar la sesión del carrito si es nula
//            }

//            ClasesDeDominio.Articulo articulo = ListArticulos.Find(a => a.id == articuloId);
//            if (articulo != null)
//            {
//                carrito.Add(articulo);
//                // No es necesario agregar la sesión nuevamente, simplemente asigna el carrito existente
//                Session["Carrito"] = carrito;
//            }

//            // Opcional: Mostrar un mensaje de confirmación
//            Response.Write("<script>alert('Artículo agregado al carrito');</script>");
//        }
//    }
//