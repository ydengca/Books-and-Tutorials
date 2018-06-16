using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using System.Collections.ObjectModel;
using SLAspxCommunication.Entities;
using System.Windows.Browser;
namespace SLAspxCommunication
{
    public partial class MainPage : UserControl
    {
        private ObservableCollection<User> _users;
        private string _userName;
        public MainPage()
        {
            InitializeComponent();
            _users = GenerateList();
            HtmlPage.RegisterScriptableObject("Page", this); 
        }

        private ObservableCollection<User> GenerateList()
        {
            _users = new ObservableCollection<User>();
            _users.Add(new User()
            {
                UserName = "User1",
                Age = 19,
                Email = "user1@user.com"
            });
            _users.Add(new User()
            {
                UserName = "User2",
                Age = 19,
                Email = "user2@user.com"
            });
            _users.Add(new User()
            {
                UserName = "User3",
                Age = 19,
                Email = "user3@user.com"
            });
            _users.Add(new User()
            {
                UserName = "User4",
                Age = 19,
                Email = "user4@user.com"
            });
            return _users;
        }
        [ScriptableMember]
        public void SetUser(string user)
        {
            _userName = user;
            try
            {
                dgUsers.ItemsSource = SearchUserName();
                HtmlPage.Window.Invoke("setResult", "User found");
            }
            catch (Exception)
            {
                HtmlPage.Window.Invoke("setResult", "User not found");                
            }
        }

        private ObservableCollection<User> SearchUserName()
        {
          User user =  _users.First<User>(e => e.UserName == _userName);
          ObservableCollection<User> temp = new ObservableCollection<User>();
          temp.Add(user);
          return temp;
        }
    }
}
