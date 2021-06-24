using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using ZAP_BeachCamping;

namespace ZAP_BEACH_CAMPING
{
    public partial class Order : System.Web.UI.Page
    {
        private double currPrice, addOnPrices, PeoplePrices;
        private SQLManager sql = new SQLManager();
        private Dictionary<string, int> pricesDict = new Dictionary<string, int>();

        protected void Page_Load(object sender, EventArgs e)
        {
            currPrice = 0;
            addOnPrices = 0;
            PeoplePrices = 0;
            foreach (var item in sql.GetAllPrices())
            {
                pricesDict.Add(item.Key, item.Value);
            }
        }

        protected void OrderSpot(object sender, EventArgs e)
        {
            string firstName = Fornavn.Text;
            string lastName = Efternavn.Text;
            string email = Email.Text;
            string phoneNumber = Telefonnummer.Text;
            string address = Adresse.Text;
            string StartDate = startDate.Text;
            string EndDate = endDate.Text;

            string type = "";
            //Sets the type to the radiobutton htat is selected.
            if (Teltplads.Checked == true){
                type = "Teltplads";
            }
            else if (StandardHytte.Checked == true){
                type = "Standard Hytte";
            }
            else if (LuksusHytte.Checked == true){
                type = "Luksus Hytte";
            }
            else if (Sæsonplads.Checked == true){
                type = "Sæsonplads";
            }
            else if (Campingplads.Checked == true){
                //
                if (BigSpot.Checked)
                {
                    type = "Campingvognplads (Stor)";
                }
                else
                {
                    type = "Campingvognplads (lille)";
                } 
                
            }
            
            int udsigt = Convert.ToInt32(Udsigt.Checked);
            
            int slutrengøring = Convert.ToInt32(cleaning.Checked);
            int adult = Convert.ToInt32(Voksne.Text);
            int child = Convert.ToInt32(Børn.Text);
            int dog = Convert.ToInt32(Hund.Text);
            int senngelinned = Convert.ToInt32(Sengelinned.Text);
            int voksenMorgenkomplet = Convert.ToInt32(VoksenMorgenkomplet.Text);
            int barnMorgenkomplet = Convert.ToInt32(BarnMorgenkomplet.Text);
            int cykelleje = Convert.ToInt32(Cykelleje.Text);
            int voksenBadeland = Convert.ToInt32(VoksenBadeland.Text);
            int badelandBarn = Convert.ToInt32(BadelandBarn.Text);
            string totalPersonalFee = TotalPersonalFeeHidden.Value + ",00 DKK";
            string totalSpotFee = TotalSpotFeeHidden.Value + ",00 DKK";
            string totalAddOnFee = TotalAddOnFeeHidden.Value + ",00 DKK";
            string totalDiscount = TotalDiscountHidden.Value + ",00 DKK";
            string totalPrice = TotalPriceHidden.Value + ",00 DKK";
            BookingManager bm = new BookingManager();
            bm.BindABookingToCustomer(firstName, lastName, email, address, phoneNumber, StartDate, EndDate, type, adult, child, dog, badelandBarn, voksenBadeland, cykelleje, barnMorgenkomplet, voksenMorgenkomplet, senngelinned, slutrengøring, udsigt);
            bm.SendReturnMail(email, StartDate, EndDate, totalPersonalFee, totalSpotFee, totalAddOnFee, totalDiscount, totalPrice);
        }
    }
}