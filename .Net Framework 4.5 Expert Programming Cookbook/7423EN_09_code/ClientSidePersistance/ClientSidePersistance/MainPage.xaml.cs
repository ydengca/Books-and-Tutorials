using System;
using System.Collections.Generic;
using System.IO.IsolatedStorage;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;

namespace ClientSidePersistance
{
    public partial class MainPage : UserControl
    {
        private IsolatedStorageSettings appSettings = IsolatedStorageSettings.ApplicationSettings;
        public MainPage()
        {
            InitializeComponent();
        }

        private void btnDraft_Click(object sender, RoutedEventArgs e)
        {
            appSettings.Add("username", txtUserName.Text);
            appSettings.Add("fullname", txtFullName.Text);
            appSettings.Add("email", txtEmail.Text);
        }

        private void btnClear_Click(object sender, RoutedEventArgs e)
        {
            txtEmail.Text = "";
            txtFullName.Text = "";
            txtUserName.Text = "";
        }

        private void btnLoad_Click(object sender, RoutedEventArgs e)
        {
            txtUserName.Text = appSettings["username"]!=null? appSettings["username"].ToString():"";
            txtFullName.Text = appSettings["fullname"]!=null? appSettings["fullname"].ToString():"";
            txtEmail.Text = appSettings["email"]!=null? appSettings["email"].ToString():"";
        }
    }
}
