﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZAP_BeachCamping
{
    class BookingManager
    {
        private SQLManager SQLconn = new SQLManager();

        public void SendReturnMail()
        {

        }
        public Customer CreateCustomer(string firstName, string lastName, string address, string phoneNum)
        {
            Customer customer = new Customer(firstName, lastName, address, phoneNum);
            return customer;
        }
        public Booking CreateBooking(DateTime startDate, DateTime endDate, string type, int adult, int child, int dog, int adgangBadelandBarn, int adgangBadelandVoksen, int cykelleje, int morgenkompletBarn, int morgenkompletVoksen, int sengelinned, int slutrengøring, int hasView)
        {
            Booking booking = new Booking(startDate, endDate, type, adult, child, dog, adgangBadelandBarn, adgangBadelandVoksen, cykelleje, morgenkompletBarn, morgenkompletVoksen, sengelinned, slutrengøring, hasView);
            return booking;
        }
        public void BindABookingToCustomer(string firstName, string lastName, string address, string phoneNum, DateTime startDate, DateTime endDate, string type, int adult, int child, int dog, int adgangBadelandBarn, int adgangBadelandVoksen, int cykelleje, int morgenkompletBarn, int morgenkompletVoksen, int sengelinned, int slutrengøring, int hasView)
        {
            Customer customer = CreateCustomer(firstName, lastName, address, phoneNum);
            Booking booking = CreateBooking(startDate, endDate, type, adult, child, dog, adgangBadelandBarn, adgangBadelandVoksen, cykelleje, morgenkompletBarn, morgenkompletVoksen, sengelinned, slutrengøring, hasView)
            SQLconn.AddNewBookings(customer.FirstName, customer.LastName, customer.Address, customer.PhoneNum, booking.StatDate, booking.EndDate, booking.Type, booking.Adult, booking.Child, booking.Dog, booking.AdgangBadelandBarn, booking.AdgangBadelandVoksen, booking.AdgangBadelandVoksen, booking.MorgenkompletBarn, booking.MorgenkompletVoksen, booking.Sengelinned, booking.Slutrengøring, booking.HasView);
        }
    }
}
