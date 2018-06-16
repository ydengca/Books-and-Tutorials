using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CookBook.Recipes.WindowForms.DataGrid;
using CookBook.Recipes.WindowForms.DataGrid.Entities;
using DynamicGridApp.Entities;

namespace DynamicGridApp
{
    public partial class DynamicGrid : Form
    {
        public DynamicGrid()
        {
            InitializeComponent();
        }

        private void btnLoad_Click(object sender, EventArgs e)
        {
            List<User> users = new List<User>();
            users.Add(new User() { UserID = "1", FirstName = "John", LastName = "Wayne" });
            users.Add(new User() { UserID = "2", FirstName = "John", LastName = "Carter" });

            Dictionary<string, string> headerMap = new Dictionary<string, string>();
            headerMap.Add("UserID", "User ID");
            headerMap.Add("FirstName", "First Name");
            headerMap.Add("LastName", "Last Name");

            if (pnlGrid.Controls.Count > 0)
            {
                pnlGrid.Controls.Clear();
            }
            Control grid = new DynamicDataGrid(GetColumnDetails(typeof(User), headerMap), users);
            grid.Dock = DockStyle.Fill;
            pnlGrid.Controls.Add(grid);
        }

        private List<DataGridEntity> GetColumnDetails(Type type, Dictionary<string,string> headers)
        {
            PropertyInfo[] info = type.GetProperties();
            List<DataGridEntity> details = new List<DataGridEntity>();
            foreach (var item in info)
            {
                DataGridEntity temp = new DataGridEntity();
                temp.ColumnType = "Text";
                temp.ColumnWidth = 100;
                temp.Header = headers[item.Name];
                temp.DataMemeber = item.Name;
                details.Add(temp);
            }
            return details;
        }
    }
}
