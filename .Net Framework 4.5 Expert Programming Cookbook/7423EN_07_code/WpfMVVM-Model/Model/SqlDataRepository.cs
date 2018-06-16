using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class SqlDataRepository:IDataRepository
    {
        public ObservableCollection<User> GetUsers()
        {
            ObservableCollection<User> users = null;
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["local"].ConnectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "GetUsers";
                using (IDataReader reader = command.ExecuteReader())
                {
                    users = MapUsers(reader);
                }
            }
            return users;
        }

        private ObservableCollection<User> MapUsers(IDataReader reader)
        {
            ObservableCollection<User> users = new ObservableCollection<User>();
            if (reader != null)
            {
                while (reader.Read())
                {
                    User user = new User();
                    user.ID = Convert.ToInt32( reader["Id"]);
                    user.UserName = reader["User_name"].ToString();
                    user.Email = reader["Email_id"].ToString();
                    user.FirstName = reader["First_name"].ToString();
                    user.LastName = reader["Last_name"].ToString();
                    users.Add(user);
                }
            }
            return users;
        }
    }
}
