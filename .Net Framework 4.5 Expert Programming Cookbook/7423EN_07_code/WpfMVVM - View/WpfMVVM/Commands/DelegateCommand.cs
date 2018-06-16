using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace WpfMVVM.Commands
{
    public class DelegateCommand:ICommand
    {
        private Action _commandMethod;

        public DelegateCommand(Action commandMethod)
        {
            _commandMethod = commandMethod;
        }

        public bool CanExecute(object parameter)
        {
            return true;
        }

        public event EventHandler CanExecuteChanged;

        public void Execute(object parameter)
        {
            _commandMethod.Invoke();
        }
    }
}
