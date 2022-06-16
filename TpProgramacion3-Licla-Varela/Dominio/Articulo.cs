﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using System.Threading.Tasks;

namespace Dominio
{
    public class Articulo
    {
        [DisplayName("ID")]
        public int ID { get; set; }

        [DisplayName("Código")]
        public string CODIGO { get; set; }
            
        [DisplayNameAttribute("Descripción")]
        public string DESCRIPCION { get; set; }

        [DisplayNameAttribute("Precio")]
        public decimal precio { get; set; }
 
        
        [DisplayNameAttribute("TIPO")]

        public string TIPO { get; set; }


        [DisplayNameAttribute("OBSERVACION")]

        public string OBS { get; set; }


        [DisplayNameAttribute("ESTADO")]

        public bool ESTADO { get; set; }

        [DisplayNameAttribute("ID_CATEGORIA")]

        public int ID_CATEGORIA { get; set; }

       
    }
}
