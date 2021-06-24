using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.Net.Mail;


namespace ZAP_BeachCamping
{
    public class BookingManager
    {
        private SQLManager SQLconn = new SQLManager();

        public void SendReturnMail(string email, string StartDate, string EndDate, string totalPersonalFee, string totalSpotFee, string totalAddOns, string totalDiscount, string totalPrice)
        {
            SmtpClient client = new SmtpClient("smtp.gmail.com");
            //Sets the pot the mail is goning to be send through.
            client.Port = 587;

            //Makes the connection use sll to ecrypt the connection.
            client.EnableSsl = true;
            //Sets the credentials to the gmail account.
            client.Credentials = new NetworkCredential("ZAPBeachCampingDK@gmail.com", "ZAPPassw0rd!");
            //Sets the sender, recipient, subject and body. 


            //Determens the the account that will be sending the message and to account that will be reciving the message.
            MailMessage msg = new MailMessage("ZAPBeachCampingDK@gmail.com", email);
            //Sets the subject of the mail.
            msg.Subject = "ZAP Beach Camping Ordreberæftelse";
            //Sets the body to be html syntax.
            msg.IsBodyHtml = true;
            //Sets the body of the mail.
            msg.Body = "" +
                "<h1>Din ordre hos ZAP Beach Camping er nu bekræftet</h1>" +
                "<h2>Du har bestilt plads hos ZAP Beach Camping fra {startDate} til {endDate}</h2>" +
                "<h3>Persongebyr i alt: {persongebyr} </h3> " +
                "<h3>Pladsgebyr i alt: {pladsgebyr} </h3>" +
                "<h3>Tillæg i alt: {addOns} </h3>" +
                "<h3>Tilbud i alt: -{tilbud}</h3>" +
                "<h1>Pris i alt: {price}</h1>";

            //Replases text in the body to customer data.
            msg.Body = msg.Body.Replace("{startDate}", StartDate);
            msg.Body = msg.Body.Replace("{endDate}", EndDate);
            msg.Body = msg.Body.Replace("{persongebyr}", totalPersonalFee);
            msg.Body = msg.Body.Replace("{pladsgebyr}", totalSpotFee);
            msg.Body = msg.Body.Replace("{tilbud}", totalDiscount);
            msg.Body = msg.Body.Replace("{addOns}", totalAddOns);
            msg.Body = msg.Body.Replace("{price}", totalPrice);
            ;

            //Sends the msg using googles smtp server.
            client.Send(msg);
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
