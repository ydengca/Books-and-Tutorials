using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CookBook.Recipes.Winforms.Layouts.Entities;

namespace CookBook.Recipes.Winforms.Layouts

{
    public class DynamicTableHelper
    {
        private TableLayoutPanel _layout;
       
        public DynamicTableHelper()
        {            
            _layout = new TableLayoutPanel();
            _layout.Dock = DockStyle.Fill;
            _layout.RowStyles.Add(new RowStyle(SizeType.AutoSize,25));
            _layout.ColumnStyles.Add(new ColumnStyle(SizeType.AutoSize, 25));
        }
        public DynamicTableHelper(TableLayoutPanel panel)
        {
            _layout = panel;
        }
        public TableLayoutPanel AddOrRemoveRows(RowEntity entity)
        {
            int listSize = entity.List.Count;
            int rowCount = _layout.RowCount;
            if (entity.Operation == RowEnum.Add &&listSize>rowCount)
            {
                AddRow( listSize-rowCount);
            }
            else if (entity.Operation == RowEnum.Delete && listSize < rowCount)
            {
                RemoveRows(rowCount - listSize);
            }
            _layout.AutoScroll = true;
            return _layout;
        }

        private void RemoveRows(int rowsToRemove)
        {
            for (int i = 0; i < rowsToRemove; i++)
            {
                _layout.RowCount = _layout.RowCount - 1;
                _layout.RowStyles.RemoveAt(_layout.RowStyles.Count - 1);
            }
        }

        private void AddRow(int rowsToAdd)
        {
            for (int i = 0; i < rowsToAdd; i++)
            {
                _layout.RowCount++;
                RowStyle style = new RowStyle(SizeType.AutoSize,50);
                _layout.RowStyles.Add(style);
            }
        }
    }
}
