using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CookBook.Recipes.Winforms.Layouts;
using CookBook.Recipes.Winforms.Layouts.Entities;

namespace DynamicTableLayoutApp
{
    public partial class TablelayoutTest : Form
    {
        private ArrayList _list; 
        public TablelayoutTest()
        {
            InitializeComponent();
            _list = new ArrayList();
            _list.Add("row 1");
            _list.Add("row 2");
           //since rows of the table is equal to the size of the list
           //we can display the row count based on list size
            lblRowCount.Text ="No. of rows "+_list.Count.ToString();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            _list.Add("row "+_list.Count);
            RowEntity row = new RowEntity();
            row.List = _list;
            row.Operation = RowEnum.Add;
            TableLayoutPanel temp = (TableLayoutPanel)pnlTableHolder.Controls[0];
            DynamicTableHelper control = new DynamicTableHelper(temp);
            temp = control.AddOrRemoveRows(row);
            pnlTableHolder.Controls.Remove(tblMain);
            pnlTableHolder.Controls.Add(temp);
            //we will get the no. of rows directly from  the table
            //to ascertain that rows have been added correctly
            lblRowCount.Text = "No. of rows " + temp.RowCount;
        }

        private void btnRemove_Click(object sender, EventArgs e)
        {
            if (_list.Count>0)
            {

                _list.RemoveAt(_list.Count - 1);               

                RowEntity row = new RowEntity();
                row.List = _list;
                row.Operation = RowEnum.Delete;
                TableLayoutPanel temp = (TableLayoutPanel)pnlTableHolder.Controls[0];
                DynamicTableHelper control = new DynamicTableHelper(temp);
                temp = control.AddOrRemoveRows(row);
                pnlTableHolder.Controls.Remove(tblMain);
                pnlTableHolder.Controls.Add(temp);
                //we will get the no. of rows directly from  the table
                //to ascertain that rows have been added correctly
                lblRowCount.Text = "No. of rows " + temp.RowCount; 
            }
        }
    }
}
