using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.ServiceModel;
using System.Text;
using System.Threading.Tasks;

namespace WcfFileUploadService
{
    [MessageContract]
    public class UploadDetails
    {
        [MessageHeader]
        public string FileName { get; set; }
        [MessageBodyMember]
        public Stream Data { get; set; }
    }
}
