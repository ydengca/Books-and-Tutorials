using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace ProducerConsumerModel
{
    class SharedBuffer
    {
        int _contents;         
        bool _reading = false;  
        public int Read()
        {
            lock (this)   
            {
                if (!_reading)
                {            
                    try
                    {                        
                        Monitor.Wait(this);
                    }
                    catch (SynchronizationLockException e)
                    {
                        Console.WriteLine(e);
                    }
                    catch (ThreadInterruptedException e)
                    {
                        Console.WriteLine(e);
                    }
                }
                Console.WriteLine("Consumed: {0}", _contents);
                _reading = false;    
                Monitor.Pulse(this);   
            }   
            return _contents;
            

        }

        public void Write(int value)
        {
            lock (this)  
            {
                if (_reading)
                {      
                    try
                    {
                        Monitor.Wait(this);   
                    }
                    catch (SynchronizationLockException e)
                    {
                        Console.WriteLine(e);
                    }
                    catch (ThreadInterruptedException e)
                    {
                        Console.WriteLine(e);
                    }
                }
                _contents = value;
                Console.WriteLine("Produced: {0}", _contents);
                _reading = true;    
                Monitor.Pulse(this);  
            } 
        }
    }
}
