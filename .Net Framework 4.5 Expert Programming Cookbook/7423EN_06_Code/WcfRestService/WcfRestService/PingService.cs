using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace WcfRestService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in both code and config file together.
    public class PingService : IPingService
    {

        public Result IsDbUp(string connectionString)
        {
            Result isUp = new Result();
            isUp.IsUp = true;
            try
            {
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                connection.Close();
            }
            catch (Exception)
            {
                isUp.IsUp = false;
            }
            return isUp;
        }
    }
}
