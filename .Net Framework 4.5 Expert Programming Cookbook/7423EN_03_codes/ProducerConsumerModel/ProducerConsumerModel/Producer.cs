using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProducerConsumerModel
{
    class Producer
    {
        private SharedBuffer _buffer;
        private int _maxCount;
        public Producer(SharedBuffer buffer, int count)
        {
            _buffer = buffer;
            _maxCount = count;
        }

        public void Start()
        {
            for (int i = 0; i < _maxCount; i++)
            {
                _buffer.Write(i);
            }
        }
    }
}
