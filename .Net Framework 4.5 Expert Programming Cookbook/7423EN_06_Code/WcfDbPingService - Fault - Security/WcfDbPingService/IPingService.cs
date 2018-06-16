using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace WcfDbPingService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    public interface IPingService
    {
        [OperationContract]
        [FaultContract(typeof(PingException))]        
        bool IsDbUp(string connectionString);        
    }    
}
