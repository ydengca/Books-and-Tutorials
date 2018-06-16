using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookBook.Recipes.WindowForms.DataGrid.Entities
{
    public class DataGridEntity
    {
        public string Header { get; set; }
        public string ColumnType { get; set; }
        public int ColumnWidth { get; set; }
        public string DataMemeber { get; set; }
    }
}
