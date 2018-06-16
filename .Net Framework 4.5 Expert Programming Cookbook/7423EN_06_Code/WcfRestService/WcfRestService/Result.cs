using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace WcfRestService
{
    [DataContract]
    public class Result
    {
        [DataMember]
        public bool IsUp { get; set; }
    }
}
