using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZAP_BeachCamping
{
    public class BookingManager
    {
        private SQLManager SQLconn = new SQLManager();

        public void SendReturnMail()
        {

        }
        public Customer CreateCustomer(string firstName, string lastName, string email, string address, string phoneNum)
        {
            Customer customer = new Customer(firstName, lastName, email, address, phoneNum);
            return customer;
        }
        public Booking CreateBooking(string startDate, string endDate, string type, int adult, int child, int dog, int adgangBadelandBarn, int adgangBadelandVoksen, int cykelleje, int morgenkompletBarn, int morgenkompletVoksen, int sengelinned, int slutrengøring, int hasView)
        {
            Booking booking = new Booking(startDate, endDate, type, adult, child, dog, adgangBadelandBarn, adgangBadelandVoksen, cykelleje, morgenkompletBarn, morgenkompletVoksen, sengelinned, slutrengøring, hasView);
            return booking;
        }
        public void BindABookingToCustomer(string firstName, string lastName, string email, string address, string phoneNum, string startDate, string endDate, string type, int adult, int child, int dog, int adgangBadelandBarn, int adgangBadelandVoksen, int cykelleje, int morgenkompletBarn, int morgenkompletVoksen, int sengelinned, int slutrengøring, int hasView)
        {
            Customer customer = CreateCustomer(firstName, lastName, email, address, phoneNum);
            Booking booking = CreateBooking(startDate, endDate, type, adult, child, dog, adgangBadelandBarn, adgangBadelandVoksen, cykelleje, morgenkompletBarn, morgenkompletVoksen, sengelinned, slutrengøring, hasView);
            SQLconn.AddNewBookings(customer.FirstName, customer.LastName, customer.Email, customer.PhoneNum, customer.Address, booking.StatDate, booking.EndDate, booking.Type, booking.Adult, booking.Child, booking.Dog, booking.AdgangBadelandBarn, booking.AdgangBadelandVoksen, booking.AdgangBadelandVoksen, booking.MorgenkompletBarn, booking.MorgenkompletVoksen, booking.Sengelinned, booking.Slutrengøring, booking.HasView);
        }
        
    }
}
