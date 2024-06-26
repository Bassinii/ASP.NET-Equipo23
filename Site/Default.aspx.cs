﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClasesdeDominio;
using ClasesDeDominio;
using Negocio;

namespace Site
{
    public partial class Default : System.Web.UI.Page
    {
        public List<Articulo> ListArticulos { get; set; }
        public List<ArticuloCarrito> ListCarrito;
        public float TotalCarrito { get; set; }
        public int cantidadProduc = 0;


        protected void Page_Load(object sender, EventArgs e)
        {
            NegocioArticulo negocio = new NegocioArticulo();
            ListArticulos = negocio.listar();


            ListCarrito = Session["Carrito"] != null ? (List<ArticuloCarrito>)Session["Carrito"] : new List<ArticuloCarrito>();
            Session.Add("Carrito", ListCarrito);
            cantidadProduc = ListCarrito.Count;

            //se trae el id del articulo añadido al carrito
            //pregunta si en la url la variable action es 1. Si es asi significa "añadir"
            if (Request.QueryString["id"] != null && int.Parse(Request.QueryString["action"]) == 1)
            {
                int id = int.Parse(Request.QueryString["id"]);

               
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


            //pregunta si en la url la variable action es 0. Si es asi significa "quitar"
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
                TotalCarrito = ListCarrito.Sum(articulo => articulo.precio*articulo.cant);

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
