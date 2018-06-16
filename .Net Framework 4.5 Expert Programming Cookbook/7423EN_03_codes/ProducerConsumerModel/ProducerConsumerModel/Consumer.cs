using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProducerConsumerModel
{
    class Consumer
    {
         private SharedBuffer _buffer;
        int _maxCount;
        public Consumer(SharedBuffer buffer, int count)
        {
            _buffer = buffer;
            _maxCount = count;
        }

        public void Start()
        {
            int temp;
            for (int i = 0; i < _maxCount; i++)
            {
                temp = _buffer.Read();
            }
        }
    }
}
