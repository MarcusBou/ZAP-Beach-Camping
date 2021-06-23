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

        public void SendReturnMail(int spotID, string startDate, string endDate, int persongebyr, int pladsgebyr, int tilbud, int price)
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
            MailMessage msg = new MailMessage("ZAPBeachCampingDK@gmail.com", "daniel.vuust@gmail.com");
            //Sets the subject of the mail.
            msg.Subject = "ZAP Beach Camping Ordreberæftelse";
            //Sets the body to be html syntax.
            msg.IsBodyHtml = true;
            //Sets the body of the mail.
            msg.Body = "" +
                "<h1>Din ordre hos ZAP Beach Camping er nu bekræftet</h1>" +
                "<h2>Du har bestilt plads nummer {spotID} fra {startDate} til {endDate}</h2>" +
                "<h3>Persongebyr i alt: {persongebyr} </h3> " +
                "<h3>Pladsgebyr i alt: {pladsgebyr} </h3>" +
                "<h3>Tilbud i alt: {tilbud}</h3>" +
                "<h1>Pris i alt: {price}</h1>";

            //Replases text in the body to customer data.
            msg.Body = msg.Body.Replace("{spotID}", spotID.ToString());
            msg.Body = msg.Body.Replace("{startDate}", startDate);
            msg.Body = msg.Body.Replace("{endDate}", endDate);
            msg.Body = msg.Body.Replace("{persongebyr}", persongebyr.ToString());
            msg.Body = msg.Body.Replace("{pladsgebyr}", pladsgebyr.ToString());
            msg.Body = msg.Body.Replace("{tilbud}", tilbud.ToString());
            msg.Body = msg.Body.Replace("{price}", price.ToString());
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
