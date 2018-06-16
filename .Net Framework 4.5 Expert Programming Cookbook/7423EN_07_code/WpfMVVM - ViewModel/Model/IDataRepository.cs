using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.ObjectModel;
namespace Model
{
    public interface IDataRepository
    {
        ObservableCollection<User> GetUsers();
    }
}
