﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZAP_BeachCamping
{
    class Booking
    {
        private DateTime startDate;
        private DateTime endDate;
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

        public Booking(DateTime startDate, DateTime endDate, int adult, int child, int dog, int adgangBadelandBarn, int adgangBadelandVoksen, int cykelleje, int morgenkompletBarn, int morgenkompletVoksen, int sengelinned, int slutrengøring, int hasView)
        {
            this.startDate = startDate;
            this.endDate = endDate;
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
