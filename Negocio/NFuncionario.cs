using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Dados;
using System.Data;

namespace Negocio
{
    public class NFuncionario
    {
        //Listar
        public static DataTable Listar()
        {
            return new DFuncionario().Listar();
        }
    }
}
