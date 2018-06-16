using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CookBook.Recipes.WindowForms.DataGrid.Entities;

namespace CookBook.Recipes.WindowForms.DataGrid
{
    public partial class DynamicDataGrid : UserControl
    {
        private List<DataGridEntity> _entities;
        private Object _dataSource;
        public DynamicDataGrid(List<DataGridEntity> details, Object dataSource)
        {
            InitializeComponent();
            _entities = details;
            _dataSource = dataSource;
            GenerateColumns();
        }

        private void GenerateColumns()
        {
            if (_entities != null && _entities.Count > 0)
            {
                foreach (var item in _entities)
                {
                    DataGridViewColumn column = GetColumn(item.ColumnType);
                    column.HeaderText = item.Header;
                    column.Width = item.ColumnWidth;
                    column.DataPropertyName = item.DataMemeber;
                    dgvGrid.Columns.Add(column);
                }
                dgvGrid.DataSource = _dataSource;
            }
        }

        private DataGridViewColumn GetColumn(string columnType)
        {
            DataGridViewColumn temp = new DataGridViewTextBoxColumn();
            switch (columnType)
            {
                case "Text":
                    temp = new DataGridViewTextBoxColumn();
                    break;
                case "Combo":
                    temp = new DataGridViewComboBoxColumn();
                    break;
                case "Checkbox":
                    temp = new DataGridViewCheckBoxColumn();
                    break;
                default:
                    break;
            }
            return temp;
        }
    }
}
