using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZAP_BeachCamping
{
    public class Booking
    {
        private DateTime startDate;
        private DateTime endDate;
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

        public DateTime StatDate { get; private set; }
        public DateTime EndDate { get; private set; }
        public string Type { get; private set; }
        public int Adult { get; private set; }
        public int Child { get; private set; }
        public int Dog { get; private set; }
        public int AdgangBadelandBarn { get; private set; }
        public int AdgangBadelandVoksen { get; private set; }
        public int Cykelleje { get; private set; }
        public int MorgenkompletBarn { get; private set; }
        public int MorgenkompletVoksen { get; private set; }
        public int Sengelinned { get; private set; }
        public int Slutrengøring { get; private set; }
        public int  HasView { get; private set; }

        public Booking(DateTime startDate, DateTime endDate, string type, int adult, int child, int dog, int adgangBadelandBarn, int adgangBadelandVoksen, int cykelleje, int morgenkompletBarn, int morgenkompletVoksen, int sengelinned, int slutrengøring, int hasView)
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
