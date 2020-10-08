using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AdministratorPizzaWolf
{
    public partial class Clients : Form
    {
        public Clients()
        {
            InitializeComponent();
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            MainForm.frmclients.Close();
        }
        private void Clients_FormClosing(object sender, FormClosingEventArgs e)
        {
            MainForm.frmclients = null;
        }
    }
}
