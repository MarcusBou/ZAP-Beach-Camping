using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZAP_BeachCamping
{
    public class Customer
    {
        private string firstName;
        private string lastName;
        private string email;
        private string address;
        private string phoneNum;
        private Booking wishedBooking;

        public string FirstName { get; private set; }
        public string LastName { get; private set; }
        public string Email { get; private set; }
        public string Address { get; private set;  }
        public string PhoneNum { get; private set; }
        public Booking WishedBooking { get; set; }

        public Customer(string firstName, string lastName, string email, string address, string phoneNum)
        {
            this.firstName = firstName;
            this.lastName = lastName;
            this.email = email;
            this.address = address;
            this.phoneNum = phoneNum;
        }
    }
}
