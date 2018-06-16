using System;
using System.Collections.ObjectModel;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Model;

namespace ModelViewModelTests
{
    [TestClass]
    public class DataRepositoryTest
    {
        [TestMethod]
        public void TestGetUsers()
        {
            IDataRepository repository = new SqlDataRepository();
            ObservableCollection<User> users = repository.GetUsers();
            Assert.IsNotNull(users);
            Assert.IsTrue(users.Count > 0);
        }
    }
}
