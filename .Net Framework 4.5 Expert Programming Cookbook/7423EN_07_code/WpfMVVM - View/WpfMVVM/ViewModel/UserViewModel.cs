using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using WpfMVVM.Commands;

namespace WpfMVVM.ViewModel
{
    public class UserViewModel:INotifyPropertyChanged
    {
        private IDataRepository _repository;
        private ObservableCollection<User> _users;
        public event PropertyChangedEventHandler PropertyChanged;
        
        
        public ObservableCollection<User> Users
        {
            get 
            {

                return _users;
            }
            set 
            { 
                _users = value;
                if (PropertyChanged != null)
                {
                    PropertyChanged(this, new PropertyChangedEventArgs("Users"));
                }
            }
        }
        public DelegateCommand Load { get; set; }
        public DelegateCommand Clear { get; set; }
        private ObservableCollection<User> GetUsers()
        {
            return _repository.GetUsers();
        }
        
        public UserViewModel()
        {
            _repository = new SqlDataRepository();
            Load = new DelegateCommand(LoadUsers);
            Clear = new DelegateCommand(ClearUsers);
        }

        private void ClearUsers()
        {
            _users.Clear();
            Users = _users;
        }

        private void LoadUsers()
        {
            Users = GetUsers();
        }

        
    }
}
