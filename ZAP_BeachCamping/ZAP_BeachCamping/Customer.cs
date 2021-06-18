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

        public string FirstName { get { return firstName; }}
        public string LastName { get { return lastName; } }
        public string Email { get { return email; } }
        public string Address { get { return address; } }
        public string PhoneNum { get { return phoneNum; } }
        public Booking WishedBooking { get { return wishedBooking; } set { wishedBooking = value; } }

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
