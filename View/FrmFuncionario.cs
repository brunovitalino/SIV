﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using Negocio;

namespace View
{
    public partial class FrmFuncionario : Form
    {
        public FrmFuncionario()
        {
            InitializeComponent();
        }

        //Listar
        public void Listar()
        {
            this.dgvListagem.DataSource = NFuncionario.Listar();
        }

        private void FrmFuncionario_Load(object sender, EventArgs e)
        {
            this.Top = 0;
            this.Left = 0;
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            this.Listar();
        }
    }
}
