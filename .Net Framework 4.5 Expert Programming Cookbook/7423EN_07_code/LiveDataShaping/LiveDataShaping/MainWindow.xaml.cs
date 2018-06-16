using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Threading;
using LiveDataShaping.Entities;

namespace LiveDataShaping
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        DispatcherTimer _timer = new DispatcherTimer();
        ObservableCollection<Asset> _items = new ObservableCollection<Asset>();
        public MainWindow()
        {
            InitializeComponent();
            _items = GenerateTestData();
            ICollectionViewLiveShaping view = (ICollectionViewLiveShaping)CollectionViewSource.GetDefaultView(_items);
            
            view.IsLiveSorting = true;
            view.LiveSortingProperties.Add("Value");
            dgAsset.ItemsSource = (IEnumerable)view;
           
            Random random = new Random();
            _timer.Interval = TimeSpan.FromSeconds(1);
            _timer.Tick += (s, e) =>
            {
                foreach (var item in _items)
                    item.Value += random.NextDouble() * 1000 - 500;
            };
            _timer.Start();
        }

        private ObservableCollection<Asset> GenerateTestData()
        {
            ObservableCollection<Asset> temp = new ObservableCollection<Asset>();
            temp.Add(new Asset() { ID = 1, Name = "ASD", Region = "Mumbai", Value = 1000 });
            temp.Add(new Asset() { ID = 2, Name = "AS Hotel", Region = "Chennai", Value = 11000 });
            temp.Add(new Asset() { ID = 3, Name = "AD Cafe", Region = "Kolkatta", Value = 10000 });
            temp.Add(new Asset() { ID = 4, Name = "Landmark", Region = "Mumbai", Value = 50000 });
            temp.Add(new Asset() { ID = 5, Name = "ASD II", Region = "Kolkatta", Value = 400 });
            return temp;
        }
    }
}
