using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using PivotViewer.Entities;

namespace PivotViewer
{
    public partial class MainPage : UserControl
    {
        public MainPage()
        {
            InitializeComponent();
            pvAsset.ItemsSource = GenerateTestData();
        }
        private ObservableCollection<Asset> GenerateTestData()
        {
            ObservableCollection<Asset> temp = new ObservableCollection<Asset>();
            temp.Add(new Asset() { ID = 1, Name = "ASD", Region = "Mumbai", Value = 1000 });
            temp.Add(new Asset() { ID = 2, Name = "AS Hotel", Region = "Chennai", Value = 11000 });
            temp.Add(new Asset() { ID = 3, Name = "AD Cafe", Region = "Kolkatta", Value = 10000 });
            temp.Add(new Asset() { ID = 4, Name = "Landmark", Region = "Mumbai", Value = 50000 });
            temp.Add(new Asset() { ID = 5, Name = "ASD II", Region = "Kolkatta", Value = 400 });
            temp.Add(new Asset() { ID = 5, Name = "ASD III", Region = "Kolkatta", Value = 1400 });
            return temp;

        }
    }
}
