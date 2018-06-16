using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiveDataShaping.Entities
{
    public class Asset : INotifyPropertyChanged
    {
        private double _currentValue;        
        public event PropertyChangedEventHandler PropertyChanged = delegate { };
        public int ID { get; set; }
        public string Name { get; set; }
        public string Region { get; set; }

        public double Value
        {
            get
            {
                return _currentValue;
            }
            set
            {
                _currentValue = value;
                PropertyChanged(this, new PropertyChangedEventArgs("Value"));
            }
        }
        

    }
}
