using System;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;

namespace PivotViewer.Entities
{
    public class Asset 
    {
        public double Value { get; set; }
        public int ID { get; set; }
        public string Name { get; set; }
        public string Region { get; set; }
    }
}
