using ClasesDeDominio;
using ClasesdeDominio;
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

        public float TotalCarrito { get; set; }
        public int idArticulo { get; set; }
        public List<ArticuloCarrito> ListCarrito;
        public List<Articulo> ListArticulos { get; set; }
        public int cantidadProduc = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            NegocioArticulo neg = new NegocioArticulo();
            ListArticulos = neg.listar();


            ListCarrito = Session["Carrito"] != null ? (List<ArticuloCarrito>)Session["Carrito"] : new List<ArticuloCarrito>();
            Session.Add("Carrito", ListCarrito);
            cantidadProduc = ListCarrito.Count;

            //se trae el id del articulo añadido al carrito
            if (Request.QueryString["id"] != null && int.Parse(Request.QueryString["action"]) == 1)
            {
                int id = int.Parse(Request.QueryString["id"]);
                //busca el id del articulo seleccionado para guardarlo en una variable
                Articulo seleccionado;
                seleccionado = ListArticulos.Find(x => x.id == id);
                if (seleccionado != null)
                {
                    ArticuloCarrito existeCarrito = ListCarrito.Find(x => x.id == id);

                    if (existeCarrito != null)
                    {
                        existeCarrito.cant++;
                    }
                    else
                    {
                        //Creamos seleccionadoCarrito mandandole al construcor seleccionado para que copie sus props.
                        ArticuloCarrito seleccionadoCarrito = new ArticuloCarrito(seleccionado);
                        ListCarrito.Add(seleccionadoCarrito);
                    }
                }

                cantidadProduc = ListCarrito.Count;
            }
            if (Request.QueryString["id"] != null && int.Parse(Request.QueryString["action"]) == 0)
            {
                int id = int.Parse(Request.QueryString["id"]);
                ArticuloCarrito seleccionado;
                seleccionado = (ArticuloCarrito)ListCarrito.Find(x => x.id == id);
                ListCarrito.Remove(seleccionado);

                cantidadProduc = ListCarrito.Count;
            }
            if (Request.QueryString["id"] != null && int.Parse(Request.QueryString["action"]) == 3)
            {
                int id = int.Parse(Request.QueryString["id"]);
                ArticuloCarrito seleccionado;
                seleccionado = (ArticuloCarrito)ListCarrito.Find(x => x.id == id);
                if (seleccionado.cant > 1)
                {
                    ListCarrito.Remove(seleccionado);
                    seleccionado.cant--;
                    ListCarrito.Add(seleccionado);

                }

            }
            if (Request.QueryString["id"] != null && int.Parse(Request.QueryString["action"]) == 4)
            {
                int id = int.Parse(Request.QueryString["id"]);
                ArticuloCarrito seleccionado;
                seleccionado = (ArticuloCarrito)ListCarrito.Find(x => x.id == id);

                ListCarrito.Remove(seleccionado);
                seleccionado.cant++;
                ListCarrito.Add(seleccionado);


            }
            TotalCarrito = ListCarrito.Sum(articulo => articulo.precio);
            if (Request.QueryString["id"] != null)
            {
                idArticulo = int.Parse(Request.QueryString["id"]);
            }
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
        public Articulo CargarDetalleArticulo(int articuloId)
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


            }
            else
            {
                Response.Write("Artículo no encontrado.");
            }
            return articulo;
        }
    }

}