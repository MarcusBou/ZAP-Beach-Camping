using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZAP_BeachCamping;

namespace ZAP_BEACH_CAMPING
{
    public partial class Order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void OrderSpot(object sender, EventArgs e)
        {
            string firstName = Fornavn.Text;
            string lastName = Efternavn.Text;
            string email = Email.Text;
            int phoneNumber = Convert.ToInt32(Telefonnummer.Text);
            string address = Adresse.Text;
            DateTime StartDate = Convert.ToDateTime(startDate.Text);
            DateTime EndDate = Convert.ToDateTime(endDate.Text);
            string type = typeSelector.SelectedValue;
            int udsigt = Convert.ToInt32(Udsigt.Checked);
            int bigSpot = Convert.ToInt32(BigSpot.Checked);
            int slutrengøring = Convert.ToInt32(cleaning.Checked);
            int adults = Convert.ToInt32(Voksne.Text);
            int childs = Convert.ToInt32(Børn.Text);
            int dogs = Convert.ToInt32(Hund.Text);
            int senngelinned = Convert.ToInt32(Sengelinned.Text);
            int voksenMorgenkomplet = Convert.ToInt32(VoksenMorgenkomplet.Text);
            int barnMorgenkomplet = Convert.ToInt32(BarnMorgenkomplet.Text);
            int cykelleje = Convert.ToInt32(Cykelleje.Text);
            int voksenBadeland = Convert.ToInt32(VoksenBadeland.Text);
            int badelandBarn = Convert.ToInt32(BadelandBarn.Text);

        }
    }
}