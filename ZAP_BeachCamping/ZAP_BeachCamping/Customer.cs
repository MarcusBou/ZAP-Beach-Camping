using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZAP_BeachCamping
{
    class Customer
    {
        private string firstName;
        private string lastName;
        private string address;
        private string phoneNum;
        private Booking wishedBooking;
        
        public Customer(string firstName, string lastName, string address, string phoneNum, Booking wishedBooking)
        {
            this.firstName = firstName;
            this.lastName = lastName;
            this.address = address;
            this.phoneNum = phoneNum;
            this.wishedBooking = wishedBooking;
        }
    }
}
