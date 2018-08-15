using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace RW_CShap_Console
{
    class Program
    {
        static void Main(string[] args)
        {
            //chp2();
            //chp6();
            //chp12();
        }

        static void chp2()
        {
            Console.WriteLine("Please enter your first name:");
            string FirstName = Console.ReadLine();

            Console.WriteLine("Please enter your last name:");
            string LastName = Console.ReadLine();

            Console.WriteLine("Hello {0}, {1}", FirstName, LastName);
            Console.Read();
        }

        static void chp6()
        {
            Console.WriteLine("How many tickets are on sale?");
            //int? TicketOnSale = Console.ReadLine() ;

            int? TicketOnSale = null;
            int AvailableTickets = TicketOnSale ?? 0;

            Console.WriteLine("Available tickets: {0}", AvailableTickets);
            Console.Read();
        }

        static void chp12()
        {
            int TotalCoffeeCost = 0;

            Start:
            Console.WriteLine("1 - Small, 2 - Medium, 3 - Large");
            int UserChoice = int.Parse(Console.ReadLine());

            switch (UserChoice)
            {
                case 1:
                    TotalCoffeeCost += 1;
                    break;
                case 2:
                    TotalCoffeeCost += 2;
                    break;
                case 3:
                    TotalCoffeeCost += 3;
                    break;
                default:
                    Console.WriteLine("Your choice {0} is invalid", UserChoice);
                    break;
            }

            Decide:
            Console.WriteLine("Do you want to buy another coffee - Yes or No?");
            string UserDecision = Console.ReadLine();

            switch (UserDecision)
            {
                case "Yes":
                    goto Start;
                case "No":
                    break;
                default:
                    Console.WriteLine("Your choice {0} is invalid. Please try again...");
                    goto Decide;
            }

            Console.Read();
        }
    }
}
