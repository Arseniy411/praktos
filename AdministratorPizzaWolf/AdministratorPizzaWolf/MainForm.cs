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
    public partial class MainForm : Form
    {
       public static Dishes frmdishes;
       public static Clients frmclients;
       public static Categories frmcategories;
       public static Orders frmorders;
       public static Staff frmstaff;


        public MainForm()
        {
            InitializeComponent();   
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void btnDishes_Click(object sender, EventArgs e)
        {
            frmdishes = new Dishes();
            frmdishes.Show();
        }

        private void btnStaff_Click(object sender, EventArgs e)
        {
            frmstaff = new Staff();
            frmstaff.Show();
        }

        private void btnOrders_Click(object sender, EventArgs e)
        {
            frmorders = new Orders();
            frmorders.Show();
        }

        private void btnCategories_Click(object sender, EventArgs e)
        {
            frmcategories = new Categories();
            frmcategories.Show();
        }

        private void btnClients_Click(object sender, EventArgs e)
        {
            frmclients = new Clients();
            frmclients.Show();
        }
    }
}
