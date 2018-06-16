using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace WcfFileUploadService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in both code and config file together.
    public class UploadService : IUploadService
    {
        public void Upload(UploadDetails details)
        {
                       
            using (FileStream fs = new FileStream(@"C:\Downloads"+details.FileName, FileMode.Create))
            {
                int bufferSize = 1 * 1024 * 1024; 
                byte[] buffer = new byte[bufferSize];
                int bytes;

                while ((bytes = details.Data.Read(buffer, 0, bufferSize)) > 0)
                {
                    fs.Write(buffer, 0, bytes);
                    fs.Flush();
                }
                
            }
            //return string.Format("The upload - {0}",result);
        }

       
    }
}
