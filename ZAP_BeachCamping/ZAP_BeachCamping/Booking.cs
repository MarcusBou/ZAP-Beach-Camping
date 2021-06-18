using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZAP_BeachCamping
{
    public class Booking
    {
        private string startDate;
        private string endDate;
        private string type;
        private int adult;
        private int child;
        private int dog;
        private int adgangBadelandBarn;
        private int adgangBadelandVoksen;
        private int cykelleje;
        private int morgenkompletBarn;
        private int morgenkompletVoksen;
        private int sengelinned;
        private int slutrengøring;
        private int hasView;

        public string StatDate { get { return startDate; } }
        public string EndDate { get { return endDate; } }
        public string Type { get { return type; } }
        public int Adult { get { return adult; } }
        public int Child { get { return child; } }
        public int Dog { get { return dog; } }
        public int AdgangBadelandBarn { get { return adgangBadelandBarn; } }
        public int AdgangBadelandVoksen { get { return adgangBadelandVoksen; } }
        public int Cykelleje { get { return cykelleje; } }
        public int MorgenkompletBarn { get { return morgenkompletBarn; } }
        public int MorgenkompletVoksen { get { return morgenkompletVoksen; } }
        public int Sengelinned { get { return sengelinned; } }
        public int Slutrengøring { get { return slutrengøring; } }
        public int  HasView { get { return hasView; } }

        public Booking(string startDate, string endDate, string type, int adult, int child, int dog, int adgangBadelandBarn, int adgangBadelandVoksen, int cykelleje, int morgenkompletBarn, int morgenkompletVoksen, int sengelinned, int slutrengøring, int hasView)
        {
            this.startDate = startDate;
            this.endDate = endDate;
            this.type = type;
            this.adult = adult;
            this.child = child;
            this.dog = dog;
            this.adgangBadelandBarn = adgangBadelandBarn;
            this.adgangBadelandVoksen = adgangBadelandVoksen;
            this.cykelleje = cykelleje;
            this.morgenkompletBarn = morgenkompletBarn;
            this.morgenkompletVoksen = morgenkompletVoksen;
            this.sengelinned = sengelinned;
            this.slutrengøring = slutrengøring;
            this.hasView = hasView;
        }
    }
}
