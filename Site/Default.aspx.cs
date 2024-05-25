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
        public int cantidadProduc = 0;


        protected void Page_Load(object sender, EventArgs e)
        {
            NegocioArticulo negocio = new NegocioArticulo();
            ListArticulos = negocio.listar();


            ListCarrito = Session["Carrito"] != null ? (List<Articulo>)Session["Carrito"] : new List<Articulo>();
            Session.Add("Carrito", ListCarrito);
            cantidadProduc = ListCarrito.Count;

            //se trae el id del articulo añadido al carrito
            if (Request.QueryString["id"] != null && int.Parse(Request.QueryString["action"]) == 1)
            {
                int id = int.Parse(Request.QueryString["id"]);
               // Articulo obj = ListCarrito.Find(x => x.id == id);//para no repetir 2 veces el mismo articulo
               /* if (obj == null)
                {

                }*/
                    //busca el id del articulo seleccionado para guardarlo en una variable
                 Articulo seleccionado = ListArticulos.Find(x => x.id == id);

                    //lo añade a la lista del carrito
                 ListCarrito.Add(seleccionado);

                cantidadProduc = ListCarrito.Count;
            }
            if (Request.QueryString["id"] != null && int.Parse(Request.QueryString["action"]) == 0)
            {
                int id = int.Parse(Request.QueryString["id"]);
                Articulo seleccionado = ListCarrito.Find(x => x.id == id);
                ListCarrito.Remove(seleccionado);

                cantidadProduc = ListCarrito.Count;
            }
            TotalCarrito = ListCarrito.Sum(articulo => articulo.precio);
            if (!IsPostBack)
            {
                CargarCategorias();
                CargarMarcas();
            }
        }
        private void CargarCategorias()
        {
            NegocioCategoria negocio = new NegocioCategoria();
            List<Categoria> categorias = negocio.listar();

            foreach (Categoria categoria in categorias)
            {
                ListItem item = new ListItem(categoria.descripcion, categoria.id.ToString());
                CategoryFilter.Items.Add(item);
            }
        }

        private void CargarMarcas()
        {
            NegocioMarca negocio = new NegocioMarca();
            List<Marca> marcas = negocio.listar();

            foreach (Marca marca in marcas)
            {
                ListItem item = new ListItem(marca.descripcion, marca.id.ToString());
                BrandFilter.Items.Add(item);
            }
        }
    }
}
