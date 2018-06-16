using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace WcfDbPingService
{
    [DataContract]
    class PingException
    {
        [DataMember]
        public string Title;
        [DataMember]
        public string Message;
        [DataMember]
        public string InnerException;
        [DataMember]
        public string StackTrace;   
    }
}
