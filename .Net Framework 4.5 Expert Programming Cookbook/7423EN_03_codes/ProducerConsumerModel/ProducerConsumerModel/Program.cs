using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace ProducerConsumerModel
{
    class Program
    {
        static void Main(string[] args)
        {
            int result = 0;   
            SharedBuffer buffer = new SharedBuffer();

            Producer producer = new Producer(buffer, 10);

            Consumer consumer = new Consumer(buffer, 10);  

            Thread producerThread = new Thread(new ThreadStart(producer.Start));
            Thread consumerThread = new Thread(new ThreadStart(consumer.Start));
            
            try
            {
                producerThread.Start();
                consumerThread.Start();

                producerThread.Join();   
                
                consumerThread.Join();
                
                Console.ReadLine();
            }
            catch (ThreadStateException e)
            {
                Console.WriteLine(e);  
                result = 1;            
            }
            catch (ThreadInterruptedException e)
            {
                Console.WriteLine(e);  
                
                result = 1;            
            }
            // Even though Main returns void, this provides a return code to 
            // the parent process.
            Environment.ExitCode = result;
        }
    }
}
