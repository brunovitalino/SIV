using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dados
{
    class Conexao
    {
        private static String senha = "";
        public static String Cn = "Server=localhost; Database=siv; Uid=root; Pwd="+senha+";";
    }
}
