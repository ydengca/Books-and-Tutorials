using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;
namespace CookBook.Recipes.Winforms.Events
{
    public class EventArgs<T>: EventArgs
    {
        public T Data {get; set;}
        public EventArgs(T value)
        {
            Data = value;
        }
    }
}
